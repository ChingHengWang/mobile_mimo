ud_0001_1_amp1 = in.Data;w_0001_1_amp1 = out.Data;


%in = [vol_in_005_10.Data];out = [linear_v_005_10.Data];
%in = [vol_in_001_01.Data];out = [linear_v_001_01.Data];
IN = [ud_0001_1_amp1];OUT = [w_0001_1_amp1];
Ts=0.02;
Fs=1/Ts;
y=fft(OUT);
x=fft(IN);
h=y./x;
m=20*log10(abs(h));
p=angle(h)*180/pi;
f = (0:length(h)-1)*Fs/length(h);
%f = ((0:length(h)-1)/length(h))*100 +0.05;
figure;
subplot(2,1,1)
semilogx(f,m)
title('Magnitude')
grid on

subplot(2,1,2)
semilogx(f,p)
title('Phase')
grid on