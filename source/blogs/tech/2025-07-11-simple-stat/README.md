# Simple Statistics使用指南

<!-- 在 Markdown 中嵌入 HTML 和 JS，simple-statistics.min.js 通过 GitHub CDN 引用 -->

​```html
<head>
  <meta charset="UTF-8">
  <title>Excel Sheet 转 JSON 工具</title>
  <script src="https://cdn.jsdelivr.net/npm/xlsx@0.18.5/dist/xlsx.full.min.js"></script>
  <style>
    body { font-family: Arial; background: #f5f5f5; }
    .container { max-width: 600px; margin: 40px auto; background: #fff; border-radius: 8px; box-shadow: 0 2px 8px #ccc; padding: 24px; }
    .row { margin-bottom: 16px; }
    label { margin-right: 8px; }
    select, input[type="file"] { min-width: 180px; }
    button { margin-right: 8px; }
    pre { background: #f8f8f8; padding: 12px; min-height: 120px; border-radius: 4px; }
  </style>
</head>
<body>
  <div class="container">
    <h2>Excel Sheet 转 JSON 工具</h2>
    <div class="row">
      <input type="file" id="excelFile" accept=".xlsx, .xls" />
    </div>
    <div class="row">
      <label for="sheetSelect">选择 Sheet：</label>
      <select id="sheetSelect" disabled>
        <option value="">请先选择Excel文件</option>
      </select>
    </div>
    <div class="row">
      <button id="importBtn" disabled>导入</button>
      <button id="exportBtn" disabled>导出 JSON</button>
    </div>
    <div class="row">
      <strong>JSON 结果：</strong>
      <pre id="output"></pre>
    </div>
  </div>
  <script>
    let workbook = null;
    let lastJson = null;

    document.getElementById('excelFile').addEventListener('change', function(e) {
      const file = e.target.files[0];
      const sheetSelect = document.getElementById('sheetSelect');
      const importBtn = document.getElementById('importBtn');
      const output = document.getElementById('output');
      sheetSelect.innerHTML = '<option value="">正在读取Sheet列表...</option>';
      sheetSelect.disabled = true;
      importBtn.disabled = true;
      output.textContent = '';
      lastJson = null;
      document.getElementById('exportBtn').disabled = true;

      if (!file) {
        sheetSelect.innerHTML = '<option value="">请先选择Excel文件</option>';
        return;
      }
      const reader = new FileReader();
      reader.onload = function(e) {
        try {
          const data = new Uint8Array(e.target.result);
          workbook = XLSX.read(data, {type: 'array'});
          const sheetNames = workbook.SheetNames;
          if (sheetNames.length === 0) {
            sheetSelect.innerHTML = '<option value="">未检测到Sheet</option>';
            return;
          }
          sheetSelect.innerHTML = '';
          sheetNames.forEach(name => {
            const opt = document.createElement('option');
            opt.value = name;
            opt.textContent = name;
            sheetSelect.appendChild(opt);
          });
          sheetSelect.disabled = false;
          importBtn.disabled = false;
        } catch (err) {
          sheetSelect.innerHTML = '<option value="">文件解析失败</option>';
          output.textContent = '解析失败: ' + err.message;
        }
      };
      reader.readAsArrayBuffer(file);
    });

    document.getElementById('importBtn').onclick = function() {
      const sheetName = document.getElementById('sheetSelect').value;
      const output = document.getElementById('output');
      if (!workbook || !sheetName) {
        output.textContent = '请先选择Excel文件和Sheet名';
        return;
      }
      try {
        const worksheet = workbook.Sheets[sheetName];
        const json = XLSX.utils.sheet_to_json(worksheet, {defval: ''});
        output.textContent = JSON.stringify(json, null, 2);
        lastJson = json;
        document.getElementById('exportBtn').disabled = false;
      } catch (err) {
        output.textContent = 'Sheet解析失败: ' + err.message;
        lastJson = null;
        document.getElementById('exportBtn').disabled = true;
      }
    };

    document.getElementById('exportBtn').onclick = function() {
      if (!lastJson) return;
      const blob = new Blob([JSON.stringify(lastJson, null, 2)], {type: 'application/json'});
      const url = URL.createObjectURL(blob);
      const a = document.createElement('a');
      a.href = url;
      a.download = 'result.json';
      document.body.appendChild(a);
      a.click();
      document.body.removeChild(a);
      URL.revokeObjectURL(url);
    };
  </script>
</body>
​```