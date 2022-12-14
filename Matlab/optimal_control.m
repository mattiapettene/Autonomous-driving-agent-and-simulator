clear;
clc;
close all;

%% Plant equations
syms s(t) v(t) a(t) u(t) l1(t) l2(t) l3(t);
ode1 = diff(s) == v;
ode2 = diff(v) == a;
ode3 = diff(a) == u;

%% Cost function inside the integral (lagrangian)
L = u^2;

%% Hamiltonian
H = L + l1*rhs(ode1) + l2*rhs(ode2) + l3*rhs(ode3);

%% Costate equations (lamda_dot)
Dl1 = diff(l1, t) ==-functionalDerivative(H,s);
Dl2 = diff(l2,t) ==-functionalDerivative(H,v);
Dl3 = diff(l3,t) ==-functionalDerivative(H,a);

%% Solve for a control u
du = functionalDerivative(H,u);
syms opt_u;
opt_u = solve(subs(du,u(t),opt_u)==0, opt_u);

%% Substitute u to state equations
ode3s = diff(a) == subs(rhs(ode3), u, opt_u);

%% Initial conditions
ICs = 's(0) = 0, v(0) = v0, a(0) = a0';
FCs = 's(T) = sf, v(T) = vf, a(T) = af';

%% Convert symbolic objects to string for using 'dsolve'
sol_opt = dsolve([ode1, ode2, ode3s, Dl1, Dl2, Dl3], ICs, FCs);


disp('Optimal polynomial longitudinal position:');
pretty(sol_opt.s)

disp('Optimal polynomial velocity:');
pretty(sol_opt.v)

disp('Optimal polynomial acceleration:');
pretty(sol_opt.a)

%% Assign to function

% Obtain optimal control
sol_opt.j = subs(opt_u,l3(t), sol_opt.l3);

syms t v0 a0 sf vf af T;
s_opt_fun = matlabFunction(sol_opt.s, 'Vars', [t,v0,a0,sf,vf,af,T], 'File', 's_opt.m');
v_opt_fun = matlabFunction(sol_opt.v, 'Vars', [t,v0,a0,sf,vf,af,T], 'File', 'v_opt.m');
a_opt_fun = matlabFunction(sol_opt.a, 'Vars', [t,v0,a0,sf,vf,af,T], 'File', 'a_opt.m');
j_opt_fun = matlabFunction(sol_opt.j, 'Vars', [t,v0,a0,sf,vf,af,T], 'File', 'j_opt.m');

