# Simple Statistics使用指南

<!-- 在 Markdown 中嵌入 HTML 和 JS，假设 simple-statistics.min.js 已本地托管在 /assets/js/ 目录下 -->

<div>
  <h3>均值计算示例</h3>
  <input id="numbers" type="text" value="1,2,3,4,5" />
  <button onclick="calcMean()">计算均值</button>
  <p id="result"></p>
</div>

<script src="/assets/js/simple-statistics.min.js"></script>
<script>
function calcMean() {
  const nums = document.getElementById('numbers').value
    .split(',')
    .map(Number)
    .filter(n => !isNaN(n));
  const mean = ss.mean(nums); // ss 为 simple-statistics 的全局对象
  document.getElementById('result').innerText = '均值: ' + mean;
}
</script>