# Controlled Terminology（CT）

受控术语为 CDISC 标准提供一致的取值集合，确保变量值、代码与标签在不同研究与系统之间保持一致。CT 涵盖 SDTM、ADaM、Define-XML 等标准中的域与变量取值。

## 使用示例
- AE 严重程度（`AESEV`）：使用受控术语值集合（如 Mild/Moderate/Severe），统一大小写与拼写，避免自由文本。
- 受试者性别（`SEX`）：采用标准值（M/F/UNK），并在 Define-XML 中注明所用受控术语版本。
- 量表参数（BDS/QS）：参数名称、分类与单位按 CT 对齐，便于跨试验比较与自动化检核。

## 快速链接
| 描述 | 链接 |
| --- | --- |
| CDISC Controlled Terminology | [https://www.cdisc.org/standards/terminology](https://www.cdisc.org/standards/terminology) |

## 实务提示
- 在立项时冻结 CT 版本并记录于配置清单与 Define-XML，避免项目中途版本漂移。
- 编写值域校验（如枚举比对、大小写统一），并在数据转换与 QC 环节强制执行。