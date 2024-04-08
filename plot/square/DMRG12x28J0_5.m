dataD8000 =[   2 0.08139
3 0.03908
4 0.02131
5 0.01179
6 0.00753
7 0.00464
8 0.00315
9 0.00206
10 0.00144
11 0.000961504
12 0.00068351
13 0.000459829
14 0.000332772
15 0.000221971
16 0.000164639
17 0.000107337
18 8.26518e-005
19 5.16351e-005
20 4.21139e-005
21 2.44076e-005
22 2.17882e-005
23 1.10399e-005
24 1.20086e-005];

dataD10000=[ 1 0.26325
2 0.0819
3 0.04
4 0.022
5 0.01238
6 0.00801
7 0.00502
8 0.00346
9 0.0023
10 0.00163
11 0.00111
12 0.000804766
13 0.000551058
14 0.000406124
15 0.000275813
16 0.000208286
17 0.000138319
18 0.000108347
19 6.8995e-005
20 5.71512e-005
21 3.38121e-005
22 3.05916e-005
23 1.5831e-005
24 1.73814e-005];

dataD12000 = [2 0.08225
3 0.04065
4 0.02249
5 0.0128
6 0.00837
7 0.00529
8 0.00369
9 0.00248
10 0.00178
11 0.00123
12 0.000900112
13 0.000624988
14 0.000467671
15 0.000322786
16 0.000247652
17 0.000167141
18 0.000132926
19 8.6105e-005
20 7.22985e-005
21 4.35193e-005
22 3.98302e-005
23 2.09472e-005
24 2.31629e-005];
semilogy(dataD8000(:,1), dataD8000(:,2),'o');hold on;
semilogy(dataD10000(:,1), dataD10000(:,2),'^');hold on;
semilogy(dataD12000(:,1), dataD12000(:,2),'^');hold on;

set(gca,'fontsize',24);
set(gca,'linewidth',1.5);
set(get(gca,'Children'),'linewidth',2); % Set line width 1.5 pounds
xlabel('$\Delta x$','Interpreter','latex');
ylabel('$|\langle \bf S_i \cdot \bf S_j\rangle|$','Interpreter','latex');
set(get(gca,'XLabel'),'FontSize',24);
set(get(gca,'YLabel'),'FontSize',24);

l =legend('PEPS $D=8$','$SU(2)$ DMRG $D=8000$', '$SU(2)$ DMRG $D=10000$', '$SU(2)$ DMRG $D=12000$');
set(l,'Box','off');set(l,'Interpreter','latex');
set(l,'Fontsize',24);
set(l,'Location','SouthWest');
set(l,'Location', 'best');
xlim([0,14]);
