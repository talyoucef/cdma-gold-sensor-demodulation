function [seq, seqbin] = msequence(p)
m = length(p) - 1;
L = 2 ^ m - 1;
reg = [1, zeros(1, m-1)];
seq = zeros(1, L);
seqbin = zeros(1, L);
g = find(p(2 : end - 1)) + 1;
for i = 1 : L
    r = reg(end);
    seqbin(i) = r;
    reg = [r reg(1 : end - 1)];
    reg(g) = bitxor(reg(g), r);
    seq(i) = seqbin(i) * 2 - 1;
end
end