clear
Index = 175634;
N0 = 4;
N1 = mod(N0-1,4)+1;

poly_div = [];
tryg_div = [];

for i = 5:45
  [XX,YY]=meshgrid(linspace(0,100,101),linspace(0,100,101));
  [x,y,f,xp, yp] = lazik(i);

  [p] = polyfit2d(x,y,f);
  [poly_FF]=polyval2d(XX,YY,p);

  [p] = trygfit2d(x,y,f);
  [tryg_FF]=trygval2d(XX,YY,p);
  
  if i == 5
    prev_poly_FF = poly_FF;
    prev_tryg_FF = tryg_FF;
  else
    poly_div = [poly_div, max(max(abs(poly_FF-prev_poly_FF)))];
    tryg_div = [tryg_div, max(max(abs(tryg_FF-prev_tryg_FF)))];
    prev_poly_FF = poly_FF;
    prev_tryg_FF = tryg_FF;
  end
end

plot(6:45, poly_div);
title("Zbieżność interpolacji wielomianowej");
xlabel("Ilość punktów pomiarowych --- K");
ylabel("Maks. wart. różnicy interpolowanych funkcji");
print (gcf, strcat("Zad2_Zbieznosc_interpolacji_wielomianowej.png"), '-dpng');

plot(6:45, tryg_div);
title("Zbieżność interpolacji trygonometrycznej");
xlabel("Ilość punktów pomiarowych --- K");
ylabel("Maks. wart. różnicy interpolowanych funkcji");
print (gcf, strcat("Zad2_Zbieznosc_interpolacji_tryg.png"), '-dpng');
