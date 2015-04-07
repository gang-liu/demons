M = ones(256,256,256);
M(1:10:256,:,:) = 0;
M(:,1:10:256,:) = 0;
M(:,:,1:10:256) = 0;

figure;imshow(M(:,:,127)); 

def_x_temp = randn(256*256*256,1)*10; 
def_y_temp = randn(256*256*256,1)*10;
def_z_temp = randn(256*256*256,1)*10;


def_x = zeros(256,256,256);
def_y = zeros(256,256,256);
def_z = zeros(256,256,256);

[N,X] =hist(def_x_temp,20); % I can distribte the 256 256 256 point to def_x
figure;plot(X,N/(256*256*256));

def_x(:) = def_x_temp; 
def_y(:) = def_y_temp; 
def_z(:) = def_z_temp; 

 [sx,sy,sz] = expfield(def_x,def_y,def_z);  % deformation field
 Mp = iminterpolate(M,def_x,def_y,def_z);
IMp = iminterpolate(M,sx,sy,sz);
figure;imshow(IMp(:,:,127)); 
figure;imshow(Mp(:,:,127)); 
sum(N)

figure;imagesc(def_x(:,:,128)*256);

