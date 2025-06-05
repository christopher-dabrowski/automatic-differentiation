import Base: ^
^(x::GraphNode, n::GraphNode) = ScalarOperator(^, x, n)
forward(::ScalarOperator{typeof(^)}, x, n) = return x^n
backward(::ScalarOperator{typeof(^)}, x, n, g) = tuple(g * n * x^(n - 1), g * log(abs(x)) * x^n)

import Base: sin
sin(x::GraphNode) = ScalarOperator(sin, x)
forward(::ScalarOperator{typeof(sin)}, x) = return sin(x)
backward(::ScalarOperator{typeof(sin)}, x, g) = tuple(g * cos(x))

import Base: *
*(A::GraphNode, x::GraphNode) = ScalarOperator(*, A, x)
forward(::ScalarOperator{typeof(*)}, A, x) = A * x
backward(::ScalarOperator{typeof(*)}, A, x, g) = tuple(g * x', A' * g)
