--@auto code head
local BaseViewController = require("app.baseMVC.BaseViewController")
local ShopViewController = class("ShopViewController", BaseViewController)

local Functions = require("app.common.Functions")

ShopViewController.debug = true
ShopViewController.modulePath = ...
ShopViewController.studioSpriteFrames = {"IntegralShopUI","CB_bgup","CB_blackbg","ShopUI_Text" }
--@auto code head end

--@Pre loading
ShopViewController.spriteFrameNames = 
    {
    }

ShopViewController.animaNames = 
    {
    }


--@auto code uiInit
--add spriteFrames
if #ShopViewController.studioSpriteFrames > 0 then
    ShopViewController.spriteFrameNames = ShopViewController.spriteFrameNames or {}
    table.insertto(ShopViewController.spriteFrameNames, ShopViewController.studioSpriteFrames)
end
function ShopViewController:onDidLoadView()

    --output list
    self._resNode_t = self.view_t.csbNode:getChildByName("main"):getChildByName("resNode")
	self._Image_Refresh_text_t = self.view_t.csbNode:getChildByName("main"):getChildByName("Button_Refresh"):getChildByName("Image_Refresh_text")
	self._Image_Refresh_icon_t = self.view_t.csbNode:getChildByName("main"):getChildByName("Image_Refresh_icon")
	self._Text_Refresh_num_t = self.view_t.csbNode:getChildByName("main"):getChildByName("Text_Refresh_num")
	self._Sprite_time_bg_t = self.view_t.csbNode:getChildByName("main"):getChildByName("Panel_main"):getChildByName("Image_bg"):getChildByName("Sprite_time_bg")
	self._Text_Countdown_t = self.view_t.csbNode:getChildByName("main"):getChildByName("Panel_main"):getChildByName("Image_bg"):getChildByName("Sprite_time_bg"):getChildByName("Text_Countdown")
	self._Text_Countdown_shen_mi_t = self.view_t.csbNode:getChildByName("main"):getChildByName("Panel_main"):getChildByName("Image_bg"):getChildByName("Sprite_time_bg"):getChildByName("Text_Countdown_shen_mi")
	self._Panel_yingxong_1_t = self.view_t.csbNode:getChildByName("main"):getChildByName("Panel_main"):getChildByName("Panel_label_list"):getChildByName("Panel_yingxong_1")
	self._Panel_tianti_2_t = self.view_t.csbNode:getChildByName("main"):getChildByName("Panel_main"):getChildByName("Panel_label_list"):getChildByName("Panel_tianti_2")
	self._Panel_gonghui_3_t = self.view_t.csbNode:getChildByName("main"):getChildByName("Panel_main"):getChildByName("Panel_label_list"):getChildByName("Panel_gonghui_3")
	self._Panel_shenmi_4_t = self.view_t.csbNode:getChildByName("main"):getChildByName("Panel_main"):getChildByName("Panel_label_list"):getChildByName("Panel_shenmi_4")
	self._Panel_libao_5_t = self.view_t.csbNode:getChildByName("main"):getChildByName("Panel_main"):getChildByName("Panel_label_list"):getChildByName("Panel_libao_5")
	self._ListView_shop_t = self.view_t.csbNode:getChildByName("main"):getChildByName("Panel_main"):getChildByName("ListView_shop")
	self._ListView_tian_ti_t = self.view_t.csbNode:getChildByName("main"):getChildByName("Panel_main"):getChildByName("ListView_tian_ti")
	self._ListView_gong_hui_t = self.view_t.csbNode:getChildByName("main"):getChildByName("Panel_main"):getChildByName("ListView_gong_hui")
	self._ListView_shen_mi_t = self.view_t.csbNode:getChildByName("main"):getChildByName("Panel_main"):getChildByName("ListView_shen_mi")
	self._ListView_li_bao_t = self.view_t.csbNode:getChildByName("main"):getChildByName("Panel_main"):getChildByName("ListView_li_bao")
	
    --label list
    
    --button list
    self._Button_back_t = self.view_t.csbNode:getChildByName("main"):getChildByName("Panel_left"):getChildByName("Button_back")
	self._Button_back_t:onTouch(Functions.createClickListener(handler(self, self.onButton_backClick), "zoom"))

	self._Button_help_t = self.view_t.csbNode:getChildByName("main"):getChildByName("Panel_left"):getChildByName("Button_help")
	self._Button_help_t:onTouch(Functions.createClickListener(handler(self, self.onButton_helpClick), "zoom"))

	self._Button_Refresh_t = self.view_t.csbNode:getChildByName("main"):getChildByName("Button_Refresh")
	self._Button_Refresh_t:onTouch(Functions.createClickListener(handler(self, self.onButton_refreshClick), "zoom"))

