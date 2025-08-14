# 贪吃蛇游戏

在这个博客中，我将展示一个用 JavaScript 编写的经典贪吃蛇游戏。这是一个交互式的游戏，您可以在浏览器中直接玩。

## 游戏说明

- 使用键盘方向键控制蛇的移动方向
- 吃到红色食物可以增加分数和蛇的长度
- 避免撞到墙壁或蛇自己的身体
- 游戏速度会随着分数增加而加快

## 游戏控制

- **方向键**: 控制蛇的移动方向
- **开始游戏**: 开始或重新开始游戏
- **暂停**: 暂停或继续游戏
- **空格键**: 暂停或继续游戏

<div id="game-area">
  <canvas id="game-canvas" width="400" height="400"></canvas>
  <div id="game-info">
    <div>分数: <span id="score">0</span></div>
    <button id="start-btn">开始游戏</button>
    <button id="pause-btn">暂停</button>
    <div id="game-over" style="display: none; color: red; font-weight: bold;">
      <div>游戏结束!</div>
      <button id="restart-btn">重新开始</button>
    </div>
  </div>
</div>

<script>
// 游戏变量
const canvas = document.getElementById('game-canvas');
const ctx = canvas.getContext('2d');
const scoreElement = document.getElementById('score');
const startBtn = document.getElementById('start-btn');
const pauseBtn = document.getElementById('pause-btn');
const gameOverElement = document.getElementById('game-over');

// 游戏设置
const gridSize = 20;
const gridWidth = canvas.width / gridSize;
const gridHeight = canvas.height / gridSize;

// 游戏状态
let snake = [];
let food = {};
let direction = 'right';
let nextDirection = 'right';
let score = 0;
let gameSpeed = 150;
let gameRunning = false;
let gameLoop;

// 初始化游戏
function initGame() {
  // 初始化蛇
  snake = [
    {x: 5, y: 10},
    {x: 4, y: 10},
    {x: 3, y: 10}
  ];
  
  // 生成食物
  generateFood();
  
  // 重置分数
  score = 0;
  scoreElement.textContent = score;
  
  // 重置游戏状态
  direction = 'right';
  nextDirection = 'right';
  gameRunning = false;
  
  // 隐藏游戏结束提示
  gameOverElement.style.display = 'none';
  
  // 更新按钮文本
  pauseBtn.textContent = '暂停';
}

// 生成食物
function generateFood() {
  food = {
    x: Math.floor(Math.random() * gridWidth),
    y: Math.floor(Math.random() * gridHeight)
  };
  
  // 确保食物不在蛇身上
  for (let segment of snake) {
    if (segment.x === food.x && segment.y === food.y) {
      return generateFood();
    }
  }
}

// 绘制游戏
function draw() {
  // 清空画布
  ctx.fillStyle = 'black';
  ctx.fillRect(0, 0, canvas.width, canvas.height);
  
  // 绘制网格线
  ctx.strokeStyle = '#333';
  ctx.lineWidth = 0.5;
  for (let x = 0; x <= canvas.width; x += gridSize) {
    ctx.beginPath();
    ctx.moveTo(x, 0);
    ctx.lineTo(x, canvas.height);
    ctx.stroke();
  }
  for (let y = 0; y <= canvas.height; y += gridSize) {
    ctx.beginPath();
    ctx.moveTo(0, y);
    ctx.lineTo(canvas.width, y);
    ctx.stroke();
  }
  
  // 绘制蛇
  for (let i = 0; i < snake.length; i++) {
    // 蛇头使用不同颜色
    if (i === 0) {
      ctx.fillStyle = '#00FF00'; // 亮绿色
    } else {
      // 蛇身使用渐变颜色
      const colorValue = Math.max(50, 200 - i * 5);
      ctx.fillStyle = `rgb(0, ${colorValue}, 0)`;
    }
    ctx.fillRect(snake[i].x * gridSize, snake[i].y * gridSize, gridSize - 1, gridSize - 1);
  }
  
  // 绘制食物
  ctx.fillStyle = 'red';
  ctx.fillRect(food.x * gridSize, food.y * gridSize, gridSize - 1, gridSize - 1);
}

