local text=" "
local img

function beginContact(a, b, coll)
    x,y = coll:getNormal()
	
   -- text = text.."\n"..a:getUserData().." colidindo com "..b:getUserData().." with a vector normal of: "..x..", "..y
    if((a:getUserData() =="bola2") and (b:getUserData() == "cube1")) 
	      or ((a:getUserData() =="cube1") and (b:getUserData() == "bola2"))  then
		  pontoYbox1=500
		  Pontos = Pontos + 1
		     text = a:getUserData() .." colidindo com "..b:getUserData()
				
	end	
    if((a:getUserData() =="bola2") and (b:getUserData() == "cube2")) 
	      or ((a:getUserData() =="cube2") and (b:getUserData() == "bola2"))  then
		  pontoYbox2=500
		  Pontos = Pontos + 1
		     text = a:getUserData() .." colidindo com "..b:getUserData()
				
	end		
    if((a:getUserData() =="bola2") and (b:getUserData() == "cube3")) 
	      or ((a:getUserData() =="cube3") and (b:getUserData() == "bola2"))  then
		  pontoYbox3=500
		  Pontos = Pontos + 1
		     text = a:getUserData() .." colidindo com "..b:getUserData()
				
	end
    if((a:getUserData() =="bola2") and (b:getUserData() == "cube4")) 
	      or ((a:getUserData() =="cube4") and (b:getUserData() == "bola2"))  then
		  pontoYbox4=500
		  Pontos = Pontos + 1
		     text = a:getUserData() .." colidindo com "..b:getUserData()
				
	end	
    if((a:getUserData() =="bola2") and (b:getUserData() == "cube5")) 
	      or ((a:getUserData() =="cube5") and (b:getUserData() == "bola2"))  then
		  pontoYbox5=500
		  Pontos = Pontos + 1
		     text = a:getUserData() .." colidindo com "..b:getUserData()
				
	end	
    if((a:getUserData() =="bola2") and (b:getUserData() == "cube6")) 
	      or ((a:getUserData() =="cube6") and (b:getUserData() == "bola2"))  then
		  pontoYbox6=500
		  Pontos = Pontos + 1
		     text = a:getUserData() .." colidindo com "..b:getUserData()
				
	end	
    if((a:getUserData() =="bola2") and (b:getUserData() == "cube7")) 
	      or ((a:getUserData() =="cube7") and (b:getUserData() == "bola2"))  then
		  pontoYbox7=543
		  Pontos = Pontos + 1
		     text = a:getUserData() .." colidindo com "..b:getUserData()
				
	end	
    if((a:getUserData() =="bola2") and (b:getUserData() == "cube8")) 
	      or ((a:getUserData() =="cube8") and (b:getUserData() == "bola2"))  then
		  pontoYbox8=543
		  Pontos = Pontos + 1
		     text = a:getUserData() .." colidindo com "..b:getUserData()
				
	end	
	
end

