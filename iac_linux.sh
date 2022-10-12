#!/bin/bash

#Diretórios
publico="/publico"
adm="/adm"
ven="/ven"
sec="/sec"

#Grupos
grp_adm="GRP_ADM"
grp_ven="GRP_VEN"
grp_sec="GRP_SEC"

#Senha padrão dos usuários
key="123456"

echo $'\n'
echo "##### VERIFICANDO DIRETÓRIOS #####"
echo $'\n'
if [ -d $publico ];
then
	echo "Diretorio "$publico" já existe"
else
	echo "Diretório "$publico" não existe"
	echo "Criando diretorio "$publico" >>>>>"
	mkdir publico
	echo "Diretório "$pulico" criado!!"
fi

if [ -d $adm ];
then
        echo "Diretorio "$adm" já existe"
else
        echo "Diretório "$adm" não existe"
	echo "Criando diretório "$adm" >>>>>"
	mkdir adm
	echo "Diretório "$adm" criado!!"
fi

if [ -d $ven ];
then
        echo "Diretorio "$ven" já existe"
else
        echo "Diretório "$ven" não existe"
	echo "criando diretório "$ven" >>>>>"
	mkdir ven
	echo "Diretório "$ven" criado!!"
fi

if [ -d $sec ];
then
        echo "Diretorio "$sec" já existe"
else
        echo "Diretório "$sec" não existe"
        echo "criando diretório "$sec" >>>>>"
        mkdir sec
	echo "Diretório "$sec" criado!!"
fi

echo $'\n'
echo "##### CONSTRUINDO GRUPOS #####"
echo $'\n'
if [ $(grep -c $grp_adm /etc/group) == 1 ];
then
	echo "O Grupo "$grp_adm" já existe"
else
	echo "O grupo "$grp_adm" não existe"
	echo "Cadastrando grupo "$grp_adm">>>>>"
	groupadd $grp_adm
	echo "Grupo "$grp_adm" cadastrado!!"
	
fi


if [ $(grep -c $grp_ven /etc/group) == 1 ];
then
        echo "O Grupo "$grp_ven" já existe"
else
        echo "O grupo "$grp_ven" não existe"
        echo "Cadastrando grupo "$grp_ven">>>>>"
	groupadd $grp_ven
	echo "Grupo "$grp_ven" cadastrado!!"
fi


if [ $(grep -c $grp_sec /etc/group) == 1 ];
then
        echo "O Grupo "$grp_sec" já existe"
else
        echo "O grupo "$grp_sec" não existe"
        echo "Cadastrando grupo "$grp_sec">>>>>"
	groupadd $grp_sec	
	echo "Grupo "$grp_sec" cadastrado!!"
fi

echo $'\n'
echo "##### CADASTRANDO USUÁRIOS #####"
echo $'\n'
echo "Usuários inseridos no grupo "$grp_adm": "
useradd carlos -m -s /bin/bash -p $(openssl passwd -crypt $key) -G $grp_adm
useradd maria -m -s /bin/bash -p $(openssl passwd -crypt $key) -G $grp_adm
useradd joao -m -s /bin/bash -p $(openssl passwd -crypt $key) -G $grp_adm

echo $'\n'
echo "Usuários inseridos no grupo "$grp_ven": "
useradd debora -m -s /bin/bash -p $(openssl passwd -crypt $key) -G $grp_ven
useradd sebastiana -m -s /bin/bash -p $(openssl passwd -crypt $key) -G $grp_ven
useradd roberto -m -s /bin/bash -p $(openssl passwd -crypt $key) -G $grp_ven

echo $'\n'
echo "Usuários inseridos no grupo "$grp_sec": "
useradd josefina -m -s /bin/bash -p $(openssl passwd -crypt $key) -G $grp_sec
useradd amanda -m -s /bin/bash -p $(openssl passwd -crypt $key) -G $grp_sec
useradd rogerio -m -s /bin/bash -p $(openssl passwd -crypt $key) -G $grp_sec

echo $'\n'
echo "##### CONFIGURANDO PERMISSÕES NOS DIRETÓRIOS #####"

chown root:$grp_adm $adm
chown root:$grp_ven $ven
chown root:$grp_sec $sec

chmod 770 $adm
chmod 770 $ven
chmod 770 $sec
chmod 777 $publico

echo $'\n'
echo "<<<<PROCESSO IAC FINALIZADO>>>>"
echo $'\n'
