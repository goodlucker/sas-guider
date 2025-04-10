# saspg work site

This site collect and summarize the resources from the sas programmer's daily life. Any thoughts and opinions could be meaningful and worthness. Check the following navigations for your uses.

## [Guidance](/books/00-Guidance/10-ich/index.html)
**行业标准与法规**  
   - **ICH指南**：重点整理ICH E9（临床试验统计学原则）、ICH E3（临床研究报告结构）等与统计编程相关的指导文件，解释其在临床试验数据管理中的具体应用。  
   - **GCP（药物临床试验质量管理规范）**：强调数据完整性与伦理合规性，提供GCP与SAS编程结合的案例分析。  
   - **CDISC标准**：单独设立板块（见第四部分），与行业规范联动说明其重要性。

-----------
## [SAS](/books/01-sas/General-Introduction/index.html)
**核心模块与技术应用**  
   - **Base SAS**：  
     - 数据清洗与转换（如`PROC SORT`、`DATA STEP`逻辑控制）；  
     - 宏语言（`%MACRO`自动化脚本编写技巧与调试方法）；  
     - 高效数据处理（哈希表、`PROC SQL`优化）。  
   - **SAS/STAT**：  
     - 临床试验常用统计方法（ANOVA、生存分析、混合效应模型）的实现代码与解读；  
     - 结果输出与报告生成（`ODS`系统的高级应用）。  
   - **SAS与外部工具集成**：如与R/Python的互操作性（`PROC IML`调用R脚本）。

-----------
## [Statistics](/books/02-statistics/Sample-Size/index.html)
**统计学核心概念**  
   - **试验设计**：随机化、盲法、样本量计算原理；  
   - **分析方法**：参数检验与非参数检验、多重校正（Bonferroni、FDR）、贝叶斯方法在工业界与学术界的差异。  

**临床试验专项**  
   - **终点指标**：主要/次要终点的定义与统计分析计划（SAP）撰写要点；  
   - **安全性分析**：不良事件编码（MedDRA）、汇总表（如AE Summary）的生成逻辑；  
   - **交互式可视化**：使用SAS `SGPLOT`或集成Shiny展示动态结果。
-----------
## [CDISC](/books/03-cdisc/sdtm/index.html)
**标准框架与实施**  
   - **SDTM（研究数据制表模型）**：  
     - 领域结构（如DM、AE、LB）与变量映射规则；  
     - 使用SAS实现从原始数据到SDTM的转换（`PROC CDISC`或自定义脚本）。  
   - **ADaM（分析数据模型）**：  
     - 衍生变量（如治疗期、基线定义）的编程逻辑；  
     - 与统计分析的衔接（如BDS结构下的纵向数据分析）。  

**工具与资源**  
   - 推荐CDISC官方工具（如Define.xml生成器）及开源工具（如PHUSE脚本库）；  
   - 提供SDTM/ADaM合规性检查的SAS宏示例。

-----------
<!-- # [XML](/books/xml/index.html)

-----------
# [BAT](/books/bat/index.html)

-----------
# [VB](/books/vb/index.html)

-----------
# [Python](/books/python/index.html)

-----------
# [R](/books/r/index.html) -->

-----------
# [Blogs](/blogs/index.html)
