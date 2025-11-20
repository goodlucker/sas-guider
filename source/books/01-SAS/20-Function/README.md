# Function 概览与分类

- 概览：SAS 函数覆盖字符串、日期时间、数组与变量信息、数学与统计、随机数、分布与分位数、宏相关等常见处理需求，是 `DATA STEP` 与宏编程的基础能力。

## 分类与示例

### 字符函数
| 函数 | 描述 | 典型用法 |
| --- | --- | --- |
| `TRIM` | 去掉尾随空格 | `TRIM('a  ') -> 'a'` |
| `STRIP` | 去掉首尾空格 | `STRIP(' a ') -> 'a'` |
| `LEFT` | 去掉左侧空格 | `LEFT('  a') -> 'a'` |
| `UPCASE` | 转换为大写 | `UPCASE('abc') -> 'ABC'` |
| `LOWCASE` | 转换为小写 | `LOWCASE('ABC') -> 'abc'` |
| `PROPCASE` | 每个词首字母大写 | `PROPCASE('sas macros') -> 'Sas Macros'` |
| `INDEX` | 查找子串位置，找不到返回 0 | `INDEX('abc','b') -> 2` |
| `INDEXC` | 查找多个子串任一首次出现位置 | `INDEXC('abc','x','b') -> 2` |
| `SUBSTR` | 提取子串（起始、长度） | `SUBSTR('abcdef',2,3) -> 'bcd'` |
| `TRANWRD` | 替换所有匹配子串 | `TRANWRD('a_b_c','_','-') -> 'a-b-c'` |
| `CATX` | 连接并插入分隔符 | `CATX('-', 'a','b') -> 'a-b'` |
| `COMPBL` | 多空格压缩为单空格 | `COMPBL('a   b') -> 'a b'` |
| `COMPRESS` | 移除指定字符（支持修饰符） | `COMPRESS('a b c') -> 'abc'` |
| `FIND` | 查找子串位置，支持 `i` 忽略大小写 | `FIND('abc','B','i') -> 2` |
| `FINDC` | 查找字符集任一字符位置，支持修饰符 | `FINDC('ab1','012') -> 3` |
| `FINDW` | 查找完整词位置（按分隔符） | `FINDW('a b c','b') -> 3` |
| `SCAN` | 提取第 n 个词（可设分隔符与修饰） | `SCAN('a,b,c',2,',') -> 'b'` |
| `COUNT` | 统计子串出现次数（支持 `i`） | `COUNT('abab','ab') -> 2` |
| `COUNTC` | 统计字符集中任一字符出现次数 | `COUNTC('a1b2','12') -> 2` |
| `COUNTW` | 统计词个数（分隔符可设） | `COUNTW('a b c') -> 3` |
| `VERIFY` | 返回第一个不在字符集内的位置 | `VERIFY('abc','ab') -> 3` |
| `TRANSLATE` | 单字符替换映射 | `TRANSLATE('abc','12','ab') -> '12c'` |
| `REPEAT` | 重复字符串 n 次 | `REPEAT('a',3) -> 'aaa'` |
| `ANYALNUM` | 从起始位置查找数字或字母 | `ANYALNUM('$A',1) -> 2` |
| `ANYALPHA` | 查找字母位置 | `ANYALPHA('1a',1) -> 2` |
| `ANYDIGIT` | 查找数字位置 | `ANYDIGIT('a1',1) -> 2` |
| `ANYPUNCT` | 查找标点位置 | `ANYPUNCT('a!',1) -> 2` |
| `ANYSPACE` | 查找空白位置 | `ANYSPACE('a b',1) -> 2` |
| `ANYUPPER` | 查找大写位置 | `ANYUPPER('Ab',1) -> 1` |
| `NOTALNUM` | 查找第一个非字母数字位置 | `NOTALNUM('ab$',1) -> 3` |
| `NOTALPHA` | 查找第一个非字母位置 | `NOTALPHA('a1',1) -> 2` |
| `NOTUPPER` | 查找第一个非大写字母位置 | `NOTUPPER('Aa',1) -> 2` |
| `CALLCATS` | 去首尾空格并连接多个字符串到目标变量 | `CALL CATS(out,' a','b ',' c '); /* out='abc' */` |
| `CALL CATX` | 按分隔符连接多个字符串到目标变量 | `CALL CATX('-',out,'a',' b'); /* out='a-b' */` |

### 日期与时间函数
| 函数 | 描述 | 典型用法 |
| --- | --- | --- |
| `MDY` | 生成指定年月日的 SAS 日期值 | `MDY(12,31,2025)` |
| `YEAR` | 由 SAS 日期值得到年份 | `YEAR('01JAN2025'd) -> 2025` |
| `MONTH` | 由 SAS 日期值得到月份 | `MONTH('01JAN2025'd) -> 1` |
| `DATE`/`TODAY` | 返回当前 SAS 日期值 | `TODAY()` |
| `DHMS` | 生成 SAS 日期时间值（datetime） | `DHMS('01JAN2025'd,8,0,0)` |
| `INTNX` | 日期平移（按周期） | `INTNX('month','01JAN2025'd,1)` |
| `INTCK` | 计算两个日期间的周期数 | `INTCK('day','01JAN2025'd,'10JAN2025'd) -> 9` |
| `YRDIF` | 计算年份差（支持方法） | `YRDIF('01JAN2024'd,'01JAN2025'd,'ACT/ACT') -> 1` |

