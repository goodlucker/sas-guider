# SAS

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
## [Statistics](/sas-guider/books/02-Statistics/Sample-Size/index.html)
**统计学核心概念**  
   - **试验设计**：随机化、盲法、样本量计算原理；  
   - **分析方法**：参数检验与非参数检验、多重校正（Bonferroni、FDR）、贝叶斯方法在工业界与学术界的差异。  

**临床试验专项**  
   - **终点指标**：主要/次要终点的定义与统计分析计划（SAP）撰写要点；  
   - **安全性分析**：不良事件编码（MedDRA）、汇总表（如AE Summary）的生成逻辑；  
   - **交互式可视化**：使用SAS `SGPLOT`或集成Shiny展示动态结果。