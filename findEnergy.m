function E = findEnergy(Xp)

Energy1 = 1/2*a1*power(Xp-Xo - rl1, 2)+ 1/3*b1*power(Xp-Xo - rl1, 3) +  1/4*c1*power(Xp-Xo - rl1, 4);
Energy2 = 1/2*a2*power(Xe-Xp - rl2, 2)+ 1/3*b2*power(Xe-Xp - rl2, 3) +  1/4*c2*power(Xe-Xp - rl2, 4);
E = Energy1 + Energy2;

end