/**
 * @author HelbaUltra
 */

// System settings
var gameloopId;
var gameRunning = true;
var screenWidth;
var screenHeight;
var ctx;
var FPS = 30;

// Game attributes
var speed = 1;
var button1;
var button2;
var mouseX;
var mouseY;
var crappyTimer = 0;

// Pet attributes
var petVelX = 2;
var petVelY = 0;
var petPosX = 200;
var petPosY = 200;

// Images
var teelImg0 = new Image();
var teelImg1 = new Image();
var teelImg2 = new Image();
var currentImg;
var background = new Image();
var flip = true;
var clicked = false;

// Sounds
var happy;
var scream;

// Animation looping
window.requestAnimFrame = (function(){
    return  window.requestAnimationFrame       || 
            window.webkitRequestAnimationFrame || 
            window.mozRequestAnimationFrame    || 
            window.oRequestAnimationFrame      || 
            window.msRequestAnimationFrame     || 
            function(/* function */ callback, /* DOMElement */ element){
              window.setTimeout(callback, 1000 / 30);
            };
  })();

// Wait for dom to finish and initialize game
$(document).ready(function(){
	init();
});

function init(){
	initSettings();
	loadImages();
	loadSounds();
	gameLoop();
}

function initSettings(){
	// Get a handle  to the 2d contest of canvas
	canvas = document.getElementById('canvas');
	ctx = canvas.getContext('2d');
	canvas.addEventListener('click', canvas_click, false);
	
	//calculate screen height and width
	canvas.width = 1200;
	canvas.height = 600;
	
	screenWidth = canvas.width;
	screenHeight = canvas.height;
	
	button1 = new Button(20, 10, "#000", "hello");
	button2 = new Button(90, 170, "#000", "bye");
}

function loadImages(){
	teelImg0.src = "img/teel-sheet0.png";
	teelImg1.src = "img/teel-sheet1.png";
	teelImg2.src = "img/teel-sheet2.png";
	background.src = "img/background.jpg";
	currentImg = teelImg0;
}

function loadSounds(){
	happy = new Audio("sound/pika_happy.wav")
	scream = new Audio("sound/pika_scream.wav");
}

function gameLoop(){
	requestAnimFrame(gameLoop);
	draw();
}

function draw() {
	ctx.fillStyle = "#000";
	petPosX += petVelX * speed;
	petPosY += petVelY * speed;
	
	if(petPosX > screenWidth - currentImg.width){
		petVelX = -petVelX;
		flip = !flip;
	}
	if(petPosX < 0){
		petVelX = -petVelX;
		flip = !flip;
	}
	
	ctx.fillStyle = 'rgb(255,255,255)';
	ctx.fillRect( 0, 0, screenWidth, screenHeight);
	ctx.drawImage(background, 0, 0, screenWidth, screenHeight);
	ctx.drawImage(currentImg, petPosX, petPosY, currentImg.width, currentImg.height);
	crappyTimer++;
	if(crappyTimer >100){
		crappyTimer = 0;
		currentImg = teelImg0;
	}
}

function no(){
	scream.play();
	currentImg = teelImg2;
	crappyTimer = 0;
}

function yes(){
	happy.play();
	currentImg = teelImg1;
	crappyTimer = 0;
}

function Button(x, y, fill, text){
	this.x = x || 0;
	this.y = y || 0;
	this.fill = fill || '#AAAAAA';
}

function canvas_click(ev) {
    mouseX = ev.clientX - canvas.offsetLeft;
    mouseY = ev.clientY - canvas.offsetTop;
    document.getElementById("testelem").innerHTML=petPosX + " " + petPosY;
    
    if(mouseX > petPosX && mouseX < petPosX + teelImg0.width && mouseY > petPosY && mouseY < petPosY + teelImg0.height){
    	yes();
    }
}

//Button.prototype.draw = function(ctx){
//	ctx.fillStyle = this.fill;
//	ctx.beginPath();
//	ctx.arc( this.x, this.y, 10, 0, Math.PI * 9, true );	//double check this parameter might need fixing
//	ctx.closePath();
//	ctx.fill();
//}