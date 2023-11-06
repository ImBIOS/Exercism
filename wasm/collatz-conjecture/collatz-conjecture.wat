(module
  ;; Collatz conjecture
  (func (export "steps") (param $number i32) (result i32)
    (local $count i32)
    (local $num i32)

    ;; zero or negative returns -1
    (if (i32.le_s (local.get $number) (i32.const 0))
      (return (i32.const -1))
    )

    (local.set $num (local.get $number))
    (local.set $count (i32.add (local.get $count) (i32.const 0)))

    ;; while (num > 1)
    (loop $loop
     (if (i32.gt_s (local.get $num) (i32.const 1))
       (then
         ;; if (num % 2 == 0)
         (if (i32.eq (i32.rem_s (local.get $num) (i32.const 2)) (i32.const 0))
           (then
             ;; num /= 2
             (local.set $num (i32.div_s (local.get $num) (i32.const 2)))
           )
           (else
             ;; num = 3 * num + 1
             (local.set $num (i32.add (i32.mul (local.get $num) (i32.const 3)) (i32.const 1)))
           )
         )
         ;; count += 1
         (local.set $count (i32.add (local.get $count) (i32.const 1)))
         (br $loop) ;; This line will cause the loop to repeat.
       )
     )
    )


    (return (local.get $count))
  )
)