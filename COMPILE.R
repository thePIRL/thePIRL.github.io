print(getwd())

file="C:\\Users\\thomenr\\Box Sync\\businesstoday\\navside.txt"
con = file(file,open='r')
NAV = readLines(con)
close(con)


folder = "C:\\Users\\thomenr\\Box Sync\\businesstoday\\"
pages = dir(paste(folder,'pages\\',sep=''))


for(kk in 1:length(pages)){
file=paste(folder,'pages\\',pages[kk],sep='')
con = file(file,open='r')
line = readLines(con)
close(con)

marker=1
newFileLine = ''
for(i in 1:length(line)){
print(i)
if(grepl('<--! NAVIGATION MARKER -->',line[i])){for(k in 1:(length(NAV)-1)){newFileLine[marker] = NAV[k];marker=marker+1;}}
else{newFileLine[marker] = line[i];marker=marker+1;}

}

fileConn<-file(paste(folder,substring(pages[kk],1,nchar(pages[kk])-4),'.html',sep=''))
writeLines(newFileLine, fileConn)
close(fileConn)


}