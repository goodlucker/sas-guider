# SAS 概览与资源

- 概览：SAS 提供数据处理、统计分析与报告生成的完整工具链，常用于临床研究数据的标准化与分析。
- 分类导航：编码（Encoding）、函数（Function）、宏（Macro）、报表（Report/ODS）、GTL、正则表达式（PRX）、统计分析（STAT）、其他工具（Other Tools）。

## 常用任务
- 数据导入与清洗：`DATA STEP`、`PROC IMPORT/EXPORT`、`PROC SQL`。
- 报表与输出：`ODS`、`PROC REPORT/PRINT/TABULATE`、RTF/HTML/Excel 输出。
- 统计分析：`SAS/STAT`（如 `PROC LOGISTIC`、`PROC LIFETEST`、`PROC MIXED`）。
- 代码复用：宏语言（`%MACRO`、`%LET`、`%IF/%DO`）。

## 快速链接
| 描述 | 链接 |
| --- | --- |
| SAS 文档门户 | [https://documentation.sas.com/](https://documentation.sas.com/) |
| SAS 技术支持 | [https://support.sas.com/](https://support.sas.com/) |
| SAS 社区 | [https://communities.sas.com/](https://communities.sas.com/) |

## 实务提示
- 统一编码与地区设置（NLS），确保多语言环境下字符正确显示与导出。
- 采用 ODS 与模板化输出，标准化报告版式并便于审阅。
- 将数据处理到分析的流程可追溯化，便于与 CDISC 标准衔接。