using JuMP, GLPK

# Preparing an optimization model
m = Model(GLPK.Optimizer)

# Declaring variables
@variable(m, x1 >= 0)
@variable(m, x2 >= 0)
@variable(m, x3 >= 0)
@variable(m, y1 >= 0)
@variable(m, y2 >= 0)
@variable(m, w1 >= 0)
@variable(m, w2 >= 0)
@variable(m, 0 <= w3 <= 6000)
@variable(m, w4 >= 0)

# Adding constraints
@constraint(m, cst1, x1 +  x2 + x3 <= 500)
@constraint(m, cst2, 2.5x1 + y1 - w1 >= 200)
@constraint(m, cst3, 3x2 + y2 - w2 >= 240)
@constraint(m, cst4, -20x3 + w3 + w4 <= 0)

# Setting the objective
@objective(m, Min, 150x1 + 230x2 + 260x3 + 238y1 - 170w1 + 210y2 - 150w2 - 36w3 - 10w4)


# Printing the prepared optimization model
print(m)

# Solving the optimization problem
JuMP.optimize!(m)

# Printing the optimal solutions obtained
println("Optimal Solutions:")
println("x1 = ", JuMP.value(x1))
println("x2 = ", JuMP.value(x2))
println("x3 = ", JuMP.value(x3))
println("y1 = ", JuMP.value(y1))
println("y2 = ", JuMP.value(y2))
println("w1 = ", JuMP.value(w1))
println("w2 = ", JuMP.value(w2))
println("w3 = ", JuMP.value(w3))