function love.load()
  img = love.graphics.newImage("Palet.png")
  imgbola = love.graphics.newImage("bola.png")
  cube1 = love.graphics.newImage("box.png")
  cube2 = love.graphics.newImage("box.png")
  cube3 = love.graphics.newImage("box.png")
  cube4 = love.graphics.newImage("box.png")
  cube5 = love.graphics.newImage("box.png")
  cube6 = love.graphics.newImage("box.png")
  cube7 = love.graphics.newImage("box.png")
  cube8 = love.graphics.newImage("box.png")
  imgFim = love.graphics.newImage("fim.jpg")   
  love.physics.setMeter(64) --the height of a meter our worlds will be 64px
  world = love.physics.newWorld(-0.1, 9.81*64, true) --create a world for the bodies to exist in with horizontal gravity of 0 and vertical gravity of 9.81
  world:setCallbacks(beginContact, endContact, preSolve, postSolve)
  Pontos = 0
  posicaoXBola = 100
  posicaoYBola = 430
  pontoYbox1 = 250
  pontoYbox2 = 250
  pontoYbox3 = 250
  pontoYbox4 = 250
  pontoYbox5 = 250
  pontoYbox6 = 250
  pontoYbox7 = 200
  pontoYbox8 = 200

  objects = {} -- table to hold all our physical objects
  
  --########################CHÃO#####################
  
  objects.ground = {}
  objects.ground.body = love.physics.newBody(world, 650/2, 650-50/2) --o retângulo que será desenhado é desenhado a partir do centro da tela
  objects.ground.shape = love.physics.newRectangleShape(950, 350) --make a rectangle with a width of 650 and a height of 50
  objects.ground.fixture = love.physics.newFixture(objects.ground.body, objects.ground.shape); --attach shape to body
  objects.ground.fixture:setUserData("Chao")
  
  --########################CHÃO#####################
  
  
  
    ---obstaculo 1 - parede horizontal Fim do cel
  objects.obstaculo1 = {}
  objects.obstaculo1.body = love.physics.newBody(world, 400, 0,"static") -- em newBody, cria-se um "corpo" que ocupará um determinado lugar no espaço
  objects.obstaculo1.shape = love.physics.newRectangleShape(0, 0, 820, 10)
  objects.obstaculo1.fixture = love.physics.newFixture(objects.obstaculo1.body, objects.obstaculo1.shape) -- A higher density gives it more mass.
   objects.obstaculo1.fixture:setUserData("obstaculo1")

  
  
  
  
  
  --criando a bola que será "atachada " a imagem da mao
  objects.ball = {}
  
  objects.ball.body = love.physics.newBody(world, 100, 150/2, "dynamic") --place the body in the center of the world and make it dynamic, so it can move around
  objects.ball.shape = love.physics.newCircleShape(22) --the ball's shape has a radius of 20
  objects.ball.fixture = love.physics.newFixture(objects.ball.body, objects.ball.shape, 5) -- Attach fixture to body and give it a density of 1.Quanto maior a densidade, mais difícil mover a bola
  objects.ball.fixture:setRestitution(5) --let the ball bounce
  objects.ball.fixture:setUserData("mão") 
  
  
  
  
   --criando a bola 2 ( Basebol)
  objects.bola2 = {}
  
  objects.bola2.body = love.physics.newBody(world, 332, 150/2, "dynamic") --place the body in the center of the world and make it dynamic, so it can move around
  objects.bola2.shape = love.physics.newCircleShape(0.2) --the ball's shape has a radius of 20
  objects.bola2.fixture = love.physics.newFixture(objects.bola2.body, objects.bola2.shape, 1) -- Attach fixture to body and give it a density of 1.Quanto maior a densidade, mais difícil mover a bola
  objects.bola2.fixture:setRestitution(0.8) --let the ball bounce
  objects.bola2.fixture:setUserData("bola2") 
  
  
  
  

  --ARO ESQUERDO
  objects.aroesquerdo = {}
  objects.aroesquerdo.body = love.physics.newBody(world, 5, 150) -- em newBody, cria-se um "corpo" que ocupará um determinado lugar no espaço
  objects.aroesquerdo.shape = love.physics.newRectangleShape(10, 600)
  objects.aroesquerdo.fixture = love.physics.newFixture(objects.aroesquerdo.body, objects.aroesquerdo.shape) -- A higher density gives it more mass.
   objects.aroesquerdo.fixture:setUserData("aroesquerdo")
   
   
   
   --ARO DIREITO
  objects.arodireito = {}
  objects.arodireito.body = love.physics.newBody(world, 800, 150) -- em newBody, cria-se um "corpo" que ocupará um determinado lugar no espaço
  objects.arodireito.shape = love.physics.newRectangleShape(10, 600)
  objects.arodireito.fixture = love.physics.newFixture(objects.arodireito.body, objects.arodireito.shape) -- A higher density gives it more mass.
   objects.arodireito.fixture:setUserData("arodireito")
   
   
