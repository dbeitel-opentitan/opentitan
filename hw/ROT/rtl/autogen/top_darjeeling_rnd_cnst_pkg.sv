// Copyright lowRISC contributors.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0
//
// ------------------- W A R N I N G: A U T O - G E N E R A T E D   C O D E !! -------------------//
// PLEASE DO NOT HAND-EDIT THIS FILE. IT HAS BEEN AUTO-GENERATED WITH THE FOLLOWING COMMAND:
//
// util/topgen.py -t hw/top_darjeeling/data/top_darjeeling.hjson \
//                -o hw/top_darjeeling/ \
//                --rnd_cnst_seed 4881560218908238235


package top_darjeeling_rnd_cnst_pkg;

  ////////////////////////////////////////////
  // otp_ctrl
  ////////////////////////////////////////////
  // Compile-time random bits for initial LFSR seed
  parameter otp_ctrl_pkg::lfsr_seed_t RndCnstOtpCtrlLfsrSeed = {
    40'h8B_81AB5329
  };

  // Compile-time random permutation for LFSR output
  parameter otp_ctrl_pkg::lfsr_perm_t RndCnstOtpCtrlLfsrPerm = {
    240'h7E65_C73A249D_95B3413C_621A2C43_057230E0_25552779_98426004_562904E4
  };

  // Compile-time random permutation for scrambling key/nonce register reset value
  parameter otp_ctrl_pkg::scrmbl_key_init_t RndCnstOtpCtrlScrmblKeyInit = {
    256'h64AF51F2_730529B3_0296007D_FB43866D_D9605FEF_E9977B00_B6FDC21D_577A172D
  };

  ////////////////////////////////////////////
  // lc_ctrl
  ////////////////////////////////////////////
  // Compile-time random bits for lc state group diversification value
  parameter lc_ctrl_pkg::lc_keymgr_div_t RndCnstLcCtrlLcKeymgrDivInvalid = {
    128'h047DCF0E_EBBDD268_AFD4E250_6DF1D060
  };

  // Compile-time random bits for lc state group diversification value
  parameter lc_ctrl_pkg::lc_keymgr_div_t RndCnstLcCtrlLcKeymgrDivTestDevRma = {
    128'h3F9CD62F_178ADC74_D53D8AD0_B600E7A1
  };

  // Compile-time random bits for lc state group diversification value
  parameter lc_ctrl_pkg::lc_keymgr_div_t RndCnstLcCtrlLcKeymgrDivProduction = {
    128'hDD2F1A43_C03DD4FF_9B887AB7_521CA6CB
  };

  // Compile-time random bits used for invalid tokens in the token mux
  parameter lc_ctrl_pkg::lc_token_mux_t RndCnstLcCtrlInvalidTokens = {
    256'hD8D7107B_AB98B075_743F7AEB_A81E1C4E_C8EBDEEE_2911062E_039F8C7E_1AFA78A1,
    256'hD42886CC_89AE759C_F865B22A_5F28DE2E_CA36AFC2_E8A40230_2CBDCF2B_4819AFAA,
    256'h0A11CB68_371EEF17_4D983156_96C49A8E_F53C96F1_1E4F43FF_D421E456_B4D6A9D1,
    256'hD2AB4A83_6F1545EB_F50FF87B_C3FE8473_A3B8A698_EB44C3B5_821FC5BA_E3E1BD59
  };

  ////////////////////////////////////////////
  // alert_handler
  ////////////////////////////////////////////
  // Compile-time random bits for initial LFSR seed
  parameter alert_pkg::lfsr_seed_t RndCnstAlertHandlerLfsrSeed = {
    32'h723B69B2
  };

  // Compile-time random permutation for LFSR output
  parameter alert_pkg::lfsr_perm_t RndCnstAlertHandlerLfsrPerm = {
    160'h8D5A7977_74CB3DF1_2A09E4EE_572DE340_70401ADA
  };

  ////////////////////////////////////////////
  // sram_ctrl_ret_aon
  ////////////////////////////////////////////
  // Compile-time random reset value for SRAM scrambling key.
  parameter otp_ctrl_pkg::sram_key_t RndCnstSramCtrlRetAonSramKey = {
    128'hC18ED453_28D7D63C_A958AC39_F21ABC39
  };

  // Compile-time random reset value for SRAM scrambling nonce.
  parameter otp_ctrl_pkg::sram_nonce_t RndCnstSramCtrlRetAonSramNonce = {
    128'h25A2B2B2_91A98470_716274C9_76B8106D
  };

  // Compile-time random bits for initial LFSR seed
  parameter sram_ctrl_pkg::lfsr_seed_t RndCnstSramCtrlRetAonLfsrSeed = {
    32'hD974CC66
  };

  // Compile-time random permutation for LFSR output
  parameter sram_ctrl_pkg::lfsr_perm_t RndCnstSramCtrlRetAonLfsrPerm = {
    160'h9945C20E_BBA058EF_8127799B_2F221DBE_1768AB3A
  };

  ////////////////////////////////////////////
  // aes
  ////////////////////////////////////////////
  // Default seed of the PRNG used for register clearing.
  parameter aes_pkg::clearing_lfsr_seed_t RndCnstAesClearingLfsrSeed = {
    64'h1C657263_358ACF63
  };

  // Permutation applied to the LFSR of the PRNG used for clearing.
  parameter aes_pkg::clearing_lfsr_perm_t RndCnstAesClearingLfsrPerm = {
    128'hD181F155_F988B7F5_1B34F097_26276E82,
    256'h1F450781_37F39FAB_669400DA_A44EB1CE_AF7A8D5A_946CD333_B9302E74_A30F258A
  };

  // Permutation applied to the clearing PRNG output for clearing the second share of registers.
  parameter aes_pkg::clearing_lfsr_perm_t RndCnstAesClearingSharePerm = {
    128'h17532B41_8095F72D_96CFFB07_68D93177,
    256'h89C1DD39_6F8CEBBC_11EEDCE6_149B7C05_C3199A34_EAD2D127_08AA3E0F_882949A9
  };

  // Default seed of the PRNG used for masking.
  parameter aes_pkg::masking_lfsr_seed_t RndCnstAesMaskingLfsrSeed = {
    160'hE335CB77_683AF657_3E4C844A_75FF9ACB_6C8AE0FA
  };

  // Permutation applied to the concatenated LFSRs of the PRNG used for masking.
  parameter aes_pkg::masking_lfsr_perm_t RndCnstAesMaskingLfsrPerm = {
    256'h34285856_905E9455_255B3D2C_1D073230_7D956309_659A1864_98140E6B_0C498D20,
    256'h4B7B166A_4672529D_2D5D0322_6C1A4E00_27334484_15822193_9B028B75_9E08992A,
    256'h8F76470D_6D3A1C3C_0F503F48_88600511_29355F67_71810A38_2E435179_363E3183,
    256'h4D7C9657_04233766_1E5A9F24_6F80747E_4A3B1B77_914F451F_0B267301_865C6261,
    256'h4C2F1270_7F2B0685_928E788C_538A8742_1959696E_39975489_7A41139C_68174010
  };

  ////////////////////////////////////////////
  // kmac
  ////////////////////////////////////////////
  // Compile-time random data for LFSR default seed
  parameter kmac_pkg::lfsr_seed_t RndCnstKmacLfsrSeed = {
    32'h90E2F868,
    256'hC0FBC069_CE0FA546_7C8B78A4_36BDC98A_3CCBBD4E_813D630B_59C31EFA_B991F458,
    256'h73BA6439_240BE367_51D2978D_DA59AEE6_E67C3475_52B2FCCC_7C7E324E_AD918FE7,
    256'hE874CEE3_BE285136_E4AE71B1_0B830200_F39071CD_7039FFF8_671D7274_2F787800
  };

  // Compile-time random permutation for LFSR output
  parameter kmac_pkg::lfsr_perm_t RndCnstKmacLfsrPerm = {
    64'h092F255D_D03D0E25,
    256'h02927F96_F59A0878_62096E59_9D51DAA6_37A1D129_E1B113C3_EACD92B4_DB885F08,
    256'h7AB1D7C5_8D96AAAA_64495CE3_16E5876E_E109192D_980209FD_03B2A9B6_3DF3BED0,
    256'hC4E6FE9B_E09C25DC_1092F446_54A75560_9AB5BB04_79C5A834_DC60706A_AA0AC291,
    256'hD5646B89_DA408901_6281FC4E_005075F7_5D4331BC_48196B22_282A329C_871F0E5C,
    256'h59476494_3E270B35_AE06F1A8_B91E1D22_1904A77F_EEE43E6D_34AF44D2_1A462932,
    256'h0A77BD49_65FE959B_84A91E1C_AEE4335F_1E82DE08_E49E8CF1_B1169777_83C775E7,
    256'h2C48CB62_169F5CB6_C2ED14EF_11A53517_8CEC3236_8A40AB25_DF078B27_167C5B12,
    256'hC4DE451C_EC0ABCD6_6C8F16FA_6A4D9256_028B4857_23266BC0_09C440CF_180797A6,
    256'h3C20E034_58117249_2451496B_55E06258_2F8A2AE6_AEB8EA77_44364AE1_FA2AC4C5,
    256'h2CC9C9B7_BAA047C0_99625E59_A661A258_836DEB31_901145B5_671A07D8_135E0356,
    256'h0C6E2DCF_AB0C09B9_2575D9CD_BA6F9C66_7B5B53EB_89BD82A5_1ADEA03F_54535668,
    256'h7B54492D_EFA36AD5_6AAB138C_82A2C2A2_1CC0208E_1194B83E_4CBF5618_4504531A,
    256'h7A15A620_068211EC_521BF7F7_183A9F96_15742F5E_280A0005_0F659052_2847D8ED,
    256'h5D15CCB7_903F9D00_3898F9B5_2BE75840_3366399A_5670CB35_54190069_6172FCC5,
    256'h9B6488EB_994C1236_9C3C9153_1C9D0E0E_F1D8D921_AFAB82A3_49D692B5_4FB5450B,
    256'h05AF4C03_487AE5B4_59746A23_8482C2AA_DF1E9845_AA2DA06B_A4F53C66_61D068DD,
    256'hA7E01054_BB7A24D0_F59F47DF_886E8E9B_071C7DC0_0BE80A11_2A62D067_60DC79AD,
    256'hA113118C_2642E81F_92A22216_FF191DA9_7702C146_D954C322_4F715717_57252A84,
    256'hC224D814_370B0B6E_F1ECF0AF_49F0CAB0_8D14DA94_2254DF46_42F026CF_3AB14303,
    256'h2190C532_2044C1DD_17184073_7D79438E_5B86BC3A_0BF25CE7_2553A76D_B365AB6B,
    256'h9ABF1E00_D5954A17_5630105F_5ED3B7D6_DD085096_85F2492C_693CD09C_EA24B946,
    256'hB6D5BA7A_CBB1D98C_1EB457C4_D3464E2E_54E66D1B_A18754FC_9022C250_5E821995,
    256'h4541080C_0636886C_02C6783A_9016ED27_5E27678E_95F232B5_84394087_4A6D7380,
    256'h91393124_70376AE6_29E85915_A076D20D_5F9CE2C0_BC74C412_BC4B5610_56930AA6,
    256'h8E33F9C1_5C298832_3EC40B50_4126C182_E8A1A55F_47C0A47E_221AC2AE_2544D628,
    256'h148FA51E_3B3D6B59_C02C3541_B9DEE5DC_72545193_FF1C508D_A51CEDC1_18E09D28,
    256'h8BC58A91_AA300B48_B249922C_E188DEAC_6E873EF3_94D00709_9A2D8FC2_A6791500,
    256'h00ADD43D_613A0DA3_99C064CC_98A31313_B8D4A46A_628D8C85_31572B13_5497A41C,
    256'hC5629950_38A504A2_A9F80F42_8FB312F7_6EAF88F4_EC97E3AB_20B85824_442EF6C3,
    256'hC6B1C120_7ECAE169_BC1FDD2B_64E62983_A971828D_50256618_856DC0E7_033622B2,
    256'h6A426192_3711A9B4_20697B01_5B823BAC_287EADE8_FC3B3328_FB14E167_6385A193
  };

  // Compile-time random permutation for forwarding LFSR state
  parameter kmac_pkg::lfsr_fwd_perm_t RndCnstKmacLfsrFwdPerm = {
    160'hA164CBC0_889FE226_9B07CF47_E53AA1E2_F5B026CF
  };

  // Compile-time random permutation for LFSR Message output
  parameter kmac_pkg::msg_perm_t RndCnstKmacMsgPerm = {
    128'h54AD2599_E8E2E1B2_D2A5D17F_919132E6,
    256'hD84DCFEB_AA7EC68E_D506284F_19C9C1C0_BB1805AF_837D81AD_7F4C3D42_070FA47C
  };

  ////////////////////////////////////////////
  // otbn
  ////////////////////////////////////////////
  // Default seed of the PRNG used for URND.
  parameter otbn_pkg::urnd_prng_seed_t RndCnstOtbnUrndPrngSeed = {
    256'h45F2A33E_AC03E8C2_FA90E321_99D8772B_86AA4C64_EFC6C284_341BF463_53F7AC1C
  };

  // Compile-time random reset value for IMem/DMem scrambling key.
  parameter otp_ctrl_pkg::otbn_key_t RndCnstOtbnOtbnKey = {
    128'h5413436E_E66BACB0_B1A1D42F_E4AE0677
  };

  // Compile-time random reset value for IMem/DMem scrambling nonce.
  parameter otp_ctrl_pkg::otbn_nonce_t RndCnstOtbnOtbnNonce = {
    64'h47DAA39D_CA2802B2
  };

  ////////////////////////////////////////////
  // keymgr
  ////////////////////////////////////////////
  // Compile-time random bits for initial LFSR seed
  parameter keymgr_pkg::lfsr_seed_t RndCnstKeymgrLfsrSeed = {
    64'h4F50894F_8D3C2230
  };

  // Compile-time random permutation for LFSR output
  parameter keymgr_pkg::lfsr_perm_t RndCnstKeymgrLfsrPerm = {
    128'h5C456049_C9DF748E_782E497E_A40BFFF3,
    256'hD44CA996_903CAB83_DE30566E_2CACD939_86A31347_CFA842C1_E3B5EC91_5852BB74
  };

  // Compile-time random permutation for entropy used in share overriding
  parameter keymgr_pkg::rand_perm_t RndCnstKeymgrRandPerm = {
    160'hE948C058_D44647C8_CDF897AA_75BB5B0A_930F8AED
  };

  // Compile-time random bits for revision seed
  parameter keymgr_pkg::seed_t RndCnstKeymgrRevisionSeed = {
    256'h615ABE45_DC0B0386_0D96EE52_D2BE686A_36EA46B0_5B247A44_B7309462_57AEBC7C
  };

  // Compile-time random bits for creator identity seed
  parameter keymgr_pkg::seed_t RndCnstKeymgrCreatorIdentitySeed = {
    256'h97E53C18_DB45AF8D_F4A1A22E_BA3F71E4_EBAC6F4F_9643C62E_4091E119_07A67345
  };

  // Compile-time random bits for owner intermediate identity seed
  parameter keymgr_pkg::seed_t RndCnstKeymgrOwnerIntIdentitySeed = {
    256'h72487F85_F60D1F1F_254A3801_CC3DB4DB_727F0D96_DE4A0E05_A5DC7FF6_4F231D7D
  };

  // Compile-time random bits for owner identity seed
  parameter keymgr_pkg::seed_t RndCnstKeymgrOwnerIdentitySeed = {
    256'hB9C9BD90_CF465B59_731B7261_A344414C_190AD0A0_9D144FFC_0C0FEA08_1CEF945B
  };

  // Compile-time random bits for software generation seed
  parameter keymgr_pkg::seed_t RndCnstKeymgrSoftOutputSeed = {
    256'h641F096B_9F3E9A49_4BA35FCF_EF0DFB22_3E8AB704_F249EE3F_A822276C_45E588ED
  };

  // Compile-time random bits for hardware generation seed
  parameter keymgr_pkg::seed_t RndCnstKeymgrHardOutputSeed = {
    256'h40CF52C8_FAE2D054_A7114977_18222EC3_7360E23D_4DDA559A_DABCF099_937FEBBF
  };

  // Compile-time random bits for generation seed when aes destination selected
  parameter keymgr_pkg::seed_t RndCnstKeymgrAesSeed = {
    256'h048FAC32_8BA1BDEE_0CACA987_BE4A4ABF_486B1674_0B20BC32_B13FF07A_13FF21CE
  };

  // Compile-time random bits for generation seed when kmac destination selected
  parameter keymgr_pkg::seed_t RndCnstKeymgrKmacSeed = {
    256'h605E0AC0_19858F73_D707CD0E_C1D33DAA_EF20E285_FA658FDD_1B426C03_7151B16C
  };

  // Compile-time random bits for generation seed when otbn destination selected
  parameter keymgr_pkg::seed_t RndCnstKeymgrOtbnSeed = {
    256'h8D444C44_4F396F44_79CB795C_F94B9E40_9D18381B_D5D56821_E2985E47_997105C4
  };

  // Compile-time random bits for generation seed when no CDI is selected
  parameter keymgr_pkg::seed_t RndCnstKeymgrCdi = {
    256'h900F2555_74675985_B210E1A9_68E45E5B_35E460FD_AF1FF382_AB0195E3_3689D99B
  };

  // Compile-time random bits for generation seed when no destination selected
  parameter keymgr_pkg::seed_t RndCnstKeymgrNoneSeed = {
    256'hCEBF2B79_B6839264_EDF4DE2B_39F39405_9891A38B_D1D16C76_3BBD9034_7E58152D
  };

  ////////////////////////////////////////////
  // csrng
  ////////////////////////////////////////////
  // Compile-time random bits for csrng state group diversification value
  parameter csrng_pkg::cs_keymgr_div_t RndCnstCsrngCsKeymgrDivNonProduction = {
    128'h7FCA9938_036525AA_A3F89E3D_E8F12786,
    256'h45E11D7C_AC763102_05E19CD3_F2ED294A_279F3C6D_0649A905_CC9B10A6_7A16161F
  };

  // Compile-time random bits for csrng state group diversification value
  parameter csrng_pkg::cs_keymgr_div_t RndCnstCsrngCsKeymgrDivProduction = {
    128'hED72416D_FD293DE3_A18A8837_B0DD4CB6,
    256'h94DD5404_51D769D2_8E1D9E76_007B7A9E_0F6E3D59_1A7FD8C7_BA264AF7_8F28AEE0
  };

  ////////////////////////////////////////////
  // sram_ctrl_main
  ////////////////////////////////////////////
  // Compile-time random reset value for SRAM scrambling key.
  parameter otp_ctrl_pkg::sram_key_t RndCnstSramCtrlMainSramKey = {
    128'hD28E4D63_8D95D180_6E870336_CD961D20
  };

  // Compile-time random reset value for SRAM scrambling nonce.
  parameter otp_ctrl_pkg::sram_nonce_t RndCnstSramCtrlMainSramNonce = {
    128'h49F33201_1CAB7D51_2B69B6B7_66DC8476
  };

  // Compile-time random bits for initial LFSR seed
  parameter sram_ctrl_pkg::lfsr_seed_t RndCnstSramCtrlMainLfsrSeed = {
    32'h0801C9AA
  };

  // Compile-time random permutation for LFSR output
  parameter sram_ctrl_pkg::lfsr_perm_t RndCnstSramCtrlMainLfsrPerm = {
    160'h1C01E407_0EC9ADB3_A7EC513A_27DD74AC_8BA6C67C
  };

  ////////////////////////////////////////////
  // sram_ctrl_mbox
  ////////////////////////////////////////////
  // Compile-time random reset value for SRAM scrambling key.
  parameter otp_ctrl_pkg::sram_key_t RndCnstSramCtrlMboxSramKey = {
    128'h0B776B16_DD95013B_9569BD77_059093ED
  };

  // Compile-time random reset value for SRAM scrambling nonce.
  parameter otp_ctrl_pkg::sram_nonce_t RndCnstSramCtrlMboxSramNonce = {
    128'h3CE77AEA_86FFD82C_B1CDEE3F_CD6039C7
  };

  // Compile-time random bits for initial LFSR seed
  parameter sram_ctrl_pkg::lfsr_seed_t RndCnstSramCtrlMboxLfsrSeed = {
    32'hC0402496
  };

  // Compile-time random permutation for LFSR output
  parameter sram_ctrl_pkg::lfsr_perm_t RndCnstSramCtrlMboxLfsrPerm = {
    160'h206C9AE3_E62B11CB_9FC2D6F3_4839B29C_540E8DEB
  };

  ////////////////////////////////////////////
  // rom_ctrl0
  ////////////////////////////////////////////
  // Fixed nonce used for address / data scrambling
  parameter bit [63:0] RndCnstRomCtrl0ScrNonce = {
    64'h767AFF4B_BB54571D
  };

  // Randomised constant used as a scrambling key for ROM data
  parameter bit [127:0] RndCnstRomCtrl0ScrKey = {
    128'h7BA3EBC3_93927B56_CC945C44_B5348892
  };

  ////////////////////////////////////////////
  // rom_ctrl1
  ////////////////////////////////////////////
  // Fixed nonce used for address / data scrambling
  parameter bit [63:0] RndCnstRomCtrl1ScrNonce = {
    64'h0A7555F7_7BFC936F
  };

  // Randomised constant used as a scrambling key for ROM data
  parameter bit [127:0] RndCnstRomCtrl1ScrKey = {
    128'hEA411188_8D196ACF_43EEF65B_7D755CF0
  };

  ////////////////////////////////////////////
  // rv_core_ibex
  ////////////////////////////////////////////
  // Default seed of the PRNG used for random instructions.
  parameter ibex_pkg::lfsr_seed_t RndCnstRvCoreIbexLfsrSeed = {
    32'h0BD7432C
  };

  // Permutation applied to the LFSR of the PRNG used for random instructions.
  parameter ibex_pkg::lfsr_perm_t RndCnstRvCoreIbexLfsrPerm = {
    160'hF6FA2481_462BFF40_CC786B2B_2B390486_577E6A27
  };

  // Default icache scrambling key
  parameter logic [ibex_pkg::SCRAMBLE_KEY_W-1:0] RndCnstRvCoreIbexIbexKeyDefault = {
    128'h01800637_1991F8FD_F8344ADD_677AFE9E
  };

  // Default icache scrambling nonce
  parameter logic [ibex_pkg::SCRAMBLE_NONCE_W-1:0] RndCnstRvCoreIbexIbexNonceDefault = {
    64'h6A7BBA1D_DDC10D8D
  };

endpackage : top_darjeeling_rnd_cnst_pkg
