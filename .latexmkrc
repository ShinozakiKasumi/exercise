# .latexmkrc — latexmk 配置文件
# 用法：latexmk -xelatex main.tex

$pdf_mode = 0;          # 不用 pdflatex
$xelatex_mode = 1;      # 使用 xelatex
$xelatex = 'xelatex -synctex=1 -interaction=nonstopmode -file-line-error %O %S';

# 输出目录
$out_dir = '.';         # 输出到当前目录

# 清理辅助文件
$clean_ext = 'synctex.gz synctex.gz(busy) run.xml tex.bak bib bfc bbl fff run tdo %R-blx.bib';
