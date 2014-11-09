function turbidity = findTurbidity(image)
%Finds the turbidity of a given image, by solving the non-linear least
%squares problem comparing it to a clear sky image 




end


function Skymodel = getSkyModel(image,theta,phi,t)
%Sky Model = M X N X 3 (same as image)




end

function result = regularizedFit(x,xc,image,theta,phi,w)
%image is M X N X 3 array of pixels
%w is MXN array of weights
%x and xc are 1x4 arrays of parameters

%Parameters
beta = 0.05

[imgHeight,imgWidth] = size(image);
result = 0; 
G = getSkyModel(image,theta,phi,x(1));

%First we find our sum of squares
for k = 1 : 3
    for i = imgHeight
        for j = imgWidth
            result = result + w(i,j)* ...
                (image(i,j,k) - x(k+1)*G(i,j,k))^2;
        end
    end
end

%Now we add the regularization term
result = result + beta*norm(x-xc)^2;
end