end
--@auto code uiInit end


--@auto button backcall begin

--@auto code Button_back btFunc
function ShopViewController:onButton_backClick()
    Functions.printInfo(self.debug,"Button_back button is click!")
    GameCtlManager:pop(self)
end
--@auto code Button_back btFunc end

--@auto code Button_refresh btFunc
function ShopViewController:onButton_refreshClick()
    Functions.printInfo(self.debug,"Button_refresh button is click!")
   
   --刷新分为礼包刷新和商店刷新二种类刑
    if self.labelType == 5 then
        ShopData:sendRefreshLiBao(handler(self, self.li_bao_refresh))
    else
        --如果没有刷新令，就显示元宝数量	
        local type = 0
        if PropData:getPropNumOfId(44) > 0 then
            type = 1
            ShopData:sendRefreshShop(type, handler(self, self.refresh))
        else
            type = 2
            local vipLevel = VipData.eventAttr.m_vipLevel
            if ShopData.shopRefreshCount <= g_VipCgf.VipRefreshCount[vipLevel] then
                ShopData:sendRefreshShop(type, handler(self, self.refresh))
            else
                --弹出报错信息
                PromptManager:openTipPrompt(LanguageConfig.language_Shop_1) 
            end
        end
    end

end
--@auto code Button_refresh btFunc end

--@auto code Button_help btFunc
function ShopViewController:onButton_helpClick()
    Functions.printInfo(self.debug,"Button_help button is click!")
    NoticeManager:openNotice(self, {type = NoticeManager.SHOP_REFRESH})
end
--@auto code Button_help btFunc end

--@auto button backcall end


--@auto code view display func
function ShopViewController:onCreate()
    Functions.printInfo(self.debug_b," ShopViewController controller create!")
end

function ShopViewController:onDisplayView()
	Functions.printInfo(self.debug_b," ShopViewController view enter display!")
    
	self._ListView_shop_t:setVisible(false)
    Functions.setPopupKey("store")
    Functions.setAdbrixTag("retension","shop_inter")
    Functions.initResNodeUI(self._resNode_t,{ "jinbi" , "yuanbao", "hunjin" })
    self._Image_Refresh_icon_t:setVisible(false)
    self._Text_Refresh_num_t:setVisible(false)
    
    --显示list
    self:showList()
    self:showShopLabel()
    if self.labelType == 1 then
        self:OpenShowView()
        self._ListView_shop_t:setVisible(true)
    elseif self.labelType == 2 then
        self:CloseShowView()
        self._ListView_tian_ti_t:setVisible(true)
    elseif self.labelType == 3 then
        self:CloseShowView()
        self._ListView_gong_hui_t:setVisible(true)
    elseif self.labelType == 4 then
        self:CloseShowView()
        self._ListView_shen_mi_t:setVisible(true)
        self.shen_mi_refresh()
    elseif self.labelType == 5 then
        self:CloseShowView()
        self._ListView_li_bao_t:setVisible(true)
    end
    
    --查看商城物品
    ShopData:sendShop(handler(self,self.refresh))
    IntegralShopData:sendIntegralShop(handler(self, self.tian_ti_refresh))
    --SoulShopData:sendShop(handler(self, self.shen_mi_refresh))
    ShopData:sendLiBaoData(handler(self, self.li_bao_refresh))
    if PlayerData.eventAttr.m_tongID ~= 0 then
        UnionData:sendShopInfo(handler(self, self.gong_hui_refresh))
        self._Panel_gonghui_3_t:setEnabled(true)
        Functions.setGraySprite(self._Panel_gonghui_3_t:getChildByName("2"),false)
    else
        self._Panel_gonghui_3_t:setEnabled(false)
        Functions.setGraySprite(self._Panel_gonghui_3_t:getChildByName("2"),true)
    end
    
    local ooo = SoulShopData:getTimeOpen()
    local iii = SoulShopData:getTimeEnd()
    local kkk = TimerManager:getCurrentSecond()
    
    if SoulShopData:getTimeOpen() <= TimerManager:getCurrentSecond() and SoulShopData:getTimeEnd() >= TimerManager:getCurrentSecond() then
        self._Panel_shenmi_4_t:setEnabled(true)
        Functions.setGraySprite(self._Panel_shenmi_4_t:getChildByName("2"),false)
    else
        self._Panel_shenmi_4_t:setEnabled(false)
        Functions.setGraySprite(self._Panel_shenmi_4_t:getChildByName("2"),true)
    end
    
    --监听购买礼包后ui变化
    local onLiBao = function(event)
        self:li_bao_refresh()
    end
    Functions.bindEventListener(self.view_t, GameEventCenter, ShopData.REFRESH_LIBAO, onLiBao)

    --监听购买后ui变化
    local onPosition = function(event)
        ShopData:sendShop(handler(self,self.refresh))
    end
    Functions.bindEventListener(self.view_t, GameEventCenter, ShopData.BUY_REFRESH_CHANGE, onPosition)
    --监听物品刷新
    local onPosition = function(event)
        ShopData:sendShop(handler(self,self.refresh))
    end
    Functions.bindEventListener(self.view_t, GameEventCenter, ShopData.REFRESH_CHANGE, onPosition)
    
    --公会购买次数的监听
    local onBuy = function(event)
        --        
        --        local str = tostring(g_csBaseCfg.shopCount - UnionData:getShopBuy_count()).."/"..tostring(g_csBaseCfg.shopCount)
        --        self._Text_buy_count_t:setText(str)
        local data = UnionData:getShopInfo()[event.data.idx]
        local str = tostring(data.m_maxCount - data.m_curCount).."/"..tostring(data.m_maxCount)
        self.widgets[event.data.idx]:getChildByName("Text_buy_count_2"):setText(tostring(str))
        if data.m_maxCount - data.m_curCount == 0 then
            self.widgets[event.data.idx]:getChildByName("Image_sold_out"):setVisible(true)
        else
            self.widgets[event.data.idx]:getChildByName("Image_sold_out"):setVisible(false)
        end
    end
    Functions.bindEventListener(self.view_t, GameEventCenter, UnionData.UNION_BUY_EVENT, onBuy)
