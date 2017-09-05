function unitVec()
    v = input('Enter the values for X, Y, and Z in the following format "[X,Y,Z]": ');
    u = v./sqrt(v(1)^2 + v(2)^2 + v(3)^2);
    fprintf('The unit vector for <%.4f, %.4f, %.4f> is <%.4f, %.4f, %.4f>\n.', v(1), v(2), v(3), u(1), u(2), u(3))
end
