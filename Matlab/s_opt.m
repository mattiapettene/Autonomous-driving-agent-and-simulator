function out1 = s_opt(t,v0,a0,sf,vf,af,T)
%S_OPT
%    OUT1 = S_OPT(t,V0,A0,SF,VF,AF,T)

%    This function was generated by the Symbolic Math Toolbox version 9.2.
%    04-Nov-2022 08:44:01

t2 = T.^2;
t3 = af.*t2;
t4 = a0.*t2.*3.0;
t5 = -t3;
out1 = t.*v0+(a0.*t.^2)./2.0-(1.0./T.^5.*t.^5.*(sf.*-1.2e+1+t5+T.*v0.*6.0+T.*vf.*6.0+a0.*t2))./2.0-(1.0./T.^3.*t.^3.*(sf.*-2.0e+1+t4+t5+T.*v0.*1.2e+1+T.*vf.*8.0))./2.0+(t.^4.*1.0./t2.^2.*(sf.*-3.0e+1-t3.*2.0+t4+T.*v0.*1.6e+1+T.*vf.*1.4e+1))./2.0;
