clc; clear; close all;
figure; hold on;

%plot circle
rad = 5;
rectangle('Position',[-rad,-rad,2*rad,2*rad],'Curvature',[1 1])
xlim([-rad,rad])
ylim([-rad,rad])
grid on
drawnow
ax = gca;

num_steps = 10;
pts = zeros(num_steps,2);
for i = 1:num_steps
    scatter(pts(i,1),pts(i,2),'r')
    F(3*(i-1)+1) = getframe;
    w = mvnrnd([0,0],eye(2));
    w = w./norm(w); %normalize
    [i1,i2] = find_intersections(pts(i,:),w,rad/100,rad);
    r = rand();
    pts(i+1,:) = r*i2 + (1-r)*i1;
    scatter(i1(1),i1(2),'g')
    scatter(i2(1),i2(2),'g')
    F(3*(i-1)+2) = getframe;
    plot([i1(1),i2(1)],[i1(2),i2(2)],'b-')
    F(3*(i-1)+3) = getframe(gca);
end
figure
movie(F,10,4)

function [i1,i2] = find_intersections(pt,w,e,rad)
% pt: Starting point
% w: direction of line to intersect with convex boundary
% e: epsilon, the tolerance of distance from intersection points to boundary
% output: two points where the line intersects a circle with radius "rad" 
    n = (0:.001:10)'*w;
    a = vecnorm(pt+n,2,2);
    b = vecnorm(pt-n,2,2);
    if(any((a >= rad-e) .* (a <= rad + e)))
        i1 = pt + n(find((a >= rad-e) .* (a <= rad + e),1),:);
    else
        error('try increasing tolerance')
    end
    if(any((b >= rad-e) .* (b <= rad + e)))
        i2 = pt - n(find((b >= rad-e) .* (b <= rad + e),1),:);
    else
        error('try increasing tolerance')
    end
end