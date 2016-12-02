local BaseModel = require("app.baseMVC.BaseModel")

local IntegralShopData = class("IntegralShopData", BaseModel)

IntegralShopData.debug = false

IntegralShopData.SELL_UP = "SELL_UP"

IntegralShopData.eventAttr.m_isNewShop = false

function IntegralShopData:ctor()

    --积分商城道具属性
    self.m_DebrisIndex = 0             --碎片索引(因为有可能是二个相同的碎片,那么ID就是一样的，不能进行购买的判断)
    self.m_DebrisID = 0                --道具ID
    self.m_DebrisType = 0              --道具类型
    self.m_DebrisCount = 0             --购买数量
    self.m_DebrisPrice = 0             --道具价格
    self.b_DebrisBuy = 0               --是否购买过(0:没有购买过。1：购买过)

	self:init()
end


function IntegralShopData:init()
    self.super.init(self)

    --商城主数据
    self.IntegralShopDatas = {}
    
end

function IntegralShopData:sendIntegralShop(listener)
    local onSendIntegralShop = function (event)
        self:ShopData(event, listener)
        return true
    end
    NetWork:addNetWorkListener({ 5, 14 }, onSendIntegralShop)
    NetWork:sendToServer({ idx = { 5, 14 }})

end

function IntegralShopData:sendRefreshShop(listener)
    local onSendIntegralShop = function (event)
        if event.ret == 1 then
            self:ShopData(event, listener)
        end
        return true
    end  

    NetWork:addNetWorkListener({ 5, 15 }, onSendIntegralShop)
    NetWork:sendToServer({ idx = { 5, 15 }})
end

--碎片数据
function IntegralShopData:ShopData(event, listener)
    local data = event.data
    self:clearIntegralShopData()--清空商城数据
    for k, v in pairs(data) do
        local IntegralData = Factory:createIntegralShopData()
        --积分商城道具属性
        IntegralData.m_DebrisIndex = k                      --索引(因为有可能是二个相同的物品,那么ID就是一样的，不能进行购买的判断)
        IntegralData.m_DebrisID = data[k].goodid            --道具ID
        IntegralData.m_DebrisType = data[k].goodtype        --道具类型
        IntegralData.m_DebrisCount = data[k].goodnum        --购买数量
        IntegralData.m_DebrisPrice = data[k].price          --道具价格
        --IntegralData.b_DebrisBuy = data[k][5]               --是否购买过(0:没有购买过。1：购买过)
        IntegralShopData:addIntegralShopData(IntegralData)
    end
    local _data = self:getIntegralShopData()

    listener()
end

--清空申请数据
function IntegralShopData:clearIntegralShopData()
    self.IntegralShopDatas = {}
end

--数据存放
function IntegralShopData:addIntegralShopData(data)
    self.IntegralShopDatas[#self.IntegralShopDatas+1] = data
end

--获取主数据
function IntegralShopData:getIntegralShopData()
    return self.IntegralShopDatas
end

return IntegralShopData