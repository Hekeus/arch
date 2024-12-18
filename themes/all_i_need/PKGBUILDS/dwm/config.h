/* See LICENSE file for copyright and license details. */

/* appearance */
static const unsigned int borderpx  = 1;        /* border pixel of windows */
static const unsigned int snap      = 32;       /* snap pixel */
static const int showbar            = 1;        /* 0 means no bar */
static const int topbar             = 1;        /* 0 means bottom bar */
static const char *fonts[]          = { "JetBrains Mono Nerd Font:size=16" };
static const char dmenufont[]       = "JetBrains Mono Nerd Font:size=16";
static const char col_gray1[]       = "#0E203A";
static const char col_gray2[]       = "#1E3657";
static const char col_gray3[]       = "#BDBCB5";
static const char col_gray4[]       = "#FCFBED";
static const char col_cyan[]        = "#1E3657";
static const char col_sel[]         = "#FEEACF";
static const char *colors[][3]      = {
	/*               fg         bg         border   */
	[SchemeNorm] = { col_gray3, col_gray1, col_gray2 },
	[SchemeSel]  = { col_sel, col_gray1,  col_sel  },
};

/* tagging */
static const char *tags[] = { "\uf303", "2", "3", "4", "5", "6", "7", "\uf269", "\ue217" };

static const Rule rules[] = {
	/* xprop(1):
	 *	WM_CLASS(STRING) = instance, class
	 *	WM_NAME(STRING) = title
	 */
	/* class         					instance    title       tags mask     isfloating   monitor */
	{ "TelegramDesktop",        NULL,      NULL,       1 << 8,        False,       -1 },
	{ "qutebrowser",   					NULL,      NULL,       1 << 7,        False,       -1 },
};

/* layout(s) */
static const float mfact     = 0.55; /* factor of master area size [0.05..0.95] */
static const int nmaster     = 1;    /* number of clients in master area */
static const int resizehints = 1;    /* 1 means respect size hints in tiled resizals */
static const int lockfullscreen = 1; /* 1 will force focus on the fullscreen window */

static const Layout layouts[] = {
	/* symbol     arrange function */
	{ "[]=",      tile },    /* first entry is default */
	{ "><>",      NULL },    /* no layout function means floating behavior */
	{ "[M]",      monocle },
};

/* key definitions */
#define MODKEY Mod4Mask
#define TAGKEYS(KEY,TAG) \
	{ MODKEY,                       KEY,      view,           {.ui = 1 << TAG} }, \
	{ Mod1Mask,                     KEY,      toggleview,     {.ui = 1 << TAG} }, \
	{ MODKEY|ShiftMask,             KEY,      tag,            {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask|ShiftMask, KEY,      toggletag,      {.ui = 1 << TAG} },

/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }

/* commands */
static char dmenumon[2] = "0"; /* component of dmenucmd, manipulated in spawn() */
static const char *dmenucmd[] = { "dmenu_run", "-m", dmenumon, "-fn", dmenufont, "-nb", col_gray1, "-nf", col_gray3, "-sb", col_cyan, "-sf", col_gray4, NULL };
static const char *termcmd[]  = { "alacritty", NULL };
static const char *qutebrowser[]  = { "open_url_in_instance.sh", NULL };
static const char *reboot[] = { "shutdown", "-r" , "now" , NULL };
static const char *shutdown[] = { "shutdown", "now" , NULL };
static const char *nnn[] = { "st", "-name", "nnn", NULL };
static const char *brightup[] = { "brightnessctl", "set", "+10%", NULL };
static const char *brightdown[] = { "brightnessctl", "set", "10%-", NULL };
static const char *volumeup[] = { "amixer", "set", "Master", "10%+",  NULL};
static const char *volumedown[] = { "amixer", "set", "Master", "10%-",  NULL};
static const char *volumemute[] = { "amixer", "set", "Master", "toggle",  NULL};
static const char *touchpad_toggle[] = { "touchpad_toggle.sh", NULL};
static const char *vpn_toggle[] = { "vpn_toggle.sh", NULL};

