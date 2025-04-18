//included by "ui_def_base.inc"

//-----------------------------------------------------------------------------
// NON TASK ROSTER
//-----------------------------------------------------------------------------

//Infopanel
#define VN_IDD_MF_INFOPANEL								47000
#define VN_DISP_MF_INFOPANEL							(uiNamespace getVariable ["para_infopanel",DisplayNull])

#define VN_MF_INFOPANEL_MAIN_IDC						5000
#define VN_MF_INFOPANEL_MAIN_CTRL						(VN_DISP_MF_INFOPANEL displayCtrl VN_MF_INFOPANEL_MAIN_IDC)

#define VN_MF_INFOPANEL_MAIN_TXT_IDC					2000
#define VN_MF_INFOPANEL_MAIN_TXT_CTRL					(VN_MF_INFOPANEL_MAIN_CTRL controlsGroupCtrl VN_MF_INFOPANEL_MAIN_TXT_IDC)
#define VN_MF_INFOPANEL_MAIN_IMG_IDC					2001
#define VN_MF_INFOPANEL_MAIN_IMG_CTRL					(VN_MF_INFOPANEL_MAIN_CTRL controlsGroupCtrl VN_MF_INFOPANEL_MAIN_IMG_IDC)

// #define VN_MF_INFOPANEL_QUICK_MAIN_IDC					2100
#define VN_MF_INFOPANEL_QUICK_CTRL(QUICK_TEMP_IDC)		(VN_DISP_MF_INFOPANEL displayCtrl QUICK_TEMP_IDC)

#define VN_MF_INFOPANEL_QUICK_TXT_IDC					2101
#define VN_MF_INFOPANEL_QUICK_TXT_CTRL(QUICK_TEMP_IDC)	(VN_MF_INFOPANEL_QUICK_CTRL(QUICK_TEMP_IDC) controlsGroupCtrl VN_MF_INFOPANEL_QUICK_TXT_IDC)

// Example display
#define VN_MF_IDD_RSCDISPLAYEXAMPLE 48000
#define VN_MF_RSCDISPLAYEXAMPLE_LT_IDC 100
#define VN_MF_RSCDISPLAYEXAMPLE_CT_IDC 101
#define VN_MF_RSCDISPLAYEXAMPLE_RT_IDC 102
#define VN_MF_RSCDISPLAYEXAMPLE_LM_IDC 103
#define VN_MF_RSCDISPLAYEXAMPLE_CM_IDC 104
#define VN_MF_RSCDISPLAYEXAMPLE_RM_IDC 105
#define VN_MF_RSCDISPLAYEXAMPLE_LB_IDC 106
#define VN_MF_RSCDISPLAYEXAMPLE_CB_IDC 107
#define VN_MF_RSCDISPLAYEXAMPLE_RB_IDC 108
