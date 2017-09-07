
%% Chapter 1 Exercises

% 1.)

weightCu = 63.55

% 2.)

myage = 31
myage = myage - 2
myage = myage + 1

% 3.)

namelengthmax

% 4.)

weightLbs = 1.0
weightOz = 16.0
who
whos
clear weightLbs
who
whos

% 5.)

intmin('uint32')
intmax('uint32')

intmin('uint64')
intmax('uint64')

% 6.)

decimalNum = 10.1
decimalNumInt32 = int32(decimalNum)

% 11.)

pounds = 134.5
kilos = pounds * 2.2

% 12.)

ftemp = -10 % Stores the approximate heart temperature of my ex (in Farenheit).
ctemp = (ftemp - 32)*5/9

% 13.)

liters = 1.5
flOz = liters * 33.814

% 14.)

sind(90)
sin(pi/2)

% 15.)

R1 = 1
R2 = 1
R3 = 1

RT = 1/(1/R1 + 1/R2 + 1/R3)

% 22.)

double('a')
double('A')
fprintf('Capitalized letters come first.\n')

% 24.)

logical 1
logical 1
logical 1
logical 0

% 25.)

x = 3
y = 9

xor(x > 5, y < 10)
    
% 26.)

3*10^5 == 3e5

% 27.)

log10(10000) == 4

%% Chapter 2 Exercises

% 1.)

[2:7]
[1.1:.2:1.7]
[8:-2:4]

% 2.)

linspace(0,2*pi,50)

% 3.)

linspace(2,3,6)

% 4.)

[-5:1:-1]
linspace(-5,-1,5)
[5:2:9]
linspace(5,9,3)
[8:-2:4]
linspace(8,4,3)

% 6.)

[-1:.5:1]'

% 7.)

vector(rem(vector,2) == 1)

% 8.)

mat = [7:10; 12:-2:6]
mat(1,3)
mat(2,:)
mat(:,1:2)

% 9.)

clear mat
mat = ones(2,4)
size(mat,1)*size(mat,2)
size(mat,1)*size(mat,2) == 2*4

% 10.)

mat = ones(2,4)
mat(1,:) = [1:4]
mat(2,:) = [-4:-1]

% 12.)

rows = randi(5)
cols = randi(5)
zed = zeros(rows,cols)

% 23.)

sum([3:2:11])

% 26.)

num = 3:2:9
den = 1:4
sum(num./den)

% 30.)

v = randi([-10,10],10)
v = v-3
positive = sum(v > 0)
vAbs = abs(v)
maximum = max(v) % for the original vector
maximum = max(vAbs) % for the absolute value transformed vector

% 31.)

ma = randi([-10, 10],3,5)
maxRow = max(ma,[],2)
maxColumn = max(ma)
maxma = max(ma(:))

%% Chapter 3 Exercises

% 1.)

Ri = 1
Ro = 2
vol = (4*pi/3)*(Ro^3 - (Ri^3))

% 4.)

mat = input('Enter a matrix (e.g. [1:3;4:6]): ')

% 6.)
num = 12345.6789;
fprintf('%f\n',num)
fprintf('%10.4f\n',num)
fprintf('%10.2f\n',num)
fprintf('%6.4f\n',num)
fprintf('%2.4f\n',num)

% 8.)

function flowrate()
    fr = input('Enter the flow in m^3/s: ');
    fprintf('A flow rate of %.3f meters per sec\nis equivalent to %.3f feet per sec\n',fr, fr/.028)
end

% 13.)

function unitVec()
    v = input('Enter the values for X, Y, and Z in the following format "[X,Y,Z]": ');
    u = v./sqrt(v(1)^2 + v(2)^2 + v(3)^2);
    fprintf('The unit vector for <%.4f, %.4f, %.4f> is <%.4f, %.4f, %.4f>\n.', v(1), v(2), v(3), u(1), u(2), u(3))
end
