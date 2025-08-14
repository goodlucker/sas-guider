# 字符转Unicode工具

以下是使用HTML和JavaScript实现的一个字符转Unicode的网页工具。该工具允许用户输入文本，并将其转换为相应的Unicode编码。

<style>
        body {
            font-family: Arial, sans-serif;
            max-width: 800px;
            margin: 20px auto;
            padding: 20px;
        }

        .container {
            background-color: #f5f5f5;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        .input-group textarea {
            width: 100%;
            min-height: 100px;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-family: Arial, sans-serif;
            font-size: 14px;
            resize: vertical;
        }

        .button-group {
            margin: 15px 0;
        }

        .button-group button {
            background-color: #4CAF50;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 14px;
            transition: background-color 0.3s;
            margin-right: 10px;
        }

        .button-group button:hover {
            background-color: #45a049;
        }

        .button-group button:last-child {
            margin-right: 0;
        }

        #output {
            margin-top: 20px;
            padding: 15px;
            background-color: white;
            border: 1px solid #ddd;
            border-radius: 4px;
            white-space: pre-wrap;
            word-wrap: break-word;
            min-height: 50px;
            font-family: monospace;
            font-size: 14px;
        }
</style>
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
<script src="char2unicode.js">
</script>
