#pragma semicolon 1

#include <sourcemod>
#include <tf2_stocks>
#include <tf2>

#define PLUGIN_VERSION "1.1.0"

new bool:g_Enabled;
new bool:g_ShowInfo;

new Handle:aa_AddAdmin = INVALID_HANDLE;
new Handle:aa_AddAdminFlag = INVALID_HANDLE;
new Handle:aa_AddAdminGroup = INVALID_HANDLE;
new Handle:aa_Announce = INVALID_HANDLE;
new Handle:aa_Enabled;
new Handle:aa_ShowInfo;
new g_iState[MAXPLAYERS+1] = 0;

#define PLUGIN_NAME 		"[TF2] Add Admin";
#define PLUGIN_AUTHOR 		"Endernation";
#define PLUGIN_DESC 		"Adds the command to add admins without wasting your time to go to the admins_simple.ini";
#define PLUGIN_VERSION		 "1.1.0 Beta";
#define PLUGIN_URL		 "www.endernation.webs.com";

public Plugin:myinfo =
{
	name = PLUGIN_NAME,
	author = PLUGIN_AUTHOR,
	description = PLUGIN_DESC,
	version = PLUGIN_VERSION,
	url = PLUGIN_URL
}

public OnPluginStart()
{
	CreateConVar("sm_aa_version", PLUGIN_VERSION, "Add Admin Version.", FCVAR_REPLICATED | FCVAR_PLUGIN | FCVAR_SPONLY | FCVAR_DONTRECORD | FCVAR_NOTIFY);
	aa_Enabled = CreateConVar("sm_aa_enabled", "1", "Enables/Disables the Add Admins Addon", FCVAR_PLUGIN, true, 0.0, true, 1.0);

	g_Enabled = GetConVarBool(aa_Enabled);

	HookConVarChange(aa_Enabled, OnCVarChange);
	AutoExecConfig(true, "plugin.addadmin");
	LoadTranslations("addadmin");
}

public OnCVarChange(Handle:convar, const String:oldValue[], const String:newValue[])
	if(convar == aa_Enabled)
		g_Enabled = GetConVarBool(aa_Enabled);
	if(convar == aa_ShowInfo)
	g_ShowInfo = GetConVarBool(aa_ShowInfo);
}