end
--@auto code view display func end

--显示label
function ShopViewController:showList()
    self._ListView_shop_t:setVisible(false)
    self._ListView_tian_ti_t:setVisible(false)
    self._ListView_gong_hui_t:setVisible(false)
    self._ListView_shen_mi_t:setVisible(false)
    self._ListView_li_bao_t:setVisible(false)
end

--显示切换
function ShopViewController:OpenShowView()
    self._Button_Refresh_t:setVisible(true)
    self._Image_Refresh_icon_t:setVisible(true)
    self._Image_Refresh_text_t:setVisible(true)
    self._Sprite_time_bg_t:setVisible(true)
end
--显示切换
function ShopViewController:CloseShowView()
    self._Button_Refresh_t:setVisible(false)
    self._Image_Refresh_icon_t:setVisible(false)
    self._Text_Refresh_num_t:setVisible(false)
    self._Sprite_time_bg_t:setVisible(false)
end

--显示label
function ShopViewController:showShopLabel()
    local labelData = {false,false,false,false,false}
    labelData[self.labelType] = true
    
    local onPanel1 = function()
        print("panel 1 click")
        if self.labelType ~= 1 then
            self.labelType = 1
            self:OpenShowView()
            self:showList()
            self._ListView_shop_t:setVisible(true)            
            self:refresh()
        end
    end

    local onPanel2 = function()
        print("panel 2 click")
        if self.labelType ~= 2 then
            self.labelType = 2
            self:CloseShowView()
            self:showList()
            self._ListView_tian_ti_t:setVisible(true)
            self:tian_ti_refresh()
        end
    end 

    local onPanel3 = function()
        print("panel 3 click")
        if self.labelType ~= 3 then
            self.labelType = 3
            self:CloseShowView()
            self:showList()
            self._ListView_gong_hui_t:setVisible(true)
            self:gong_hui_refresh()
        end
    end 

    local onPanel4 = function()
        print("panel 4 click")
        if self.labelType ~= 4 then
            self.labelType = 4
            self:CloseShowView()
            self:showList()
            self._Sprite_time_bg_t:setVisible(true)
            self._ListView_shen_mi_t:setVisible(true)
            self:shen_mi_refresh()
        end
    end 

    local onPanel5 = function()
        print("panel 5 click")
        if self.labelType ~= 5 then
            self.labelType = 5
            self:OpenShowView()
            self:showList()
            self._Sprite_time_bg_t:setVisible(false)
            self._ListView_li_bao_t:setVisible(true)
            self:li_bao_refresh()
        end
    end 

    Functions.initTabCom({ { self._Panel_yingxong_1_t, onPanel1, labelData[1] }, { self._Panel_tianti_2_t, onPanel2, labelData[2]}, { self._Panel_gonghui_3_t, onPanel3, labelData[3]}, 
        { self._Panel_shenmi_4_t, onPanel4, labelData[4]}, { self._Panel_libao_5_t, onPanel5, labelData[5]}})
    --接收到数据再显示界面
    --self:showView()
