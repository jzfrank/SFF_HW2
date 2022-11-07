f1(f2)

function res = f2()
    res = rand;
end

function res = f1(f2)
    res = f2();
end