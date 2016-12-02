--@auto code head
local BasePopView = require("app.baseMVC.BasePopView")
local LiBaoShopPopView = class("LiBaoShopPopView", BasePopView)

local Functions = require("app.common.Functions")

LiBaoShopPopView.csbResPath = "lk/csb"
LiBaoShopPopView.debug = true
LiBaoShopPopView.studioSpriteFrames = {"IntegralShopUI" }
--@auto code head end


--@auto code uiInit
--add spriteFrames
if #LiBaoShopPopView.studioSpriteFrames > 0 then
    LiBaoShopPopView.spriteFrameNames = LiBaoShopPopView.spriteFrameNames or {}
    table.insertto(LiBaoShopPopView.spriteFrameNames, LiBaoShopPopView.studioSpriteFrames)
end
function LiBaoShopPopView:onInitUI()

    --output list
    self._Sprite_shop_pop_bg_t = self.csbNode:getChildByName("Sprite_shop_pop_bg")
	self._Text_expend_type_bao_num_t = self.csbNode:getChildByName("Sprite_shop_pop_bg"):getChildByName("Text_expend_type_bao_num")
	self._Text_pop_cargo_name_t = self.csbNode:getChildByName("Sprite_shop_pop_bg"):getChildByName("Text_pop_cargo_name")
	self._Image_Pop_head_t = self.csbNode:getChildByName("Sprite_shop_pop_bg"):getChildByName("Image_Pop_head")
	self._Image_buy_2_t = self.csbNode:getChildByName("Sprite_shop_pop_bg"):getChildByName("Button_Pop_buy"):getChildByName("Image_buy_2")
	self._Image_expend_type_bao_t = self.csbNode:getChildByName("Sprite_shop_pop_bg"):getChildByName("Image_expend_type_bao")
	self._Text_baohan_t = self.csbNode:getChildByName("Sprite_shop_pop_bg"):getChildByName("Text_baohan")
	self._Panel_items_t = self.csbNode:getChildByName("Sprite_shop_pop_bg"):getChildByName("Panel_items")
	
    --label list
    
    --button list
    self._Panel_2_t = self.csbNode:getChildByName("Sprite_shop_pop_bg"):getChildByName("Panel_2")
	self._Panel_2_t:onTouch(Functions.createClickListener(handler(self, self.onPanel_2Click), "zoom"))

	self._Button_Pop_buy_t = self.csbNode:getChildByName("Sprite_shop_pop_bg"):getChildByName("Button_Pop_buy")
	self._Button_Pop_buy_t:onTouch(Functions.createClickListener(handler(self, self.onButton_pop_buyClick), "zoom"))
end
--@auto code uiInit end


--@auto button backcall begin

--@auto code Panel_2 btFunc
function LiBaoShopPopView:onPanel_2Click()
    Functions.printInfo(self.debug,"Panel_2 button is click!")
end
--@auto code Panel_2 btFunc end

--@auto code Button_pop_buy btFunc
function LiBaoShopPopView:onButton_pop_buyClick()
    Functions.printInfo(self.debug,"Button_pop_buy button is click!")
    local onClose = function(event)
    	self.close(self)
    end
    ShopData:sendBuyLiBao(self.shopModel.m_Idx, onClose)
end
--@auto code Button_pop_buy btFunc end

--@auto button backcall end


--@auto code output func
function LiBaoShopPopView:getPopAction()
	Functions.printInfo(self.debug,"pop actionFunc is call")
end

function LiBaoShopPopView:onDisplayView(data)
	Functions.printInfo(self.debug,"pop action finish ")
    self.shopModel = data.datas
    
--    local heroNode = nil
--    heroNode = Functions.createPartNode({nodeType = ItemType.Prop, nodeId = self.shopModel.m_ItemID})
    
    if self.shopModel.m_Idx <= 3 then
        Functions.loadImageWithWidget(self._Image_Pop_head_t, "lk/ui_res/IntegralShopUI/qianghualibao.png")
    else
        Functions.loadImageWithWidget(self._Image_Pop_head_t, "lk/ui_res/IntegralShopUI/ziyuanlibao.png")
    end
    
    self._Text_pop_cargo_name_t:setText(self.shopModel.m_Name)
    
    self._Image_expend_type_bao_t:ignoreContentAdaptWithSize(true)
    Functions.loadImageWithWidget(self._Image_expend_type_bao_t, "commonUI/res/image/bao.png")

    
    local size = self._Panel_items_t:getContentSize()
    local pX = 0
    for k,v in pairs(self.shopModel.m_Goods) do
        local hero = {}
        if v[2] == 4 then --4为道具
            hero = Functions.createPartNode({nodeType = ItemType.Prop, nodeId = v[1], count = v[3]})
        elseif v[2] == 1 then--1为武将卡
            hero = Functions.createPartNode({nodeType = ItemType.HeroCard, nodeId = v[1], count = v[3]})
        elseif v[2] == 5 then--1为武将卡碎片
            hero = Functions.createPartNode({nodeType = ItemType.CardFragment, nodeId = v[1], count = v[3]})
            --Functions.loadImageWithWidget(head, ConfigHandler:getHeroHeadImageOfId(data.id))
            --ban:getChildByName("Image_name_type"):setVisible(true)
        else
            assert(false,"商店出售的商品类型 type = " .. data.type .. "错误")
        end
        
        
        hero:setScale(0.7)
        pX = Functions.getPosOfIndex(k, #self.shopModel.m_Goods, 90, size.width/2)
        hero:setPosition(pX , size.height/2)
        self._Panel_items_t:addChild(hero)
    end
    
    self._Text_expend_type_bao_num_t:setText(tostring(self.shopModel.m_ItemPrice))
end

function LiBaoShopPopView:onCreate()
	Functions.printInfo(self.debug,"child class create call ")
end
--@auto code output func end

return LiBaoShopPopView