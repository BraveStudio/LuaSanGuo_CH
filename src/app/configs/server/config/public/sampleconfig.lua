--抽卡,登陆奖励等配置

--整个抽奖系统基础配置

--宝箱概率配置
g_SampleTreasureBoxCfg = 
{
	--[1号类型-金箱子]
	--[2号类型-银箱子]
	[1] = { --金箱子
			--[[
			[索引] = {
					[索引] = { [索引1]={等级},[索引2]={掉落组小项},}
					},
			--]]
			--金箱子计数器为 五星装备卡
			--次数为，前面一个+1到当前配置一个的个数掉后面的掉落组
		[1] = {  --VIP0					-- id,type,概率
			   [1] = {[1]= {0,}, [2]={[1]={17,2,128},[2]={65,2,138},[3]={69,2,38},[4]={35,2,28},[5]={49,2,58},  },},
			   [2] = {[1]= {1,}, [2]={{40,2,30},{27,2,50},{50,2,30},{1,2,60},{13,2,60},{24,2,70},{15,2,50},{45,2,30}, },},
			   [3] = {[1]= {10,}, [2]={{43,2,140},{97,2,200},{50,2,140},{1,2,130},{15,2,140},{44,2,130},{10,2,130}, },},
			   [4] = {[1]= {25,}, [2]={{47,2,190},{97,2,200},{38,2,240},{29,2,370},{63,2,280},{49,2,330}, },},
			   [5] = {[1]= {50,}, [2]={{17,2,300},{48,2,300},{50,2,240},{1,2,370},{69,2,280},{24,2,330},{49,2,360},},},
		},
		[2] = {  --VIP1
			},
		[3] = {  --VIP2
			},
		[4] = {  --VIP3
			},
		[5] = {  --VIP4
			},
		[6] = {  --VIP5
			},
		[7] = {  --VIP6
			},
		[8] = {  --VIP7
			},
		[9] = {  --VIP8
			},
		[10] = {  --VIP9
			},
		[11] = {  --VIP10
			},

		},
	[2] = { --银箱子
			--[[
			[索引] = {
					[索引] = { [索引1]={等级},[索引2]={掉落组小项},}
					},
			--]]
			--银箱子计数器为 三星装备卡
			[1] = {  --VIP0					-- id,type,概率
			   
				[1] = {[1]= {0,}, [2]={[1]={17,2,128},[2]={65,2,138},[3]={69,2,38},[4]={35,2,28},[5]={49,2,58},  },},
			   [2] = {[1]= {1,}, [2]={{40,2,30},{27,2,50},{50,2,30},{1,2,60},{13,2,60},{24,2,70},{15,2,50},{45,2,30}, },},
			   [3] = {[1]= {10,}, [2]={{43,2,140},{97,2,200},{50,2,140},{1,2,130},{15,2,140},{44,2,130},{10,2,130}, },},
			   [4] = {[1]= {25,}, [2]={{47,2,190},{97,2,200},{38,2,240},{29,2,370},{63,2,280},{49,2,330}, },},
			   [5] = {[1]= {50,}, [2]={{17,2,300},{48,2,300},{50,2,240},{1,2,370},{69,2,280},{24,2,330},{49,2,360},},},
			},
			[2] = {  --VIP1
				},
			[3] = {  --VIP2
				},
			[4] = {  --VIP3
				},
			[5] = {  --VIP4
				},
			[6] = {  --VIP5
				},
			[7] = {  --VIP6
				},
			[8] = {  --VIP7
				},
			[9] = {  --VIP8
				},
			[10] = {  --VIP9
				},
			[11] = {  --VIP10
				},
		},
}

--
