function [gold, goldbin] = Gold(polyA, polyB, d)
polyBd = circshift(polyB, -d);
goldbin = bitxor(polyA, polyBd);
gold = goldbin * 2 - 1;
end