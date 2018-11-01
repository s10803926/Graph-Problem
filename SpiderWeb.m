clear all
close all

fileID = fopen('input1.txt','r');
formatSpec='%d %d %s ';
C=textscan(fileID,formatSpec); %reading the values from input
file
fclose(fileID);
a=double(C{1});
b=double(C{2});
%variable declaration
j=1;storeS=[];storeE=[];storeSW=[];g=[];f=[];h=[];listE=[];lists
outh=[];
k=1;E={};E1={};SW1={};sum=0;East={};
gSW=[];fSW=[];SW={};SE={};storeSE=[];gSE=[];fSE=[];gE=[];fE=[];S
={};S1={};
%reading all nodes connected in East direction
for i=1:118
if C{3}{i}=='E'
storeE=[storeE,i];
gE=[gE,a(i,1)];
fE=[fE,b(i,1)];
end
end
startE=[1,20,33,52,66,74,82];
for r=1:7
if r==1
hE=find(fE==startE(r));
else
hE=find(gE==startE(r));
listE=[];
end
for i=1:12
listE=[listE,hE];
if (fE(hE)==11 ||fE(hE)==28 ||fE(hE)==43 ||fE(hE)== 57
||fE(hE)==69||fE(hE)== 80||fE(hE)==91)
break
end
hE=find(gE==fE(hE));
end
E{1,1,r}=listE;
end
for Eno=1:7
for breadth=1:length(E{1,Eno})
E{1,Eno}(1,breadth)=fE(E{1,Eno}(1,breadth));

end
end
E{1,1}=[0 E{1,1}];
E{1,2}=[20 E{1,2}];
E{1,3}=[33 E{1,3}];
E{1,4}=[52 E{1,4}];
E{1,5}=[66 E{1,5}];
E{1,6}=[74 E{1,6}];
E{1,7}=[82 E{1,7}];
%applying the two conditions for the spider to move for the East
bound
%nodes
%1.moving in a straight line
%2.crossing two bugs each time
for Eno=1:7
for breadth=1:length(E{1,Eno})
if breadth+3 > length(E{1,Eno})
break
end
E1{1,Eno}(1,breadth)=(E{1,Eno}(1,breadth))+3;
end
end
for i=1:7
LE1=length(E1{i});
E{i}=E{i}(1:LE1);
end
%reading all nodes connected in south direction
for i=1:118
if C{3}{i}=='S'
storeS=[storeS,i];
% we have all the locations where South is located
% we generate a matrix with values of matrix 'a' corresponding
to south
% then we find the location of value of 'b' of the same location
in 'a'
% and we use the location to get the connecting node
% thus we generate a list of nodes connected in south
g=[g,a(i,1)];
f=[f,b(i,1)];
end
end %south
s=[1,3,10,11];
for r=1:4

h=find(g==s(r));
list=[];
%disp(h)
for i=1:12
list=[list,h];
if h==37 || h==41|| h==40||h==39
break
end
h=find(g==f(h));
end
S{1,1,r}=list;
end
for Sno=1:4
for breadth=1:length(S{1,Sno})
S{1,Sno}(1,breadth)=f(S{1,Sno}(1,breadth));
end
end
S{1,1}=[1 S{1,1}];
S{1,2}=[3 S{1,2}];
S{1,3}=[10 S{1,3}];
S{1,4}=[11 S{1,4}];
%applying the two conditions for the spider to move for the
south bound
%nodes
%1.moving in a straight line
%2.crossing two bugs each time
for Sno=1:4
for breadth=1:length(S{1,Sno})
if breadth+3 > length(S{1,Sno})
break
end
S1{Sno}(1,breadth)=(S{Sno}(1,(breadth+3)));
end
end
for i=1:4
LS1=length(S1{i});
S{i}=S{i}(1:LS1);
end
%reading all nodes connected in southwest direction
for i=1:118
if C{3}{i}=='SW'
storeSW=[storeSW,i];
% we have all the locations where SouthWEST is located

