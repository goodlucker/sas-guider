# Encoding

| 网站描述                                                 | 链接                                                                                                                                                             |
| -------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| SAS 官方文档（Encoding）                                 | [https://documentation.sas.com/doc/en/pgmsascdc/v_037/engxml/n1v1k2v1w1v1n1.htm](https://documentation.sas.com/doc/en/pgmsascdc/v_037/engxml/n1v1k2v1w1v1n1.htm) |
| SAS 9.4 National Language Support (NLS): Reference Guide | [https://documentation.sas.com/doc/en/nlsref/9.4/n1v1k2v1w1v1n1.htm](https://documentation.sas.com/doc/en/nlsref/9.4/n1v1k2v1w1v1n1.htm)                         |
| SAS Community：SAS encoding 讨论                         | [https://communities.sas.com/t5/SAS-Programming/Encoding-in-SAS/td-p/276326](https://communities.sas.com/t5/SAS-Programming/Encoding-in-SAS/td-p/276326)         |
| SAS Support：Encoding and Character Sets                 | [https://support.sas.com/kb/22/390.html](https://support.sas.com/kb/22/390.html)                                                                                 |
| SAS Blogs：Understanding SAS encoding                    | [https://blogs.sas.com/content/sasdummy/2012/10/10/encoding-in-sas/](https://blogs.sas.com/content/sasdummy/2012/10/10/encoding-in-sas/)                         |

 字符转Unicode工具 body { font-family: Arial, sans-serif; max-width: 800px; margin: 20px auto; padding: 20px; } .container { background-color: #f5f5f5; padding: 20px; border-radius: 8px; box-shadow: 0 2px 4px rgba(0,0,0,0.1); } h1 { color: #333; text-align: center; margin-bottom: 30px; } .input-group { margin-bottom: 20px; } textarea { width: 100%; height: 100px; padding: 10px; border: 1px solid #ddd; border-radius: 4px; resize: vertical; } button { background-color: #4CAF50; color: white; padding: 10px 20px; border: none; border-radius: 4px; cursor: pointer; font-size: 16px; transition: background-color 0.3s; } button:hover { background-color: #45a049; } #output { margin-top: 20px; padding: 15px; background-color: white; border: 1px solid #ddd; border-radius: 4px; white-space: pre-wrap; word-wrap: break-word; min-height: 50px; }

# 字符转Unicode工具

转换为Unicode

function convertToUnicode() { const inputText = document.getElementById('inputText').value; const outputDiv = document.getElementById('output'); if (!inputText) { outputDiv.textContent = "请输入要转换的文本"; return; } let result = ''; for (let i = 0; i < inputText.length; i++) { // 获取字符的Unicode编码 const codePoint = inputText.codePointAt(i); // 处理代理对（Surrogate pairs） if (codePoint > 0xffff) { i++; // 跳过代理对的第二部分 } // 转换为十六进制并格式化 const hexValue = codePoint.toString(16).toUpperCase(); const formattedCode = 'U+' + hexValue.padStart(4, '0'); result += \`${formattedCode}\\n\`; } outputDiv.textContent = result; }