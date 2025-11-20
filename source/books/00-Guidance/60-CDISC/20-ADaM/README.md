# ADaM

ADaM（Analysis Data Model）用于支持统计分析的可追溯数据结构设计，与 SDTM 相衔接，强调变量来源、衍生逻辑与分析一致性。

## 数据结构分类（ADaM IG）
- ADSL（受试者层面数据集）：每位受试者一条记录，包含人口学、分组、治疗周期、基线等关键分析变量。
- OCCDS（发生类数据集）：用于不良事件、并用药等按发生记录的数据（如 `ADAE`）。
- BDS（基本数据结构）：用于纵向或多次测量的分析数据（如 `ADLB`、`ADVS`、`ADCM`），包含参数、时间点与分析值等。

## 网站与资源
| 网站描述                  | 链接                                                                                                                                                                     |
| ------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| CDISC 官方 ADaM 标准页面  | [https://www.cdisc.org/standards/foundational/adam](https://www.cdisc.org/standards/foundational/adam)                                                                   |
| ADaM Implementation Guide | [https://www.cdisc.org/standards/foundational/adam/adam-implementation-guide](https://www.cdisc.org/standards/foundational/adam/adam-implementation-guide)                 |
| FDA 关于 ADaM 的技术规范  | [https://www.fda.gov/industry/fda-resources-data-standards/analysis-data-model-adam](https://www.fda.gov/industry/fda-resources-data-standards/analysis-data-model-adam) |
| PHUSE ADaM 资源与脚本     | [https://www.phuse.global/adam-resources](https://www.phuse.global/adam-resources)                                                                                       |
| SAS ADaM 相关文档与案例   | [https://support.sas.com/resources/papers/proceedings/proceedings/sugi30/113-30.pdf](https://support.sas.com/resources/papers/proceedings/proceedings/sugi30/113-30.pdf) |
