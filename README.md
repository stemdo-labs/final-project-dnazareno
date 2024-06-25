Pasos para levantar el servicio:

1) Ejecutar en forma manual el workflow "terraform_options_workflow.yaml", con la opción "apply", que despliega la infraestructura en Azure

2) Ejecutar en forma manual los workflows "start_ansible_workflow.yaml" y "start_k8s_workflow.yaml", que configuran la máquina virtual de backup y el cluster de kubernetes de Azure.

3) Ejecutar en forma manual el workflow "ansible_workflow.yaml", que configura la máquina virtual de la base de datos.

4) Editar código de la aplicación en la rama dnazareno y generar una PR hacia main. Esto ejecuta el workflow "CI_APP.yaml", que genera la imagen de la app y la sube al registry de Azure

5) Mergear esta PR ejecuta el workflow "CD_APP.yaml", que despliega los recursos de kubernetes.

Recordar también, configurar la máquina virtual de backup como selfhosted runner.

Al modificar código en la carpeta de Terraform en la rama dnazareno y crear una PR hacia main, se ejecuta el plan y se agrega como comentario a la PR.

Al mergear esta PR, se realiza el apply.

Se modificó la app de entradas, para que pueda recibir variables de entorno y configurar más facilmente el string de conexión en bdModel.php

Se creó un composer.json para guardar el versionado de la aplicación. Esta versión se utiliza para crear y desplegar la imagen

Se configuró un workflow que usa como runner a la máquina virtual de backup, para realizar un backup de la base de datos "concierto" en la maquina virtual de base de datos, zipear dicho backup y subir ese archivo a un contenedor de azure storage. Este workflow se configuró para que se ejecute diariamente. Es el de nombre "db_backup_workflow.yaml"

Se creó un workflow de ejecución manual, que al darle el nombre de un backup guardado en el container de backups del recurso azure storage desplegado, lo descarga y lo despliega en la base de datos. Es el de nombre "db_restore_workflow.yaml"

Cuestiones faltantes:
- Los extras. Seguridad, Monitoreo y Logging.

Cuestiones a mejorar:
- Me faltó testing. Sobre todo referido al despliegue desde cero.
- Seguro podría haber securizado mejor el despliegue de Azure, por ejemplo, utilizando Bastion.
- Crear un FQDN o algun recurso que me sirva para acceder al servicio de la aplicación de entradas de alguna forma más amigable que usando la IP pública que te brinda el LoadBalancer.
- Hacer un README mejor.
- He dejado públicos todos los password y valores sensibles de Terraform y Ansible. Es un error grave que no llegué a corregir. La próxima vez encaro de entrada realizar la solución con secretos.

Me hubiese encantado tener algún día más para poder hacer todo esto.
