static const char norm_fg[] = "#f6f6f6";
static const char norm_bg[] = "#030303";
static const char norm_border[] = "#acacac";

static const char sel_fg[] = "#f6f6f6";
static const char sel_bg[] = "#B7B9C6";
static const char sel_border[] = "#f6f6f6";

static const char urg_fg[] = "#f6f6f6";
static const char urg_bg[] = "#A2A5B0";
static const char urg_border[] = "#A2A5B0";

static const char *colors[][3]      = {
    /*               fg           bg         border                         */
    [SchemeNorm] = { norm_fg,     norm_bg,   norm_border }, // unfocused wins
    [SchemeSel]  = { sel_fg,      sel_bg,    sel_border },  // the focused win
    [SchemeUrg] =  { urg_fg,      urg_bg,    urg_border },
};