// 更新游戏状态
function update() {
  // 更新方向
  direction = nextDirection;
  
  // 计算新的蛇头位置
  const head = {x: snake[0].x, y: snake[0].y};
  
  switch (direction) {
    case 'up':
      head.y -= 1;
      break;
    case 'down':
      head.y += 1;
      break;
    case 'left':
      head.x -= 1;
      break;
    case 'right':
      head.x += 1;
      break;
  }
  
  // 检查碰撞边界
  if (head.x < 0 || head.x >= gridWidth || head.y < 0 || head.y >= gridHeight) {
    gameOver();
    return;
  }
  
  // 检查碰撞自己
  for (let segment of snake) {
    if (segment.x === head.x && segment.y === head.y) {
      gameOver();
      return;
    }
  }
  
  // 将新头部添加到蛇身上
  snake.unshift(head);
  
  // 检查是否吃到食物
  if (head.x === food.x && head.y === food.y) {
    // 增加分数
    score += 10;
    scoreElement.textContent = score;
    
    // 生成新食物
    generateFood();
    
    // 增加速度
    if (gameSpeed > 50) {
      gameSpeed -= 2;
    }
  } else {
    // 移除尾部
    snake.pop();
  }
}

// 游戏结束
function gameOver() {
  gameRunning = false;
  clearInterval(gameLoop);
  gameOverElement.style.display = 'block';
  pauseBtn.textContent = '暂停';
}

// 开始游戏
function startGame() {
  if (!gameRunning) {
    gameRunning = true;
    gameOverElement.style.display = 'none';
    if (gameLoop) clearInterval(gameLoop);
    gameLoop = setInterval(() => {
      update();
      draw();
    }, gameSpeed);
    pauseBtn.textContent = '暂停';
  }
}

// 暂停游戏
function pauseGame() {
  if (gameRunning) {
    gameRunning = false;
    clearInterval(gameLoop);
    pauseBtn.textContent = '继续';
  } else {
    startGame();
  }
}

// 处理键盘输入
function handleKeydown(e) {
  switch (e.key) {
    case 'ArrowUp':
      if (direction !== 'down') nextDirection = 'up';
      break;
    case 'ArrowDown':
      if (direction !== 'up') nextDirection = 'down';
      break;
    case 'ArrowLeft':
      if (direction !== 'right') nextDirection = 'left';
      break;
    case 'ArrowRight':
      if (direction !== 'left') nextDirection = 'right';
      break;
    case ' ':
      // 空格键暂停/继续
      e.preventDefault();
      pauseGame();
      break;
  }
}

// 事件监听器
startBtn.addEventListener('click', () => {
  initGame();
  startGame();
});

pauseBtn.addEventListener('click', pauseGame);

// 添加重新开始按钮事件监听器
document.getElementById('restart-btn').addEventListener('click', () => {
  initGame();
  startGame();
});

document.addEventListener('keydown', handleKeydown);

// 初始化游戏
initGame();
draw();
</script>

<style>
#game-area {
  display: flex;
  flex-direction: column;
  align-items: center;
  margin: 20px 0;
}

#game-info {
  display: flex;
  align-items: center;
  margin-top: 10px;
}

#game-info > * {
  margin: 0 10px;
}

#game-over div:first-child {
  font-size: 24px;
  margin-bottom: 10px;
}

button {
  background-color: #4CAF50;
  border: none;
  color: white;
  padding: 10px 20px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 4px 2px;
  cursor: pointer;
  border-radius: 4px;
  transition: background-color 0.3s;
}

button:hover {
  background-color: #45a049;
}

#restart-btn {
  background-color: #008CBA;
}

#restart-btn:hover {
  background-color: #007B9A;
}
</style>