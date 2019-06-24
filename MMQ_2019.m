function [x] = MMQ_2019(A, w, b)
    W = diag(w);
    x = (A'*W*A)\(A'*W*b);
    return
end

