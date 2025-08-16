module CrossValidation
using Statistics
using Random
using LinearAlgebra
using GLM

export k_fold_cv

"""
    k_fold_cv(model, knots, X, Y, k, metric_f; kwargs...)

TBW
"""
function k_fold_cv(model, knots, X, Y, k, metric_f; kwargs...)
    Random.seed!(42)
    n = length(X)
    fold_size = div(n, k)
    indices = shuffle(1:n)
    metrics = Float64[]

    for i in 1:k
        test_indices = indices[(i-1)*fold_size+1:min(i*fold_size, n)]
        train_indices = setdiff(indices, test_indices)
        
        train_X = X[train_indices]
        train_Y = Y[train_indices]
        test_X = X[test_indices]
        test_Y = Y[test_indices]

        # Treina o moelo de splines
        spline_model = model(train_X, df=knots, intercept=true)
        model_splines = lm(spline_model(train_X), train_Y)
        
        # Avalia o modelo
        predictions = predict(model_splines, spline_model(test_X))
        metric = metric_f(test_Y, predictions)
        push!(metrics, metric)
    end
    return mean(metrics)
end
end # end of module CrossValidation