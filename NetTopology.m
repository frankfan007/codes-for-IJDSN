% clc,clear
Nc = 10; % ����90��ͨ�Žڵ㣬���ѡ��10����֪�ڵ㣻
[E,posSensor,SenNode] = getConnectivitySparse(Nc);
posSenNode = posSensor(:,SenNode); % ��֪�ڵ��λ�ã�
posComNode = posSensor;
posComNode(:,SenNode) = [];  % ȥ����֪�ڵ��λ��,ʣ��ͨ�Žڵ��λ�ã�

figure
hold on;
for i = 1:Nc-1
    for j = i+1:Nc
        if E(i,j)
            plot(posSensor(1,[i,j]),posSensor(2,[i,j]),'b-');
        end
    end
end

plot(posSenNode(1,:),posSenNode(2,:),'^','MarkerFaceColor',[1,0,0],'MarkerEdgeColor',[0,0,0]);
plot(posComNode(1,:),posComNode(2,:),'sk');
h1 = plot(-5000,-5000,'^','MarkerFaceColor',[1,0,0],'MarkerEdgeColor',[0,0,0]);
h2 = plot(-5000,-5000,'sk');
h3 = plot([-5000,-6000],[-5000,-6000],'b-');
axis([-4000,4000,-4000,4000]);
legend([h1,h2,h3],'Sensor Nodes','Communication Nodes','Communication Link');