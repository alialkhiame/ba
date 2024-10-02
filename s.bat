@echo off
REM Batch script to compile a LaTeX document with BibLaTeX on Windows

REM Specify your main LaTeX file name without extension
set LATEX_FILE=BA

REM Run pdflatex (first pass)
echo Running pdflatex (first pass)...
pdflatex -interaction=nonstopmode %LATEX_FILE%.tex

REM Run biber (for bibliography)
echo Running biber...
biber %LATEX_FILE%

REM Run pdflatex (second pass)
echo Running pdflatex (second pass)...
pdflatex -interaction=nonstopmode %LATEX_FILE%.tex

REM Run pdflatex (final pass)
echo Running pdflatex (final pass)...
pdflatex -interaction=nonstopmode %LATEX_FILE%.tex

REM Open the resulting PDF file (optional)
echo Opening PDF...
start %LATEX_FILE%.pdf

REM Cleanup temporary files (optional)
echo Cleaning up auxiliary files...
del %LATEX_FILE%.aux %LATEX_FILE%.bbl %LATEX_FILE%.blg %LATEX_FILE%.log %LATEX_FILE%.out %LATEX_FILE%.toc

echo Compilation finished!
pause
