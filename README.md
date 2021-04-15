# tekkom-new-language-programming
This repos is used for develop new language programming on Compilation Technic Course

This project is based on C language programming
We use Lex for <b><i>Lexical Analyzer</i></b> or scanner and <b><i>Yacc</i></b> for <b><i>Syntax Analyzer</i></b> or parser

For more information about Lex & Yacc, visit the web official below<br>
<a href="https://www.epaperpress.com/lexandyacc/">Lex & Yacc</a>


<h1> How to Use </h1>
<hr>
<p>1. cd path/tekkom-new-language-programming/</p>
<p>2. yacc -d kalkulator.y</p>
<p>3. lex kalkulator.l</p>
<p>4. gcc lex.yy.c kalkulator.tab.c -o output.exe</p>
<p>5. ./output.exe</p>
