--@auto code head
local BaseView = require("app.baseMVC.BaseView")
local SoldiersView = class("SoldiersView", BaseView)

local Functions = require("app.common.Functions")

SoldiersView.csbResPath = "lk/csb"
SoldiersView.debug = true
--@auto code head end


--@auto code uiInit
function SoldiersView:onInitUI()

    --output list
    
    --label list
    self._Text_head_hp_1_t = self.csbNode:getChildByName("main"):getChildByName("Panel_main"):getChildByName("Sprite_compound_bg"):getChildByName("Panel_tax_two"):getChildByName("Sprite_Soldiers_head_two_1"):getChildByName("Text_head_hp_1")
	self._Text_head_hp_1_t:setString(LanguageConfig.lk_common_1)

	self._Text_head_atk_1_t = self.csbNode:getChildByName("main"):getChildByName("Panel_main"):getChildByName("Sprite_compound_bg"):getChildByName("Panel_tax_two"):getChildByName("Sprite_Soldiers_head_two_1"):getChildByName("Text_head_atk_1")
	self._Text_head_atk_1_t:setString(LanguageConfig.lk_common_2)

	self._Text_head_ke_1_t = self.csbNode:getChildByName("main"):getChildByName("Panel_main"):getChildByName("Sprite_compound_bg"):getChildByName("Panel_tax_two"):getChildByName("Sprite_Soldiers_head_two_1"):getChildByName("Text_head_ke_1")
	self._Text_head_ke_1_t:setString(LanguageConfig.ui_Soldiers_2)

	self._Text_fa_fang_1_t = self.csbNode:getChildByName("main"):getChildByName("Panel_main"):getChildByName("Sprite_compound_bg"):getChildByName("Panel_tax_two"):getChildByName("Sprite_Soldiers_head_two_1"):getChildByName("Text_fa_fang_1")
	self._Text_fa_fang_1_t:setString(LanguageConfig.lk_common_4)

	self._Text_fa_shu_1_t = self.csbNode:getChildByName("main"):getChildByName("Panel_main"):getChildByName("Sprite_compound_bg"):getChildByName("Panel_tax_two"):getChildByName("Sprite_Soldiers_head_two_1"):getChildByName("Text_fa_shu_1")
	self._Text_fa_shu_1_t:setString(LanguageConfig.lk_common_3)

	self._Text_head_hp_2_t = self.csbNode:getChildByName("main"):getChildByName("Panel_main"):getChildByName("Sprite_compound_bg"):getChildByName("Panel_tax_two"):getChildByName("Sprite_Soldiers_head_two_2"):getChildByName("Text_head_hp_2")
	self._Text_head_hp_2_t:setString(LanguageConfig.lk_common_1)

	self._Text_head_atk_2_t = self.csbNode:getChildByName("main"):getChildByName("Panel_main"):getChildByName("Sprite_compound_bg"):getChildByName("Panel_tax_two"):getChildByName("Sprite_Soldiers_head_two_2"):getChildByName("Text_head_atk_2")
	self._Text_head_atk_2_t:setString(LanguageConfig.lk_common_2)

	self._Text_head_ke_2_t = self.csbNode:getChildByName("main"):getChildByName("Panel_main"):getChildByName("Sprite_compound_bg"):getChildByName("Panel_tax_two"):getChildByName("Sprite_Soldiers_head_two_2"):getChildByName("Text_head_ke_2")
	self._Text_head_ke_2_t:setString(LanguageConfig.ui_Soldiers_2)

	self._Text_fa_shu_2_t = self.csbNode:getChildByName("main"):getChildByName("Panel_main"):getChildByName("Sprite_compound_bg"):getChildByName("Panel_tax_two"):getChildByName("Sprite_Soldiers_head_two_2"):getChildByName("Text_fa_shu_2")
	self._Text_fa_shu_2_t:setString(LanguageConfig.lk_common_3)

	self._Text_fa_fang_2_t = self.csbNode:getChildByName("main"):getChildByName("Panel_main"):getChildByName("Sprite_compound_bg"):getChildByName("Panel_tax_two"):getChildByName("Sprite_Soldiers_head_two_2"):getChildByName("Text_fa_fang_2")
	self._Text_fa_fang_2_t:setString(LanguageConfig.lk_common_4)
    --button list
    self._Button_back_t = self.csbNode:getChildByName("main"):getChildByName("Panel_left"):getChildByName("Button_back")
	self._Button_back_t:onTouch(Functions.createClickListener(handler(self, self.onButton_backClick), "zoom"))
end
--@auto code uiInit end


--@auto button backcall begin


--@auto code Button_back btFunc
function SoldiersView:onButton_backClick()
    Functions.printInfo(self.debug,"Button_back button is click!")
end
--@auto code Button_back btFunc end

--@auto button backcall end


return SoldiersView