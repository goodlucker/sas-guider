# SAS 批量执行系统

## 使用说明

这是一个通过 JavaScript 调用 SAS 程序批量执行的解决方案。

## 脚本实现

```html
<script>
// 直接内联的 JavaScript 代码
document.addEventListener('DOMContentLoaded', () => {
  console.log('脚本已加载');
  document.getElementById('demo').textContent = 'Hello from inline JS!';
});
</script>
<div id="sas-control-panel">
  <h2>SAS 程序批量执行</h2>
  
  <div>
    <label>选择模块：</label>
    <select id="module-select">
      <option value="metadata">metadata</option>
      <option value="sdtm">sdtm</option>
      <option value="adam">adam</option>
      <option value="tlfs">tlfs</option>
      <option value="other">other</option>
    </select>
    
    <button id="load-programs">加载程序</button>
  </div>
  
  <div>
    <h3>程序列表</h3>
    <table id="program-table" border="1">
      <thead>
        <tr>
          <th><a href="#" onclick="sortPrograms('name')">程序名 ▲▼</a></th>
          <th><a href="#" onclick="sortPrograms('date')">修改日期 ▲▼</a></th>
          <th><a href="#" onclick="sortPrograms('priority')">优先级 ▲▼</a></th>
          <th>操作</th>
        </tr>
      </thead>
      <tbody id="program-list"></tbody>
    </table>
  </div>
  
  <div>
    <button id="run-selected">执行选中</button>
    <button id="run-all">全部执行</button>
  </div>
  
  <div id="log-output" style="margin-top: 20px; border: 1px solid #ccc; padding: 10px; height: 200px; overflow: auto;"></div>
</div>

<script>
// 配置对象
const config = {
  modules: {
    metadata: 'metadata',
    sdtm: 'sdtm',
    adam: 'adam',
    tlfs: 'tlfs',
    other: 'other'
  },
  baseDir: './sas_programs'
};

// 存储程序数据
let sasPrograms = [];
let currentSortField = 'name';
let sortDirection = 1; // 1=升序, -1=降序

// 加载程序列表
async function loadPrograms(module) {
  try {
    // 实际应用中这里应该是从服务器获取数据
    // 示例使用虚拟数据
    sasPrograms = [
      { name: 'dm_derive.sas', module: 'sdtm', priority: 2, mtime: '2023-05-15' },
      { name: 'ae_analysis.sas', module: 'adam', priority: 1, mtime: '2023-05-10' },
      { name: 'tl_metrics.sas', module: 'tlfs', priority: 3, mtime: '2023-05-18' }
    ];
    
    renderProgramList();
    logMessage(`${module} 模块加载成功，共 ${sasPrograms.length} 个程序`);
  } catch (error) {
    logMessage(`加载失败: ${error.message}`, 'error');
  }
}

// 渲染程序列表
function renderProgramList() {
  const tbody = document.getElementById('program-list');
  tbody.innerHTML = '';
  
  sasPrograms.sort((a, b) => {
    if (a[currentSortField] > b[currentSortField]) return sortDirection;
    if (a[currentSortField] < b[currentSortField]) return -sortDirection;
    return 0;
  });
  
  sasPrograms.forEach(program => {
    const tr = document.createElement('tr');
    tr.innerHTML = `
      <td>${program.name}</td>
      <td>${program.mtime}</td>
      <td>
        <select class="priority-select" data-name="${program.name}">
          <option value="0" ${program.priority === 0 ? 'selected' : ''}>低</option>
          <option value="1" ${program.priority === 1 ? 'selected' : ''}>中</option>
          <option value="2" ${program.priority === 2 ? 'selected' : ''}>高</option>
        </select>
      </td>
      <td><button class="run-btn" data-name="${program.name}">执行</button></td>
    `;
    tbody.appendChild(tr);
  });
  
  // 添加事件监听
  document.querySelectorAll('.priority-select').forEach(select => {
    select.addEventListener('change', (e) => {
      const programName = e.target.getAttribute('data-name');
      const program = sasPrograms.find(p => p.name === programName);
      if (program) program.priority = parseInt(e.target.value);
    });
  });
  
  document.querySelectorAll('.run-btn').forEach(btn => {
    btn.addEventListener('click', (e) => {
      const programName = e.target.getAttribute('data-name');
      runProgram(programName);
    });
  });
}

// 排序程序
function sortPrograms(field) {
  if (currentSortField === field) {
    sortDirection *= -1; // 切换排序方向
  } else {
    currentSortField = field;
    sortDirection = 1;
  }
  renderProgramList();
}

// 执行程序
function runProgram(programName) {
  const program = sasPrograms.find(p => p.name === programName);
  if (!program) return;
  
  logMessage(`开始执行: ${program.name} (优先级: ${program.priority})`);
  
  // 实际应用中这里应该是调用服务器API
  setTimeout(() => {
    logMessage(`完成执行: ${program.name}`);
  }, 2000);
}

// 日志输出
function logMessage(message, type = 'info') {
  const logDiv = document.getElementById('log-output');
  const p = document.createElement('p');
  p.style.color = type === 'error' ? 'red' : 'black';
  p.textContent = `[${new Date().toLocaleTimeString()}] ${message}`;
  logDiv.appendChild(p);
  logDiv.scrollTop = logDiv.scrollHeight;
}

// 初始化事件
document.getElementById('load-programs').addEventListener('click', () => {
  const module = document.getElementById('module-select').value;
  loadPrograms(module);
});

document.getElementById('run-selected').addEventListener('click', () => {
  const selected = sasPrograms.filter(p => p.priority > 0);
  if (selected.length === 0) {
    logMessage('请先设置要执行的程序优先级', 'error');
    return;
  }
  
  logMessage(`开始批量执行 ${selected.length} 个程序...`);
  selected.forEach(p => runProgram(p.name));
});

document.getElementById('run-all').addEventListener('click', () => {
  logMessage(`开始执行全部 ${sasPrograms.length} 个程序...`);
  sasPrograms.forEach(p => runProgram(p.name));
});
</script>