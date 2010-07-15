function [TQ, logZ] = tabularFactorCondition(TF, queryVars, clamped)
%% Compute sum_H p(Q, H | V=v) through brute force enumeration
% See also variableElimination

visVars  = find(clamped); 
visValues  = nonzeros(clamped); 
TF = tabularFactorSlice(TF, visVars, visValues);
[TF, Z] = tabularFactorNormalize(TF);
TQ = tabularFactorMarginalize(TF, queryVars);
logZ = log(Z + eps); 
end