--Desenho dos boxers

  --Cube1
  objects.box1 = {}
  objects.box1.body = love.physics.newBody(world, 250, pontoYbox1) -- em newBody, cria-se um "corpo" que ocupará um determinado lugar no espaço
  objects.box1.shape = love.physics.newRectangleShape(32, 32)
  objects.box1.fixture = love.physics.newFixture(objects.box1.body, objects.box1.shape) -- A higher density gives it more mass.
   objects.box1.fixture:setUserData("cube1")
  
  --cube2
  objects.box2 = {}
  objects.box2.body = love.physics.newBody(world, 293, pontoYbox2) -- em newBody, cria-se um "corpo" que ocupará um determinado lugar no espaço
  objects.box2.shape = love.physics.newRectangleShape(32, 32)
  objects.box2.fixture = love.physics.newFixture(objects.box2.body, objects.box2.shape) -- A higher density gives it more mass.
   objects.box2.fixture:setUserData("cube2")  
   
  --cube3
  objects.box3 = {}
  objects.box3.body = love.physics.newBody(world, 336, pontoYbox3) -- em newBody, cria-se um "corpo" que ocupará um determinado lugar no espaço
  objects.box3.shape = love.physics.newRectangleShape(32, 32)
  objects.box3.fixture = love.physics.newFixture(objects.box3.body, objects.box3.shape) -- A higher density gives it more mass.
   objects.box3.fixture:setUserData("cube3")
  --cube4
  objects.box4 = {}
  objects.box4.body = love.physics.newBody(world, 379, pontoYbox4) -- em newBody, cria-se um "corpo" que ocupará um determinado lugar no espaço
  objects.box4.shape = love.physics.newRectangleShape(32, 32)
  objects.box4.fixture = love.physics.newFixture(objects.box4.body, objects.box4.shape) -- A higher density gives it more mass.
   objects.box4.fixture:setUserData("cube4")
   
  --cube5
  objects.box5 = {}
  objects.box5.body = love.physics.newBody(world, 422, pontoYbox5) -- em newBody, cria-se um "corpo" que ocupará um determinado lugar no espaço
  objects.box5.shape = love.physics.newRectangleShape(32, 32)
  objects.box5.fixture = love.physics.newFixture(objects.box5.body, objects.box5.shape) -- A higher density gives it more mass.
   objects.box5.fixture:setUserData("cube5")

  --cube6
  objects.box6 = {}
  objects.box6.body = love.physics.newBody(world, 465, pontoYbox6) -- em newBody, cria-se um "corpo" que ocupará um determinado lugar no espaço
  objects.box6.shape = love.physics.newRectangleShape(32, 32)
  objects.box6.fixture = love.physics.newFixture(objects.box6.body, objects.box6.shape) -- A higher density gives it more mass.
   objects.box6.fixture:setUserData("cube6")   
   
  --cube7
  objects.box7 = {}
  objects.box7.body = love.physics.newBody(world, 336, pontoYbox7) -- em newBody, cria-se um "corpo" que ocupará um determinado lugar no espaço
  objects.box7.shape = love.physics.newRectangleShape(32, 32)
  objects.box7.fixture = love.physics.newFixture(objects.box7.body, objects.box7.shape) -- A higher density gives it more mass.
   objects.box7.fixture:setUserData("cube7")

  --cube8
  objects.box8 = {}
  objects.box8.body = love.physics.newBody(world, 379, pontoYbox8) -- em newBody, cria-se um "corpo" que ocupará um determinado lugar no espaço
  objects.box8.shape = love.physics.newRectangleShape(32, 32)
  objects.box8.fixture = love.physics.newFixture(objects.box8.body, objects.box8.shape) -- A higher density gives it more mass.
   objects.box8.fixture:setUserData("cube8")   
   
  --fim do jogo
  objects.fim = {}
  objects.fim.body = love.physics.newBody(world, 999, 999) -- em newBody, cria-se um "corpo" que ocupará um determinado lugar no espaço
  objects.fim.shape = love.physics.newRectangleShape(32, 32)
  objects.fim.fixture = love.physics.newFixture(objects.fim.body, objects.fim.shape) -- A higher density gives it more mass.
   objects.fim.fixture:setUserData("fim")      
   
  --initial graphics setup
  love.graphics.setBackgroundColor(0, 191, 255) --set the background color to a nice blue
  love.graphics.setMode(800, 600, false, true, 0) --set the window dimensions to 650 by 650
end


function love.update(dt)
  world:update(dt) --this puts the world into motion
  
  
  

  if love.keyboard.isDown("right") then 
     posicaoXBola = posicaoXBola + (250*dt)
  end
  
  if love.keyboard.isDown("left") then 
    posicaoXBola = posicaoXBola -(250*dt)
  end
  
  if love.keyboard.isDown("up") then 
    posicaoYBola = posicaoYBola - (280*dt)
  end
  
  if love.keyboard.isDown("down") then 
    posicaoYBola = posicaoYBola + (250*dt)
  end  
  -- POSICIONANDO O PALET 
  objects.ball.body:setPosition(posicaoXBola, posicaoYBola)
  if pontoYbox4 > 250 then
     objects.box1.body:setPosition(250, pontoYbox1)
  end
  if pontoYbox2 > 250 then
	objects.box2.body:setPosition(293, pontoYbox2)
  end
  if pontoYbox3 > 250 then
	objects.box3.body:setPosition(336, pontoYbox3)
  end
  if pontoYbox4 > 250 then
    objects.box4.body:setPosition(379, pontoYbox4)
  end
  if pontoYbox5 > 250 then
    objects.box5.body:setPosition(422, pontoYbox5)
  end
  if pontoYbox6 > 250 then
    objects.box6.body:setPosition(465, pontoYbox6)
  end  
  if pontoYbox7 > 250 then
    objects.box7.body:setPosition(336, pontoYbox7)
  end  
  if pontoYbox8 > 250 then
    objects.box8.body:setPosition(379, pontoYbox8)
  end    
  if Pontos > 7 then
    objects.fim.body:setPosition(250, 50)
  end 
  
