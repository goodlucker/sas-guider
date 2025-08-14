function convertToUnicode() {
    const inputText = document.getElementById('inputText').value;
    const outputDiv = document.getElementById('output');

    if (!inputText) {
        outputDiv.textContent = "请输入要转换的文本";
        return;
    }

    let result = '';
    for (let i = 0; i < inputText.length; i++) {
        const codePoint = inputText.codePointAt(i);
        if (codePoint > 0xffff) {
            i++; // 跳过代理对的第二部分
        }
        const hexValue = codePoint.toString(16).toUpperCase();
        const formattedCode = 'U+' + hexValue.padStart(4, '0');
        result += `${formattedCode}\n`;
    }

    outputDiv.textContent = result;
}