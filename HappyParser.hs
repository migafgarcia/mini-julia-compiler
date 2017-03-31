{-# OPTIONS_GHC -w #-}
module HappyParser where

import AlexTokens
import TACTranslator
import Control.Applicative(Applicative(..))

-- parser produced by Happy Version 1.19.4

data HappyAbsSyn t4 t5 t6 t7
	= HappyTerminal (Token)
	| HappyErrorToken Int
	| HappyAbsSyn4 t4
	| HappyAbsSyn5 t5
	| HappyAbsSyn6 t6
	| HappyAbsSyn7 t7

action_0 (8) = happyShift action_6
action_0 (9) = happyShift action_7
action_0 (10) = happyShift action_8
action_0 (11) = happyShift action_9
action_0 (14) = happyShift action_10
action_0 (22) = happyShift action_11
action_0 (24) = happyShift action_12
action_0 (33) = happyShift action_13
action_0 (34) = happyShift action_14
action_0 (4) = happyGoto action_3
action_0 (6) = happyGoto action_4
action_0 (7) = happyGoto action_5
action_0 _ = happyFail

action_1 (34) = happyShift action_2
action_1 _ = happyFail

action_2 (31) = happyShift action_38
action_2 _ = happyFail

action_3 (35) = happyShift action_37
action_3 (36) = happyAccept
action_3 _ = happyFail

action_4 _ = happyReduce_7

action_5 (16) = happyShift action_24
action_5 (17) = happyShift action_25
action_5 (18) = happyShift action_26
action_5 (19) = happyShift action_27
action_5 (20) = happyShift action_28
action_5 (21) = happyShift action_29
action_5 (25) = happyShift action_30
action_5 (26) = happyShift action_31
action_5 (27) = happyShift action_32
action_5 (28) = happyShift action_33
action_5 (29) = happyShift action_34
action_5 (30) = happyShift action_35
action_5 (32) = happyShift action_36
action_5 _ = happyReduce_6

action_6 _ = happyReduce_30

action_7 _ = happyReduce_31

action_8 _ = happyReduce_21

action_9 (22) = happyShift action_23
action_9 _ = happyFail

action_10 (22) = happyShift action_22
action_10 _ = happyFail

action_11 (8) = happyShift action_6
action_11 (9) = happyShift action_7
action_11 (10) = happyShift action_8
action_11 (22) = happyShift action_11
action_11 (24) = happyShift action_12
action_11 (34) = happyShift action_19
action_11 (6) = happyGoto action_20
action_11 (7) = happyGoto action_21
action_11 _ = happyFail

action_12 (8) = happyShift action_6
action_12 (9) = happyShift action_7
action_12 (10) = happyShift action_8
action_12 (22) = happyShift action_11
action_12 (24) = happyShift action_12
action_12 (34) = happyShift action_19
action_12 (6) = happyGoto action_17
action_12 (7) = happyGoto action_18
action_12 _ = happyFail

action_13 (22) = happyShift action_16
action_13 _ = happyFail

action_14 (31) = happyShift action_15
action_14 _ = happyReduce_32

action_15 (8) = happyShift action_6
action_15 (9) = happyShift action_7
action_15 (10) = happyShift action_8
action_15 (22) = happyShift action_11
action_15 (24) = happyShift action_12
action_15 (34) = happyShift action_19
action_15 (6) = happyGoto action_60
action_15 (7) = happyGoto action_61
action_15 _ = happyFail

action_16 (34) = happyShift action_59
action_16 _ = happyFail

action_17 _ = happyReduce_19

action_18 (16) = happyShift action_24
action_18 (17) = happyShift action_25
action_18 (18) = happyShift action_26
action_18 (19) = happyShift action_27
action_18 (20) = happyShift action_28
action_18 (21) = happyShift action_29
action_18 (25) = happyShift action_30
action_18 (26) = happyShift action_31
action_18 (27) = happyShift action_32
action_18 (28) = happyShift action_33
action_18 (29) = happyShift action_34
action_18 (30) = happyShift action_35
action_18 (32) = happyShift action_36
action_18 _ = happyFail

action_19 _ = happyReduce_32

action_20 (23) = happyShift action_58
action_20 _ = happyFail

action_21 (16) = happyShift action_24
action_21 (17) = happyShift action_25
action_21 (18) = happyShift action_26
action_21 (19) = happyShift action_27
action_21 (20) = happyShift action_28
action_21 (21) = happyShift action_29
action_21 (23) = happyShift action_57
action_21 (25) = happyShift action_30
action_21 (26) = happyShift action_31
action_21 (27) = happyShift action_32
action_21 (28) = happyShift action_33
action_21 (29) = happyShift action_34
action_21 (30) = happyShift action_35
action_21 (32) = happyShift action_36
action_21 _ = happyFail

action_22 (8) = happyShift action_6
action_22 (9) = happyShift action_7
action_22 (10) = happyShift action_8
action_22 (22) = happyShift action_11
action_22 (24) = happyShift action_12
action_22 (34) = happyShift action_19
action_22 (6) = happyGoto action_56
action_22 (7) = happyGoto action_18
action_22 _ = happyFail

action_23 (8) = happyShift action_6
action_23 (9) = happyShift action_7
action_23 (10) = happyShift action_8
action_23 (22) = happyShift action_11
action_23 (24) = happyShift action_12
action_23 (34) = happyShift action_19
action_23 (6) = happyGoto action_55
action_23 (7) = happyGoto action_18
action_23 _ = happyFail

action_24 (8) = happyShift action_6
action_24 (9) = happyShift action_7
action_24 (22) = happyShift action_40
action_24 (34) = happyShift action_19
action_24 (7) = happyGoto action_54
action_24 _ = happyFail

action_25 (8) = happyShift action_6
action_25 (9) = happyShift action_7
action_25 (22) = happyShift action_40
action_25 (34) = happyShift action_19
action_25 (7) = happyGoto action_53
action_25 _ = happyFail

action_26 (8) = happyShift action_6
action_26 (9) = happyShift action_7
action_26 (22) = happyShift action_40
action_26 (34) = happyShift action_19
action_26 (7) = happyGoto action_52
action_26 _ = happyFail

action_27 (8) = happyShift action_6
action_27 (9) = happyShift action_7
action_27 (22) = happyShift action_40
action_27 (34) = happyShift action_19
action_27 (7) = happyGoto action_51
action_27 _ = happyFail

action_28 (8) = happyShift action_6
action_28 (9) = happyShift action_7
action_28 (22) = happyShift action_40
action_28 (34) = happyShift action_19
action_28 (7) = happyGoto action_50
action_28 _ = happyFail

action_29 (8) = happyShift action_6
action_29 (9) = happyShift action_7
action_29 (22) = happyShift action_40
action_29 (34) = happyShift action_19
action_29 (7) = happyGoto action_49
action_29 _ = happyFail

action_30 (8) = happyShift action_6
action_30 (9) = happyShift action_7
action_30 (22) = happyShift action_40
action_30 (34) = happyShift action_19
action_30 (7) = happyGoto action_48
action_30 _ = happyFail

action_31 (8) = happyShift action_6
action_31 (9) = happyShift action_7
action_31 (22) = happyShift action_40
action_31 (34) = happyShift action_19
action_31 (7) = happyGoto action_47
action_31 _ = happyFail

action_32 (8) = happyShift action_6
action_32 (9) = happyShift action_7
action_32 (22) = happyShift action_40
action_32 (34) = happyShift action_19
action_32 (7) = happyGoto action_46
action_32 _ = happyFail

action_33 (8) = happyShift action_6
action_33 (9) = happyShift action_7
action_33 (22) = happyShift action_40
action_33 (34) = happyShift action_19
action_33 (7) = happyGoto action_45
action_33 _ = happyFail

action_34 (8) = happyShift action_6
action_34 (9) = happyShift action_7
action_34 (22) = happyShift action_40
action_34 (34) = happyShift action_19
action_34 (7) = happyGoto action_44
action_34 _ = happyFail

action_35 (8) = happyShift action_6
action_35 (9) = happyShift action_7
action_35 (22) = happyShift action_40
action_35 (34) = happyShift action_19
action_35 (7) = happyGoto action_43
action_35 _ = happyFail

action_36 (8) = happyShift action_6
action_36 (9) = happyShift action_7
action_36 (22) = happyShift action_40
action_36 (34) = happyShift action_19
action_36 (7) = happyGoto action_42
action_36 _ = happyFail

action_37 (8) = happyShift action_6
action_37 (9) = happyShift action_7
action_37 (10) = happyShift action_8
action_37 (11) = happyShift action_9
action_37 (14) = happyShift action_10
action_37 (22) = happyShift action_11
action_37 (24) = happyShift action_12
action_37 (33) = happyShift action_13
action_37 (34) = happyShift action_14
action_37 (4) = happyGoto action_41
action_37 (6) = happyGoto action_4
action_37 (7) = happyGoto action_5
action_37 _ = happyReduce_9

action_38 (8) = happyShift action_6
action_38 (9) = happyShift action_7
action_38 (22) = happyShift action_40
action_38 (34) = happyShift action_19
action_38 (7) = happyGoto action_39
action_38 _ = happyFail

action_39 (16) = happyShift action_24
action_39 (17) = happyShift action_25
action_39 (18) = happyShift action_26
action_39 (19) = happyShift action_27
action_39 (20) = happyShift action_28
action_39 (21) = happyShift action_29
action_39 (32) = happyShift action_36
action_39 _ = happyFail

action_40 (8) = happyShift action_6
action_40 (9) = happyShift action_7
action_40 (22) = happyShift action_40
action_40 (34) = happyShift action_19
action_40 (7) = happyGoto action_65
action_40 _ = happyFail

action_41 _ = happyReduce_8

action_42 (20) = happyShift action_28
action_42 _ = happyReduce_26

action_43 (16) = happyShift action_24
action_43 (17) = happyShift action_25
action_43 (18) = happyShift action_26
action_43 (19) = happyShift action_27
action_43 (20) = happyShift action_28
action_43 (21) = happyShift action_29
action_43 (32) = happyShift action_36
action_43 _ = happyReduce_15

action_44 (16) = happyShift action_24
action_44 (17) = happyShift action_25
action_44 (18) = happyShift action_26
action_44 (19) = happyShift action_27
action_44 (20) = happyShift action_28
action_44 (21) = happyShift action_29
action_44 (32) = happyShift action_36
action_44 _ = happyReduce_16

action_45 (16) = happyShift action_24
action_45 (17) = happyShift action_25
action_45 (18) = happyShift action_26
action_45 (19) = happyShift action_27
action_45 (20) = happyShift action_28
action_45 (21) = happyShift action_29
action_45 (32) = happyShift action_36
action_45 _ = happyReduce_13

action_46 (16) = happyShift action_24
action_46 (17) = happyShift action_25
action_46 (18) = happyShift action_26
action_46 (19) = happyShift action_27
action_46 (20) = happyShift action_28
action_46 (21) = happyShift action_29
action_46 (32) = happyShift action_36
action_46 _ = happyReduce_14

action_47 (16) = happyShift action_24
action_47 (17) = happyShift action_25
action_47 (18) = happyShift action_26
action_47 (19) = happyShift action_27
action_47 (20) = happyShift action_28
action_47 (21) = happyShift action_29
action_47 (32) = happyShift action_36
action_47 _ = happyReduce_18

action_48 (16) = happyShift action_24
action_48 (17) = happyShift action_25
action_48 (18) = happyShift action_26
action_48 (19) = happyShift action_27
action_48 (20) = happyShift action_28
action_48 (21) = happyShift action_29
action_48 (32) = happyShift action_36
action_48 _ = happyReduce_17

action_49 (20) = happyShift action_28
action_49 _ = happyReduce_27

action_50 _ = happyReduce_28

action_51 (20) = happyShift action_28
action_51 _ = happyReduce_25

action_52 (20) = happyShift action_28
action_52 _ = happyReduce_24

action_53 (18) = happyShift action_26
action_53 (19) = happyShift action_27
action_53 (20) = happyShift action_28
action_53 (21) = happyShift action_29
action_53 (32) = happyShift action_36
action_53 _ = happyReduce_23

action_54 (18) = happyShift action_26
action_54 (19) = happyShift action_27
action_54 (20) = happyShift action_28
action_54 (21) = happyShift action_29
action_54 (32) = happyShift action_36
action_54 _ = happyReduce_22

action_55 (23) = happyShift action_64
action_55 _ = happyFail

action_56 (23) = happyShift action_63
action_56 _ = happyFail

action_57 _ = happyReduce_29

action_58 _ = happyReduce_20

action_59 (23) = happyShift action_62
action_59 _ = happyFail

action_60 _ = happyReduce_2

action_61 (16) = happyShift action_24
action_61 (17) = happyShift action_25
action_61 (18) = happyShift action_26
action_61 (19) = happyShift action_27
action_61 (20) = happyShift action_28
action_61 (21) = happyShift action_29
action_61 (25) = happyShift action_30
action_61 (26) = happyShift action_31
action_61 (27) = happyShift action_32
action_61 (28) = happyShift action_33
action_61 (29) = happyShift action_34
action_61 (30) = happyShift action_35
action_61 (32) = happyShift action_36
action_61 _ = happyReduce_1

action_62 _ = happyReduce_5

action_63 (8) = happyShift action_6
action_63 (9) = happyShift action_7
action_63 (10) = happyShift action_8
action_63 (11) = happyShift action_9
action_63 (14) = happyShift action_10
action_63 (22) = happyShift action_11
action_63 (24) = happyShift action_12
action_63 (33) = happyShift action_13
action_63 (34) = happyShift action_14
action_63 (4) = happyGoto action_68
action_63 (6) = happyGoto action_4
action_63 (7) = happyGoto action_5
action_63 _ = happyFail

action_64 (8) = happyShift action_6
action_64 (9) = happyShift action_7
action_64 (10) = happyShift action_8
action_64 (11) = happyShift action_9
action_64 (14) = happyShift action_10
action_64 (22) = happyShift action_11
action_64 (24) = happyShift action_12
action_64 (33) = happyShift action_13
action_64 (34) = happyShift action_14
action_64 (4) = happyGoto action_66
action_64 (5) = happyGoto action_67
action_64 (6) = happyGoto action_4
action_64 (7) = happyGoto action_5
action_64 _ = happyFail

action_65 (16) = happyShift action_24
action_65 (17) = happyShift action_25
action_65 (18) = happyShift action_26
action_65 (19) = happyShift action_27
action_65 (20) = happyShift action_28
action_65 (21) = happyShift action_29
action_65 (23) = happyShift action_57
action_65 (32) = happyShift action_36
action_65 _ = happyFail

action_66 (12) = happyShift action_71
action_66 (13) = happyShift action_72
action_66 (35) = happyShift action_37
action_66 _ = happyReduce_10

action_67 (15) = happyShift action_70
action_67 _ = happyFail

action_68 (15) = happyShift action_69
action_68 (35) = happyShift action_37
action_68 _ = happyFail

action_69 _ = happyReduce_3

action_70 _ = happyReduce_4

action_71 (8) = happyShift action_6
action_71 (9) = happyShift action_7
action_71 (10) = happyShift action_8
action_71 (11) = happyShift action_9
action_71 (14) = happyShift action_10
action_71 (22) = happyShift action_11
action_71 (24) = happyShift action_12
action_71 (33) = happyShift action_13
action_71 (34) = happyShift action_14
action_71 (4) = happyGoto action_74
action_71 (6) = happyGoto action_4
action_71 (7) = happyGoto action_5
action_71 _ = happyFail

action_72 (22) = happyShift action_73
action_72 _ = happyFail

action_73 (8) = happyShift action_6
action_73 (9) = happyShift action_7
action_73 (10) = happyShift action_8
action_73 (22) = happyShift action_11
action_73 (24) = happyShift action_12
action_73 (34) = happyShift action_19
action_73 (6) = happyGoto action_75
action_73 (7) = happyGoto action_18
action_73 _ = happyFail

action_74 (35) = happyShift action_37
action_74 _ = happyReduce_12

action_75 (23) = happyShift action_76
action_75 _ = happyFail

action_76 (8) = happyShift action_6
action_76 (9) = happyShift action_7
action_76 (10) = happyShift action_8
action_76 (11) = happyShift action_9
action_76 (14) = happyShift action_10
action_76 (22) = happyShift action_11
action_76 (24) = happyShift action_12
action_76 (33) = happyShift action_13
action_76 (34) = happyShift action_14
action_76 (4) = happyGoto action_66
action_76 (5) = happyGoto action_77
action_76 (6) = happyGoto action_4
action_76 (7) = happyGoto action_5
action_76 _ = happyFail

action_77 _ = happyReduce_11

happyReduce_1 = happySpecReduce_3  4 happyReduction_1
happyReduction_1 (HappyAbsSyn7  happy_var_3)
	_
	(HappyTerminal (TokenString happy_var_1))
	 =  HappyAbsSyn4
		 (Atrib happy_var_1 happy_var_3
	)
happyReduction_1 _ _ _  = notHappyAtAll 

happyReduce_2 = happySpecReduce_3  4 happyReduction_2
happyReduction_2 (HappyAbsSyn6  happy_var_3)
	_
	(HappyTerminal (TokenString happy_var_1))
	 =  HappyAbsSyn4
		 (AtribBool happy_var_1 happy_var_3
	)
happyReduction_2 _ _ _  = notHappyAtAll 

happyReduce_3 = happyReduce 6 4 happyReduction_3
happyReduction_3 (_ `HappyStk`
	(HappyAbsSyn4  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn6  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (While happy_var_3 happy_var_5
	) `HappyStk` happyRest

happyReduce_4 = happyReduce 6 4 happyReduction_4
happyReduction_4 (_ `HappyStk`
	(HappyAbsSyn5  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn6  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (If happy_var_3 happy_var_5
	) `HappyStk` happyRest

happyReduce_5 = happyReduce 4 4 happyReduction_5
happyReduction_5 (_ `HappyStk`
	(HappyTerminal (TokenString happy_var_3)) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (PrintLine happy_var_3
	) `HappyStk` happyRest

happyReduce_6 = happySpecReduce_1  4 happyReduction_6
happyReduction_6 (HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn4
		 (Expression happy_var_1
	)
happyReduction_6 _  = notHappyAtAll 

happyReduce_7 = happySpecReduce_1  4 happyReduction_7
happyReduction_7 (HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn4
		 (BoolExpression happy_var_1
	)
happyReduction_7 _  = notHappyAtAll 

happyReduce_8 = happySpecReduce_3  4 happyReduction_8
happyReduction_8 (HappyAbsSyn4  happy_var_3)
	_
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (NextCmd happy_var_1 happy_var_3
	)
happyReduction_8 _ _ _  = notHappyAtAll 

happyReduce_9 = happySpecReduce_2  4 happyReduction_9
happyReduction_9 _
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (happy_var_1
	)
happyReduction_9 _ _  = notHappyAtAll 

happyReduce_10 = happySpecReduce_1  5 happyReduction_10
happyReduction_10 (HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn5
		 (Com happy_var_1
	)
happyReduction_10 _  = notHappyAtAll 

happyReduce_11 = happyReduce 6 5 happyReduction_11
happyReduction_11 ((HappyAbsSyn5  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn6  happy_var_4) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn4  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn5
		 (ElseIf happy_var_1 happy_var_4 happy_var_6
	) `HappyStk` happyRest

happyReduce_12 = happySpecReduce_3  5 happyReduction_12
happyReduction_12 (HappyAbsSyn4  happy_var_3)
	_
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn5
		 (Else happy_var_1 happy_var_3
	)
happyReduction_12 _ _ _  = notHappyAtAll 

happyReduce_13 = happySpecReduce_3  6 happyReduction_13
happyReduction_13 (HappyAbsSyn7  happy_var_3)
	_
	(HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn6
		 (GreaterThan happy_var_1 happy_var_3
	)
happyReduction_13 _ _ _  = notHappyAtAll 

happyReduce_14 = happySpecReduce_3  6 happyReduction_14
happyReduction_14 (HappyAbsSyn7  happy_var_3)
	_
	(HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn6
		 (LessThan happy_var_1 happy_var_3
	)
happyReduction_14 _ _ _  = notHappyAtAll 

happyReduce_15 = happySpecReduce_3  6 happyReduction_15
happyReduction_15 (HappyAbsSyn7  happy_var_3)
	_
	(HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn6
		 (GreatEqual happy_var_1 happy_var_3
	)
happyReduction_15 _ _ _  = notHappyAtAll 

happyReduce_16 = happySpecReduce_3  6 happyReduction_16
happyReduction_16 (HappyAbsSyn7  happy_var_3)
	_
	(HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn6
		 (LessEqual happy_var_1 happy_var_3
	)
happyReduction_16 _ _ _  = notHappyAtAll 

happyReduce_17 = happySpecReduce_3  6 happyReduction_17
happyReduction_17 (HappyAbsSyn7  happy_var_3)
	_
	(HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn6
		 (Equals happy_var_1 happy_var_3
	)
happyReduction_17 _ _ _  = notHappyAtAll 

happyReduce_18 = happySpecReduce_3  6 happyReduction_18
happyReduction_18 (HappyAbsSyn7  happy_var_3)
	_
	(HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn6
		 (NotEquals happy_var_1 happy_var_3
	)
happyReduction_18 _ _ _  = notHappyAtAll 

happyReduce_19 = happySpecReduce_2  6 happyReduction_19
happyReduction_19 (HappyAbsSyn6  happy_var_2)
	_
	 =  HappyAbsSyn6
		 (Not happy_var_2
	)
happyReduction_19 _ _  = notHappyAtAll 

happyReduce_20 = happySpecReduce_3  6 happyReduction_20
happyReduction_20 _
	(HappyAbsSyn6  happy_var_2)
	_
	 =  HappyAbsSyn6
		 (happy_var_2
	)
happyReduction_20 _ _ _  = notHappyAtAll 

happyReduce_21 = happySpecReduce_1  6 happyReduction_21
happyReduction_21 (HappyTerminal (TokenBool happy_var_1))
	 =  HappyAbsSyn6
		 (Bool happy_var_1
	)
happyReduction_21 _  = notHappyAtAll 

happyReduce_22 = happySpecReduce_3  7 happyReduction_22
happyReduction_22 (HappyAbsSyn7  happy_var_3)
	_
	(HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn7
		 (Add happy_var_1 happy_var_3
	)
happyReduction_22 _ _ _  = notHappyAtAll 

happyReduce_23 = happySpecReduce_3  7 happyReduction_23
happyReduction_23 (HappyAbsSyn7  happy_var_3)
	_
	(HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn7
		 (Sub happy_var_1 happy_var_3
	)
happyReduction_23 _ _ _  = notHappyAtAll 

happyReduce_24 = happySpecReduce_3  7 happyReduction_24
happyReduction_24 (HappyAbsSyn7  happy_var_3)
	_
	(HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn7
		 (Mult happy_var_1 happy_var_3
	)
happyReduction_24 _ _ _  = notHappyAtAll 

happyReduce_25 = happySpecReduce_3  7 happyReduction_25
happyReduction_25 (HappyAbsSyn7  happy_var_3)
	_
	(HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn7
		 (Div happy_var_1 happy_var_3
	)
happyReduction_25 _ _ _  = notHappyAtAll 

happyReduce_26 = happySpecReduce_3  7 happyReduction_26
happyReduction_26 (HappyAbsSyn7  happy_var_3)
	_
	(HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn7
		 (Div happy_var_3 happy_var_1
	)
happyReduction_26 _ _ _  = notHappyAtAll 

happyReduce_27 = happySpecReduce_3  7 happyReduction_27
happyReduction_27 (HappyAbsSyn7  happy_var_3)
	_
	(HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn7
		 (Mod happy_var_1 happy_var_3
	)
happyReduction_27 _ _ _  = notHappyAtAll 

happyReduce_28 = happySpecReduce_3  7 happyReduction_28
happyReduction_28 (HappyAbsSyn7  happy_var_3)
	_
	(HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn7
		 (Power happy_var_1 happy_var_3
	)
happyReduction_28 _ _ _  = notHappyAtAll 

happyReduce_29 = happySpecReduce_3  7 happyReduction_29
happyReduction_29 _
	(HappyAbsSyn7  happy_var_2)
	_
	 =  HappyAbsSyn7
		 (happy_var_2
	)
happyReduction_29 _ _ _  = notHappyAtAll 

happyReduce_30 = happySpecReduce_1  7 happyReduction_30
happyReduction_30 (HappyTerminal (TokenInt happy_var_1))
	 =  HappyAbsSyn7
		 (Int happy_var_1
	)
happyReduction_30 _  = notHappyAtAll 

happyReduce_31 = happySpecReduce_1  7 happyReduction_31
happyReduction_31 (HappyTerminal (TokenFloat happy_var_1))
	 =  HappyAbsSyn7
		 (Float happy_var_1
	)
happyReduction_31 _  = notHappyAtAll 

happyReduce_32 = happySpecReduce_1  7 happyReduction_32
happyReduction_32 (HappyTerminal (TokenString happy_var_1))
	 =  HappyAbsSyn7
		 (Var happy_var_1
	)
happyReduction_32 _  = notHappyAtAll 

happyNewToken action sts stk [] =
	action 36 36 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	TokenInt happy_dollar_dollar -> cont 8;
	TokenFloat happy_dollar_dollar -> cont 9;
	TokenBool happy_dollar_dollar -> cont 10;
	TokenIf -> cont 11;
	TokenElse -> cont 12;
	TokenElseIf -> cont 13;
	TokenWhile -> cont 14;
	TokenEnd -> cont 15;
	TokenAdd -> cont 16;
	TokenSub -> cont 17;
	TokenMult -> cont 18;
	TokenDiv -> cont 19;
	TokenPower -> cont 20;
	TokenMod -> cont 21;
	TokenLPar -> cont 22;
	TokenRPar -> cont 23;
	TokenNot -> cont 24;
	TokenEquals -> cont 25;
	TokenNotEquals -> cont 26;
	TokenLessThan -> cont 27;
	TokenGreaterThan -> cont 28;
	TokenLessEqual -> cont 29;
	TokenGreatEqual -> cont 30;
	TokenAtrib -> cont 31;
	TokenReverseDiv -> cont 32;
	TokenPrintLine -> cont 33;
	TokenString happy_dollar_dollar -> cont 34;
	TokenNewLine -> cont 35;
	_ -> happyError' (tk:tks)
	}

happyError_ 36 tk tks = happyError' tks
happyError_ _ tk tks = happyError' (tk:tks)

newtype HappyIdentity a = HappyIdentity a
happyIdentity = HappyIdentity
happyRunIdentity (HappyIdentity a) = a

instance Functor HappyIdentity where
    fmap f (HappyIdentity a) = HappyIdentity (f a)

instance Applicative HappyIdentity where
    pure    = return
    a <*> b = (fmap id a) <*> b
instance Monad HappyIdentity where
    return = HappyIdentity
    (HappyIdentity p) >>= q = q p

happyThen :: () => HappyIdentity a -> (a -> HappyIdentity b) -> HappyIdentity b
happyThen = (>>=)
happyReturn :: () => a -> HappyIdentity a
happyReturn = (return)
happyThen1 m k tks = (>>=) m (\a -> k a tks)
happyReturn1 :: () => a -> b -> HappyIdentity a
happyReturn1 = \a tks -> (return) a
happyError' :: () => [(Token)] -> HappyIdentity a
happyError' = HappyIdentity . parseError

parse tks = happyRunIdentity happySomeParser where
  happySomeParser = happyThen (happyParse action_0 tks) (\x -> case x of {HappyAbsSyn4 z -> happyReturn z; _other -> notHappyAtAll })

happySeq = happyDontSeq


parseError :: [Token] -> a
parseError x = error ("Syntax Error" ++ (show x))
{-# LINE 1 "templates\GenericTemplate.hs" #-}
{-# LINE 1 "templates\\GenericTemplate.hs" #-}
{-# LINE 1 "<built-in>" #-}
{-# LINE 1 "<command-line>" #-}
{-# LINE 1 "templates\\GenericTemplate.hs" #-}
-- Id: GenericTemplate.hs,v 1.26 2005/01/14 14:47:22 simonmar Exp 

{-# LINE 13 "templates\\GenericTemplate.hs" #-}

{-# LINE 46 "templates\\GenericTemplate.hs" #-}








{-# LINE 67 "templates\\GenericTemplate.hs" #-}

{-# LINE 77 "templates\\GenericTemplate.hs" #-}

{-# LINE 86 "templates\\GenericTemplate.hs" #-}

infixr 9 `HappyStk`
data HappyStk a = HappyStk a (HappyStk a)

-----------------------------------------------------------------------------
-- starting the parse

happyParse start_state = happyNewToken start_state notHappyAtAll notHappyAtAll

-----------------------------------------------------------------------------
-- Accepting the parse

-- If the current token is (1), it means we've just accepted a partial
-- parse (a %partial parser).  We must ignore the saved token on the top of
-- the stack in this case.
happyAccept (1) tk st sts (_ `HappyStk` ans `HappyStk` _) =
        happyReturn1 ans
happyAccept j tk st sts (HappyStk ans _) = 
         (happyReturn1 ans)

-----------------------------------------------------------------------------
-- Arrays only: do the next action

{-# LINE 155 "templates\\GenericTemplate.hs" #-}

-----------------------------------------------------------------------------
-- HappyState data type (not arrays)



newtype HappyState b c = HappyState
        (Int ->                    -- token number
         Int ->                    -- token number (yes, again)
         b ->                           -- token semantic value
         HappyState b c ->              -- current state
         [HappyState b c] ->            -- state stack
         c)



-----------------------------------------------------------------------------
-- Shifting a token

happyShift new_state (1) tk st sts stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (i) -> i }) in
--     trace "shifting the error token" $
     new_state i i tk (HappyState (new_state)) ((st):(sts)) (stk)

happyShift new_state i tk st sts stk =
     happyNewToken new_state ((st):(sts)) ((HappyTerminal (tk))`HappyStk`stk)

-- happyReduce is specialised for the common cases.

happySpecReduce_0 i fn (1) tk st sts stk
     = happyFail (1) tk st sts stk
happySpecReduce_0 nt fn j tk st@((HappyState (action))) sts stk
     = action nt j tk st ((st):(sts)) (fn `HappyStk` stk)

happySpecReduce_1 i fn (1) tk st sts stk
     = happyFail (1) tk st sts stk
happySpecReduce_1 nt fn j tk _ sts@(((st@(HappyState (action))):(_))) (v1`HappyStk`stk')
     = let r = fn v1 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_2 i fn (1) tk st sts stk
     = happyFail (1) tk st sts stk
happySpecReduce_2 nt fn j tk _ ((_):(sts@(((st@(HappyState (action))):(_))))) (v1`HappyStk`v2`HappyStk`stk')
     = let r = fn v1 v2 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_3 i fn (1) tk st sts stk
     = happyFail (1) tk st sts stk
happySpecReduce_3 nt fn j tk _ ((_):(((_):(sts@(((st@(HappyState (action))):(_))))))) (v1`HappyStk`v2`HappyStk`v3`HappyStk`stk')
     = let r = fn v1 v2 v3 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happyReduce k i fn (1) tk st sts stk
     = happyFail (1) tk st sts stk
happyReduce k nt fn j tk st sts stk
     = case happyDrop (k - ((1) :: Int)) sts of
         sts1@(((st1@(HappyState (action))):(_))) ->
                let r = fn stk in  -- it doesn't hurt to always seq here...
                happyDoSeq r (action nt j tk st1 sts1 r)

happyMonadReduce k nt fn (1) tk st sts stk
     = happyFail (1) tk st sts stk
happyMonadReduce k nt fn j tk st sts stk =
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
          let drop_stk = happyDropStk k stk in
          happyThen1 (fn stk tk) (\r -> action nt j tk st1 sts1 (r `HappyStk` drop_stk))

happyMonad2Reduce k nt fn (1) tk st sts stk
     = happyFail (1) tk st sts stk
happyMonad2Reduce k nt fn j tk st sts stk =
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
         let drop_stk = happyDropStk k stk





             new_state = action

          in
          happyThen1 (fn stk tk) (\r -> happyNewToken new_state sts1 (r `HappyStk` drop_stk))

happyDrop (0) l = l
happyDrop n ((_):(t)) = happyDrop (n - ((1) :: Int)) t

happyDropStk (0) l = l
happyDropStk n (x `HappyStk` xs) = happyDropStk (n - ((1)::Int)) xs

-----------------------------------------------------------------------------
-- Moving to a new state after a reduction

{-# LINE 256 "templates\\GenericTemplate.hs" #-}
happyGoto action j tk st = action j j tk (HappyState action)


-----------------------------------------------------------------------------
-- Error recovery ((1) is the error token)

-- parse error if we are in recovery and we fail again
happyFail (1) tk old_st _ stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (i) -> i }) in
--      trace "failing" $ 
        happyError_ i tk

{-  We don't need state discarding for our restricted implementation of
    "error".  In fact, it can cause some bogus parses, so I've disabled it
    for now --SDM

-- discard a state
happyFail  (1) tk old_st (((HappyState (action))):(sts)) 
                                                (saved_tok `HappyStk` _ `HappyStk` stk) =
--      trace ("discarding state, depth " ++ show (length stk))  $
        action (1) (1) tk (HappyState (action)) sts ((saved_tok`HappyStk`stk))
-}

-- Enter error recovery: generate an error token,
--                       save the old token and carry on.
happyFail  i tk (HappyState (action)) sts stk =
--      trace "entering error recovery" $
        action (1) (1) tk (HappyState (action)) sts ( (HappyErrorToken (i)) `HappyStk` stk)

-- Internal happy errors:

notHappyAtAll :: a
notHappyAtAll = error "Internal Happy error\n"

-----------------------------------------------------------------------------
-- Hack to get the typechecker to accept our action functions







-----------------------------------------------------------------------------
-- Seq-ing.  If the --strict flag is given, then Happy emits 
--      happySeq = happyDoSeq
-- otherwise it emits
--      happySeq = happyDontSeq

happyDoSeq, happyDontSeq :: a -> b -> b
happyDoSeq   a b = a `seq` b
happyDontSeq a b = b

-----------------------------------------------------------------------------
-- Don't inline any functions from the template.  GHC has a nasty habit
-- of deciding to inline happyGoto everywhere, which increases the size of
-- the generated parser quite a bit.

{-# LINE 322 "templates\\GenericTemplate.hs" #-}
{-# NOINLINE happyShift #-}
{-# NOINLINE happySpecReduce_0 #-}
{-# NOINLINE happySpecReduce_1 #-}
{-# NOINLINE happySpecReduce_2 #-}
{-# NOINLINE happySpecReduce_3 #-}
{-# NOINLINE happyReduce #-}
{-# NOINLINE happyMonadReduce #-}
{-# NOINLINE happyGoto #-}
{-# NOINLINE happyFail #-}

-- end of Happy Template.
