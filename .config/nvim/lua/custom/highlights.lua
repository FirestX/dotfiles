
local colors = {
  variable = "#bdbdbd",
  keyword  = "#6c95eb",
  method   = "#38c596",
  type     = "#c191ff",
  property = "#65c3cc",
  constant = "#66c3cc",
  string   = "#c9a26d",
  number   = "#ed94c0",
  comment  = "#85c46c",
  unused   = "#777777",
}

return {
  hl_override = {
    ---------------------------------------------------------------------------
    -- 🟦 Variables
    ---------------------------------------------------------------------------
    ["@variable"]                 = { fg = colors.variable },           -- General variables
    ["@variable.c_sharp"]         = { link = "@variable" },
    ["@variable.member.c_sharp"]  = { fg = colors.property },           -- Class fields / properties
    ["@variable.parameter"]       = { fg = colors.variable },           -- Function parameters
    ["@variable.parameter.c_sharp"]= { link = "@variable.parameter" },

    ---------------------------------------------------------------------------
    -- 🟪 Keywords
    ---------------------------------------------------------------------------
    ["@keyword"]                  = { fg = colors.keyword, italic = false },     -- General keywords (using, new)
    ["@keyword.repeat"]           = { fg = colors.keyword, bold = true },        -- Loops (for, while)
    ["@keyword.repeat.c_sharp"]   = { link = "@keyword.repeat" },
    ["@keyword.conditional"]      = { fg = colors.keyword },                     -- Conditionals (if, else)
    ["@keyword.conditional.c_sharp"]= { link = "@keyword.conditional" },
    ["@keyword.return"]           = { fg = colors.keyword },                     -- return
    ["@keyword.return.c_sharp"]   = { link = "@keyword.return" },
    ["@keyword.exception"]        = { fg = colors.keyword },                     -- throw, try, catch

    ---------------------------------------------------------------------------
    -- 🟩 Functions & Methods
    ---------------------------------------------------------------------------
    ["@function.method"]          = { fg = colors.method },                      -- Method definitions
    ["@function.method.call"]     = { link = "@function.method" },               -- Method calls
    ["@function.method.call.c_sharp"] = { link = "@function.method" },

    ---------------------------------------------------------------------------
    -- 🟧 Types, Properties & Constants
    ---------------------------------------------------------------------------
    ["Type"]                      = { fg = colors.type },                        -- Class / type names
    ["@property"]                 = { fg = colors.property },                    -- Properties
    ["@constant"]                 = { fg = colors.constant, bold = true },       -- Constants / enums
    ["@module"]                   = { fg = colors.type },                        -- Namespaces / modules

    ---------------------------------------------------------------------------
    -- 🟨 Literals
    ---------------------------------------------------------------------------
    ["Boolean"]                   = { fg = colors.keyword, italic = true },      -- Boolean literals (true/false)
    ["@boolean.c_sharp"]          = { link = "Boolean" },
    ["@number"]                   = { fg = colors.number, bold = true },         -- Numeric literals
    ["@number.c_sharp"]           = { link = "@number" },
    ["@string"]                   = { fg = colors.string },                      -- String literals

    ---------------------------------------------------------------------------
    -- 🟫 Comments & Punctuation
    ---------------------------------------------------------------------------
    ["@comment"]                  = { fg = colors.comment, italic = true },      -- Comments
    ["@punctuation.delimiter"]    = { fg = colors.variable },                    -- Commas, semicolons, etc.

    ---------------------------------------------------------------------------
    -- 🟥 Diagnostics
    ---------------------------------------------------------------------------
    ["DiagnosticUnnecessary"]     = { fg = colors.unused, italic = true },       -- Unused code (e.g. unused 'using')
    ---------------------------------------------------------------------------
    -- ⬜ TabLine Transparency & Highlighting
    ---------------------------------------------------------------------------
    TabLine     = { bg = "none" },
    TabLineFill = { bg = "none" },
    TabLineSel  = { fg = "#1e2327", bg = colors.keyword, bold = true },
  },
}
