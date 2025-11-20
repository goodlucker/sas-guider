# Function 概览与分类

- 概览：SAS 函数覆盖字符串、日期时间、数组与变量信息、数学与统计、随机数、分布与分位数、宏相关等常见处理需求，是 `DATA STEP` 与宏编程的基础能力。

## 分类与示例

| 分类 | 常见函数 | 用途说明 | 典型用法 |
| --- | --- | --- | --- |
| 字符函数 | `TRIM`、`UPCASE`、`LOWCASE`、`INDEX`、`SUBSTR`、`TRANWRD`、`PROPCASE`、`CATX`、`COMPBL`、`COMPRESS`、`FIND/FINDC/FINDW`、`SCAN`、`STRIP`、`COUNT/COUNTC/COUNTW` | 字符清洗、大小写转换、查找与替换、分词与计数 | `UPCASE('abc') -> 'ABC'`；`TRANWRD('a_b','_','-') -> 'a-b'` |
| 日期与时间函数 | `MDY`、`YEAR`、`MONTH`、`DATE/TODAY`、`DHMS`、`INTNX`、`INTCK`、`YRDIF` | 构造日期、日期拆解、日期时间计算与间隔统计 | `MDY(12,31,2025)`；`INTNX('month','01JAN2025'd,1)` |
| 数组与变量信息函数 | `VNAME`、`VTYPE`、`VLENGTH`；结合 `ARRAY` | 批量变量处理、变量元信息获取 | `VNAME(x)` 返回变量名；`ARRAY nums[*] x1-x10;` 批量遍历 |
| 数学函数 | `ROUND`、`SUM`、`MEAN`、`STD`、`LOG`、`EXP`、`MIN`、`MAX` | 基本数值运算与变换 | `ROUND(3.1415,0.01) -> 3.14`；`LOG(EXP(1)) -> 1` |
| 描述统计函数 | `MEAN`、`MEDIAN`、`STD`、`VAR`、`NMISS/CMISS` | 样本统计量与缺失计数 | `MEAN(of x1-x5)`；`NMISS(of x1-x5)` |
| 逻辑与特殊函数 | `IFC`、`MISSING`、`COALESCEC`、`REVERSE` | 条件返回、缺失判断、首个非缺失取值、字符串反转 | `IFC(age>=18,'Adult','Child')`；`MISSING(val)` |
| 随机数函数 | `RAND('normal'|'uniform'|...)` | 生成随机样本用于模拟或重采样 | `RAND('normal',0,1)` |
| 分布密度/分布函数 | `PDF('dist', ...)`、`CDF('dist', ...)` | 计算概率密度与累计分布 | `PDF('normal',x,0,1)`；`CDF('binomial',k,n,p)` |
| 分位数函数 | `QUANTILE('dist', p)` | 计算分布的分位点 | `QUANTILE('normal',0.95)` |
| 宏相关函数 | `%SYSFUNC`、`SYMGET`、`SYMPUTX`、`%QSCAN`、`%QSUBSTR` | 宏中调用函数、宏-数据步变量交互、带转义的文本处理 | `%SYSFUNC(today())`；`SYMPUTX('m',value)` |

## 快速链接
| 网站描述 | 链接 |
| --- | --- |
| SAS 官方函数文档 | [https://documentation.sas.com/doc/en/pgmsascdc/v_037/lefunctionsref/titlepage.htm](https://documentation.sas.com/doc/en/pgmsascdc/v_037/lefunctionsref/titlepage.htm) |
| SAS 9.4 Functions and CALL Routines: Reference | [https://documentation.sas.com/doc/en/lefunctionsref/9.4/titlepage.htm](https://documentation.sas.com/doc/en/lefunctionsref/9.4/titlepage.htm) |
| SAS Support：Functions by Category | [https://support.sas.com/documentation/cdl/en/lefunctionsref/67960/HTML/default/viewer.htm#n1v1k2v1w1v1n1.htm](https://support.sas.com/documentation/cdl/en/lefunctionsref/67960/HTML/default/viewer.htm#n1v1k2v1w1v1n1.htm) |
| SAS Community：SAS Functions 讨论 | [https://communities.sas.com/t5/SAS-Programming/bd-p/programming](https://communities.sas.com/t5/SAS-Programming/bd-p/programming) |
| SAS Functions Cheat Sheet | [https://www.listendata.com/2015/02/sas-functions-cheat-sheet.html](https://www.listendata.com/2015/02/sas-functions-cheat-sheet.html) |
