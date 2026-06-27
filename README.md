# 高中数学之旅

一本面向高考的高中数学习题集，包含习题册与配套答案册，采用 LaTeX (XeLaTeX + ctexbook) 排版。

## 📖 简介

本项目收录了高中数学各章节的典型习题与详细解析，覆盖集合与逻辑、函数与导数、向量、立体几何、解三角形、圆锥曲线、数列、概率与统计等核心知识点。每章按知识框架→选择题→解答题的结构组织，习题册采用左栏题目、右栏答题区的双栏排版设计。

## 📚 章节概览

| 章节 | 选择题 | 解答题 | 内容 |
|------|--------|--------|------|
| 集合和逻辑用语 | 8 | 5 | 集合运算、命题与逻辑 |
| 函数与导数 | 2 | — | 函数性质与导数应用 |
| 向量 | 9 | — | 向量运算、数量积与几何应用 |
| 立体几何 | 4 | — | 空间几何体、线面关系 |
| 解三角形 | — | 6 | 正余弦定理、取值范围、面积问题 |
| 圆锥曲线 | 3 | 1 | 椭圆、双曲线与抛物线 |
| 数列 | — | 3 | 等差等比、数列综合 |
| 概率与统计 | 1 | 1 | 概率计算与统计分析 |

## 📂 项目结构

```
exercise/
├── main.tex                  # 习题册主文件
├── main_solutions.tex        # 答案册主文件
├── .latexmkrc                # latexmk 编译配置
├── preamble/                 # 导言区模块
│   ├── packages.tex          # 宏包调用
│   ├── colors.tex            # 颜色定义
│   ├── fonts.tex             # 字体配置
│   ├── macros.tex            # 语义化命令与工具宏
│   ├── environments.tex      # xsim 习题环境定义 + tcolorbox 模板
│   └── pagestyle.tex         # 页眉页脚样式
├── covers/                   # 封面/封底
│   ├── cover-exercise.tex    # 习题册封面
│   ├── backcover-exercise.tex
│   ├── cover-solutions.tex   # 答案册封面
│   └── backcover-solutions.tex
├── chapters/                 # 章节结构文件（仅 \input 引用）
│   ├── 集合.tex
│   ├── 函数与导数.tex
│   ├── 向量.tex
│   ├── 立体几何.tex
│   ├── 解三角形.tex
│   ├── 圆锥曲线.tex
│   ├── 数列.tex
│   └── 概率与统计.tex
├── database/                 # 题库（一题一文件）
│   ├── 集合/                 # choice_001~008, exercise_001~005
│   ├── 函数与导数/            # choice_001~002
│   ├── 向量/                  # choice_001~009
│   ├── 立体几何/             # choice_001~004
│   ├── 解三角形/              # exercise_001~006
│   ├── 圆锥曲线/             # choice_001~003, exercise_001
│   ├── 数列/                  # exercise_001~003
│   └── 概率与统计/            # choice_001, exercise_001
└── README.md
```

### 题库文件格式

**选择题** (`choice_NNN.tex`)：
```latex
\begin{choice}[source={来源}, topic={知识点}]
题目内容
\begin{tasks}(2)
\task ... \task ... \task ... \task ...
\end{tasks}
\end{choice}
\begin{choice-sol}
解析内容
\end{choice-sol}
```

**解答题** (`exercise_NNN.tex`)：
```latex
\begin{prob}[topic={知识点}, score=12]
题目内容
\end{prob}
\begin{prob-sol}
解析内容
\end{prob-sol}
```

## 🔨 编译方式

本项目使用 **XeLaTeX** 编译，推荐在 WSL (Ubuntu) 环境下使用 `latexmk` 自动化工具：

```bash
# 编译习题册（24页，双栏答题区）
latexmk -xelatex main.tex

# 编译答案册（30页，仅解析）
latexmk -xelatex main_solutions.tex
```

### 编译依赖

- **TeX 发行版**：[TeX Live](https://www.tug.org/texlive/) 2025+（需安装 `texlive-xetex`、`texlive-latex-extra`、`texlive-fonts-extra`、`texlive-lang-chinese`、`texlive-science`）
- **中文字体**：SimSun、SimHei、STKaiti、FangSong（安装到系统字体目录）
- **数学字体**：NewCMMath（TeX Live `texlive-fonts-extra` 自带）

### 主要宏包

| 宏包 | 用途 |
|------|------|
| ctexbook | 中文文档类 |
| xsim | 习题与解析管理（choice/prob 两种类型） |
| tcolorbox | 彩色方框（题目/知识框架/解析环境） |
| paracol | 左右双栏排版（习题册专用） |
| tasks | 选择题选项排版 |
| tikz | 封面/封底绘制、答题卡方框 |
| unicode-math | Unicode 数学字体支持 |

## 🏗️ 架构设计

- **内容-格式分离**：题目内容存放于 `database/` 目录（一题一文件），格式模板集中在 `preamble/environments.tex`，章节文件 `chapters/` 仅做结构编排
- **双输出模式**：同一套数据库文件，通过 `main.tex`（习题册）和 `main_solutions.tex`（答案册）两套控制器分别编译
- **xsim 管理**：使用 xsim 的 `DeclareExerciseType` 定义 choice（选择题）和 prob（解答题）两种类型，配合 `\IfSolutionPrintF` 实现条件排版
- **语义化命令**：`\R`、`\N`、`\Z`、`\Q`、`\dd`、`\ee`、`\ii` 等数学符号宏，便于统一修改

## 🎨 设计特色

- **Springer 风格封面**：橙色主调，顶部横栏 + 左侧竖栏布局
- **镜像封底**：底部横栏 + 右侧竖栏，与封面形成镜像关系，附有习题册简介
- **灰度内页**：正文部分采用灰度配色方案，适合黑白打印
- **双栏答题设计**：习题册左栏为题目，右栏为答题区（选择题含涂卡方框，解答题含作答横线）

## 📥 下载

前往 [Releases](https://github.com/ShinozakiKasumi/exercise/releases) 页面下载最新版本的习题册与答案册 PDF。

## 📝 致谢

致那些不是从知乎来的游客：请访问知乎@余命数的文章，或添加作者 QQ 2454167821，获取详情。

## 📄 License

本项目仅供学习交流使用。
