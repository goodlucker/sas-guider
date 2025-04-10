# Markdown使用指南

# Markdown 标题语法

要创建标题，请在单词或短语前面添加井号 (#) 。# 的数量代表了标题的级别。例如，添加三个 # 表示创建一个三级标题(例如：### My Header)。

![](https://img.zconnect.cn/faq/a0a6720425f3bf1eb249d180c4520a33.jpg)

不同的 Markdown 应用程序处理 # 和标题之间的空格方式并不一致。为了兼容考虑，请用一个空格在 # 和标题之间进行分隔。

![](https://img.zconnect.cn/faq/876d8435344b43364c5a94b4f10f6399.jpg)

# Markdown强调语法

通过将文本设置为粗体、斜体或高亮标记来强调其重要性。

## 粗体（Bold）

要加粗文本，请在单词或短语的前后各添加两个星号（asterisks）或两个下划线（underscores）。如需加粗一个单词或短语的中间部分用以表示强调的话，请在要加粗部分的两侧各添加两个星号（asterisks）。

![](https://img.zconnect.cn/faq/b29a7a7aac90e18ef298d291b1fcab33.jpg)

Markdown应用程序在如何处理单词或短语中间的下划线上并不一致。为兼容考虑，在单词或短语中间部分加粗的话，请使用星号（asterisks）。

![](https://img.zconnect.cn/faq/8283f4f9123597d1944e95596528783d.jpg)

## 斜体（Italic）

要用斜体显示文本，请在单词或短语前后添加一个星号（asterisk）或下划线（underscore）。要斜体突出单词的中间部分，请在前后各添加一个星号，中间不要带空格。

![](https://img.zconnect.cn/faq/a3e0e51858dc76e61af62e33826ec394.jpg)

Markdown 应用程序在如何处理单词或短语中间的下划线上并不一致。为兼容考虑，在单词或短语中间部分斜体处理的话，请使用星号（asterisks）。

![](https://img.zconnect.cn/faq/f7e3d59a5d23a7d542141dda01eee14e.jpg)

## 粗体（Bold）和斜体（Italic）

要同时用粗体和斜体突出显示文本，请在单词或短语的前后各添加三个星号或下划线。要加粗并用斜体显示单词或短语的中间部分，请在要突出显示的部分前后各添加三个星号，中间不要带空格。

![](https://img.zconnect.cn/faq/e785cfe856ba418b2dc019863a146ee4.jpg)

Markdown 应用程序在处理单词或短语中间添加的下划线上并不一致。为了实现兼容性，请使用星号将单词或短语的中间部分加粗并以斜体显示，以示重要。

![](https://img.zconnect.cn/faq/b353a71a483a37a9baaaba898f46c6d5.jpg)

## Markdown文本高亮标记

支持在 Markdown 中对文本进行高亮标记，其语法为使用双等号==对需要进行高亮标记的文本进行包裹，例如：

\# ==很重要的==一段  
这是普通文本==这是高亮文本==这是普通文本  
\==这还是高亮文本==

上述文本会被解析渲染为如下的内容：

![](https://img.zconnect.cn/faq/8bbc3d94dab0e9d5cb25d661ae78b11c.jpg)

# Markdown 引用语法

要创建块引用，请在段落前添加一个 > 符号。

\> Dorothy followed her through many of the beautiful rooms in her castle.

渲染效果如下所示：

![](https://img.zconnect.cn/faq/bbbf363b23c7c6b5e96cf7e88b0dcee5.jpg)

# Markdown 代码语法

要将单词或短语表示为代码，请将其包裹在反引号 ( \` ) 中。

At the command prompt, type \`nano\`

渲染效果如下所示：

![](https://img.zconnect.cn/faq/cd45305b9b6cc1daca3af78f9571e626.jpg)

## 转义反引号

如果你要表示为代码的单词或短语中包含一个或多个反引号，则可以通过将单词或短语包裹在双反引号( \`\` )中。

![](https://img.zconnect.cn/faq/c8bb044b7eafaa79a7410bd274472bf0.jpg)

# Markdown 围栏代码块

可以使用三个反引号( \`\`\` ) 后接语言的名称，使用特定语言的代码块，如下所示：

\`\`\`python  
import datetime  
print(datetime.date.today())  
\`\`\`

渲染效果如下：

# ![](https://img.zconnect.cn/faq/cd761b5457098f8ec1bc66bc61662502.jpg)

# Markdown 分隔线语法

要创建分隔线，请在单独一行上使用三个或多个星号 (\*\*\*)、破折号 (---) 或下划线 (\_\_\_) ，并且不能包含其他内容。

![](https://img.zconnect.cn/faq/d0cb3bdbc4f6fc9bfe5e8aefe4ce0091.jpg)

以上三个分隔线的渲染效果看起来都一样。

# Markdown 删除线

此功能可以指示某些单词是一个错误，要从文档中删除。若要删除单词，请在单词前后使用两个波浪号~~。

如：~~夏天下雪是正常的。~~ 冬天下雪才是正常的。

渲染效果如下：

![](https://img.zconnect.cn/faq/186bd99382b6cbd7fb8159fbc1137eba.jpg)

# Markdown列表

## 无序列表（减号）Unordered Lists (-)

如果需要在文档中插入无序列表，可以直接使用-符号对内容进行标识，如下所示：

\- 列表一  
\- 列表二  
\- 列表三

上面的内容将会渲染为如下所示的内容：

![](https://img.zconnect.cn/faq/740e0b87679cb59c96a49544662babbe.jpg)

## 无序列表（星号）Unordered Lists (\*)

同时，\*号也可以实现无序列表，如下所示：

\* 列表一  
\* 列表二  
\* 列表三

上面的内容同样会渲染为下面的形式：

![](https://img.zconnect.cn/faq/8d67ca1c26df7e96a68e056258467b34.jpg)

## 无序列表（加号和嵌套）Unordered Lists (+)

无序列表也可以进行嵌套，如下所示：

\+ 列表一  
\+ 列表二  
    + 列表二-1  
    + 列表二-2  
    + 列表二-3  
\+ 列表三  
    \* 列表一  
    \* 列表二  
    \* 列表三

上述内容将会渲染为下面的形式：

![](https://img.zconnect.cn/faq/f8cd3e79999cad36ae40a599c5b7f20e.jpg)

## 有序列表 Ordered Lists (-)

除了无序列表，有序列表可以直接使用数字+（.） 进行标识，如下所示：

1\. 第一行  
2\. 第二行  
3\. 第三行

上述内容将会渲染为下面的形式：

![](https://img.zconnect.cn/faq/ddd3d53a058bcc148b42f000ac9a8b0a.jpg)

## 任务列表

任务列表使您可以创建带有复选框的项目列表。在支持任务列表的Markdown应用程序中，复选框将显示在内容旁边。要创建任务列表，请在任务列表项之前添加破折号-和方括号\[ \]，并在\[ \]前面加上空格。要选择一个复选框，请在方括号\[x\]之间添加 x 。如下所示：

\- \[x\] GFM 任务 1  
\- \[x\] GFM 任务 2  
\- \[ \] GFM 任务 3  
    - \[ \] GFM 任务 3-1  
    - \[ \] GFM 任务 3-2  
    - \[ \] GFM 任务 3-3  
\- \[ \] GFM 任务 4  
    - \[ \] GFM 任务 4-1  
    - \[ \] GFM 任务 4-2

渲染效果如下：

![](https://img.zconnect.cn/faq/d2344535b584bdaf0d35d6be8d4e6c13.jpg)

# Markdown 链接语法

如果需要添加链接，可以使用语法：

\[链接名称\](链接地址)

比如：

\[必应\](https://cn.bing.com/?mkt=zh-CN)

上述内容将会渲染为如下的链接：

[必应](https://cn.bing.com/?mkt=zh-CN/)

# Markdown 图片语法

要添加图像，请使用感叹号 ( ! ), 然后在方括号增加替代文本，图片链接放在圆括号里，括号里的链接后可以增加一个可选的图片标题文本。

1、图片的语法为：!\[图片说明\](图片地址)

2、指定图片大小：!\[ \](图片地址#size=宽度x高度)

例如：!\[风景\](https://uploadfile.bizhizu.cn/2017/0701/20170701031430776.jpg#size=100x100)

图片将显示为100x100的大小：

![](https://img.zconnect.cn/faq/2b80c9a9c18864f71706861ba7c2c540.jpg)

# Markdown 公式

## 单行公式

如果你需要编写单行公式，那么可以使用$$符号将公式包裹起来，如下所示：

$$E=mc^2$$

上述内容将会渲染为如下的公式：

![](https://img.zconnect.cn/faq/70711fa4f81554b5c51068b0bc9a4627.jpg)