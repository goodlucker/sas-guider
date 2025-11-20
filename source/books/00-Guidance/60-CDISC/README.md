# CDISC 概览与资源

- CDISC（Clinical Data Interchange Standards Consortium）致力于临床研究数据的标准化与互操作，核心标准包括 SDTM、ADaM 与 Define-XML，并配套受控术语（Controlled Terminology）与治疗领域用户指南（TAUG）。
- 在监管申报中，CDISC 标准提升数据的一致性、可追溯性与可审查性，已被主要监管机构广泛采纳。

## 主要标准
- SDTM（Study Data Tabulation Model）：用于标准化临床试验原始数据的结构与域。
- ADaM（Analysis Data Model）：用于统计分析的数据集设计（如 ADSL、BDS、OCCDS）。
- Define-XML：用于传递数据集结构与元数据的机器可读说明文件。
- Controlled Terminology：CDISC 维护的受控术语，确保变量取值与代码的一致性。

## 快速链接
| 描述 | 链接 |
| --- | --- |
| CDISC 官网 | [https://www.cdisc.org/](https://www.cdisc.org/) |
| Standards 总览 | [https://www.cdisc.org/standards](https://www.cdisc.org/standards) |
| SDTM 标准 | [https://www.cdisc.org/standards/foundational/sdtm](https://www.cdisc.org/standards/foundational/sdtm) |
| SDTM Implementation Guide | [https://www.cdisc.org/standards/foundational/sdtmig](https://www.cdisc.org/standards/foundational/sdtmig) |
| ADaM 标准 | [https://www.cdisc.org/standards/foundational/adam](https://www.cdisc.org/standards/foundational/adam) |
| ADaM Implementation Guide | [https://www.cdisc.org/standards/foundational/adam/adam-implementation-guide](https://www.cdisc.org/standards/foundational/adam/adam-implementation-guide) |
| Define-XML 标准 | [https://www.cdisc.org/standards/foundational/define-xml](https://www.cdisc.org/standards/foundational/define-xml) |
| Controlled Terminology | [https://www.cdisc.org/standards/terminology](https://www.cdisc.org/standards/terminology) |
| TAUG（治疗领域用户指南） | [https://www.cdisc.org/standards/therapeutic-areas](https://www.cdisc.org/standards/therapeutic-areas) |
| ODM / Data Exchange | [https://www.cdisc.org/standards/data-exchange](https://www.cdisc.org/standards/data-exchange) |

## 监管机构对 CDISC 的要求（摘要）
- FDA：接受并推荐 CDISC 标准；需对齐 Study Data Standards Catalog 版本并遵循 Technical Conformance Guide。
  - 参考：FDA Data Standards Resources（[https://www.fda.gov/industry/fda-resources-data-standards](https://www.fda.gov/industry/fda-resources-data-standards)）
- EMA：支持电子申报与标准化数据提交，临床数据普遍采用 SDTM/ADaM/Define-XML。
  - 参考：EMA 官网（[https://www.ema.europa.eu/en/homepage](https://www.ema.europa.eu/en/homepage)）
- NMPA/CDE：推进电子申报与数据标准化实践，企业多采用 CDISC 标准以提升质量与国际互认。
  - 参考：NMPA（[https://www.nmpa.gov.cn/](https://www.nmpa.gov.cn/)）、CDE（[https://www.cde.org.cn/](https://www.cde.org.cn/)）

## 项目实施建议
- 在立项阶段明确目标市场与标准版本，统一 SDTM/ADaM/Define-XML 与受控术语版本。
- 建立从原始数据到 SDTM/ADaM 的可追溯编程流程，生成 Define-XML 并使用校验工具进行一致性检查。
- 定期关注 CDISC 与监管机构的更新公告，保持交付物与技术要求同步。