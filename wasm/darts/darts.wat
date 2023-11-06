(module
  ;; Dart game score function
  (func (export "score") (param $x f32) (param $y f32) (result i32)
    (local $dist f32)

    ;; Constants for circle radii
    (f32.const 1.0)
    (f32.const 5.0)
    (f32.const 10.0)

    ;; Calculate distance from the point to the center using Pythagorean theorem
    (local.set $dist (f32.sqrt (f32.add (f32.mul (local.get $x) (local.get $x)) (f32.mul (local.get $y) (local.get $y)))))

    ;; Determine the score based on the distance
    (if (f32.le (local.get $dist) (f32.const 1.0))
      (return (i32.const 10))
    )
    (if (f32.le (local.get $dist) (f32.const 5.0))
      (return (i32.const 5))
    )
    (if (f32.le (local.get $dist) (f32.const 10.0))
      (return (i32.const 1))
    )
    (return (i32.const 0))
  )
)
