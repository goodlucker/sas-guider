const fs = require('fs');
const path = require('path');
const { exec } = require('child_process');

// 配置部分
const config = {
  sasPath: 'C:\\Program Files\\SASHome\\SASFoundation\\9.4\\sas.exe', // SAS执行路径
  baseDir: './sas_programs', // 基础目录
  modules: {
    metadata: 'metadata',
    sdtm: 'sdtm',
    adam: 'adam',
    tlfs: 'tlfs',
    other: 'other'
  },
  logDir: './logs' // 日志目录
};

// 确保日志目录存在
if (!fs.existsSync(config.logDir)) {
  fs.mkdirSync(config.logDir, { recursive: true });
}

// SAS程序队列
let sasQueue = [];
let runningProcesses = 0;
const MAX_CONCURRENT_PROCESSES = 2; // 最大并发数

// 获取SAS程序列表
function getSasPrograms(module) {
  const modulePath = path.join(config.baseDir, config.modules[module]);
  if (!fs.existsSync(modulePath)) {
    return [];
  }

  return fs.readdirSync(modulePath)
    .filter(file => file.endsWith('.sas'))
    .map(file => {
      const fullPath = path.join(modulePath, file);
      const stats = fs.statSync(fullPath);
      return {
        name: file,
        path: fullPath,
        module,
        priority: 0, // 默认优先级
        ctime: stats.ctime,
        mtime: stats.mtime
      };
    });
}

// 排序函数
const sortFunctions = {
  nameAsc: (a, b) => a.name.localeCompare(b.name),
  nameDesc: (a, b) => b.name.localeCompare(a.name),
  dateAsc: (a, b) => a.mtime - b.mtime,
  dateDesc: (a, b) => b.mtime - a.mtime,
  priorityAsc: (a, b) => a.priority - b.priority,
  priorityDesc: (a, b) => b.priority - a.priority
};

// 运行SAS程序
function runSasProgram(program) {
  return new Promise((resolve, reject) => {
    const logFile = path.join(config.logDir, `${program.name.replace('.sas', '')}_${Date.now()}.log`);
    const command = `"${config.sasPath}" -sysin "${program.path}" -log "${logFile}" -print "${logFile.replace('.log', '.lst')}"`;
    
    console.log(`Running: ${program.name} (Priority: ${program.priority})`);
    runningProcesses++;
    
    const sasProcess = exec(command, (error, stdout, stderr) => {
      runningProcesses--;
      if (error) {
        console.error(`Error running ${program.name}: ${error.message}`);
        return reject(error);
      }
      if (stderr) {
        console.error(`Stderr for ${program.name}: ${stderr}`);
      }
      console.log(`Completed: ${program.name}`);
      resolve();
    });
    
    // 可以在这里添加进程优先级设置（Windows）
    // 例如使用wmic设置进程优先级
  });
}

// 处理队列
async function processQueue() {
  while (sasQueue.length > 0 && runningProcesses < MAX_CONCURRENT_PROCESSES) {
    const nextProgram = sasQueue.shift();
    await runSasProgram(nextProgram).catch(console.error);
  }
  
  if (sasQueue.length > 0) {
    setTimeout(processQueue, 1000);
  }
}

// 主函数
function main() {
  // 1. 获取所有模块的SAS程序
  const allPrograms = [];
  for (const module in config.modules) {
    const programs = getSasPrograms(module);
    programs.forEach(p => p.module = module); // 确保模块信息正确
    allPrograms.push(...programs);
  }
  
  // 2. 用户界面部分（简化版）
  // 实际应用中这里可以是Web界面或GUI界面
  console.log('Available SAS programs:');
  allPrograms.forEach((p, i) => {
    console.log(`${i + 1}. [${p.module}] ${p.name} (Modified: ${p.mtime.toLocaleString()})`);
  });
  
  // 3. 设置优先级（示例）
  // 实际应用中可以通过界面设置
  const highPriorityPrograms = allPrograms.filter(p => 
    p.name.includes('derive') || p.name.includes('create')
  );
  highPriorityPrograms.forEach(p => p.priority = 2);
  
  // 4. 排序（示例：按优先级降序，然后按名称升序）
  const sortedPrograms = [...allPrograms]
    .sort((a, b) => sortFunctions.priorityDesc(a, b) || sortFunctions.nameAsc(a, b));
  
  // 5. 添加到队列
  sasQueue = [...sortedPrograms];
  
  // 6. 开始处理队列
  processQueue();
}

// 启动
main();