static const Key keys[] = {
	/* modifier                     key        function        argument */
	{ 0,														0x1008ff12,	spawn,	   	  	{.v = volumemute } },
	{ 0,														0x1008ff11,	spawn,	   	  	{.v = volumedown } },
	{ 0,														0x1008ff13,	spawn,	   	  	{.v = volumeup } },
	{ 0,														0x1008ff03,	spawn,	   	  	{.v = brightdown } },
	{ 0,														0x1008ff02,	spawn,	   	  	{.v = brightup } },
	{ 0,														0x1008ffa9,	spawn,	   	  	{.v = touchpad_toggle } },
	{ MODKEY|ShiftMask,             XK_r,      	spawn,          {.v = reboot } },
	{ MODKEY|ShiftMask,             XK_h,      	spawn,          {.v = shutdown } },
	{ MODKEY,                     	XK_p,      	spawn,          {.v = dmenucmd } },
	{ MODKEY,	                			XK_Return,	spawn,          {.v = termcmd } },
	{ MODKEY,	                			XK_u,	   		spawn,          {.v = qutebrowser } },
	{ MODKEY,	                			XK_v,	   		spawn,          {.v = vpn_toggle } },
	{ MODKEY,                       XK_b,      	togglebar,      {0} },
	{ MODKEY,                       XK_j,      	focusstack,     {.i = +1 } },
	{ MODKEY,                       XK_k,      	focusstack,     {.i = -1 } },
	{ MODKEY,                       XK_i,      	incnmaster,     {.i = +1 } },
	{ MODKEY,                       XK_d,      	incnmaster,     {.i = -1 } },
	{ MODKEY,                       XK_h,      	setmfact,       {.f = -0.05} },
	{ MODKEY,                       XK_l,      	setmfact,       {.f = +0.05} },
	{ MODKEY,                       XK_Return, 	zoom,           {0} },
	{ MODKEY,                       XK_Tab,    	view,           {0} },
	{ MODKEY,	                			XK_q,      	killclient,     {0} },
	{ MODKEY,                       XK_t,      	setlayout,      {.v = &layouts[0]} },
	{ MODKEY,                       XK_f,      	setlayout,      {.v = &layouts[1]} },
	{ MODKEY,                       XK_m,      	setlayout,      {.v = &layouts[2]} },
	{ MODKEY,                       XK_space,  	setlayout,      {0} },
	{ MODKEY|ShiftMask,             XK_space,  	togglefloating, {0} },
	{ MODKEY,                       XK_0,      	view,           {.ui = ~0 } },
	{ MODKEY|ShiftMask,             XK_0,      	tag,            {.ui = ~0 } },
	{ MODKEY,                       XK_comma,  	focusmon,       {.i = -1 } },
	{ MODKEY,                       XK_period, 	focusmon,       {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_comma,  	tagmon,         {.i = -1 } },
	{ MODKEY|ShiftMask,             XK_period, 	tagmon,         {.i = +1 } },
	TAGKEYS(                        XK_1,                      0)
	TAGKEYS(                        XK_2,                      1)
	TAGKEYS(                        XK_3,                      2)
	TAGKEYS(                        XK_4,                      3)
	TAGKEYS(                        XK_5,                      4)
	TAGKEYS(                        XK_6,                      5)
	TAGKEYS(                        XK_7,                      6)
	TAGKEYS(                        XK_8,                      7)
	TAGKEYS(                        XK_9,                      8)
	{ MODKEY|ShiftMask,             XK_q,      	quit,           {0} },
};

/* button definitions */
/* click can be ClkTagBar, ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin */
static const Button buttons[] = {
	/* click                event mask      button          function        argument */
	{ ClkLtSymbol,          0,              Button1,        setlayout,      {0} },
	{ ClkLtSymbol,          0,              Button3,        setlayout,      {.v = &layouts[2]} },
	{ ClkWinTitle,          0,              Button2,        zoom,           {0} },
	{ ClkStatusText,        0,              Button2,        spawn,          {.v = termcmd } },
	{ ClkClientWin,         MODKEY,         Button1,        movemouse,      {0} },
	{ ClkClientWin,         MODKEY,         Button2,        togglefloating, {0} },
	{ ClkClientWin,         MODKEY,         Button3,        resizemouse,    {0} },
	{ ClkTagBar,            0,              Button1,        view,           {0} },
	{ ClkTagBar,            0,              Button3,        toggleview,     {0} },
	{ ClkTagBar,            MODKEY,         Button1,        tag,            {0} },
	{ ClkTagBar,            MODKEY,         Button3,        toggletag,      {0} },
};

