function [sign] = get_sign(A)
   sign = min(svd(A));
end

