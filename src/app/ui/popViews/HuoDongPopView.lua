--@auto code head
local BasePopView = require("app.baseMVC.BasePopView")
local HuoDongPopView = class("HuoDongPopView", BasePopView)

local Functions = require("app.common.Functions")

HuoDongPopView.csbResPath = "lk/csb"
HuoDongPopView.debug = true
HuoDongPopView.studioSpriteFrames = {"HuoDongPopUI","HuoDongPopUI_Text_Bg","HuoDongPopUI_Text" }
--@auto code head end


HuoDongPopView.spriteFrameNames = 
{
}

HuoDongPopView.animaNames = 
{
}


--@auto code uiInit
--add spriteFrames
if #HuoDongPopView.studioSpriteFrames > 0 then
    HuoDongPopView.spriteFrameNames = HuoDongPopView.spriteFrameNames or {}
    table.insertto(HuoDongPopView.spriteFrameNames, HuoDongPopView.studioSpriteFrames)
end
function HuoDongPopView:onInitUI()

    --output list
    self._ScrollView_title_t = self.csbNode:getChildByName("Panel_huo_dong"):getChildByName("ScrollView_title")
	self._Panel_Every_day_t = self.csbNode:getChildByName("Panel_huo_dong"):getChildByName("ScrollView_title"):getChildByName("Panel_Every_day")
	self._Panel_chong_zhi_huo_dong_t = self.csbNode:getChildByName("Panel_huo_dong"):getChildByName("ScrollView_title"):getChildByName("Panel_chong_zhi_huo_dong")
	self._Panel_san_can_t = self.csbNode:getChildByName("Panel_huo_dong"):getChildByName("ScrollView_title"):getChildByName("Panel_san_can")
	self._Panel_15day_sign_t = self.csbNode:getChildByName("Panel_huo_dong"):getChildByName("ScrollView_title"):getChildByName("Panel_15day_sign")
	self._Panel_30day_login_t = self.csbNode:getChildByName("Panel_huo_dong"):getChildByName("ScrollView_title"):getChildByName("Panel_30day_login")
	self._Panel_online_reward_t = self.csbNode:getChildByName("Panel_huo_dong"):getChildByName("ScrollView_title"):getChildByName("Panel_online_reward")
	self._Panel_cheng_zhang_t = self.csbNode:getChildByName("Panel_huo_dong"):getChildByName("ScrollView_title"):getChildByName("Panel_cheng_zhang")
	self._Panel_yue_ka_t = self.csbNode:getChildByName("Panel_huo_dong"):getChildByName("ScrollView_title"):getChildByName("Panel_yue_ka")
	self._Panel_info_t = self.csbNode:getChildByName("Panel_huo_dong"):getChildByName("Panel_info")
	self._Panel_all_t = self.csbNode:getChildByName("Panel_huo_dong"):getChildByName("Panel_info"):getChildByName("Panel_all")
	self._Text_time_t = self.csbNode:getChildByName("Panel_huo_dong"):getChildByName("Panel_info"):getChildByName("Panel_all"):getChildByName("Text_time")
	self._Text_time_num_t = self.csbNode:getChildByName("Panel_huo_dong"):getChildByName("Panel_info"):getChildByName("Panel_all"):getChildByName("Text_time_num")
	self._Text_jie_shao_info_t = self.csbNode:getChildByName("Panel_huo_dong"):getChildByName("Panel_info"):getChildByName("Panel_all"):getChildByName("Text_jie_shao_info")
	self._Text_gold_num_t = self.csbNode:getChildByName("Panel_huo_dong"):getChildByName("Panel_info"):getChildByName("Panel_all"):getChildByName("Text_gold_num")
	self._Panel_jie_shao_t = self.csbNode:getChildByName("Panel_huo_dong"):getChildByName("Panel_info"):getChildByName("Panel_jie_shao")
	self._Text_jie_shao_no_time_t = self.csbNode:getChildByName("Panel_huo_dong"):getChildByName("Panel_info"):getChildByName("Panel_jie_shao"):getChildByName("Text_jie_shao_no_time")
	self._Panel_cheng_zhang_text_t = self.csbNode:getChildByName("Panel_huo_dong"):getChildByName("Panel_info"):getChildByName("Panel_cheng_zhang_text")
	self._Text_cheng_zhang_t = self.csbNode:getChildByName("Panel_huo_dong"):getChildByName("Panel_info"):getChildByName("Panel_cheng_zhang_text"):getChildByName("Text_cheng_zhang")
	self._Panel_yue_ka_text_t = self.csbNode:getChildByName("Panel_huo_dong"):getChildByName("Panel_info"):getChildByName("Panel_yue_ka_text")
	self._Text_yueka_num_t = self.csbNode:getChildByName("Panel_huo_dong"):getChildByName("Panel_info"):getChildByName("Panel_yue_ka_text"):getChildByName("Image_mei_ri_bg"):getChildByName("Text_yueka_num")
	self._Panel_san_can_text_t = self.csbNode:getChildByName("Panel_huo_dong"):getChildByName("Panel_info"):getChildByName("Panel_san_can_text")
	self._ListView_Every_day_t = self.csbNode:getChildByName("Panel_huo_dong"):getChildByName("Panel_info"):getChildByName("ListView_Every_day")
	self._ListView_chong_zhi_t = self.csbNode:getChildByName("Panel_huo_dong"):getChildByName("Panel_info"):getChildByName("ListView_chong_zhi")
	self._ListView_san_can_t = self.csbNode:getChildByName("Panel_huo_dong"):getChildByName("Panel_info"):getChildByName("ListView_san_can")
	self._ListView_chen_zhang_t = self.csbNode:getChildByName("Panel_huo_dong"):getChildByName("Panel_info"):getChildByName("ListView_chen_zhang")
	self._Text_ji_jin_1_t = self.csbNode:getChildByName("Panel_huo_dong"):getChildByName("Panel_info"):getChildByName("ListView_chen_zhang"):getChildByName("model"):getChildByName("Image_mei_ri_bg"):getChildByName("Text_ji_jin_1")
	self._Text_ji_jin_2_t = self.csbNode:getChildByName("Panel_huo_dong"):getChildByName("Panel_info"):getChildByName("ListView_chen_zhang"):getChildByName("model"):getChildByName("Image_mei_ri_bg"):getChildByName("Text_ji_jin_2")
	self._ListView_yue_ka_t = self.csbNode:getChildByName("Panel_huo_dong"):getChildByName("Panel_info"):getChildByName("ListView_yue_ka")
	self._Panel_list_cheng_jiu_t = self.csbNode:getChildByName("Panel_huo_dong"):getChildByName("Panel_info"):getChildByName("Panel_list_cheng_jiu")
	self._Panel_dian_zan_t = self.csbNode:getChildByName("Panel_huo_dong"):getChildByName("Panel_info"):getChildByName("Panel_dian_zan")
	self._Panel_loginReward_t = self.csbNode:getChildByName("Panel_huo_dong"):getChildByName("Panel_info"):getChildByName("Panel_loginReward")
	self._Panel_onlineReward_t = self.csbNode:getChildByName("Panel_huo_dong"):getChildByName("Panel_info"):getChildByName("Panel_onlineReward")
	self._Panel_signReward_t = self.csbNode:getChildByName("Panel_huo_dong"):getChildByName("Panel_info"):getChildByName("Panel_signReward")
	
    --label list
    
    --button list
    self._Button_close_t = self.csbNode:getChildByName("Panel_huo_dong"):getChildByName("Button_close")
	self._Button_close_t:onTouch(Functions.createClickListener(handler(self, self.onButton_closeClick), "zoom"))

	self._Button_cheng_zhang_t = self.csbNode:getChildByName("Panel_huo_dong"):getChildByName("Panel_info"):getChildByName("Panel_cheng_zhang_text"):getChildByName("Button_cheng_zhang")
	self._Button_cheng_zhang_t:onTouch(Functions.createClickListener(handler(self, self.onButton_cheng_zhangClick), "zoom"))

	self._Button_buy_yueka_t = self.csbNode:getChildByName("Panel_huo_dong"):getChildByName("Panel_info"):getChildByName("Panel_yue_ka_text"):getChildByName("Image_mei_ri_bg"):getChildByName("Button_buy_yueka")
	self._Button_buy_yueka_t:onTouch(Functions.createClickListener(handler(self, self.onButton_buy_yuekaClick), "zoom"))

	self._Button_get_dian_zan_t = self.csbNode:getChildByName("Panel_huo_dong"):getChildByName("Panel_info"):getChildByName("Panel_dian_zan"):getChildByName("Image_mei_ri_bg"):getChildByName("Button_get_dian_zan")
	self._Button_get_dian_zan_t:onTouch(Functions.createClickListener(handler(self, self.onButton_get_dian_zanClick), "zoom"))

	self._Button_go_to_dz_t = self.csbNode:getChildByName("Panel_huo_dong"):getChildByName("Panel_info"):getChildByName("Panel_dian_zan"):getChildByName("Button_go_to_dz")
	self._Button_go_to_dz_t:onTouch(Functions.createClickListener(handler(self, self.onButton_go_to_dzClick), "zoom"))