### 数组与变量信息函数
| 函数 | 描述 | 典型用法 |
| --- | --- | --- |
| `VNAME` | 返回变量名称 | `VNAME(x) -> 'x'` |
| `VTYPE` | 返回变量类型（`C`/`N`） | `VTYPE(x) -> 'N'` |
| `VLENGTH` | 返回变量长度 | `VLENGTH(name)` |
| `ARRAY` | 批量变量处理（语法） | `ARRAY nums[*] x1-x10;` |

### 数学函数
| 函数 | 描述 | 典型用法 |
| --- | --- | --- |
| `ROUND` | 四舍五入（可设单位） | `ROUND(3.1415,0.01) -> 3.14` |
| `SUM` | 求和 | `SUM(of x1-x5)` |
| `MEAN` | 平均值 | `MEAN(of x1-x5)` |
| `STD` | 标准差 | `STD(of x1-x5)` |
| `LOG`/`EXP` | 对数/指数 | `LOG(EXP(1)) -> 1` |
| `MIN`/`MAX` | 最小值/最大值 | `MIN(of x1-x5)` |

### 描述统计函数
| 函数 | 描述 | 典型用法 |
| --- | --- | --- |
| `MEDIAN` | 中位数 | `MEDIAN(of x1-x5)` |
| `VAR` | 方差 | `VAR(of x1-x5)` |
| `NMISS`/`CMISS` | 计数缺失（数值/字符） | `NMISS(of x1-x5)` |

### 逻辑与特殊函数
| 函数 | 描述 | 典型用法 |
| --- | --- | --- |
| `IFC` | 条件表达式返回字符值 | `IFC(age>=18,'Adult','Child')` |
| `MISSING` | 判断是否缺失 | `MISSING(val) -> 1/0` |
| `COALESCEC` | 返回首个非缺失字符值 | `COALESCEC(a,b,c)` |
| `REVERSE` | 字符串反转 | `REVERSE('abc') -> 'cba'` |

### 随机数函数
| 函数 | 描述 | 典型用法 |
| --- | --- | --- |
| `RAND` | 生成指定分布的随机数 | `RAND('normal',0,1)` |

### 分布密度与分布函数
| 函数 | 描述 | 典型用法 |
| --- | --- | --- |
| `PDF` | 概率密度函数 | `PDF('normal',x,0,1)` |
| `CDF` | 累积分布函数 | `CDF('binomial',k,n,p)` |

### 分位数函数
| 函数 | 描述 | 典型用法 |
| --- | --- | --- |
| `QUANTILE` | 分位点计算 | `QUANTILE('normal',0.95)` |

### 宏相关函数
| 函数 | 描述 | 典型用法 |
| --- | --- | --- |
| `%SYSFUNC` | 在宏中调用数据步函数 | `%SYSFUNC(today())` |
| `SYMGET` | 从宏变量取值到数据步 | `SYMGET('name')` |
| `SYMPUTX` | 将值写入宏变量（去空格） | `SYMPUTX('m',value)` |
| `%QSCAN` | 带转义的 SCAN（宏） | `%QSCAN(a b,2)` |
| `%QSUBSTR` | 带转义的 SUBSTR（宏） | `%QSUBSTR(a/b,3)` |

## 快速链接
| 网站描述 | 链接 |
| --- | --- |
| SAS 官方函数文档 | [https://documentation.sas.com/doc/en/pgmsascdc/v_037/lefunctionsref/titlepage.htm](https://documentation.sas.com/doc/en/pgmsascdc/v_037/lefunctionsref/titlepage.htm) |
| SAS 9.4 Functions and CALL Routines: Reference | [https://documentation.sas.com/doc/en/lefunctionsref/9.4/titlepage.htm](https://documentation.sas.com/doc/en/lefunctionsref/9.4/titlepage.htm) |
| SAS Support：Functions by Category | [https://support.sas.com/documentation/cdl/en/lefunctionsref/67960/HTML/default/viewer.htm#n1v1k2v1w1v1n1.htm](https://support.sas.com/documentation/cdl/en/lefunctionsref/67960/HTML/default/viewer.htm#n1v1k2v1w1v1n1.htm) |
| SAS Community：SAS Functions 讨论 | [https://communities.sas.com/t5/SAS-Programming/bd-p/programming](https://communities.sas.com/t5/SAS-Programming/bd-p/programming) |
| SAS Functions Cheat Sheet | [https://www.listendata.com/2015/02/sas-functions-cheat-sheet.html](https://www.listendata.com/2015/02/sas-functions-cheat-sheet.html) |
