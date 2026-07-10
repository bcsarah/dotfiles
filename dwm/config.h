/* appearance */
static const unsigned int borderpx  = 2;
static const unsigned int snap      = 32;
static const int showbar            = 0;
static const int topbar             = 1;
static const char *fonts[]          = { "JetBrainsMono Nerd Font:size=12" };
static const char dmenufont[]       = "JetBrainsMono Nerd Font:size=12";

static const char col_bg[]          = "#282828";
static const char col_bg_alt[]      = "#3c3836";
static const char col_fg[]          = "#ebdbb2";
static const char col_fg_alt[]      = "#928374";
static const char col_green[]       = "#98971a";
static const char col_yellow[]      = "#fabd2f";
static const char col_blue[]        = "#458588";
static const char col_red[]         = "#cc241d";
static const char col_aqua[]        = "#83a598";
static const char col_purple[]      = "#b16286";
static const char col_orange[]      = "#d79921";

/* Esquemas de cores */
static const char *colors[][3] = {
    /*               fg         bg         border   */
    [SchemeNorm] = { col_fg, col_bg, col_bg_alt },
    [SchemeSel]  = { col_bg, col_green, col_green }, /* workspace ativo */
};

/* tagging - ícones dos workspaces */
static const char *tags[] = { "  ", "  ", "  ", " 󰖣 " };

static const Rule rules[] = {
    /* class         instance    title       tags mask     isfloating   monitor */
    { "emojify",      NULL,       NULL,       0,            1,           -1 },
    { "pavucontrol",  NULL,       NULL,       0,            1,           -1 },
};

/* layout(s) */
static const float mfact     = 0.55;
static const int nmaster     = 1;
static const int resizehints = 1;
static const int lockfullscreen = 1;
static const int refreshrate = 120;

static const Layout layouts[] = {
    /* symbol     arrange function */
    { "",      tile },
    { "",      NULL },
    { "",      monocle },
};

/* key definitions */
#define MODKEY Mod4Mask
#define TAGKEYS(KEY,TAG) \
    { MODKEY,                       KEY,      view,           {.ui = 1 << TAG} }, \
    { MODKEY|ControlMask,           KEY,      toggleview,     {.ui = 1 << TAG} }, \
    { MODKEY|ShiftMask,             KEY,      tag,            {.ui = 1 << TAG} }, \
    { MODKEY|ControlMask|ShiftMask, KEY,      toggletag,      {.ui = 1 << TAG} },

#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }

/* commands */
static char dmenumon[2] = "0";
static const char *dmenucmd[] = { "dmenu_run", NULL };
static const char *dmenudesk[] = { "j4-dmenu-desktop", NULL };
static const char *term[]  = { "kitty", NULL };
static const char *file[]  = { "thunar", NULL };
static const char *browser[]  = { "zen-browser", NULL };
static const char *notes[]  = { "obsidian", NULL };
static const char *game[]  = { "steam", NULL };
static const char *volume[]  = { "pavucontrol", NULL };
static const char *emoji[]  = { "emojify", NULL };

static const char *screenshotcmd[]  = { "sh", "-c", "maim --select | xclip -selection clipboard -t image/png", NULL };
static const char *screenshotfullcmd[]  = { "sh", "-c", "maim | xclip -selection clipboard -t image/png", NULL };

static const Key keys[] = {
    { MODKEY,                       XK_q,      spawn,          {.v = term } },
    { MODKEY,                       XK_w,      killclient,     {0} },
    { MODKEY,                       XK_e,      spawn,          {.v = file } },
    { MODKEY,                       XK_r,      spawn,          {.v = dmenudesk } },
    { MODKEY|ShiftMask,             XK_r,      spawn,          {.v = dmenucmd } },
    { MODKEY,                       XK_v,      togglefloating, {0} },

    { MODKEY,                       XK_b,      spawn,          {.v = browser } },
    { MODKEY,                       XK_g,      spawn,          {.v = game } },
    { MODKEY,                       XK_o,      spawn,          {.v = notes } },
    { MODKEY,                       XK_z,      spawn,          {.v = volume } },
    { MODKEY,                       XK_m,      spawn,          {.v = emoji } },

    { 0,                            XK_Print,  spawn,          {.v = screenshotcmd } },
    { ShiftMask,                    XK_Print,  spawn,          {.v = screenshotfullcmd } },

    { MODKEY,                       XK_j,      focusstack,     {.i = +1 } },
    { MODKEY,                       XK_k,      focusstack,     {.i = -1 } },
    { MODKEY|ShiftMask,             XK_j,      rotatestack,    {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_k,      rotatestack,    {.i = -1 } },
    { MODKEY|ControlMask,           XK_h,      setmfact,       {.f = -0.05} },
    { MODKEY|ControlMask,           XK_l,      setmfact,       {.f = +0.05} },
	{ MODKEY,                       XK_Return, zoom,           {0} },

    { MODKEY,                       XK_y,      setlayout,      {.v = &layouts[2]} },
    { MODKEY,                       XK_u,      setlayout,      {.v = &layouts[0]} },
    { MODKEY,                       XK_i,      togglebar,      {0} },

    TAGKEYS(                        XK_1,                      0)
    TAGKEYS(                        XK_2,                      1)
    TAGKEYS(                        XK_3,                      2)
    TAGKEYS(                        XK_4,                      3)

    { MODKEY|ShiftMask,             XK_c,      quit,           {0} },
};

/* button definitions */
static const Button buttons[] = {
    { ClkLtSymbol,          0,              Button1,        setlayout,      {0} },
    { ClkLtSymbol,          0,              Button3,        setlayout,      {.v = &layouts[2]} },
    { ClkWinTitle,          0,              Button2,        zoom,           {0} },
    { ClkStatusText,        0,              Button2,        spawn,          {.v = term } },
    { ClkClientWin,         MODKEY,         Button1,        movemouse,      {0} },
    { ClkClientWin,         MODKEY,         Button2,        togglefloating, {0} },
    { ClkClientWin,         MODKEY,         Button3,        resizemouse,    {0} },
    { ClkTagBar,            0,              Button1,        view,           {0} },
    { ClkTagBar,            0,              Button3,        toggleview,     {0} },
    { ClkTagBar,            MODKEY,         Button1,        tag,            {0} },
    { ClkTagBar,            MODKEY,         Button3,        toggletag,      {0} },
};
