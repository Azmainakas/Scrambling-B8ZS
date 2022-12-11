% inputData = [1 0 0 0 0 0 0 0 0 0 0 1 1 0 0 1 1]
inputData = [1 1 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0]

count = 0
j = 0
backCount = 0
outMat = zeros(1, length(inputData))
for i = 1:length(inputData)
    if inputData(i) == 0
        count = count + 1
        backCount = i - 8
    else
        j = j + 1
        count = 0
%         result(i) = inputData(i)
        if mod(j,2)==0
            outMat(i)=-1
        else
            outMat(i)=+1
        end
%         outMat(i) = inputData(i)
    end
    if count == 8 && outMat(i-8) == 1
%             result(backCount:backCount+8) = [1 0 0 0 1 -1 0 -1 1]
            outMat(backCount:backCount+8) = [1 0 0 0 1 -1 0 -1 1]
        elseif count == 8 && outMat(i-8) == -1
%             result(backCount:backCount+8) = [-1 0 0 0 -1 1 0 1 -1]
            outMat(backCount:backCount+8) = [-1 0 0 0 -1 1 0 1 -1]
        end
end
resultFinal = outMat
if resultFinal(end) == 1
    resultFinal(1, end+1) = 1
elseif resultFinal(end) == -1
    resultFinal(1, end+1) = -1
else
    resultFinal(1, end+1) = 0
end
stairs(resultFinal, 'LineWidth', 2);
line(xlim(),[0,0],'LineWidth', 0.1, 'Color', 'k')
xline(2,'--','LineWidth',1);
xline(3,'--','LineWidth',1);
xline(4,'--','LineWidth',1);
xline(5,'--','LineWidth',1);
xline(6,'--','LineWidth',1);
xline(7,'--','LineWidth',1);
xline(8,'--','LineWidth',1);
xline(9,'--','LineWidth',1);
for k = 1:length(inputData)
    text(k+0.5,1.2,num2str(inputData(k)))
    text(k+0.5,-1.2,num2str(outMat(k)))
end
axis([1 length(resultFinal) -2 2])
grid on
