// Learn Mode Activated 
void halfAndHalf(){
  textFont(avenirHeavy);
  if(mouseY < height * 0.36){
    fill(lightblue, 50);
    rect(width/2, height * 0.18, width, height * 0.36);
    fill(255);
    text("Take me through the life story of a high mass star\n like Achernar, Vega, Sirius and Altair", width/2, 165);
  }
  if(mouseY > height * 0.36){
    fill(lightblue, 50);
    rect(width/2, height * 0.68, width, height * 0.64);
    fill(255);
    text("Take me through the life story of a low mass star\n like our own Sun, Alpha Centauri and Proxima Centauri", width/2, 670);
  }
}