% we generate a matrix with values of matrix 'a' corresponding
to southWEST
% then we find the location of value of 'b' of the same location
in 'a'
% and we use the location to get the connecting node
% thus we generate a list of nodes connected in south
gSW=[gSW,a(i,1)];
fSW=[fSW,b(i,1)];
end
end %southwest
startSW=[3,28,49];
for r=1:3
hSW=find(gSW==startSW(r));
listSW=[];
%listSW=startSW(r);
%disp(h)
for i=1:6
listSW=[listSW,hSW];
if (fSW(hSW)==19 || fSW(hSW)==54 || fSW(hSW)==86)
break
end
hSW=find(gSW==fSW(hSW));
%disp(hSW);
end
SW{1,1,r}=listSW;
end
for SWno=1:3
for breadth=1:length(SW{1,SWno})
SW{1,SWno}(1,breadth)=fSW(SW{1,SWno}(1,breadth));
end
end
SW{1,1}=[3 SW{1,1}];
SW{1,2}=[28 SW{1,2}];
SW{1,3}=[49 SW{1,3}];
%applying the two conditions for the spider to move for the
southwest bound
%nodes
%1.moving in a straight line
%2.crossing two bugs each time
for SWno=1:3
for breadth=1:length(SW{1,SWno})
if breadth+3 > length(SW{1,SWno})
break
end
SW1{SWno}(1,breadth)=(SW{SWno}(1,(breadth+3)));

end
end
for i=1:3
LSW1=length(SW1{i});
SW{i}=SW{i}(1:LSW1);
end
%reading all nodes connected in southEast direction
for i=1:118
if C{3}{i}=='SE'
storeSE=[storeSE,i];
% we have all the locations where SouthWEST is located
% we generate a matrix with values of matrix 'a' corresponding
to southWEST
% then we find the location of value of 'b' of the same location
in 'a'
% and we use the location to get the connecting node
% thus we generate a list of nodes connected in south
gSE=[gSE,a(i,1)];
fSE=[fSE,b(i,1)];
end
end %southEast
startSE=[29,63];
for r=1:2
hSE=find(gSE==startSE(r));
listSE=[];
%listSW=startSW(r);
%disp(h)
for i=1:9
listSE=[listSE,hSE];
if (fSE(hSE)==85 || fSE(hSE)==89)
break
end
hSE=find(gSE==fSE(hSE));
%disp(hSW);
end
SE{1,1,r}=listSE;
end
for SEno=1:2
for breadth=1:length(SE{1,SEno})
SE{1,SEno}(1,breadth)=fSE(SE{1,SEno}(1,breadth));
end
end
SE{1,1}=[29 SE{1,1}];
SE{1,2}=[63 SE{1,2}];

%applying the two conditions for the spider to move for the
southEast bound
%nodes
%1.moving in a straight line
%2.crossing two bugs each time
for SEno=1:2
for breadth=1:length(SE{1,SEno})
if breadth+3 > length(SE{1,SEno})
break
end
SE1{SEno}(1,breadth)=(SE{SEno}(1,(breadth+3)));
end
end
for i=1:2
LSE1=length(SE1{i});
SE{i}=SE{i}(1:LSE1);
end
C =
horzcat(E{1},E{2},E{2},E{3},E{4},E{5},E{6},E{7},S{1},S{2},S{3},S
{4},...
SW{1},SW{2},SW{3},SE{1},SE{2});
C1=
horzcat(E1{1},E1{2},E1{2},E1{3},E1{4},E1{5},E1{6},E1{7},S1{1},S1
{2},...
S1{3},S1{4},SW1{1},SW1{2},SW1{3},SE1{1},SE1{2});
%concatinated all the lists of South,East,SouthWest,SouthEast
into a single
%list and added 1 to all the values of list since matlab doesnt
support
%entries less than 1.

for i=1:length(C)
CM(i)=C(i)+1;
CM1(i)=C1(i)+1;
end
m=horzcat(CM,CM1);
n=horzcat(CM1,CM);
dg=logical(sparse(m,n,1,93,93));
% generating a braph from the list of possible nodes

h= view(biograph(dg));
S=1;
T=93;
%then using Dijstras algorithm caliculated the path from the
start to the
%end of the maze where the female spider is located
[dist, path, pred] = graphshortestpath(dg, S,
T,'Directed',false,...
'Method','Dijkstra');
%reducing value of the entrees of the matrix path by 1 to get
the original
%path the spider should follow to reach the female spider
for i=1:length(path)
path(i)=path(i)-1;
end
disp(path);
% And yeah the spider can have the dinner with the female spider
