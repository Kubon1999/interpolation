clear
Index = 175634;
N0 = 4;
N1 = mod(N0-1,4)+1;
K = [4, 8, 14, 38];
[XX,YY]=meshgrid(linspace(0,100,101),linspace(0,100,101));
for i= K
  [x,y,f,xp,yp] = lazik(i);

  subplot(2,2,1)
  plot(xp,yp,'-o','linewidth',3 , 'markersize', 2.5);
  title(strcat("Tor poruszania się łazika - K: ", num2str(i)));
  xlabel("x [KM]");
  ylabel("y [KM]");
  
  subplot(2,2,2);
  plot3(x,y,f,'o', 'markersize', 4);
  title(strcat("Wartości próbek - K: ", num2str(i)));
  xlabel("x [KM]");
  ylabel("y [KM]");
  zlabel("F(x,y)");
  
  subplot(2,2,3);
  [p] = polyfit2d(x,y,f);
  [FF]=polyval2d(XX,YY,p);
  surf(XX,YY,FF);
  shading flat;

  title(strcat("Interpolacja wielomianowa - K: ", num2str(i)));
  xlabel("x [KM]");
  ylabel("y [KM]");
  zlabel("F(x,y)");
  
  [p] = trygfit2d(x,y,f);
  [FF]=trygval2d(XX,YY,p);
  subplot(2,2,4);
  surf(XX,YY,FF);
  shading flat;

  title(strcat("Interpolacja trygonometryczna - K: ", num2str(i)));
  xlabel("x [KM]");
  ylabel("y [KM]");
  zlabel("F(x,y)");
  
  print (gcf, strcat("Zad1_K_", num2str(i), ".png"), '-dpng')

end