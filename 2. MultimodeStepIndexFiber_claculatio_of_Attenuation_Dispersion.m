clc;
clear all;
close all;
format long;
wl=1:0.05:2;
wl1=wl*1e-6;
vc=299792458;
w=2*pi*(vc./wl1);
 Wavelength=wl*1e-6;
Fresult={'ofc_y.txt', 'ofc_x.txt'};
 
for i=1:2
    [neff,beta,alpha,alphadB]=textread(Fresult{i},....
        '%f %f %f %f');
   neffr(i,:)=neff;
   betar(i,:)=beta;
   alphar(i,:)=alpha;
   alphadBr(i,:)=alphadB;
   
   b1=diff(betar(i,:))./diff(w);
   Dispersion(i,:)=((diff(b1)./diff(wl1(1:end-1))));
   
end
figure(1)
plot(wl1*1e6,neffr(1,:),'-r',wl1*1e6,neffr(2,:),'-b');
legend('y-mode','x-mode','Location','best');
xlabel('Wavelenght(\mu m)');
ylabel('Effective Index');
title('Effective Index vs wavelength');
 
figure(2)
plot(wl1*1e6,betar(1,:),'-r',wl1*1e6,betar(2,:),'k');
legend('y-mode','x-mode','Location','best');
xlabel('Wavelenght(\mu m)');
ylabel('beta');
title('beta vs wavelength');
 
figure(3)

plot(wl*1e6,alphadBr(1,:),'-r',wl*1e6,alphadBr(2,:),'k');
legend('y-mode','x-mode','Location','best');
xlabel('Wavelenght(\mu m)');
ylabel('alphadB');
title('alphadB vs wavelength');
 
figure(4)
plot(wl1(1:end-2)*1e6,Dispersion(1,:),'-r',wl1(1:end-2)*1e6,Dispersion(2,:),'k');
legend('y-mode','x-mode','Location','best');
xlabel('Wavelenght(\mu m)');
ylabel('Dispersion');
title('Dispersion vs wavelength');
 

