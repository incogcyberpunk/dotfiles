---@diagnostic disable: undefined-global
return {
  -- For an default exported arrow function
  s(
    'edaf',
    fmta(
      [[
    const <> = ( <> ) <> =>> {
      <>
    }

    export default <>;
  ]],
      {
        i(1, 'name'),
        i(2, 'args'),
        d(3, function()
          if vim.bo.filetype == 'typescript' then
            return sn(nil, { t ': ', i(1, 'returnType') })
          else
            return sn(nil, { t '' })
          end
        end),
        i(0),
        rep(1),
      }
    )
  ),

  -- For an ternary operator
  s(
    'ter',
    fmta(
      [[
    <> ? <> : <>;
    ]],
      {
        i(1, 'condition'),
        i(2, 'trueValue'),
        i(0, 'falseValue'),
      }
    )
  ),

  -- For getting the current date and time for TODO
  s(
    'td',
    fmta(
      [[
  // <>:(<>): <>
  ]],
      {
        c(1, {
          t 'TODO',
          t 'HACK',
          t 'WARN',
          t 'PERF',
          t 'NOTE',
          t 'TEST',
        }),
        t { os.date '%Y-%m-%d %H:%M UTC %Z' },
        i(2, 'description'),
      }
    )
  ),
}
