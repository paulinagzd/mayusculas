# Mayúsculas

![Mayusculas](/Mayusculas/M.png)

La aplicación de Mayúsculas provee una herramienta móvil interactiva que ayude a estudiantes universitarios y preuniversitarios a practicar el uso de las mayúsculas y minúsculas de acuerdo a las reglas académicas vigentes y también que sea capaz de reconocer los usos correctos de las mayúsculas en contexto de textos académicos y científicos. El sistema fomentará el aprendizaje a través de distintos niveles como el completar oraciones, señalar si las afirmaciones son verdaderas o falsas o rellenar espacios en blanco.

Esta aplicación espera educar al usuario para que sea capaz de:
* Aplicar las normas básicas de uso de mayúsculas y minúsculas.
* Aplicar las normas básicas de uso diacrítico de mayúsculas.
* Aplicar las normas de uso de mayúsculas en textos académicos y científicos.
* Monitorear su proceso
------
HOW TO PR:
* Una branch por funcionalidad
* Commit message que describa los cambios hechos
* Para corregir cosas que se subieron dentro de ese mismo pr, tratar de hacer un rebase (see how to rebase)
* Probar todo antes de subirlo, si hay dudas pedir codereview
* updatear tu branch con master para evitar merge conflicts (see how to update with master)
* al mergear los cambios a master checar que todo funcione bien (avisar en wha)

------
<br />
HOW TO REBASE: <br />
"git stash" //para stashear cambios unstageados <br />
"git rebase -i HEAD~N" //N es el numero de commits antes que el mio que quiero ver, ex: si quiero arreglar algo que hice hace 4 commits, le doy git rebase -i HEAD~4  <br />
va a abrir bash, darle click a la tecla "i" para entrar al modo de editar, saldra una lista con los N commits que pusiste, busca el que quieres editar y envez de "pick", escribe "edit", haz esto para todos los commits que quieras cambiar, al acabar da ctrl+C para salir del modo editar y ":xa!" para guardar <br />
Haz tus cambios, dale "git add [cambios]"<br />
"git rebase --continue" O "git rebase --abort" si mejor no<br />
"git push --force"<br />
y yap<br />
<br />
------

HOW TO UPDATE WITH MASTER:<br />
"git checkout master"<br />
"git pull origin master"<br />
"git checkout [tu-branch]"<br />
"git rebase master" //si hay merge conflicts salen aqui, y los arreglas en tu local y los pones en staging<br />
"git push origin [tu-branch] --force-with-lease
