Mag = 10; V = 10; No_pts = 100; theta = 2;
Phi = Mag * (1-2*rand([No_pts,1]));
E = V * (1-2*rand([No_pts,1]));
Z = Phi*theta + E;
LS = Phi \ Z
Max = max(Z ./ Phi), Min = min(Z ./ Phi)

