(module
  (func (export "isLeap") (param $year i32) (result i32)
    (local $leap i32)
    (local.set $leap (i32.const 0)) ;; Default to non-leap year
    (block $not_leap_year ;; Block for non-leap year case
      (block $leap_year_check ;; Block for leap year check
        (br_if $leap_year_check ;; If not divisible by 4, it's not a leap year
          (i32.ne (i32.rem_u (local.get $year) (i32.const 4)) (i32.const 0))
        )
        (br_if $not_leap_year ;; If divisible by 100 and not 400, it's not a leap year
          (i32.and
            (i32.eq (i32.rem_u (local.get $year) (i32.const 100)) (i32.const 0))
            (i32.ne (i32.rem_u (local.get $year) (i32.const 400)) (i32.const 0))
          )
        )
        (local.set $leap (i32.const 1)) ;; It is a leap year
      )
    )
    (local.get $leap)
  )
)