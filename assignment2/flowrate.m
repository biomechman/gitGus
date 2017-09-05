function flowrate()
    fr = input('Enter the flow in m^3/s: ');
    fprintf('A flow rate of %.3f meters per sec\nis equivalent to %.3f feet per sec\n',fr, fr/.028)
end