end
--@auto code uiInit end


--@auto button backcall begin

--@auto code Button_cheng_zhang btFunc
--购买成长基金
function HuoDongPopView:onButton_cheng_zhangClick()
    Functions.printInfo(self.debug,"Button_cheng_zhang button is click!")
    if PlayerData.eventAttr.m_gold < g_VipCgf.GrowUpGold then
        --弹出报错信息
        PromptManager:openTipPrompt(LanguageConfig.language_Enlist_11)
        return true
    end
    --监听服务器数据
    local onServerRequest = function (event)
        Functions.setAdbrixTag("retension","growth_wealth_buy",PlayerData.eventAttr.m_level)
        PlayerData.eventAttr.m_gold = event.gold
        local data = event.state
        ActivityData.VIPJiHua = {}
        for k, v in pairs(data) do
            ActivityData.VIPJiHua[#ActivityData.VIPJiHua + 1] = v
        end
        ActivityData.VIPJiHuaBuy = 1
        self:ShowChengZhang()
        
        --弹出报错信息
        PromptManager:openTipPrompt(LanguageConfig.language_9_7)
    end
    NetWork:addNetWorkListener({25,3}, Functions.createNetworkListener(onServerRequest,true,"ret"))
    local msg = {idx = {25, 3}}
    NetWork:sendToServer(msg)

end
--@auto code Button_cheng_zhang btFunc end

--@auto code Button_close btFunc
function HuoDongPopView:onButton_closeClick()
    Functions.printInfo(self.debug,"Button_close button is click!")
    self:close()
end
--@auto code Button_close btFunc end

--@auto code Button_buy_yueka btFunc
function HuoDongPopView:onButton_buy_yuekaClick()
    Functions.printInfo(self.debug,"Button_buy_yueka button is click!")
    VipData:buyMonthCard()
end
--@auto code Button_buy_yueka btFunc end

--@auto code Button_get_dian_zan btFunc
function HuoDongPopView:onButton_get_dian_zanClick()
    Functions.printInfo(self.debug,"Button_get_dian_zan button is click!")
    
    --领取点赞奖励
    local updateShow = function(event)
        self:ShowDainZan()
    end
    ActivityData:sendGetDianZan(updateShow)
end
--@auto code Button_get_dian_zan btFunc end

--@auto code Button_go_to_dz btFunc
function HuoDongPopView:onButton_go_to_dzClick()
    Functions.printInfo(self.debug,"Button_go_to_dz button is click!")
    --接受点赞
    Functions.callJavaFuc(function ( )
        NativeUtil:javaCallHanler({command = "nanoo",url = SDKConfig.facebookUrl,isAddParameter = false})
    end)
    local data = ActivityData:getDianZan()
    --没有点过赞时才向服务器
    if data.dzBZ == 0 then
        local updateShow = function(event)
            self:ShowDainZan()
        end
        ActivityData:sendAcceptDianZan(updateShow)
    end
end
--@auto code Button_go_to_dz btFunc end

--@auto button backcall end


--@auto code output func
function HuoDongPopView:getPopAction()
	Functions.printInfo(self.debug,"pop actionFunc is call")
    Functions.playScaleOpenChildViewAction(self)
end

function HuoDongPopView:onDisplayView()
    Functions.printInfo(self.debug,"pop action finish ")
    Functions.setPopupKey("welfare")
    
    -- --请求累积消费
    -- ActivityData:sendXiaoFei()
    
    --请求充值活动
    ActivityData:sendNumHuoDong()
    
--    --发送天梯
--    ActivityData:sendTianTi()
    
	--请求vip成长基金状态
    ActivityData:sendJiHua()

    --请求成就
    ActivityData:sendChengJiu()

    --查询月卡奖励
    ActivityData:sendYueKa()
    
    --当前语言
    if G_CurrentLanguage == "hk" then
    	--查询点赞奖励
        ActivityData:sendDianZan()
    end

    
    --请求每日充值
    local onData = function()
        self:clearPanel()
        self:ShowTime(1)
        self:ShowEveryDay()
        self:showView()
        
    end
    ActivityData:sendEveryDay(onData)

    
    self.State = 1
    local onPanel = function(index)
        self.State = index
        if self._Text_time_num_t.timeSprite ~= nil then
            self._Text_time_num_t:removeChild(self._Text_time_num_t.timeSprite)
            self._Text_time_num_t.timeSprite = nil
        end
        self:Show(self.State)
    end
    local tableParam = {}
    for i=1,8 do
        local tempParam = {}
        tempParam[#tempParam+1] = self._ScrollView_title_t:getChildByTag(i)
        tempParam[#tempParam+1] = onPanel
        if i == 1 then
            tempParam[#tempParam+1] = true
        end
        tableParam[#tableParam+1] = tempParam
    end
    Functions.initTabCom(tableParam)

    self:bindShowFlag()
    --  
end

function HuoDongPopView:onCreate()
	Functions.printInfo(self.debug,"child class create call ")
end
--@auto code output func end

function HuoDongPopView:onChangeView()
end

function HuoDongPopView:clearPanel()
    for i= 1,15 do 
        self._Panel_info_t:getChildByTag(i):setVisible(false)
    end
end

function HuoDongPopView:bindShowFlag()
    local  attrNames = {{ActivityData,"EveryDayBZ"},{ActivityData,"MoneyBZ"},{ActivityData,"SanCanBZ"},
                        {RewardStateData,"signRewardFlag"},{RewardStateData,"loginRewardFlag"},
                        {ActivityData,"m_onlinePrizeState"},{ActivityData,"VIPBZ"},{ActivityData,"YueKaBZ"}}
    for i=1,8 do
        Functions.bindUiWithModelAttr(self._ScrollView_title_t:getChildByTag(i):getChildByName("flag"), attrNames[i][1], attrNames[i][2],function(event)
            if event.data == true or event.data == 1 then 
                self._ScrollView_title_t:getChildByTag(i):getChildByName("flag"):setVisible(true)
            else
                self._ScrollView_title_t:getChildByTag(i):getChildByName("flag"):setVisible(false)
            end
        end)
        if attrNames[i][1]["eventAttr"][attrNames[i][2]] == true or attrNames[i][1]["eventAttr"][attrNames[i][2]]  == 1 then 
            self._ScrollView_title_t:getChildByTag(i):getChildByName("flag"):setVisible(true)
        else
            self._ScrollView_title_t:getChildByTag(i):getChildByName("flag"):setVisible(false)
        end
    end
end

--显示倒记时
function HuoDongPopView:showTime_(wiget, time)

    if time == 0 then
        return
    end
    if wiget.timeSprite then
        return
    end
    wiget.timeSprite = Functions.createSprite()
    wiget:addChild(wiget.timeSprite)
    --任务倒记时
    local onTime = function()
        local m_newtime = TimerManager:getCurrentSecond()
        local tm = time - m_newtime
        if tm < 0 then
            tm = 0
        end
        local str = LanguageConfig.language_HuoDong_3..string.format(LanguageConfig.language_HuoDong_1, tm/(3600*24), tm%(3600*24)/3600, tm/60%60)
        if tm == 0 then
            str = LanguageConfig.language_HuoDong_2
        end
        Functions.initLabelOfString(wiget, str)
        
--        local time = str--TimerManager:formatTime(LanguageConfig.language_HuoDong_1, tm)
--        local day = TimerManager:formatTime("%d", tm)
--        local iii = tonumber(day)
        --天数小于10天时，就要显示一位数，否则显示二位数

--        else
--            if tonumber(day) < 10 then
--                str = LanguageConfig.language_HuoDong_3..string.sub(time,2,#time)
--            else
--                str = LanguageConfig.language_HuoDong_3..tostring(time)
--            end
--            
--        end
    end
    Functions.bindEventListener(wiget.timeSprite, GameEventCenter, TimerManager.SECOND_CHANGE_EVENT, onTime)
    onTime()
end

function HuoDongPopView:Show(type)
    Functions.printInfo(self.debug,"Show")
    self:clearPanel()
    self:ShowTime(type)
    if type == 1 then --每日特惠
        self:ShowEveryDay()
    elseif type == 2 then --充值活动
        self:ShowNumHuoDong()
    elseif type == 3 then --豪华三餐
        self:ShowSanCan()
    elseif type == 4 then --15天登陆
        self:showSignReward()        
    elseif type == 5 then --每月签到
        self:showLoginReward()
    elseif type == 6 then --在线礼包
        self:showOnlineReward()       
    elseif type == 7 then --成长计划
        self:ShowChengZhang()
    elseif type == 8 then--月卡奖励
        self:ShowYueKa()
    end
    
end

function HuoDongPopView:ShowTime(type)
    Functions.printInfo(self.debug,"Show")
    if type == 6 or type == 4 or type == 7 then
    	return
    end
    if type == 5 then

    else
        local a1 = ActivityData:getEndTime()
        local a2 = ActivityData:getStartTime()
        local Start = ActivityData:getStartTime()[1]
        local Start_hour = tostring(Start.hour)
        --因为是显示时间，所以小于10时前面加个0
        if Start.hour < 10 then
            Start_hour = "0"..tostring(Start.hour)
        end
        local Start_min = tostring(Start.min)
        if Start.min < 10 then
            Start_min = "0"..tostring(Start_min)
        end
        assert(Start, "No start time")
        local EndTime = ActivityData:getEndTime()[1]
        --因为是显示时间，所以小于10时前面加个0
        local EndTime_hour = tostring(EndTime.hour)
        if EndTime.hour < 10 then
            EndTime_hour = "0"..tostring(EndTime.hour)
        end
        local EndTime_min = tostring(EndTime.min)
        if EndTime.min < 10 then
            EndTime_min = "0"..tostring(EndTime_min)
        end
        local str = tostring(Start.month)..LanguageConfig.language_HuoDong_4..tostring(Start.day)..LanguageConfig.language_HuoDong_5.." "..Start_hour..":"..Start_min.."--"..
            tostring(EndTime.month)..LanguageConfig.language_HuoDong_4..tostring(EndTime.day)..LanguageConfig.language_HuoDong_5.." "..EndTime_hour..":"..EndTime_min
        Functions.initLabelOfString( self._Text_time_t, str )

        if os.time(ActivityData.StartTime[1]) > TimerManager:getCurrentSecond() then
            Functions.initLabelOfString(self._Text_time_num_t, LanguageConfig.language_HuoDong_12)
        else
            self:showTime_(self._Text_time_num_t, os.time(ActivityData.EndTime[1]))
        end
    end
end

--成长计划
function HuoDongPopView:ShowChengZhang()
    Functions.printInfo(self.debug,"ShowChengZhang")
    
    self._Panel_all_t:setVisible(false)
    self._Panel_cheng_zhang_text_t:setVisible(true)
    Functions.initLabelOfString( self._Text_cheng_zhang_t, g_welfareInstructions.chengZhang)

    if ActivityData.VIPJiHuaBuy == 0 then
        Functions.setEnabledBt(self._Button_cheng_zhang_t,true)
    elseif ActivityData.VIPJiHuaBuy == 1 then
        Functions.setEnabledBt(self._Button_cheng_zhang_t,false)
    end
    
    local listHandler = function(index, widget, data, model)

        local button = widget:getChildByName("Image_mei_ri_bg")
        local banModel = model:getChildByName("Image_mei_ri_bg")
        Functions.initTextColor(banModel:getChildByName("Text_ji_jin_1"),button:getChildByName("Text_ji_jin_1"))
        Functions.initTextColor(banModel:getChildByName("Text_ji_jin_2"),button:getChildByName("Text_ji_jin_2"))
        
        local onClick = function(event)
            print("button click")
            --打开二级界面
            self:getJiHuaJiang(index)
        end
        button:getChildByName("Button_get"):onTouch(Functions.createClickListener(onClick, "zoom"))

        local num = ActivityData:getJiHuaItem()
        local JiHuaOne = tostring(num[index].level)..LanguageConfig.language_HuoDong_6
        local JiHuaTwo = string.format(LanguageConfig.language_HuoDong_7,num[index].level, num[index].gold )  --(LanguageConfig.language_HuoDong_7)..tostring(num[index].level)..LanguageConfig.language_HuoDong_8..tostring(num[index].gold)..LanguageConfig.language_HuoDong_9
        Functions.initLabelOfString(button:getChildByName("Text_ji_jin_1"), JiHuaOne,button:getChildByName("Text_ji_jin_2"),JiHuaTwo)
        if ActivityData.VIPJiHuaBuy == 0 or data == 0 then
            Functions.setEnabledBt(button:getChildByName("Button_get"),false)
        elseif data == 2 then
            Functions.setEnabledBt(button:getChildByName("Button_get"),false)
            button:getChildByName("Button_get"):getChildByName("Image_get"):ignoreContentAdaptWithSize(true)
            Functions.loadImageWithWidget(button:getChildByName("Button_get"):getChildByName("Image_get"),"commonUI/res/common/yilingqu.png")
        elseif data == 1 then
            Functions.setEnabledBt(button:getChildByName("Button_get"),true)
        end
    end
    --绑定响应事件函数
    Functions.bindListWithData(self._ListView_chen_zhang_t, ActivityData:getJiHua(), listHandler)
end

--成长计划领奖
function HuoDongPopView:getJiHuaJiang(idx)
    --监听服务器数据
    local onServerRequest = function (event)
        PlayerData.eventAttr.m_gold = event.gold
        ActivityData.VIPJiHua[idx] = 2
        self:ShowChengZhang()
        
        --弹出报错信息
        PromptManager:openTipPrompt(LanguageConfig.language_task_1)
    end
    NetWork:addNetWorkListener({25,4}, Functions.createNetworkListener(onServerRequest,true,"ret"))
    local msg = {idx = {25, 4},index = idx }
    NetWork:sendToServer(msg)
end

--每日充值领奖
function HuoDongPopView:getEveryDayJiang(idx)
    --监听服务器数据
    local onServerRequest = function(event)
        local data = event.data
        PlayerData.eventAttr.m_gold = data.gold
        PlayerData.eventAttr.m_hunjing = data.hunjing
        PlayerData.eventAttr.m_money = data.money
        PlayerData.eventAttr.m_soul = data.soul
        for k, v in pairs(data.items) do
            Functions:addItemResources( {id = v.id, type = v.type, count = v.count, slot = v.slot} )
        end
        ActivityData.EveryDay[idx] = 2
        self:ShowEveryDay()
        
        --弹出报错信息
        PromptManager:openTipPrompt(LanguageConfig.language_task_1)
    end
    NetWork:addNetWorkListener({20,16}, Functions.createNetworkListener(onServerRequest,true,"ret"))
    local msg = {idx = {20, 16},index = idx }
    NetWork:sendToServer(msg)
end

--充值活动领奖
function HuoDongPopView:getMoneyHuoDong(idx)
    --监听服务器数据
    local onServerRequest = function(event)
        local data = event.data
        PlayerData.eventAttr.m_gold = data.gold
        PlayerData.eventAttr.m_hunjing = data.hunjing
        PlayerData.eventAttr.m_money = data.money
        PlayerData.eventAttr.m_soul = data.soul
        for k, v in pairs(data.items) do
            Functions:addItemResources( {id = v.id, type = v.type, count = v.count, slot = v.slot} )
        end
        ActivityData.MoneyHuoDong[idx] = 2
        self:ShowNumHuoDong()
        
        --弹出报错信息
        PromptManager:openTipPrompt(LanguageConfig.language_task_1)
    end
    NetWork:addNetWorkListener({20,9}, Functions.createNetworkListener(onServerRequest,true,"ret"))
    local msg = {idx = {20, 9}, index = idx }
    NetWork:sendToServer(msg)
end


--天梯领奖
function HuoDongPopView:getTianTi(idx)
    --监听服务器数据
    local onServerRequest = function(event)
        local data = event.data
        PlayerData.eventAttr.m_gold = data.gold
        PlayerData.eventAttr.m_hunjing = data.hunjing
        PlayerData.eventAttr.m_money = data.money
        PlayerData.eventAttr.m_soul = data.soul
        for k, v in pairs(data.items) do
            Functions:addItemResources( {id = v.id, type = v.type, count = v.count, slot = v.slot} )
        end
        ActivityData.MoneyHuoDong[idx] = 2
        self:ShowNumHuoDong()
        --弹出报错信息
        PromptManager:openTipPrompt(LanguageConfig.language_task_1)
    end
    NetWork:addNetWorkListener({20,9}, Functions.createNetworkListener(onServerRequest,true,"ret"))
    local msg = {idx = {20, 9}, index = idx }
    NetWork:sendToServer(msg)
end

--每日特惠
function HuoDongPopView:ShowEveryDay()
    Functions.printInfo(self.debug,"ShowChengZhang")
    self._ListView_Every_day_t:setVisible(true)
    self._Panel_jie_shao_t:setVisible(true)

    self._Text_gold_num_t:setVisible(true)
    local str = string.format(LanguageConfig.language_HuoDong_13, ActivityData:getEveryDayGold())
    Functions.initLabelOfString( self._Text_gold_num_t, str)
    Functions.initLabelOfString( self._Text_jie_shao_no_time_t, g_welfareInstructions.teHui)

    local listHandler = function(index, widget, data, model)

        local button = widget:getChildByName("Image_chong_zhi_bg")
        local banModel = model:getChildByName("Image_chong_zhi_bg")
        Functions.initTextColor(banModel:getChildByName("Text_yuanjia_num"),button:getChildByName("Text_yuanjia_num"))
--        local numGold = ActivityData:getEveryItemGold()
--        Functions.initLabelOfString(button:getChildByName("Text_yuanjia_num"), numGold[index])
        
        
        local FadeIn = cc.FadeIn:create(1)
        local FadeOut = cc.FadeOut:create(1)
        local play = cc.Sequence:create(FadeOut,FadeIn)
        local rep = cc.RepeatForever:create(play)--永久播放 （次数设为负数可以一直播放）

        Functions.playAnimaWithCreateSprite(widget,rep,true, "lk/ui_res/HuoDongPopUI/chongzhi_2.png", cc.p( 355, 35 ),1.1)
        local param = {scale = 1, pos = cc.p( 355, 35 ) , zorder = 10, spriteName = "commonUI/res/lk/HuoDongPopUI/chongzhi_1.png"}
        local sp = Functions.createSprite(param)

        widget:addChild(sp)

        local onClick = function(event)
            print("button click")
            --打开二级界面
            self:getEveryDayJiang(index)
        end
        button:getChildByName("Button_get"):onTouch(Functions.createClickListener(onClick, "zoom"))
        
        local heroNode = nil
        local item = ActivityData:getEveryDayItem()[index].goods
        
        assert(#item <= 4,"HuoDongPopView:ShowEveryDay————每日充值奖励物品大于4个")
        
        for k, v in pairs(item) do
            if v.type == 4 then --4为道具
                heroNode = Functions.createPartNode({nodeType = ItemType.Prop, nodeId = v.id, count = v.count})
            elseif v.type == 1 then--1为武将卡
                heroNode = Functions.createPartNode({nodeType = ItemType.HeroCard, nodeId = v.id, count = v.count})
            elseif v.type == 5 then--1为武将卡碎片
                heroNode = Functions.createPartNode({nodeType = ItemType.CardFragment, nodeId = v.id, count = v.count})
                --Functions.loadImageWithWidget(head, ConfigHandler:getHeroHeadImageOfId(v.id))
            else
                assert(false,"商店出售的商品类型 type = " .. data.m_ItemType .. "错误")
            end
            local Price = ConfigHandler:getItemPrice(v.id,v.type) 
            local numGold = Price*v.count
            Functions.initLabelOfString(button:getChildByName("Text_yuanjia_num"), numGold)
            
            local Image = "Image_"..tostring(k)
            Functions.copyParam(button:getChildByName(Image), heroNode)
            local wgt = heroNode:getChildByName("model")
            wgt:setTouchEnabled(false)
            local onImage = function(parameters)
                PromptManager:openInfPrompt({type = v.type,id = v.id,target = heroNode:getChildByName("model")})
            end
            
            widget:getChildByName("Image_chong_zhi_bg"):getChildByName(Image):onTouch(Functions.createClickListener(onImage, "zoom"))

            button:getChildByName(Image):setVisible(true)
            button:addChild(heroNode)
        end


        local EveryDayNum = tostring(ActivityData:getEveryDayItem()[index].payCount)..LanguageConfig.language_HuoDong_9
        Functions.initLabelOfString(button:getChildByName("Text_chong_num"), EveryDayNum)
        if data == 0 then
            Functions.setEnabledBt(button:getChildByName("Button_get"),false)
        elseif data == 2 then
            Functions.setEnabledBt(button:getChildByName("Button_get"),false)
            button:getChildByName("Button_get"):getChildByName("Image_get"):ignoreContentAdaptWithSize(true)
            Functions.loadImageWithWidget(button:getChildByName("Button_get"):getChildByName("Image_get"),"commonUI/res/common/yilingqu.png")
        elseif data == 1 then
            Functions.setEnabledBt(button:getChildByName("Button_get"),true)
        end
    end
    --绑定响应事件函数
    local iiiii = ActivityData:getEveryDay()
    Functions.bindListWithData(self._ListView_Every_day_t, ActivityData:getEveryDay(), listHandler)
end

--充值活动
function HuoDongPopView:ShowNumHuoDong()
    Functions.printInfo(self.debug,"ShowChengZhang")
    self._Panel_all_t:setVisible(true)

    self._Text_gold_num_t:setVisible(true)
    local str = string.format(LanguageConfig.language_HuoDong_15, ActivityData:getMoneyHuoDongNum())
    Functions.initLabelOfString( self._Text_gold_num_t, str)
    
    Functions.initLabelOfString( self._Text_jie_shao_info_t, g_welfareInstructions.chongZhi)

    local listHandler = function(index, widget, data, model)

        local button = widget:getChildByName("Image_mei_ri_bg")

        local onClick = function(event)
            print("button click")
            --打开二级界面
            self:getMoneyHuoDong(index)
        end
        button:getChildByName("Button_get"):onTouch(Functions.createClickListener(onClick, "zoom"))

        local heroNode = nil
        local item = ActivityData:getMoneyHuoDongItem()[index].goods

        assert(#item <= 4,"HuoDongPopView:ShowEveryDay————每日充值奖励物品大于4个")

        for k, v in pairs(item) do
            if v.type == 4 then --4为道具
                heroNode = Functions.createPartNode({nodeType = ItemType.Prop, nodeId = v.id, count = v.count})
            elseif v.type == 1 then--1为武将卡
                heroNode = Functions.createPartNode({nodeType = ItemType.HeroCard, nodeId = v.id, count = v.count})
            elseif v.type == 5 then--1为武将卡碎片
                heroNode = Functions.createPartNode({nodeType = ItemType.CardFragment, nodeId = v.id, count = v.count})
                --Functions.loadImageWithWidget(head, ConfigHandler:getHeroHeadImageOfId(v[1]))
            else
                assert(false,"商店出售的商品类型 type = " .. data.m_ItemType .. "错误")
            end
            local Image = "Image_"..tostring(k)
            Functions.copyParam(button:getChildByName(Image), heroNode)
            local wgt = heroNode:getChildByName("model")
            wgt:setTouchEnabled(false)
            
            local onImage = function(parameters)
                PromptManager:openInfPrompt({type = v.type,id = v.id,target = heroNode:getChildByName("model")})
            end

            widget:getChildByName("Image_mei_ri_bg"):getChildByName(Image):onTouch(Functions.createClickListener(onImage, "zoom"))

            button:getChildByName(Image):setVisible(true)
            button:addChild(heroNode)
        end


        local EveryDayNum = tostring(ActivityData:getMoneyHuoDongItem()[index].payCount)..LanguageConfig.language_HuoDong_9
        Functions.initLabelOfString(button:getChildByName("Text_chong_num"), EveryDayNum)
        if data == 0 then
            Functions.setEnabledBt(button:getChildByName("Button_get"),false)
        elseif data == 2 then
            Functions.setEnabledBt(button:getChildByName("Button_get"),false)
            button:getChildByName("Button_get"):getChildByName("Image_get"):ignoreContentAdaptWithSize(true)
            Functions.loadImageWithWidget(button:getChildByName("Button_get"):getChildByName("Image_get"),"commonUI/res/common/yilingqu.png")
        elseif data == 1 then
            Functions.setEnabledBt(button:getChildByName("Button_get"),true)
        end
    end
    --绑定响应事件函数
    local iiiii = ActivityData:getMoneyHuoDong()
    Functions.bindListWithData(self._ListView_chong_zhi_t, ActivityData:getMoneyHuoDong(), listHandler)
end


--豪华三餐
function HuoDongPopView:ShowSanCan()
    Functions.printInfo(self.debug,"ShowChengZhang")
    
    
    self._Text_gold_num_t:setVisible(false)
    self._Panel_san_can_text_t:setVisible(true)

    local listHandler = function(index, widget, data, model)

        local button = widget:getChildByName("Image_mei_ri_bg")
        local banModel = model:getChildByName("Image_mei_ri_bg")
        Functions.initTextColor(banModel:getChildByName("Text_tiem"),button:getChildByName("Text_tiem"))

        local onClick = function(event)
            print("button click")
            --打开二级界面
            local updateShow = function(event)
                --弹出提示信息
                PromptManager:openTipPrompt(LanguageConfig.language_task_1)
            	self:ShowSanCan()
            end
            ActivityData:sendGetSanCan(index, updateShow)
        end
        button:getChildByName("Button_get"):onTouch(Functions.createClickListener(onClick, "zoom"))
        
        if index == 2 then
            Functions.loadImageWithWidget(button:getChildByName("Image_yuan"), "commonUI/res/lk/HuoDongPopUI/hhwanc.png")
        elseif index == 3 then
            Functions.loadImageWithWidget(button:getChildByName("Image_yuan"), "commonUI/res/lk/HuoDongPopUI/hhyex.png")
        end
        
        
        local timeST = TimerManager:formatTime("%H:%M", data.st)
        local timeET = TimerManager:formatTime("%H:%M", data.et)
        local str = string.format(LanguageConfig.language_HuoDong_16, timeST, timeET)
        Functions.initLabelOfString( button:getChildByName("Text_tiem"), str)

        if data.flag == 0 then
            Functions.setEnabledBt(button:getChildByName("Button_get"),false)
        elseif data.flag == 2 then
            Functions.setEnabledBt(button:getChildByName("Button_get"),false)
            button:getChildByName("Button_get"):getChildByName("Image_get"):ignoreContentAdaptWithSize(true)
            Functions.loadImageWithWidget(button:getChildByName("Button_get"):getChildByName("Image_get"),"commonUI/res/common/yilingqu.png")
        elseif data.flag == 1 then
            Functions.setEnabledBt(button:getChildByName("Button_get"),true)
        end
    end
    --绑定响应事件函数
    Functions.bindListWithData(self._ListView_san_can_t, ActivityData:getSanCan(), listHandler)
end

--月卡奖励
function HuoDongPopView:ShowYueKa()
    Functions.printInfo(self.debug,"ShowYueKa")
     self._Panel_jie_shao_t:setVisible(true)
    
    
    self._Text_gold_num_t:setVisible(true)
    self._Panel_yue_ka_text_t:setVisible(true)
    self._ListView_yue_ka_t:setVisible(true)
    Functions.initLabelOfString( self._Text_jie_shao_no_time_t, g_welfareInstructions.yueKa)
    
    local daoJiShi = ActivityData:getYueKaInfo().monthTime
    local time = 0
    
    if daoJiShi ~= 0 then
        time = ((ActivityData:getYueKaInfo().monthTime - TimerManager:getCurrentSecond()) / (24*60*60))
    end
    local text = string.format(LanguageConfig.language_HuoDong_17, tonumber(time))
    Functions.initLabelOfString( self._Text_yueka_num_t, text)

    local listHandler = function(index, widget, data, model)

        local button = widget:getChildByName("Image_mei_ri_bg")
        local banModel = model:getChildByName("Image_mei_ri_bg")

        local onClick = function(event)
            print("button click")
            --打开二级界面
            local updateShow = function(event)
                --弹出提示信息
                PromptManager:openTipPrompt(LanguageConfig.language_task_1)
                self:ShowYueKa()
            end
            ActivityData:sendGetYueKa(index, updateShow)
        end
        button:getChildByName("Button_get"):onTouch(Functions.createClickListener(onClick, "zoom"))
        
        local heroNode = nil
        local item = ActivityData:getYueKa()[index]

        assert(#item <= 4,"HuoDongPopView:ShowEveryDay————每日充值奖励物品大于4个")
        for k, v in ipairs(item) do
            if v[2] == 4 then --4为道具
                heroNode = Functions.createPartNode({nodeType = ItemType.Prop, nodeId = v[1], count = v[3]})
            elseif v[2] == 1 then--1为武将卡
                heroNode = Functions.createPartNode({nodeType = ItemType.HeroCard, nodeId = v[1], count = v[3]})
            elseif v[2] == 5 then--1为武将卡碎片
                heroNode = Functions.createPartNode({nodeType = ItemType.CardFragment, nodeId = v[1], count = v[3]})
                --Functions.loadImageWithWidget(head, ConfigHandler:getHeroHeadImageOfId(v[1]))
            else
                assert(false,"商店出售的商品类型 type = " .. v[2] .. "错误")
            end
            local Image = "Image_"..tostring(k)
            Functions.copyParam(button:getChildByName(Image), heroNode)
            local wgt = heroNode:getChildByName("model")
            wgt:setTouchEnabled(false)

            local onImage = function(parameters)
                PromptManager:openInfPrompt({type = v[2],id = v[1],target = heroNode:getChildByName("model")})
            end

            widget:getChildByName("Image_mei_ri_bg"):getChildByName(Image):onTouch(Functions.createClickListener(onImage, "zoom"))

            button:getChildByName(Image):setVisible(true)
            button:addChild(heroNode)
        end

        if index == 2 then
            Functions.loadImageWithWidget(button:getChildByName("Image_yuan"), "commonUI/res/lk/HuoDongPopUI/mrlb.png")
        end

        if data.bz == 0 then
            Functions.setEnabledBt(button:getChildByName("Button_get"),false)
        elseif data.bz == 2 then
            Functions.setEnabledBt(button:getChildByName("Button_get"),false)
            button:getChildByName("Button_get"):getChildByName("Image_get"):ignoreContentAdaptWithSize(true)
            Functions.loadImageWithWidget(button:getChildByName("Button_get"):getChildByName("Image_get"),"commonUI/res/common/yilingqu.png")
        elseif data.bz == 1 then
            Functions.setEnabledBt(button:getChildByName("Button_get"),true)
        end
    end
    local ppp = ActivityData:getYueKa()
    --绑定响应事件函数
    Functions.bindListWithData(self._ListView_yue_ka_t, ActivityData:getYueKa(), listHandler)
end

--成就奖励
function HuoDongPopView:ShowChengJiu()
    Functions.printInfo(self.debug,"ShowChengJiu")
    
    
    self._Panel_all_t:setVisible(false)
    self._Panel_cheng_zhang_text_t:setVisible(false)
    self._Panel_yue_ka_text_t:setVisible(false)

    local listHandler = function(index, widget, model, data)
    
        widget:setTouchEnabled(true)
        widget:setSwallowTouches(false)
         local button = widget:getChildByName("Image_mei_ri_bg")
         local banModel = model:getChildByName("Image_mei_ri_bg")
         Functions.initTextColor(banModel:getChildByName("Text_tiao_jian"),button:getChildByName("Text_tiao_jian"))
         local text = string.format("language_chengjiu_%d", data.tj)
         local str = string.format(LanguageConfig[text], data.tjnum)
         button:getChildByName("Text_tiao_jian"):setText(str)
         
        local onClick = function(event)
            print("button click")
            --打开二级界面
            local updateShow = function(event)
                --弹出提示信息
                PromptManager:openTipPrompt(LanguageConfig.language_task_1)
                self:ShowChengJiu()
            end
            ActivityData:sendGetChengJiu(data.id, updateShow)
        end
        button:getChildByName("Button_get"):onTouch(Functions.createClickListener(onClick, "zoom"))


        local heroNode = nil
        local item = data.goods

        assert(#item <= 4,"HuoDongPopView:ShowEveryDay————每日充值奖励物品大于4个")

        for k, v in pairs(item) do
            local Image = "Image_"..tostring(k)
            button:getChildByName(Image):getChildByName("Image_star"):setVisible(true)
            button:getChildByName(Image):getChildByName("Image_sui_pian"):setVisible(false)
            
            local itemWidget = button:getChildByName(Image)--:getChildByName("disImage") --Image_item
            local starWidget = button:getChildByName(Image):getChildByName("Image_star")
            
            local textNum = button:getChildByName(Image):getChildByName("Text_num")
            local str = "X"..tostring(v[3])
            textNum:setString(str)
             
            if v[2] == 4 then --4为道具
                --heroNode = Functions.createPartNode({nodeType = ItemType.Prop, nodeId = v[1], count = v[3]})
                button:getChildByName(Image):getChildByName("Image_star"):setVisible(false)
                Functions.initItemComOfId(itemWidget, v[1])
            elseif v[2] == 1 then--1为武将卡
                Functions.loadImageWithWidget(itemWidget:getChildByName("disImage"), ConfigHandler:getHeroHeadImageOfId(v[1]))
                Functions.HeroStar(starWidget, v[1])
            elseif v[2] == 5 then--1为武将卡碎片
                button:getChildByName(Image):getChildByName("Image_sui_pian"):setVisible(true)
                Functions.loadImageWithWidget(itemWidget:getChildByName("disImage"), ConfigHandler:getHeroHeadImageOfId(v[1]))
                Functions.HeroStar(starWidget, v[1])
            else
                assert(false,"商店出售的商品类型 type = " .. data.m_ItemType .. "错误")
            end

            local onImage = function(parameters)
                PromptManager:openInfPrompt({type = v[2],id = v[1],target = widget:getChildByName("Image_mei_ri_bg"):getChildByName(Image)})
            end
            widget:getChildByName("Image_mei_ri_bg"):getChildByName(Image):onTouch(Functions.createClickListener(onImage, "zoom"))

            button:getChildByName(Image):setVisible(true)
            --button:addChild(heroNode)
        end

        if data.bz == 0 then
            Functions.loadImageWithWidget(button:getChildByName("Button_get"):getChildByName("Image_get"),"commonUI/res/common/lingqu.png")
            Functions.setEnabledBt(button:getChildByName("Button_get"),false)
            Functions.loadImageWithWidget(button:getChildByName("Button_get"):getChildByName("Image_get"),"commonUI/res/common/lingqu.png")
        elseif data.bz == 2 then
            Functions.setEnabledBt(button:getChildByName("Button_get"),false)
            button:getChildByName("Button_get"):getChildByName("Image_get"):ignoreContentAdaptWithSize(true)
            Functions.loadImageWithWidget(button:getChildByName("Button_get"):getChildByName("Image_get"),"commonUI/res/common/yilingqu.png")
        elseif data.bz == 1 then
            Functions.loadImageWithWidget(button:getChildByName("Button_get"):getChildByName("Image_get"),"commonUI/res/common/lingqu.png")
            Functions.setEnabledBt(button:getChildByName("Button_get"),true)
            Functions.loadImageWithWidget(button:getChildByName("Button_get"):getChildByName("Image_get"),"commonUI/res/common/lingqu.png")
        end
    
    end
    
    local romveNodeHandler = function(widget)
        Functions.removeEventBeforeUiClean(widget)
    end

    Functions.bindTableViewWithData(self._Panel_list_cheng_jiu_t,{ firstData = ActivityData:getChengJiu() },
    {handler = listHandler, romveNodeHandler = romveNodeHandler},{direction = true, col = 1, firstSegment = 0, segment = 2 }) 
end

--点赞
function HuoDongPopView:ShowDainZan()
    Functions.printInfo(self.debug,"ShowDainZan")

    
    self._Text_gold_num_t:setVisible(false)
    self._Panel_dian_zan_t:setVisible(true)
    Functions.initLabelOfString( self._Text_jie_shao_no_time_t, g_welfareInstructions.dianZan)

    local heroNode = nil
    local data = ActivityData:getDianZan()
    local item = data.goods

    assert(#item <= 5,"HuoDongPopView:ShowEveryDay————每日充值奖励物品大于4个")

    for k, v in ipairs(item) do
        if v[2] == 4 then --4为道具
            heroNode = Functions.createPartNode({nodeType = ItemType.Prop, nodeId = v[1], count = v[3]})
        elseif v[2] == 1 then--1为武将卡
            heroNode = Functions.createPartNode({nodeType = ItemType.HeroCard, nodeId = v[1], count = v[3]})
        elseif v[2] == 5 then--1为武将卡碎片
            heroNode = Functions.createPartNode({nodeType = ItemType.CardFragment, nodeId = v[1], count = v[3]})
            --Functions.loadImageWithWidget(head, ConfigHandler:getHeroHeadImageOfId(v[1]))
        else
            assert(false,"商店出售的商品类型 type = " .. v[2] .. "错误")
        end
        local Image = "Image_"..tostring(k)
        local button = self._Panel_dian_zan_t:getChildByName("Image_mei_ri_bg")
        Functions.copyParam(button:getChildByName(Image), heroNode)
        local wgt = heroNode:getChildByName("model")
        wgt:setTouchEnabled(false)

        local onImage = function(parameters)
            PromptManager:openInfPrompt({type = v[2],id = v[1],target = heroNode:getChildByName("model")})
        end

        button:getChildByName(Image):onTouch(Functions.createClickListener(onImage, "zoom"))

        button:getChildByName(Image):setVisible(true)
        button:addChild(heroNode)
    end
    
--    if data.dzBZ ~= 0 then
--        Functions.setEnabledBt(self._Button_go_to_dz_t,false)
--    end
    
    if data.rewardBZ == 0 then
        Functions.setEnabledBt(self._Button_get_dian_zan_t,false)
    elseif data.rewardBZ == 2 then
        Functions.setEnabledBt(self._Button_get_dian_zan_t,false)
        self._Button_get_dian_zan_t:getChildByName("Image_get"):ignoreContentAdaptWithSize(true)
        Functions.loadImageWithWidget(self._Button_get_dian_zan_t:getChildByName("Image_get"),"commonUI/res/common/yilingqu.png")
    elseif data.rewardBZ == 1 then
        Functions.setEnabledBt(self._Button_get_dian_zan_t,true)
    end
end
--登陆30天领奖
function HuoDongPopView:showLoginReward()
    Functions.initLabelOfString( self._Text_jie_shao_no_time_t, g_welfareInstructions.qianDao)
    self._Panel_loginReward_t:setVisible(true)
    self._Panel_jie_shao_t:setVisible(true)
    local prizeData = Functions.copyTab(RewardData.rewardInf.Accumulate) 
    local prizeStateData = RewardStateData.rewardState
    local listHandler = function(index, widget, model, data) 
        widget:setTouchEnabled(true) 
        widget:getChildByName("prizePanel"):getChildByName("prize"):setTouchEnabled(false)
        widget:setSwallowTouches(false)  
        local prizeCntLabel = widget:getChildByName("prizePanel"):getChildByName("prizeCntLabel")
        local prize = widget:getChildByName("prizePanel"):getChildByName("prize")
        local mask = widget:getChildByName("prizePanel"):getChildByName("mask")
        mask:setVisible(false)
        local choose = widget:getChildByName("prizePanel"):getChildByName("choose")
        choose:setVisible(false)
        local done = widget:getChildByName("prizePanel"):getChildByName("done")
        done:setVisible(false)
        --是否双倍天数
        local vipDouble = widget:getChildByName("prizePanel"):getChildByName("vipDouble")
        for t =1,#g_VipCgf.VipLevel do 
            if g_VipCgf.VipLogReward[t] == i then
                vipDouble:getChildByName("level"):setString("V" .. tostring(t))
                vipDouble:setVisible(true)
            end
        end

        local isReward = false
        prizeCntLabel:setString("x" .. tostring(data[1][3]))

        if data[1][2] == 1 then
            local heroHeadImg = ConfigHandler:getHeroHeadImageOfId(data[1][1]) 
            prize:ignoreContentAdaptWithSize(true)
            Functions.loadImageWithWidget(prize, heroHeadImg)
        elseif data[1][2] == 5 then
            local heroHeadImg = ConfigHandler:getHeroHeadImageOfId(data[1][1]) 
            prize:ignoreContentAdaptWithSize(true)
            widget:getChildByName("prizePanel"):getChildByName("piece"):setVisible(true)
            Functions.loadImageWithWidget(prize, heroHeadImg)
        elseif data[1][2] == 4  and data[1][1] > 0 then
            local propImg = ConfigHandler:getPropImageOfId(data[1][1])  
            prize:ignoreContentAdaptWithSize(true)           
            Functions.loadImageWithWidget(prize, propImg)
        elseif data[1][2] == 4  and data[1][1] == -3 then
            Functions.loadImageWithWidget(prize, "property_money.png")

        elseif data[1][2] == 4  and data[1][1] == -2 then
            Functions.loadImageWithWidget(prize, "property_gold.png")
        elseif data[1][2] == 4  and data[1][1] == -5 then
            Functions.loadImageWithWidget(prize, "soul80.png")
        elseif data[1][2] == 4  and data[1][1] == -6 then
            Functions.loadImageWithWidget(prize, "property_soulCrystal.png")
        end
        
        if index < prizeStateData.m_lgAccumu then  --无法领取状态
            mask:setVisible(true)
        end
        if index == prizeStateData.m_lgAccumu then
            choose:setVisible(true) 
        end        
        if index == prizeStateData.m_lgAccumu and prizeStateData.m_lgAccumuRd[index] == false then --当前可领取状态
            isReward = true            
        end
        
        if prizeStateData.m_lgAccumuRd[index] == true then --当前已领取状态
            done:setVisible(true) 
            mask:setVisible(true)

        end   
        local onPrizeClick = function() 
            if isReward == true then    
                local handler = function (event)
                    Functions.playSound("getrewards.mp3")
                    mask:setVisible(true)
                    done:setVisible(true)
                    isReward = false
                    prizeStateData.m_lgAccumuRd[index] = true 
                    local count = data[1][3]
                    for t =1,VipData.eventAttr.m_vipLevel do 
                        if g_VipCgf.VipLogReward[t] == index then
                            count = data[1][3] * 2
                        end
                    end
                    Functions:addItemResources({id = data[1][1],type = data[1][2],count = count,slot = event.rettbl[1]})
                    -- RewardData:updatedata[1][2],data[1][1],data[1][3],event.rettbl[1]) 
                    --更新登陆领奖是否可领奖标示
                    RewardStateData.eventAttr.loginRewardFlag = 0   --登陆领奖：30天每天的领奖状态
                end  
                RewardData:RequestLoginReward(handler)
            else
                PromptManager:openInfPrompt({type = data[1][2],id = data[1][1],target = widget})
            end
        end
        widget:onTouch(Functions.createClickListener(handler(widget, onPrizeClick), ""))
    end
    local romveNodeHandler = function(widget)
        Functions.removeEventBeforeUiClean(widget)
    end
    local cleanNodeHandler = function(widget)
        widget:getChildByName("prizePanel"):getChildByName("piece"):setVisible(false)
        widget:getChildByName("prizePanel"):getChildByName("mask"):setVisible(false)
        widget:getChildByName("prizePanel"):getChildByName("choose"):setVisible(false)
        widget:getChildByName("prizePanel"):getChildByName("done"):setVisible(false)
    end
    Functions.bindTableViewWithData(self._Panel_loginReward_t:getChildByName("listPanel"),{firstData = prizeData,
                                                        secondData = prizeData},
                                                        {handler = listHandler,handler2 = cleanNodeHandler,romveNodeHandler = romveNodeHandler},
                                                        {direction = true,col = 5,firstSegment = 5,segment = 5,segmentY = 10})
end
--在线领奖
function HuoDongPopView:showOnlineReward( )
    self._Panel_onlineReward_t:setVisible(true)
    local rewardBt = self._Panel_onlineReward_t:getChildByName("rewardBt")
    local prizePanel = self._Panel_onlineReward_t:getChildByName("prizePanel")
    local timeNode = self._Panel_onlineReward_t:getChildByName("time")
    local complateTips = self._Panel_onlineReward_t:getChildByName("complateTips")
    local displayPrize = function(index)
        local prizeData = Functions.packagePrizeConfig(ActivityData.onlineReward.Rewards[index])
        Functions.createPrizeNode(prizePanel,prizeData,true)
    end
    local initOnlineRewardDisplay = function( )
        rewardBt:setVisible(true)
        displayPrize(ActivityData.eventAttr.m_onlineIndex) 


        Functions.bindUiWithModelAttr(timeNode, ActivityData, "remainTime",function(event)
           local time = TimerManager:formatTime("!%H:%M:%S", event.data)
           Functions.initLabelOfString(timeNode, time)
        end)
        
        if ActivityData.eventAttr.m_onlinePrizeState == 1 then
            Functions.setEnabledBt(rewardBt, true)
            complateTips:setVisible(false) 
            rewardBt:setVisible(true)               
        else
            Functions.setEnabledBt(rewardBt, false)
            if ActivityData.eventAttr.m_onlinePrizeState == 2 then 
                if ActivityData.eventAttr.m_onlineIndex == #ActivityData.onlineReward.Rewards then
                    complateTips:setVisible(true) 
                    rewardBt:setVisible(false)
                end
            end
        end
        Functions.bindUiWithModelAttr(rewardBt, ActivityData, "m_onlinePrizeState",function(event)
            if event.data == 1 then
                Functions.setEnabledBt(rewardBt, true)
                complateTips:setVisible(false) 
                rewardBt:setVisible(true)
            else
                Functions.setEnabledBt(rewardBt, false)
                if event.data == 2 then 
                    if ActivityData.eventAttr.m_onlineIndex == #ActivityData.onlineReward.Rewards then
                        complateTips:setVisible(true) 
                        rewardBt:setVisible(false)
                    end
                end
            end
        end)  
    end
    local onRewardbtClick = function( )
        local handler = function (event)
            PromptManager:openTipPrompt(LanguageConfig.language_activity_1)
            if ActivityData.eventAttr.m_onlineIndex < #ActivityData.onlineReward.Rewards then
                ActivityData.eventAttr.m_onlineIndex = ActivityData.eventAttr.m_onlineIndex + 1 
                local prize1 = prizePanel:getChildByName("prize1")
                local prize2 = prizePanel:getChildByName("prize2")
                prize1:retain()
                prize2:retain()
                Functions.addCleanFuncWithNode(prizePanel, function()
                                                    prize1:release()
                                              end)
                Functions.addCleanFuncWithNode(prizePanel, function()
                                                    prize2:release()
                                              end)
                prizePanel:removeAllChildren()
                prizePanel:addChild(prize1)
                prizePanel:addChild(prize2)
                displayPrize(ActivityData.eventAttr.m_onlineIndex)
            end
            Functions.playSound("getrewards.mp3")
        end    
        ActivityData:RequestOnlineReward(handler)
    end
    rewardBt:onTouch(Functions.createClickListener(onRewardbtClick, ""))
    rewardBt:setVisible(false)
    ActivityData:requireOnline(initOnlineRewardDisplay)
end
--签到领奖 
function HuoDongPopView:showSignReward()
    self._Panel_signReward_t:setVisible(true)
    local prizeData = g_SampleCfg.NewReward
    local prizeStateData = RewardStateData.rewardState
    local listHandler = function(index,widget,data,model)
        for j=1,3 do
            local prizeNode = widget:getChildByName("prize" .. tostring(j))
            local prize = prizeNode:getChildByName("prize")
            local prizeCntLabel = prizeNode:getChildByName("prizeCntLabel")
            prizeCntLabel:setString("x" .. tostring(data[j][3]))
            if data[j][2] == 1 then
                local heroHeadImg = ConfigHandler:getHeroHeadImageOfId(data[j][1]) 
                -- prize:ignoreContentAdaptWithSize(true)
                Functions.loadImageWithWidget(prize, heroHeadImg)
            elseif data[j][2] == 5 then
                local heroHeadImg = ConfigHandler:getHeroHeadImageOfId(data[j][1]) 
                -- prize:ignoreContentAdaptWithSize(true)
                prize:setScale(0.85)
                prizeNode:getChildByName("piece"):setVisible(true)
                Functions.loadImageWithWidget(prize, heroHeadImg)
            elseif data[j][2] == 4 and data[j][1] > 0 then
                local propImg = ConfigHandler:getPropImageOfId(data[j][1])  
                prize:ignoreContentAdaptWithSize(true)  
                prize:setScale(0.8)         
                Functions.loadImageWithWidget(prize, propImg)
            elseif data[j][2] == 4 and data[j][1] == -3 then
                Functions.loadImageWithWidget(prize, "property_money.png")
            elseif data[j][2] == 4 and data[j][1] == -2 then
                prize:setScale(0.8)
                Functions.loadImageWithWidget(prize, "property_gold.png")
            elseif data[j][2] == 4 and data[j][1] == -5 then
                Functions.loadImageWithWidget(prize, "property_soul.png")
            elseif data[j][2] == 4 and data[j][1] == -6 then    
                Functions.loadImageWithWidget(prize, "property_soulCrystal.png")
            end

            prize:onTouch(Functions.createClickListener(handler(prize, function()
                PromptManager:openInfPrompt({type = data[j][2],id = data[j][1],target = prize})
            end), ""))
        end

        widget:getChildByName("dayNum"):setString(tostring(index))
        

        local getBt = widget:getChildByName("getBt")
        --新手引导相关
        if index == 1 then
            self._firstGetBt_t = getBt
        end
        Functions.setEnabledBt(getBt, false)
        if index == prizeStateData.m_keepLoginDay and  prizeStateData.m_loginReward == 1 then
            local btText = getBt:getChildByName("Image_get")
            btText:ignoreContentAdaptWithSize(true)
            Functions.loadImageWithWidget(btText, "tyj/uiFonts_res/yilingqu.png")
            Functions.setEnabledBt(getBt, false)
        elseif  index < prizeStateData.m_keepLoginDay then
            local btText = getBt:getChildByName("Image_get")
            btText:ignoreContentAdaptWithSize(true)
            Functions.loadImageWithWidget(btText, "tyj/uiFonts_res/yilingqu.png")
            Functions.setEnabledBt(getBt, false)
        elseif index == prizeStateData.m_keepLoginDay and prizeStateData.m_loginReward ~= 1 then --当前可领取状态
            Functions.setEnabledBt(getBt, true)
        end
        local onPrizeClick = function()
            local handler = function(event)
                Functions.playSound("getrewards.mp3")
                local btText = getBt:getChildByName("Image_get")
                btText:ignoreContentAdaptWithSize(true)
                Functions.loadImageWithWidget(btText, "tyj/uiFonts_res/yilingqu.png")
                Functions.setEnabledBt(getBt, false)  
                prizeStateData.m_loginReward = 1    
                Functions:addItemResources({id = data[1][1],type = data[1][2],count = data[1][3],slot = event.rettbl[1]})
                Functions:addItemResources({id = data[2][1],type = data[2][2],count = data[2][3],slot = event.rettbl[2]})
                Functions:addItemResources({id = data[3][1],type = data[3][2],count = data[3][3],slot = event.rettbl[3]})
                RewardStateData.eventAttr.signRewardFlag = 0   --签到领奖：是否有奖可领 1/0
            end
            RewardData:RequestSignReward(handler)
        end
        getBt:onTouch(Functions.createClickListener(handler(getBt, onPrizeClick), ""))
        if index == 1 then 
            self._prizeBt_t = widget:getChildByName("bg")
        end
    end
    local listView = self._Panel_signReward_t:getChildByName("ListView")
    Functions.bindListWithData(listView, prizeData, listHandler)

    local dayCnt = self._Panel_signReward_t:getChildByName("dayCnt")
    dayCnt:setString(tostring(prizeStateData.m_keepLoginDay))
end
--选美
function HuoDongPopView:ShowXuanMei()
    Functions.printInfo(self.debug,"ShowXuanMei")

    
    self._Text_gold_num_t:setVisible(false)
    local onstr = function(data)
        -- body
        Functions.initLabelOfString( self._Text_jie_shao_no_time_t, "选美活动")
    end
    local str = NoticeManager:getSystemNoticeData(self:getController(), { type = NoticeManager.XUAN_MEI, cb = onstr} )
end

return HuoDongPopView