local ShopData = {}

ShopData.debug = false

ShopData.BUY_DATA = "BUY_DATA"

ShopData.BUY_REFRESH_CHANGE = "BUY_REFRESH_CHANGE"

ShopData.REFRESH_CHANGE = "REFRESH_CHANGE"
--礼包刷新
ShopData.REFRESH_LIBAO = "REFRESH_LIBAO"

function ShopData:init()

    --商城主数据
    self.shopDatas = {}
    --商城礼包数据
    self.liBaoDatas = {}
    --商城礼包刷新需要资源数量
    self.refresMoney = 0
    --商城刷新次数
    self.shopRefreshCount = 0
    self.nextFreshTime = 0
    
    local onRefreshShop = function (event)
        local data = event.data
        self:clearShopData()--清空商城数据
        for k, v in pairs(data) do
            self:addShopData(v,k)
        end
        self.nextFreshTime = event.nextFreshTime
        --购买后数据更新监听
        GameEventCenter:dispatchEvent({ name = ShopData.REFRESH_CHANGE, data = {} })
    end
    NetWork:addNetWorkListener({ 5, 20 }, onRefreshShop) 
end

--清空申请数据
function ShopData:clearShopData()
    self.shopDatas = {}
end

--数据存放
function ShopData:addShopData(data,k)
    
    local shopInfo         = Factory.createShopModel()
    shopInfo.m_Idx = k                      --物品索引
    shopInfo.m_ItemID = data[1]             --道具ID
    shopInfo.m_ItemType = data[2]           --道具类型(1为卡片，4为道具,5-武将碎片)                    
    shopInfo.m_MoneyType = data[3]          --金钱类型（1-元宝，2-普通钱币,3-魂晶）
    shopInfo.m_ItemPrice = data[4]          --道具价格
    shopInfo.m_ItemNum = data[5]            --道具数量
    shopInfo.m_ItemState = data[6]          --道具状态（1－可以买，0－不可以买）

    
    
--    shopInfo.m_ItemClassify = data[5]       --道具显示分类
--    shopInfo.m_LimitCount = data[6]         --每天限制购买数
--    shopInfo.m_LimitIndex = data[7]         --限制索引
    --shopInfo.eventAttr.m_BuyCount = data[8]           --现在已经购买个数
    
    self.shopDatas[#self.shopDatas+1] = shopInfo
end

--查看商城物品
function ShopData:sendShop(listener)
    Functions.printInfo(self.debug,"sendShop")
    --Functions.bindMGSDisplay(self._Text_money_t, self._Text_bao_t, self._Text_soul_t )
    local onSendShop = function (event)
        local data = event.data
        ShopData:clearShopData()--清空商城数据
        for k, v in pairs(data) do
            ShopData:addShopData(v,k)   
        end
        self.shopRefreshCount = event.refreshcount
        self.nextFreshTime = event.nextFreshTime
        listener()
    end
    NetWork:addNetWorkListener({ 5, 11 }, Functions.createNetworkListener(onSendShop,true,"ret"))
    NetWork:sendToServer({ idx = { 5, 11 }})
end

--刷新商城物品
function ShopData:sendRefreshShop(type, listener)
    Functions.printInfo(self.debug,"sendRefreshShop")
    --Functions.bindMGSDisplay(self._Text_money_t, self._Text_bao_t, self._Text_soul_t )
    local onRefreshShop = function (event)

        local data = event.data
        PlayerData.eventAttr.m_hunjing = event.hunjing
        ShopData:clearShopData()--清空商城数据
        for k, v in pairs(data) do
            ShopData:addShopData(v,k)   
        end
        ShopData.shopRefreshCount = event.refreshcount
        if PropData:getPropNumOfId(44) > 0 then
            PropData:miuProp( {m_id = 44, m_count = 1} )
        end
        listener()
    end
    NetWork:addNetWorkListener({ 5, 18 }, Functions.createNetworkListener(onRefreshShop,true,"ret"))
    NetWork:sendToServer({ idx = { 5, 18 }, stype = type })
end

--查询礼包物品
function ShopData:sendLiBaoData(listener)
    Functions.printInfo(self.debug,"sendLiBaoData")
    
    local onLiBao = function (event)
        self.liBaoDatas = {}
        local data = event.data
        for k,v in ipairs(data) do
            local shopInfo = {}
            shopInfo.m_Idx = k                      --物品索引
            shopInfo.m_Name = v.name                --礼包名 
            shopInfo.m_Goods = v.goods              --礼包所含物品              
            shopInfo.m_ItemPrice = v.price          --道具价格
            shopInfo.m_IsBuy = v.isbuy              --道具状态（true－可以买，fasle－不可以买）
            shopInfo.m_Pic = v.pic                  --图片
            self.liBaoDatas[#self.liBaoDatas+1] = shopInfo
        end
        self.refresMoney = data.refreshPrice          --礼包商店刷新需要的资源数量

        listener()
    end
    NetWork:addNetWorkListener({ 37, 1 }, Functions.createNetworkListener(onLiBao,true,"ret"))
    NetWork:sendToServer({ idx = { 37, 1 }})
end

--购买礼包
function ShopData:sendBuyLiBao(idx, listener)
    Functions.printInfo(self.debug,"sendBuyLiBao")

    local onLiBao = function (event)
        local liBaoDatas = ShopData:getLiBaoDatas()
        liBaoDatas[idx].m_IsBuy = false

        for k,v in ipairs(event.data.goods) do
            Functions:addItemResources( {id = v[1], type = v[2], count = v[3], slot = v[4]} )
        end
        --礼包里有元宝，所以要放在加完道具的后面
        PlayerData.eventAttr.m_gold = event.data.curgold
        
        --购买后数据更新监听
        GameEventCenter:dispatchEvent({ name = ShopData.REFRESH_LIBAO, data = {} })
        listener()
    end
    NetWork:addNetWorkListener({ 37, 2 }, Functions.createNetworkListener(onLiBao,true,"ret"))
    NetWork:sendToServer({ idx = { 37, 2 }, index = idx})
end

--刷新礼包
function ShopData:sendRefreshLiBao( listener)
    Functions.printInfo(self.debug,"sendRefreshLiBao")

    local onLiBao = function (event)
        local liBaoDatas = ShopData:getLiBaoDatas()
        for k,v in ipairs(liBaoDatas) do
            liBaoDatas[k].m_IsBuy = true
        end
        PlayerData.eventAttr.m_gold = event.data.curgold
        self.refresMoney = event.data.refreshPrice          --礼包商店刷新需要的资源数量
        listener()
    end
    NetWork:addNetWorkListener({ 37, 3 }, Functions.createNetworkListener(onLiBao,true,"ret"))
    NetWork:sendToServer({ idx = { 37, 3 }})
end

--获取主数据
function ShopData:getShopDatas()
    return self.shopDatas
end

--获取礼包数据
function ShopData:getLiBaoDatas()
    return self.liBaoDatas
end

--获取礼包刷新所需资源数量
function ShopData:getRefresMoney()
    return self.refresMoney
end


--获取倒计时
function ShopData:getCountdown()
    return self.nextFreshTime
end

return ShopData