end

function love.draw()
	
  love.graphics.setColor(218, 165, 32) 
  love.graphics.polygon("fill", objects.ground.body:getWorldPoints(objects.ground.shape:getPoints())) 

  love.graphics.setColor(0, 191, 255) 
  love.graphics.circle("fill", objects.ball.body:getX(), objects.ball.body:getY(), objects.ball.shape:getRadius())
  
  
  love.graphics.setColor(50, 50, 50) 
  love.graphics.polygon("fill", objects.aroesquerdo.body:getWorldPoints(objects.aroesquerdo.shape:getPoints()))
  love.graphics.polygon("fill", objects.arodireito.body:getWorldPoints(objects.arodireito.shape:getPoints()))
  
  
  love.graphics.setColor(50, 50, 50) 
  love.graphics.polygon("fill", objects.obstaculo1.body:getWorldPoints(objects.obstaculo1.shape:getPoints()))
  
 
   love.graphics.print(text, 10, 10)
    love.graphics.setColor(255, 255, 255)
	
	--Desenha os pontos na Tela
	love.graphics.print(Pontos, 750, 25)
    love.graphics.setColor(255, 255, 255)
	
	--Desenha o box1
  love.graphics.polygon("fill", objects.box1.body:getWorldPoints(objects.box1.shape:getPoints()))
  love.graphics.draw(cube1,objects.box1.body:getX()-img:getWidth()/3,objects.box1.body:getY()-img:getHeight()/3)
	--Desenha o box2
  love.graphics.polygon("fill", objects.box2.body:getWorldPoints(objects.box2.shape:getPoints()))
  love.graphics.draw(cube2,objects.box2.body:getX()-img:getWidth()/3,objects.box2.body:getY()-img:getHeight()/3)
 	--Desenha o box3
  love.graphics.polygon("fill", objects.box3.body:getWorldPoints(objects.box3.shape:getPoints()))
  love.graphics.draw(cube3,objects.box3.body:getX()-img:getWidth()/3,objects.box3.body:getY()-img:getHeight()/3)
	--Desenha o box4
  love.graphics.polygon("fill", objects.box4.body:getWorldPoints(objects.box4.shape:getPoints()))
  love.graphics.draw(cube4,objects.box4.body:getX()-img:getWidth()/3,objects.box4.body:getY()-img:getHeight()/3)
	--Desenha o box5
  love.graphics.polygon("fill", objects.box5.body:getWorldPoints(objects.box5.shape:getPoints()))
  love.graphics.draw(cube5,objects.box5.body:getX()-img:getWidth()/3,objects.box5.body:getY()-img:getHeight()/3)
	--Desenha o box6
  love.graphics.polygon("fill", objects.box6.body:getWorldPoints(objects.box6.shape:getPoints()))
  love.graphics.draw(cube6,objects.box6.body:getX()-img:getWidth()/3,objects.box6.body:getY()-img:getHeight()/3)
	--Desenha o box7
  love.graphics.polygon("fill", objects.box7.body:getWorldPoints(objects.box7.shape:getPoints()))
  love.graphics.draw(cube7,objects.box7.body:getX()-img:getWidth()/3,objects.box7.body:getY()-img:getHeight()/3) 	 	 	
	--Desenha o box8
  love.graphics.polygon("fill", objects.box8.body:getWorldPoints(objects.box8.shape:getPoints()))
  love.graphics.draw(cube8,objects.box8.body:getX()-img:getWidth()/3,objects.box8.body:getY()-img:getHeight()/3)  
  
  -- desenhando o porco	
  love.graphics.draw(img,objects.ball.body:getX()-img:getWidth()/2,objects.ball.body:getY()-img:getHeight()/2)
  
  --desenhando a segunda bola
  love.graphics.draw(imgbola,objects.bola2.body:getX()-img:getWidth()/2,objects.bola2.body:getY()-img:getHeight()/2)

  --Desenha o fim
  love.graphics.polygon("fill", objects.fim.body:getWorldPoints(objects.fim.shape:getPoints()))
  love.graphics.draw(imgFim,objects.fim.body:getX()-img:getWidth()/3,objects.fim.body:getY()-img:getHeight()/3)  
 
   
   love.graphics.print(objects.ball.body:getX(), 10, 40)
   love.graphics.print(objects.ball.body:getY(), 10, 60)
end