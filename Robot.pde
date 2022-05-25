class Robot extends Enemy {
	// Requirement #5: Complete Dinosaur Class

	final int PLAYER_DETECT_RANGE_ROW = 2;
	final int LASER_COOLDOWN = 180;
	final int HAND_OFFSET_Y = 37;
	final int HAND_OFFSET_X_FORWARD = 64;
	final int HAND_OFFSET_X_BACKWARD = 16;
  boolean isRight = true;
  float speed = 2f;
  float timer = 0;
  boolean attackMode = false;
  float currentSpeed = speed;
  Laser laser;
  float robotROW = floor(y/SOIL_SIZE);

Robot(float x, float y){
 super(x,y);
 }
 
  void display(){
   if(isRight){
   image(robot,x,y);
   }else{
   pushMatrix();
   translate(x+w,y);
   scale(-1,1);
   image(robot,0,0);
   popMatrix();
   }
    if(attackMode){
   laser.display();}
 }
 
 void update(){ 
 
 if(isRight){x += currentSpeed;}else{x -= currentSpeed;}
 if(x+w >= width){
 isRight = false;}
 if(x <= 0){
 isRight = true;}
 //在右邊
 if(isRight && player.x >x){
 if( player.row + PLAYER_DETECT_RANGE_ROW >= robotROW && player.row -PLAYER_DETECT_RANGE_ROW <= robotROW){
 currentSpeed = 0;
 if(timer ==0){
   timer++;
   attackMode = true;
   laser.fire(x+HAND_OFFSET_X_BACKWARD, y ,player.x ,player.y);
   laser.update();
   laser.checkCollision(player);
  
 }if(timer >= LASER_COOLDOWN){timer =0;}
 }
 }
 //在左邊
 if(!isRight && player.x< x){
 if( player.row + PLAYER_DETECT_RANGE_ROW >= robotROW && player.row -PLAYER_DETECT_RANGE_ROW <= robotROW){
 currentSpeed = 0;} 
 }
 
 
if(!isRight && player.x> x){currentSpeed = speed;}
if(isRight && player.x <x){currentSpeed = speed;}
 }
 
	// HINT: Player Detection in update()
	/*

	boolean checkX = ( Is facing forward AND player's center point is in front of my hand point )
					OR ( Is facing backward AND player's center point (x + w/2) is in front of my hand point )

	boolean checkY = player is less than (or equal to) 2 rows higher or lower than me

	if(checkX AND checkY){
		Is laser's cooldown ready?
			True  > Fire laser from my hand!
			False > Don't do anything
	}else{
		Keep moving!
	}

	*/
 }
