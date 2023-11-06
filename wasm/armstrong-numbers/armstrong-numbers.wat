(module
  (func (export "isArmstrongNumber") (param $candidate i32) (result i32)
    (local $sum i32)
    (local $temp i32)
    (local $digit i32)
    (local $count i32)
    (local $n i32)
    (local.set $sum (i32.const 0))
    (local.set $temp (local.get $candidate))
    ;; Calculate the number of digits
    (local.set $count (i32.const 0))
    (block $block
      (loop $countLoop
        (local.set $count (i32.add (local.get $count) (i32.const 1)))
        (local.set $temp (i32.div_u (local.get $temp) (i32.const 10)))
        (br_if $countLoop (i32.gt_u (local.get $temp) (i32.const 0)))
      )
    )
    ;; Reset temp to the candidate number
    (local.set $temp (local.get $candidate))
    ;; Calculate the Armstrong sum
    (block $block
      (loop $sumLoop
        (local.set $digit (i32.rem_u (local.get $temp) (i32.const 10)))
        (local.set $n (local.get $count))
        ;; Raise digit to the power of count
        (local.set $digit (i32.const 1))
        (loop $powerLoop
          (local.set $digit (i32.mul (local.get $digit) (i32.rem_u (local.get $temp) (i32.const 10))))
          (local.set $n (i32.sub (local.get $n) (i32.const 1)))
          (br_if $powerLoop (i32.gt_u (local.get $n) (i32.const 0)))
        )
        (local.set $sum (i32.add (local.get $sum) (local.get $digit)))
        (local.set $temp (i32.div_u (local.get $temp) (i32.const 10)))
        (br_if $sumLoop (i32.gt_u (local.get $temp) (i32.const 0)))
      )
    )
    (i32.eq (local.get $sum) (local.get $candidate))
  )
)