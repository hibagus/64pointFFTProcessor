% FFT 8-point (C) Bagus Hanindhito (13211007)
% Twiddle Factor
Wn1 = (sqrt(2)/2)-j*(sqrt(2)/2);
Wn2 = 0 - j*1;
Wn3 = -(sqrt(2)/2)-j*(sqrt(2)/2);
% Input (diisi manual)
xt0 = 0 + j*0;
xt1 = 0 + j*0;
xt2 = 0 + j*0;
xt3 = 0 + j*0;
xt4 = 0 + j*0;
xt5 = 0 + j*0;
xt6 = 0 + j*0;
xt7 = 0 + j*0;
% Convert Input to Fixed Point
xt0_real = fi(real(xt0), 1, 16, 12);
xt0_imag = fi(imag(xt0), 1, 16, 12);
xt1_real = fi(real(xt1), 1, 16, 12);
xt1_imag = fi(imag(xt1), 1, 16, 12);
xt2_real = fi(real(xt2), 1, 16, 12);
xt2_imag = fi(imag(xt2), 1, 16, 12);
xt3_real = fi(real(xt3), 1, 16, 12);
xt3_imag = fi(imag(xt3), 1, 16, 12);
xt4_real = fi(real(xt4), 1, 16, 12);
xt4_imag = fi(imag(xt4), 1, 16, 12);
xt5_real = fi(real(xt5), 1, 16, 12);
xt5_imag = fi(imag(xt5), 1, 16, 12);
xt6_real = fi(real(xt6), 1, 16, 12);
xt6_imag = fi(imag(xt6), 1, 16, 12);
xt7_real = fi(real(xt7), 1, 16, 12);
xt7_imag = fi(imag(xt7), 1, 16, 12);
% Display Input
xt0_hex = dec2hex(bin2dec(strcat(xt0_real.bin,xt0_imag.bin)))
xt1_hex = dec2hex(bin2dec(strcat(xt1_real.bin,xt1_imag.bin)))
xt2_hex = dec2hex(bin2dec(strcat(xt2_real.bin,xt2_imag.bin)))
xt3_hex = dec2hex(bin2dec(strcat(xt3_real.bin,xt3_imag.bin)))
xt4_hex = dec2hex(bin2dec(strcat(xt4_real.bin,xt4_imag.bin)))
xt5_hex = dec2hex(bin2dec(strcat(xt5_real.bin,xt5_imag.bin)))
xt6_hex = dec2hex(bin2dec(strcat(xt6_real.bin,xt6_imag.bin)))
xt7_hex = dec2hex(bin2dec(strcat(xt7_real.bin,xt7_imag.bin)))
% Output
xf0 = xt0 + xt1     + xt2     + xt3     + xt4 + xt5     + xt6     + xt7;
xf1 = xt0 + Wn1*xt1 + Wn2*xt2 + Wn3*xt3 - xt4 - Wn1*xt5 - Wn2*xt6 - Wn3*xt7;
xf2 = xt0 + Wn2*xt1 - xt2     - Wn2*xt3 + xt4 + Wn2*xt5 - xt6     - Wn2*xt7;
xf3 = xt0 + Wn3*xt1 - Wn2*xt2 + Wn1*xt3 - xt4 - Wn3*xt5 + Wn2*xt6 - Wn1*xt7;
xf4 = xt0 - xt1     + xt2     - xt3     + xt4 - xt5     + xt6     - xt7;
xf5 = xt0 - Wn1*xt1 + Wn2*xt2 - Wn3*xt3 - xt4 + Wn1*xt5 - Wn2*xt6 + Wn3*xt7;
xf6 = xt0 - Wn2*xt1 - xt2     + Wn2*xt3 + xt4 - Wn2*xt5 - xt6     + Wn2*xt7;
xf7 = xt0 - Wn3*xt1 - Wn2*xt2 - Wn1*xt3 - xt4 + Wn3*xt5 + Wn2*xt6 + Wn1*xt7;
% Convert Output to Fixed Point
xf0_real = fi(real(xf0), 1, 16, 12);
xf0_imag = fi(imag(xf0), 1, 16, 12);
xf1_real = fi(real(xf1), 1, 16, 12);
xf1_imag = fi(imag(xf1), 1, 16, 12);
xf2_real = fi(real(xf2), 1, 16, 12);
xf2_imag = fi(imag(xf2), 1, 16, 12);
xf3_real = fi(real(xf3), 1, 16, 12);
xf3_imag = fi(imag(xf3), 1, 16, 12);
xf4_real = fi(real(xf4), 1, 16, 12);
xf4_imag = fi(imag(xf4), 1, 16, 12);
xf5_real = fi(real(xf5), 1, 16, 12);
xf5_imag = fi(imag(xf5), 1, 16, 12);
xf6_real = fi(real(xf6), 1, 16, 12);
xf6_imag = fi(imag(xf6), 1, 16, 12);
xf7_real = fi(real(xf7), 1, 16, 12);
xf7_imag = fi(imag(xf7), 1, 16, 12);
% Display Result
xf0_hex = dec2hex(bin2dec(strcat(xf0_real.bin,xf0_imag.bin)))
xf1_hex = dec2hex(bin2dec(strcat(xf1_real.bin,xf1_imag.bin)))
xf2_hex = dec2hex(bin2dec(strcat(xf2_real.bin,xf2_imag.bin)))
xf3_hex = dec2hex(bin2dec(strcat(xf3_real.bin,xf3_imag.bin)))
xf4_hex = dec2hex(bin2dec(strcat(xf4_real.bin,xf4_imag.bin)))
xf5_hex = dec2hex(bin2dec(strcat(xf5_real.bin,xf5_imag.bin)))
xf6_hex = dec2hex(bin2dec(strcat(xf6_real.bin,xf6_imag.bin)))
xf7_hex = dec2hex(bin2dec(strcat(xf7_real.bin,xf7_imag.bin)))
