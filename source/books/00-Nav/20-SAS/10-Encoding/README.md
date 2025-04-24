# Encoding

| 网站描述                                                 | 链接                                                                                                                                                             |
| -------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| SAS 官方文档（Encoding）                                 | [https://documentation.sas.com/doc/en/pgmsascdc/v_037/engxml/n1v1k2v1w1v1n1.htm](https://documentation.sas.com/doc/en/pgmsascdc/v_037/engxml/n1v1k2v1w1v1n1.htm) |
| SAS 9.4 National Language Support (NLS): Reference Guide | [https://documentation.sas.com/doc/en/nlsref/9.4/n1v1k2v1w1v1n1.htm](https://documentation.sas.com/doc/en/nlsref/9.4/n1v1k2v1w1v1n1.htm)                         |
| SAS Community：SAS encoding 讨论                         | [https://communities.sas.com/t5/SAS-Programming/Encoding-in-SAS/td-p/276326](https://communities.sas.com/t5/SAS-Programming/Encoding-in-SAS/td-p/276326)         |
| SAS Support：Encoding and Character Sets                 | [https://support.sas.com/kb/22/390.html](https://support.sas.com/kb/22/390.html)                                                                                 |
| SAS Blogs：Understanding SAS encoding                    | [https://blogs.sas.com/content/sasdummy/2012/10/10/encoding-in-sas/](https://blogs.sas.com/content/sasdummy/2012/10/10/encoding-in-sas/)                         |

# Unicode 转换工具

这是一个嵌入式字符转换工具：

<!-- 开始嵌入 -->
<!DOCTYPE html>
<script>
//<![CDATA[
document.write(`
<style>
body { font-family: Arial; max-width: 800px; margin: 20px auto; padding: 20px; }
.container { background: #f5f5f5; padding: 20px; border-radius: 8px; }
textarea { width: 100%; height: 100px; padding: 10px; }
button { background: #4CAF50; color: white; padding: 10px 20px; border: none; }
#output { margin-top: 20px; padding: 15px; background: white; }
</style>

<div class="container">
  <h1>字符转Unicode工具</h1>
  <textarea id="inputText" placeholder="输入文本..."></textarea>
  <button onclick="convertToUnicode()">转换</button>
  <div id="output"></div>
</div>

<script>
function convertToUnicode() {
  const input = document.getElementById('inputText').value;
  let result = '';
  for (let i = 0; i < input.length; i++) {
    const code = input.codePointAt(i);
    if (code > 0xffff) i++;
    result += 'U+' + code.toString(16).padStart(4, '0') + '\\n';
  }
  document.getElementById('output').textContent = result;
}
<\/script>
`);
//]]>
</script>
<noscript>需要启用 JavaScript</noscript>
<!-- 结束嵌入 -->

## 使用说明
1. 在文本框中输入文字
2. 点击转换按钮