end

--商城刷新所需魂晶数量
function ShopViewController:shopHunJingNum()
    Functions.printInfo(self.debug,"sendRefreshShop")
    local count = ShopData.shopRefreshCount + 1
    local data = g_VipCgf.RefreshHunJing
    local NUM = 0
    if count > data[#data][2] then
        NUM = data[#data][3]
        return NUM
    end
    
    for k, v in pairs(data) do
    	if v[2] >= count then
    		NUM = v[3]
    		break
    	end
    end
    return NUM
end

function ShopViewController:showshen_miTime()
    Functions.printInfo(self.debug_b,"showTime")
    --倒记时
    local onTime = function(event)
        local m_newtime = TimerManager:getCurrentSecond()
        local CountdownTime = SoulShopData:getTimeEnd()
        m_newtime = CountdownTime - m_newtime 
        if m_newtime < 0 then
            m_newtime = 0
        end

        local time = TimerManager:formatOverTime("%02d:%02d:%02d", m_newtime)
        local str = LanguageConfig.language_soulShop_2..time
        Functions.initLabelOfString( self._Text_Countdown_shen_mi_t, str)
    end
    Functions.bindEventListener(self._Text_Countdown_shen_mi_t, GameEventCenter, TimerManager.SECOND_CHANGE_EVENT, onTime)
    --onTime()
end

function ShopViewController:showTime()
    Functions.printInfo(self.debug_b,"showTime")
    --倒记时
    local onTime = function(event)
        local m_newtime = TimerManager:getCurrentSecond()
        local CountdownTime = ShopData:getCountdown()
        m_newtime = CountdownTime - m_newtime 
        if m_newtime < 0 then
            m_newtime = 0
        end

        local time = TimerManager:formatOverTime("%02d:%02d:%02d", m_newtime)
        local str = LanguageConfig.language_Shop_3..time
        Functions.initLabelOfString( self._Text_Countdown_t, str)
    end
    Functions.bindEventListener(self._Text_Countdown_t, GameEventCenter, TimerManager.SECOND_CHANGE_EVENT, onTime)
    onTime()
end

function ShopViewController:refresh()

    self._Text_Countdown_t:setVisible(true)
    self._Text_Countdown_shen_mi_t:setVisible(false)
    self:showTime()
    
    local shopdatas = ShopData:getShopDatas()
    
    --如果没有刷新令，就显示魂晶数量
    self._Image_Refresh_icon_t:setVisible(true)
    self._Text_Refresh_num_t:setVisible(true)
    self._Image_Refresh_icon_t:ignoreContentAdaptWithSize(true)
    if PropData:getPropNumOfId(44) > 0 then
        self._Image_Refresh_icon_t:setScale(0.5)
        Functions.loadImageWithWidget(self._Image_Refresh_icon_t, "commonUI/res/icons/refresh_Icon.png")
        Functions.initLabelOfString(self._Text_Refresh_num_t:setText(), tostring(PropData:getPropNumOfId(44)))
    else
        self._Image_Refresh_icon_t:setScale(1)
        Functions.loadImageWithWidget(self._Image_Refresh_icon_t, "commonUI/res/image/hunjin.png")
        Functions.initLabelOfString(self._Text_Refresh_num_t:setText(), self:shopHunJingNum())
    end
    
    local listHandler = function(index, widget, model, data)
        local ban = widget:getChildByName("Image_ban")
        local banModel = model:getChildByName("Image_ban")
        local head = widget:getChildByName("Image_ban"):getChildByName("Image_head")
        
        Functions.initTextColor(banModel:getChildByName("Text_cargo_name"),ban:getChildByName("Text_cargo_name"))
        Functions.initTextColor(banModel:getChildByName("Text_buy_count"),ban:getChildByName("Text_buy_count"))
        local heroNode = nil
        if data.m_ItemType == 4 then --4为道具
            ban:getChildByName("Text_cargo_name"):setText(ConfigHandler:getPropNameOfId(data.m_ItemID))
--            Functions.loadImageWithWidget(head, ConfigHandler:getPropImageOfId(data.m_ItemID))
            heroNode = Functions.createPartNode({nodeType = ItemType.Prop, nodeId = data.m_ItemID})
        elseif data.m_ItemType == 1 then--1为武将卡
            ban:getChildByName("Text_cargo_name"):setText(ConfigHandler:getHeroNameOfId(data.m_ItemID))
--            Functions.loadImageWithWidget(head, ConfigHandler:getHeroHeadImageOfId(data.m_ItemID))
            heroNode = Functions.createPartNode({nodeType = ItemType.HeroCard, nodeId = data.m_ItemID})
        elseif data.m_ItemType == 5 then--1为武将卡碎片
            ban:getChildByName("Text_cargo_name"):setText(ConfigHandler:getHeroNameOfId(data.m_ItemID))
            heroNode = Functions.createPartNode({nodeType = ItemType.CardFragment, nodeId = data.m_ItemID})
            Functions.loadImageWithWidget(head, ConfigHandler:getHeroHeadImageOfId(data.m_ItemID))
            ban:getChildByName("Image_name_type"):setVisible(true)
        else
            assert(false,"商店出售的商品类型 type = " .. data.m_ItemType .. "错误")
        end
        Functions.copyParam(head, heroNode)
        head:setVisible(false)
        ban:addChild(heroNode)

        ban:getChildByName("Image_cost_type"):ignoreContentAdaptWithSize(true)
        if data.m_MoneyType == 1 then--1为元宝
            Functions.loadImageWithWidget(ban:getChildByName("Image_cost_type"), "commonUI/res/image/bao.png")
        elseif data.m_MoneyType == 2 then--2为铜钱
            Functions.loadImageWithWidget(ban:getChildByName("Image_cost_type"), "commonUI/res/image/jinbi.png")
        elseif data.m_MoneyType == 3 then--2为铜钱
            Functions.loadImageWithWidget(ban:getChildByName("Image_cost_type"), "commonUI/res/image/hunjin.png")
        end

        ban:getChildByName("Text_buy_count"):setText(tostring(data.m_ItemNum))
        ban:getChildByName("Text_cost_count"):setText(tostring(data.m_ItemPrice))
        
        if data.m_ItemState == 0 then
            ban:getChildByName("Image_sell_out"):setVisible(true)
        else
            ban:getChildByName("Image_sell_out"):setVisible(false)
        end

        local onShopBut = function(event)
            print("button click")
            --打开二级界面
            if data.m_ItemState == 1 then
                self:openChildView("app.ui.popViews.ShopPopView", { data = {datas = data ,shopType = 1} })
            else
                --弹出报错信息
                PromptManager:openTipPrompt(LanguageConfig.language_Shop_2)
            end
        end
        widget:getChildByName("Image_ban"):onTouch(Functions.createClickListener(onShopBut, "zoom"))
        
        if index == 1 then
            self._shopWidget_t = widget:getChildByName("Image_ban")
        end

    end
    --绑定响应事件函数
    if self.labelType == 1 then
        Functions.bindArryListWithData(self._ListView_shop_t,{ firstData = shopdatas }, listHandler,{direction = false,col = 2,firstSegment = 10,segment = 10})
        --接收到数据再显示界面
        self:showView()
    end
end

--天梯商店
function ShopViewController:tian_ti_refresh()
    Functions.printInfo(self.debug_b,"refresh")

    local listHandler = function(index, widget, model,data)
        local ban = widget:getChildByName("Image_ban")
        local banModel = model:getChildByName("Image_ban")
        local head = widget:getChildByName("Image_ban"):getChildByName("Image_head")
        Functions.initTextColor(banModel:getChildByName("Text_cargo_name"),ban:getChildByName("Text_cargo_name"))
        Functions.initTextColor(banModel:getChildByName("Text_buy_count"),ban:getChildByName("Text_buy_count"))

        local heroNode = nil
        if data.m_DebrisType == 4 then --4为道具
            ban:getChildByName("Text_cargo_name"):setText(ConfigHandler:getPropNameOfId(data.m_DebrisID))
            heroNode = Functions.createPartNode({nodeType = ItemType.Prop, nodeId = data.m_DebrisID})
        elseif data.m_DebrisType == 1 then--1为武将卡
            ban:getChildByName("Text_cargo_name"):setText(ConfigHandler:getHeroNameOfId(data.m_DebrisID))
            heroNode = Functions.createPartNode({nodeType = ItemType.HeroCard, nodeId = data.m_DebrisID})
        elseif data.m_DebrisType == 5 then--1为武将卡碎片
            ban:getChildByName("Text_cargo_name"):setText(ConfigHandler:getHeroNameOfId(data.m_DebrisID))
            heroNode = Functions.createPartNode({nodeType = ItemType.CardFragment, nodeId = data.m_DebrisID})
            ban:getChildByName("lmage_name_type"):setVisible(true)
            --Functions.loadImageWithWidget(head, ConfigHandler:getHeroHeadImageOfId(data.m_DebrisID))
        end

        Functions.copyParam(head, heroNode)
        head:setVisible(false)
        ban:addChild(heroNode)

        --ban:getChildByName("Text_cargo_name"):setText(ConfigHandler:getHeroNameOfId(data.m_DebrisID))
        --Functions.loadImageWithWidget(head, ConfigHandler:getHeroHeadImageOfId(data.m_DebrisID))

        ban:getChildByName("Text_buy_count"):setText(tostring(data.m_DebrisCount))
        ban:getChildByName("Text_cost_count"):setText(tostring(data.m_DebrisPrice))

        if data.b_DebrisBuy == 1 then
            ban:getChildByName("Image_sell_out_1"):setVisible(true)
        end


        local onShopBut = function(event)
            print("button click")
            --打开二级界面
            self:openChildView("app.ui.popViews.IntegralShopPopView", { data = index})
        end
        widget:getChildByName("Image_ban"):onTouch(Functions.createClickListener(onShopBut, "zoom"))

    end
    --绑定响应事件函数
    if self.labelType == 2 then
        Functions.bindArryListWithData(self._ListView_tian_ti_t,{firstData = IntegralShopData:getIntegralShopData()}, listHandler,{direction = false,col = 2,firstSegment = 10,segment = 10})
        --接收到数据再显示界面
        self:showView()
    end
end

--公会商店
function ShopViewController:gong_hui_refresh()

    local shopdatas = UnionData:getShopInfo()

    self.widgets = {}
    local listHandler = function(index, widget, model, data)
        local ban = widget:getChildByName("Image_ban")

        self.widgets[#self.widgets + 1] = ban
        local banModel = model:getChildByName("Image_ban")
        local head = widget:getChildByName("Image_ban"):getChildByName("Image_head")
        local open = widget:getChildByName("Image_ban"):getChildByName("Image_sell_out"):getChildByName("Text_buy_open")

        Functions.initTextColor(banModel:getChildByName("Text_cargo_name"),ban:getChildByName("Text_cargo_name"))
        Functions.initTextColor(banModel:getChildByName("Text_buy_count"),ban:getChildByName("Text_buy_count"))
        Functions.initTextColor(banModel:getChildByName("Image_sell_out"):getChildByName("Text_buy_open"),ban:getChildByName("Image_sell_out"):getChildByName("Text_buy_open"))
        local heroNode = nil
        if data.m_ItemType == 4 then --4为道具
            ban:getChildByName("Text_cargo_name"):setText(ConfigHandler:getPropNameOfId(data.m_ItemID))
            --            Functions.loadImageWithWidget(head, ConfigHandler:getPropImageOfId(data.m_ItemID))
            heroNode = Functions.createPartNode({nodeType = ItemType.Prop, nodeId = data.m_ItemID})
        elseif data.m_ItemType == 1 then--1为武将卡
            ban:getChildByName("Text_cargo_name"):setText(ConfigHandler:getHeroNameOfId(data.m_ItemID))
            --            Functions.loadImageWithWidget(head, ConfigHandler:getHeroHeadImageOfId(data.m_ItemID))
            heroNode = Functions.createPartNode({nodeType = ItemType.HeroCard, nodeId = data.m_ItemID})
        elseif data.m_ItemType == 5 then--1为武将卡碎片
            ban:getChildByName("Text_cargo_name"):setText(ConfigHandler:getHeroNameOfId(data.m_ItemID))
            heroNode = Functions.createPartNode({nodeType = ItemType.CardFragment, nodeId = data.m_ItemID})
            Functions.loadImageWithWidget(head, ConfigHandler:getHeroHeadImageOfId(data.m_ItemID))
            ban:getChildByName("Image_name_type"):setVisible(true)
        else
            assert(false,"商店出售的商品类型 type = " .. data.goodtype .. "错误")
        end
        Functions.copyParam(head, heroNode)
        head:setVisible(false)
        ban:addChild(heroNode)

        --ban:getChildByName("Text_cargo_name"):setText(ConfigHandler:getHeroNameOfId(data.m_ItemID))
        ban:getChildByName("Image_cost_type"):ignoreContentAdaptWithSize(true)
        --        if data.m_MoneyType == 1 then--1为元宝
        Functions.loadImageWithWidget(ban:getChildByName("Image_cost_type"), "commonUI/res/image/gongxian.png")
        --        elseif data.m_MoneyType == 2 then--2为铜钱
        --            Functions.loadImageWithWidget(ban:getChildByName("Image_cost_type"), "commonUI/res/image/jinbi.png")
        --        elseif data.m_MoneyType == 3 then--2为铜钱
        --            Functions.loadImageWithWidget(ban:getChildByName("Image_cost_type"), "commonUI/res/image/hunjin.png")
        --        end

        ban:getChildByName("Text_buy_count"):setText(tostring(data.m_ItemNum))
        ban:getChildByName("Text_cost_count"):setText(tostring(data.m_ItemPrice))
        local str = tostring(data.m_maxCount - data.m_curCount).."/"..tostring(data.m_maxCount)
        ban:getChildByName("Text_buy_count_2"):setText(tostring(str))
        if data.m_maxCount - data.m_curCount == 0 then
            ban:getChildByName("Image_sold_out"):setVisible(true)
        else
            ban:getChildByName("Image_sold_out"):setVisible(false)
        end



        local level = UnionData:getUnionShopLevel()
        if data.m_Needlevel > level then
            ban:getChildByName("Image_sell_out"):setVisible(true)
            local str = string.format(LanguageConfig.language_Union_46, data.m_Needlevel)
            open:setText(str)
        else
            ban:getChildByName("Image_sell_out"):setVisible(false)
        end


        local onShopBut = function(event)
            print("button click")
            --打开二级界面
            local level = UnionData:getUnionShopLevel()
            if data.m_Needlevel <= level then
                self:openChildView("app.ui.popViews.ShopPopView", { data = {datas = data ,shopType = 2}})
            else
                --弹出报错信息
                PromptManager:openTipPrompt(LanguageConfig.language_Shop_4)
            end

        end
        widget:getChildByName("Image_ban"):onTouch(Functions.createClickListener(onShopBut, "zoom"))

        if index == 1 then
            self._shopWidget_t = widget:getChildByName("Image_ban")
        end

    end
    --绑定响应事件函数
    if self.labelType == 3 then
        Functions.bindArryListWithData(self._ListView_gong_hui_t,{ firstData = shopdatas }, listHandler,{direction = false,col = 2,firstSegment = 10,segment = 10})
        --接收到数据再显示界面
        self:showView()
    end
end

function ShopViewController:shen_mi_refresh()

    local shopdatas = SoulShopData:getSoulShopDatas()
    
    self:showshen_miTime()
    self._Text_Countdown_t:setVisible(false)
    self._Text_Countdown_shen_mi_t:setVisible(true)

    --如果没有刷新令，就显示魂晶数量


    local listHandler = function(index, widget, model, data)
        local ban = widget:getChildByName("Image_ban")
        local banModel = model:getChildByName("Image_ban")
        local head = widget:getChildByName("Image_ban"):getChildByName("Image_head")

        Functions.initTextColor(banModel:getChildByName("Text_cargo_name"),ban:getChildByName("Text_cargo_name"))
        Functions.initTextColor(banModel:getChildByName("Text_buy_count"),ban:getChildByName("Text_buy_count"))
        Functions.initTextColor((banModel:getChildByName("Image_sell_out"):getChildByName("Text_buy_open")), (ban:getChildByName("Image_sell_out"):getChildByName("Text_buy_open")))
        
        local heroNode = nil
        if data.type == 4 then --4为道具
            ban:getChildByName("Text_cargo_name"):setText(ConfigHandler:getPropNameOfId(data.id))
            heroNode = Functions.createPartNode({nodeType = ItemType.Prop, nodeId = data.id})
        elseif data.type == 1 then--1为武将卡
            ban:getChildByName("Text_cargo_name"):setText(ConfigHandler:getHeroNameOfId(data.id))
            heroNode = Functions.createPartNode({nodeType = ItemType.HeroCard, nodeId = data.id})
        elseif data.type == 5 then--1为武将卡碎片
            ban:getChildByName("Text_cargo_name"):setText(ConfigHandler:getHeroNameOfId(data.id))
            heroNode = Functions.createPartNode({nodeType = ItemType.CardFragment, nodeId = data.id})
            Functions.loadImageWithWidget(head, ConfigHandler:getHeroHeadImageOfId(data.id))
            ban:getChildByName("Image_name_type"):setVisible(true)
        else
            assert(false,"商店出售的商品类型 type = " .. data.type .. "错误")
        end
        Functions.copyParam(head, heroNode)
        head:setVisible(false)
        ban:addChild(heroNode)

        ban:getChildByName("Image_cost_type"):ignoreContentAdaptWithSize(true)
        if data.coldtype == 1 then--1为元宝
            Functions.loadImageWithWidget(ban:getChildByName("Image_cost_type"), "commonUI/res/image/bao.png")
        elseif data.coldtype == 2 then--2为铜钱
            Functions.loadImageWithWidget(ban:getChildByName("Image_cost_type"), "commonUI/res/image/jinbi.png")
        elseif data.coldtype == 3 then--3为魂晶
            Functions.loadImageWithWidget(ban:getChildByName("Image_cost_type"), "commonUI/res/image/hunjin.png")
        end

        ban:getChildByName("Text_buy_count"):setText(tostring(data.num))
        ban:getChildByName("Text_cost_count"):setText(tostring(data.price))

        if data.flag == 1 then
            ban:getChildByName("Image_sell_out"):setVisible(false)
        else
            local open = widget:getChildByName("Image_ban"):getChildByName("Image_sell_out"):getChildByName("Text_buy_open")
            local str = string.format(LanguageConfig.language_soulShop_1, data.needlevel)
            open:setText(str)

            ban:getChildByName("Image_sell_out"):setVisible(true)
        end

        local onShopBut = function(event)
            print("button click")
            --打开二级界面
            if data.flag == 1 then
                self:openChildView("app.ui.popViews.SoulShopPopView", { data = {datas = data ,shopType = 4} })
            else
                --弹出报错信息
                PromptManager:openTipPrompt(LanguageConfig.language_Shop_4)
            end
        end
        widget:getChildByName("Image_ban"):onTouch(Functions.createClickListener(onShopBut, "zoom"))

        if index == 1 then
            self._shopWidget_t = widget:getChildByName("Image_ban")
        end
    end
    --绑定响应事件函数
    if self.labelType == 4 then
        Functions.bindArryListWithData(self._ListView_shen_mi_t,{ firstData = shopdatas }, listHandler,{direction = false,col = 2,firstSegment = 10,segment = 10})
        --接收到数据再显示界面
        self:showView()
    end
end

--礼包商店
function ShopViewController:li_bao_refresh()

    local shopdatas = ShopData:getLiBaoDatas()

    --如果没有刷新令，就显示魂晶数量
    self._Image_Refresh_icon_t:setVisible(true)
    self._Text_Refresh_num_t:setVisible(true)
    self._Image_Refresh_icon_t:ignoreContentAdaptWithSize(true)
    self._Image_Refresh_icon_t:setScale(1)
    Functions.loadImageWithWidget(self._Image_Refresh_icon_t, "commonUI/res/image/yuanbao.png")
    Functions.initLabelOfString(self._Text_Refresh_num_t, tostring(ShopData:getRefresMoney()))

    local listHandler = function(index, widget, model, data)
        local ban = widget:getChildByName("Image_ban")
        local banModel = model:getChildByName("Image_ban")
        local head = widget:getChildByName("Image_ban"):getChildByName("Image_head")

        Functions.initTextColor(banModel:getChildByName("Text_cargo_name"),ban:getChildByName("Text_cargo_name"))
        Functions.initTextColor(banModel:getChildByName("Text_buy_count"),ban:getChildByName("Text_buy_count"))
        
        if data.m_Idx <= 3 then
            Functions.loadImageWithWidget(head, "lk/ui_res/IntegralShopUI/qianghualibao.png")
        else
            Functions.loadImageWithWidget(head, "lk/ui_res/IntegralShopUI/ziyuanlibao.png")
        end

        ban:getChildByName("Image_cost_type"):ignoreContentAdaptWithSize(true)
        Functions.loadImageWithWidget(ban:getChildByName("Image_cost_type"), "commonUI/res/image/bao.png")
        
        ban:getChildByName("Text_cargo_name"):setText(data.m_Name)

        ban:getChildByName("Text_buy_count"):setText(tostring(1))
        ban:getChildByName("Text_cost_count"):setText(tostring(data.m_ItemPrice))

        if not data.m_IsBuy then
            ban:getChildByName("Image_sell_out"):setVisible(true)
        else
            ban:getChildByName("Image_sell_out"):setVisible(false)
        end

        local onShopBut = function(event)
            print("button click")
            --打开二级界面
            if data.m_IsBuy then
                self:openChildView("app.ui.popViews.LiBaoShopPopView", { data = {datas = data} })
            else
                --弹出报错信息
                PromptManager:openTipPrompt(LanguageConfig.language_Shop_2)
            end
        end
        widget:getChildByName("Image_ban"):onTouch(Functions.createClickListener(onShopBut, "zoom"))

        if index == 1 then
            self._shopWidget_t = widget:getChildByName("Image_ban")
        end

    end
    --绑定响应事件函数
    if self.labelType == 5 then
        Functions.bindArryListWithData(self._ListView_li_bao_t,{ firstData = shopdatas }, listHandler,{direction = false,col = 2,firstSegment = 10,segment = 10})
    end
end

--接受push数据
function ShopViewController:onReceivePushData(data)
    --标签类型
    self.labelType = data.labelType
end

function ShopViewController:openBgMusic()
    Audio.playMusic("sound/main2.mp3",true)
end

function ShopViewController:onChangeView()
end

return ShopViewController