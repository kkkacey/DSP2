clear;

load ecg_signal.txt
load ecg_noisy_1.txt
load ecg_noisy_2.txt
cs=ecg_signal;
ns1=ecg_noisy_1;
ns2=ecg_noisy_2;

level=3;
thold=0.4;

% Haar Transform
figure;
CA=ns1;
HTrans=cell(level+1,1);
for i=1:level
    [CA,CD]=dwt(CA,'db1');
    HTrans{level-i+2}=CD;
end
HTrans{1}=CA;
for i=1:level+1
    subplot(level+1,1,i)
    stem(HTrans{i},'.');
    hold;plot([1,length(HTrans{i})],[thold,thold],'r');plot([1,length(HTrans{i})],[-thold,-thold],'r');
end

% Daubichies Transform
figure;
CA=ns1;
DTrans=cell(level+1,1);
for i=1:level
    [CA,CD]=dwt(CA,'db2');
    DTrans{level-i+2}=CD;
end
DTrans{1}=CA;
for i=1:level+1
    subplot(level+1,1,i)
    stem(DTrans{i},'.');
    hold;plot([1,length(DTrans{i})],[thold,thold],'r');plot([1,length(DTrans{i})],[-thold,-thold],'r');
end

% noise reduction(hard thresholding)
%   Haar
for i=2:level+1
    for n=1:length(HTrans{i})
        if HTrans{i}(n)<thold
            HTrans{i}(n)=0;
        end
    end
end
% figure;
% for i=1:level+1
%     subplot(level+1,1,i)
%     stem(HTrans{i},'.');
%     hold;plot([1,length(HTrans{i})],[thold,thold],'r');plot([1,length(HTrans{i})],[-thold,-thold],'r');
% end
figure;
so=HTrans{1};
for i=2:level+1
    so=idwt(so,HTrans{i},'db1');
end
subplot(3,1,1)
plot(so);title('noise reduction in Haar Transform')
subplot(3,1,2)
plot(cs);title('original signal')
subplot(3,1,3)
plot(ns1);title('original noisy signal')

%   Daubichies
for i=2:level+1
    for n=1:length(DTrans{i})
        if DTrans{i}(n)<thold
            DTrans{i}(n)=0;
        end
    end
end
% figure;
% for i=1:level+1
%     subplot(level+1,1,i)
%     stem(DTrans{i},'.');
%     hold;plot([1,length(DTrans{i})],[thold,thold],'r');plot([1,length(DTrans{i})],[-thold,-thold],'r');
% end
figure;
so=DTrans{1};
for i=2:level+1
    so=idwt(so,DTrans{i},'db2');
end
subplot(3,1,1)
plot(so);title('noise reduction in Daubichies Transform')
subplot(3,1,2)
plot(cs);title('original signal')
subplot(3,1,3)
plot(ns1);title('original noisy signal')

