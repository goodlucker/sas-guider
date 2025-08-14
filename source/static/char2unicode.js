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
        // 使用codePointAt后，如果字符是代理对，会自动跳过下一个代码单元
        // 但我们仍需要手动调整索引
        if (codePoint > 0xFFFF) {
            i++; // 跳过代理对的第二部分
        }
        const hexValue = codePoint.toString(16).toUpperCase();
        const formattedCode = 'U+' + hexValue.padStart(4, '0');
        result += `${formattedCode}\n`;
    }
    
    outputDiv.textContent = result;
}

// 添加复制到剪贴板功能
function copyToClipboard() {
    const outputDiv = document.getElementById('output');
    if (outputDiv.textContent) {
        navigator.clipboard.writeText(outputDiv.textContent)
            .then(() => {
                alert('已复制到剪贴板！');
            })
            .catch(err => {
                console.error('复制失败: ', err);
                alert('复制失败，请手动复制。');
            });
    }
}

// 添加清空输入功能
function clearInput() {
    document.getElementById('inputText').value = '';
    document.getElementById('output').textContent = '';
}