class Dinosaur extends Enemy {
	// Requirement #4: Complete Dinosaur Class

	final float TRIGGERED_SPEED_MULTIPLIER = 5;
  boolean isRight = true;
  float speed = 1f;
  float currentSpeed = speed;

 Dinosaur(float x, float y){
 super(x,y);
 }
 
 void display(){
   if(isRight){
   image(dinosaur,x,y);
   }else{
   pushMatrix();
   translate(x+w,y);
   scale(-1,1);
   image(dinosaur,0,0);
   popMatrix();
   }
 }
 
 void update(){ 
   if(isRight){x += currentSpeed;}else{x -= currentSpeed;}
 if(x+w >= width){
 isRight = false;}
 if(x <= 0){
 isRight = true;}
 
 if(isRight && x < player.x && y == player.y){
  currentSpeed =5f;
 }else if( !isRight && x >player.x && y == player.y){
  currentSpeed =5f;
 }else{
 currentSpeed = speed;}
 }
 
	// HINT: Player Detection in update()
	/*
	float currentSpeed = speed
	If player is on the same row with me AND (it's on my right side when I'm going right OR on my left side when I'm going left){
		currentSpeed *= TRIGGERED_SPEED_MULTIPLIER
	}
	*/
}
