%% Моделирование вращения НС Земли  

clear all
clc
n=10;
% dTheta = 1/n;

% backside color
 space_color = 'black';
%space_color = 'white';
 %h = figure ('Position',[1 37 1920 1080]);
 h = figure (800)

set(h,'Color', space_color);

 earth = imread('1024px-Land_ocean_ice_2048.jpg');
  %earth = imread('cloud_combined_2048.jpg');

image(earth)    % display Earth image
axis image

clouds = imread('cloud_combined_2048.jpg');
image(earth)
axis image
hold on

im = image(clouds);
im.AlphaData = max(clouds,[],3);    % set transparency to maximum cloud value
hold off

[px,py,pz] = sphere(5000);                % generate coordinates for a 50 x 50 sphere

cla
sEarth = surface(py, px ,flip(pz));   
sEarth.FaceColor = 'texturemap';        % set color to texture mapping
sEarth.EdgeColor = 'none';              % remove surface edge color
sEarth.CData = earth;                   % set color data 

hold on
sCloud = surface(px*1.02,py*1.02,flip(pz)*1.02); 

sCloud.FaceColor = 'texturemap';        % set color to texture mapping
sCloud.EdgeColor = 'none';              % remove surface edge color
sCloud.CData = clouds;                  % set color data 
 
sCloud.FaceAlpha = 'texturemap';        % set transparency to texture mapping
sCloud.AlphaData = max(clouds,[],3);    % set transparency data 

hold off



 daspect([1 1 1])                        % set aspect ratio
 axis off tight                          % remove axis and set limits to data range

                           
axis vis3d
% a_degree=deg2rad(-360); % диапазон вращения с минимальной точки 
% b_degree=deg2rad(0); % диапазон вращения до максимальной точки
hPan =tan(-6.29:0.01:6.29);             %Вращение НС вокруг ЦМ по горизонтальной оси/ sin(-6.29:0.01:6.29);
% hPan = rad2deg (hPan);

% c_degree=deg2rad(-180); % диапазон вращения с минимальной точки 
% d_degree=deg2rad(0); % диапазон вращения до максимальной точки
vPan =  csc(-6.29:0.01:6.29);           %Вращение НС вокруг ЦМ по вертикальной оси/ cos(-6.29:0.01:6.29);
% vPan = rad2deg(vPan);

for i=1:length(vPan) %i= 1:0.1:5 %
    
     for k = 1:length(hPan)
        view([k i])                      % specify viewpoint // view([k i]) колебание
%     campan(dTheta*1, k,'data',[5 2 1]); % [5 2 1] moving dot of coordinate// 4.1, where -3.5 it's -90, 3.5=90
    
        campan(hPan(k), vPan(k),'data',[0 0 k]); % [i i i] для случая колебания и врашения [0 0 k]
        view_angle=deg2rad(175); % zooming // отвечает за уол обзора кадра камеры-запись в градусах и сам переводит, где -n..0..N
        camva(view_angle);
        pause(0.078);

    end 

end
 


%% Вращение Земли в видимом диапазоне

clear all
clc
n=10;
dTheta = 1/n;

% backside color
space_color = 'black';
% h = figure ('Position',[1 37 1920 1080]);
h = figure (800)

set(h,'Color', space_color);

earth = imread('1024px-Land_ocean_ice_2048.jpg');
% earth = imread('terminator.jpg');

image(earth)    % display Earth image
axis image

clouds = imread('cloud_combined_2048.jpg');
image(earth)
axis image
hold on

im = image(clouds);
im.AlphaData = max(clouds,[],3);    % set transparency to maximum cloud value
hold off

[px,py,pz] = sphere(50);                % generate coordinates for a 50 x 50 sphere

cla
sEarth = surface(py, px ,flip(pz));   
sEarth.FaceColor = 'texturemap';        % set color to texture mapping
sEarth.EdgeColor = 'none';              % remove surface edge color
sEarth.CData = earth;                   % set color data 

hold on
sCloud = surface(px*1.02,py*1.02,flip(pz)*1.02); 

sCloud.FaceColor = 'texturemap';        % set color to texture mapping
sCloud.EdgeColor = 'none';              % remove surface edge color
sCloud.CData = clouds;                  % set color data 
 
sCloud.FaceAlpha = 'texturemap';        % set transparency to texture mapping
sCloud.AlphaData = max(clouds,[],3);    % set transparency data 

hold off



 daspect([1 1 1])                        % set aspect ratio
 axis off tight                          % remove axis and set limits to data range

                           
axis vis3d

for i=1:0.01:360 
    view([0 i]) % specify viewpoint
    campan(dTheta*1, 4.1,'data',[5 2 1]); % [5 2 1] moving dot of coordinate// 4.1, where -3.5 it's -90, 3.5=90
    
    view_angle=3.5; % zooming// отвечает за уол обзора кадра
    camva(view_angle);
    pause(0.01); % влияет на скоротсь кадра
  
%     ax = gca;
%     ax.Interactions = zoomInteraction('Dimensions','x');
%     ax.Interactions = [panInteraction dataTipInteraction]
    
end
    
    
%% Вращение Земли в ИК диапазоне 

clear all
clc
n=10;
dTheta = 1/n;

% backside color
% space_color = 'white';
space_color = 'black';
h = figure (800);
% h = figure ('Position',[1 35 1920 1080]);
set(h,'Color', space_color);

% earth = imread('ik.jpg'); В ИК диапазоне
earth = imread('1024px-Land_ocean_ice_2048.jpg');
image(earth)    % display Earth image
axis image

clouds = imread('cloud_combined_2048.jpg');
image(earth)
axis image
hold on

im = image(clouds);
im.AlphaData = max(clouds,[],3);    % set transparency to maximum cloud value
hold off

[px,py,pz] = sphere(50);                % generate coordinates for a 50 x 50 sphere

cla
sEarth = surface(py, px ,flip(pz));   
sEarth.FaceColor = 'texturemap';        % set color to texture mapping
sEarth.EdgeColor = 'none';              % remove surface edge color
sEarth.CData = earth;                   % set color data 

hold on
sCloud = surface(px*1.02,py*1.02,flip(pz)*1.02); 

sCloud.FaceColor = 'texturemap';        % set color to texture mapping
sCloud.EdgeColor = 'none';              % remove surface edge color
sCloud.CData = clouds;                  % set color data 
 
sCloud.FaceAlpha = 'texturemap';        % set transparency to texture mapping
sCloud.AlphaData = max(clouds,[],3);    % set transparency data 

hold off



 daspect([1 1 1])                        % set aspect ratio
 axis off tight                          % remove axis and set limits to data range

                           
axis vis3d

for i=1:0.01:2700   
    view([i 360]) % specify viewpoint 
    campan(dTheta*0, 10.0,'data',[0 0 0]); % [2 1 4] moving dot of coordinate// 3.5, where -3.5 it's -90, 3.5=90
    view_angle=deg2rad(360); % zooming // отвечает за уол обзора кадра камеры-запись в градусах и сам переводит, где -n..0..N
    camva(view_angle);
    pause(0.01);
end

