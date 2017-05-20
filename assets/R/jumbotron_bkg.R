#get 20000 pi digits
pie <- read.csv("http://oeis.org/A000796/b000796.txt", header=FALSE, sep=" ")
#col V1 - digit position, col V2 - digit value

#add modulo 2 value
pie$V3 = pie$V2 %% 2

#create figure for jumbotron background
library(corrplot)


for (i in 1:4){
#transform pie vector into matrix
n.rows = 19*i
n.cols = 42*i
digit.nr = n.rows*n.cols

pie_m = t(matrix(pie$V3[1:digit.nr],n.cols,n.rows))


  col2 <- colorRampPalette(c("black","#FFFCF5", "#8B7765"))	
  png(file=paste0("/Users/bpiasecka/Documents/MyWebPage/paper_kit_by_BP/assets/paper_img/pi4_",i,"_2.png"),
      width=2048, height=(2048*n.rows/n.cols),bg="green")
  corrplot(pie_m,method="color",is.corr=FALSE,tl.pos="n",cl.pos="n",#addgrid.col="#FFFCF5",
           bg="transparent",
           cl.lim = c(0,1),col = col2(3),mar=c(0,0,0,0))  
  dev.off()
}


