# 字符转Unicode工具

以下是使用HTML和JavaScript实现的一个字符转Unicode的网页工具。该工具允许用户输入文本，并将其转换为相应的Unicode编码。

**HTML结构**

```html
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <title>字符转Unicode工具</title>
    <link rel="stylesheet" href="unicode.css">
</head>
<body>
    <div class="container">
        <h1>字符转Unicode工具</h1>
        <div class="input-group">
            <textarea id="inputText" placeholder="请输入要转换的文本..."></textarea>
        </div>
        <div class="button-group">
            <button onclick="convertToUnicode()">转换为Unicode</button>
            <button onclick="copyToClipboard()">复制结果</button>
            <button onclick="clearInput()">清空</button>
        </div>
        <div id="output"></div>
    </div>
    <script src="char2unicode.js"></script>
</body>
</html>
