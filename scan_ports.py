import os
import re

import mysql.connector as mysql

def getIps(hosts):
    red = "200.33.171.*"
    os.system("nmap -sP " + red + " > D:/Archivos/Descargas/TSW/tmp.txt")
    File = open(r"tmp.txt", "r")
    for line in File.readlines():
        line = line.rstrip()
        regex = re.findall(r'[0-9]+(?:\.[0-9]+){3}', line)
        if regex:
            hosts.append(regex)

def saveIps(hosts):
    conexion = mysql.connect(host='localhost', user= 'root', passwd='', db='nmap')
    operacion = conexion.cursor()
    query = "INSERT IGNORE INTO ip (direccion, status) VALUES (%s, %s)"
    values = []
    for host in hosts:
        tmp = [''.join(host), "NO ANALIZADO"]
        values.append(tmp)
    operacion.executemany(query, values)
    conexion.commit()
    print(operacion.rowcount, " ip guardadas")
    conexion.close()

def scanIp(hosts):
    print("Elija un ip para analizar:")
    c = 0
    for host in hosts:
        print("(%03d) % s" %(c, ''.join(host)))
        c += 1
    ip = input()
    ip = hosts[int(ip)]
    scanPorts(ip)

def scanPorts(ip):
    resultado = os.popen("nmap -sT " + ''.join(ip)).readlines()
    puertos = resultado[5:len(resultado)-2]
    conexion = mysql.connect(host='localhost', user= 'root', passwd='', db='nmap')
    operacion = conexion.cursor()
    query = "INSERT IGNORE INTO puerto (numero, status, servicio, direccion) VALUES (%s, %s, %s, %s)"
    values = []
    for puerto in puertos:
        campos = puerto.split()
        tmp = [campos[0], campos[1], campos[2], ''.join(ip)]
        values.append(tmp)
    operacion.executemany(query, values)
    conexion.commit()
    print(operacion.rowcount, " puertos guardados")
    operacion.execute("UPDATE ip SET status = 'ANALIZADO' WHERE direccion = '%s'" % (''.join(ip)))
    conexion.commit()
    conexion.close()

hosts = []
getIps(hosts)
saveIps(hosts)
scanIp(hosts)