(module
  (memory (export "mem") 1)

  (func (export "isPangram") (param $offset i32) (param $length i32) (result i32)
    (local $i i32)
    (local $charCode i32)
    (local $alphabetMask i32)
    (local.set $alphabetMask (i32.const 0))
    (local.set $i (i32.const 0)) ;; Initialize $i to 0

    (block $exit
      (loop $loop
        (br_if $exit (i32.ge_s (local.get $i) (local.get $length))) ;; Corrected exit condition

        (local.set $charCode (i32.load8_u (i32.add (local.get $offset) (local.get $i))))

        ;; Convert ASCII A-Z to a-z
        (local.set $charCode
          (i32.or
            (local.get $charCode)
            (i32.const 0x20)
          )
        )

        ;; Ensure it's a lowercase letter a-z
        (if
          (i32.and
            (i32.ge_u (local.get $charCode) (i32.const 97))
            (i32.le_u (local.get $charCode) (i32.const 122))
          )
          (local.set $alphabetMask
            (i32.or
              (local.get $alphabetMask)
              (i32.shl
                (i32.const 1)
                (i32.sub (local.get $charCode) (i32.const 97))
              )
            )
          )
        )

        (local.set $i (i32.add (local.get $i) (i32.const 1))) ;; Increment $i at the end of the loop

        (br $loop)
      )
    )

    ;; Check if all bits are set (i.e., all letters found)
    (if (i32.eqz (i32.xor (local.get $alphabetMask) (i32.const 0x3FFFFFF))) ;; Corrected bitmask check
      (return (i32.const 1))
    )

    (i32.const 0)
  )
)