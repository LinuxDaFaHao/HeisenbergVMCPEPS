e0D8=[-82.03496291, -81.89328610, -81.72985196, -81.87593464, -81.91994767, -81.94854546, -81.96776235, -81.98130512, -81.99068962, -81.99032571, -82.00979211, -81.99524703, -82.01573015, -82.01137906, -82.02208827, -82.02550178, -82.02487136, -82.03243577, -82.03488748, -82.03472566, -82.04393498, -82.02992805, -82.04254445, -82.04308069, -82.05339256, -82.03848862, -82.04802953, -82.05923634, -82.06211603, -82.04225070, -82.04947195, -82.05713468, -82.07071413, -82.07626396, -82.07328963, -82.07207495, -82.07912691, -82.08612838, -82.08646264, -82.08136615, -82.08767503, -82.08781033, -82.07049913, -82.09380423, -82.09666653, -82.08309535, -82.08952325, -82.08693912, -82.08884191, -82.09273296, -82.08809097, -82.09369396, -82.09368290, -82.09627742, -82.09276665, -82.09113315, -82.10576376, -82.10533722, -82.10870465, -82.10922403, -82.09876161, -82.10979948, -82.10303863, -82.10939671, -82.11308419, -82.11807887, -82.11125923, -82.11013951, -82.11999679, -82.11797052, -82.11605963, -82.11803674, -82.11922244, -82.12109987, -82.12291957, -82.12066340, -82.12371423, -82.12536163, -82.12122664, -82.12855258, -82.13249147, -82.13005751, -82.12846493, -82.13982163, -82.13410613, -82.13589020, -82.13671577, -82.13920752, -82.14112857, -82.13922572, -82.14197342, -82.14040015, -82.13794068, -82.14144261, -82.14429061, -82.13796110, -82.15520650, -82.14867283, -82.14050187, -82.14564988, -82.14963480];
e0D8iPEPS=[-72.75093620, -74.27068350, -74.86615936, -75.72893621, -76.32255594, -76.79077959, -77.17160438, -77.50230657, -77.77750575, -78.03101299, -78.25452627, -78.45993225, -78.63866680, -78.81657523, -79.00741085, -79.19457052, -79.33346582, -79.44851889, -79.58644873, -79.71998715, -79.84157155, -79.90917357, -80.04004848, -80.11448078, -80.17074070, -80.24939694, -80.32874772, -80.38710430, -80.42014978, -80.46378826, -80.51217110, -80.59515643, -80.61588399, -80.64115281, -80.69919150, -80.72732082, -80.75249478, -80.78344926, -80.80966932, -80.85188564, -80.88310462, -80.90744238, -80.90403180, -80.93149296, -80.98221062, -81.00461407, -81.01285578, -81.06560396, -81.08293202, -81.09092420, -81.12178838, -81.13573770, -81.16417866, -81.18993779, -81.20457284, -81.23264011, -81.23490666, -81.27486355, -81.29374828, -81.32062644, -81.34494744, -81.36836594, -81.38780650, -81.39794719, -81.42573211, -81.44535483, -81.44678220, -81.46360005, -81.48677602, -81.49317118, -81.49952645, -81.53924840, -81.55307517, -81.55417850, -81.57429465, -81.55620909, -81.57899550, -81.61597264, -81.61786157, -81.63161869, -81.63328274, -81.65785261, -81.66136668, -81.66250564, -81.67011542, -81.68889717, -81.69696394, -81.68358370, -81.72470242, -81.70119790];
e0D10=[];

h0=plot(e0D8([1:end]), 'o','LineWidth', 2); hold on;
h0=plot(e0D8iPEPS([1:end]), 'o','LineWidth', 2); hold on;

% h0=plot(e0D10([1,3:end]), 'o','LineWidth', 2); hold on;
% 
% T=text(200,0.03,['$4\times 4$, PEPS $D=8$', char(10),...
%                 'Boundary MPSe0D8iPEPS $\chi=24$', char(10),...
%                 'Typical step length $\alpha = 0.2$', char(10),...
%                 'Typical Samples = 56 chains $\times 2000$.']);
% set(T,'Interpreter','latex');
% set(T,'Fontsize',18);

% 
% l=legend([h0, h1, h2,h3, h4,h5], {'SR, $D=8$', 'Gradient, $D=8$', ...
%     'Gradient, $D=8, \alpha = 0.01$', 'SR, $D=10, \alpha = 0.2$', ...
%     'SR, $D=10$', ... %$\alpha=0.3$ for initial and final stage, varies in middle stage
%     'SR, $D=12$'});
% set(l,'Box','off');set(l,'Interpreter','latex');
% set(l,'Fontsize',18);
% set(l,'Location','NorthEast');

xlabel('Iteration','Interpreter','latex')
% ylabel('Persite energy $e_0$','Interpreter','latex')
ylabel('energy relative error','Interpreter','latex')
set(gca,'fontsize',24);
set(gca,'linewidth',1.5);
set(get(gca,'Children'),'linewidth',2); % Set line width 1.5 pounds
set(get(gca,'XLabel'),'FontSize',24);
set(get(gca,'YLabel'),'FontSize',24);
set(gcf, 'position',  [100, 100, 1300, 600]);
hold off;

figure_directory = './';
figure_name_eps = 'EnergyDecreasingKagome6x6.eps';
figure_path = fullfile(figure_directory, figure_name_eps);
saveas(gcf, figure_path, 'epsc');
disp(['Energy deceasing of the heisenberg model: ', figure_path]);