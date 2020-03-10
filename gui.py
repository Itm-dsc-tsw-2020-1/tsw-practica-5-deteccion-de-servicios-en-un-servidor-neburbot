import mysql.connector as mysql
import tkinter as tk
from tkinter import ttk
import tkinter.font as tkFont

class Table(tk.Frame):
    def __init__(self, parent = None, title = "", headers = [], height = 10, *args, **kwargs):
        tk.Frame.__init__(self, parent, *args, **kwargs)
        self._title = tk.Label(self, text = title, background = "#d29482", font=("Helvetica", 26))
        self._headers = headers
        self._tree = ttk.Treeview(self, height = height, columns = self._headers, show = "headings")
        self._title.pack(side = tk.TOP, fill = "x")

        vsb = ttk.Scrollbar(self, orient = "vertical", command=self._tree.yview)
        vsb.pack(side = 'right', fill = 'y')
        hsb = ttk.Scrollbar(self, orient = "horizontal", command = self._tree.xview)
        hsb.pack(side = 'bottom', fill = 'x')

        self._tree.configure(xscrollcommand = hsb.set, yscrollcommand = vsb.set)
        self._tree.pack(side = "left")

        for header in self._headers:
            self._tree.heading(header, text = header.title())
            self._tree.column(header, stretch = True, width = tkFont.Font().measure(header.title()))

    def add_row(self, row):
        self._tree.insert('', 'end', values = row)
        for i, item in enumerate(row):
            col_width = tkFont.Font().measure(item)
            if self._tree.column(self._headers[i], width=None) < col_width:
                self._tree.column(self._headers[i], width=col_width)

def ventana_principal(parent = None):
    t3 = tk.Toplevel(parent)
    t3.title("NMAP")
    t3.configure(bg="#f8edd9")
    t3.focus_set()
    t3.grab_set()

    ips_headers = ( u"Dirección", u"Status")
    ports_headers = ( u"Puerto", u"Status", u"Servicio", u"Dirección")

    ips_tab = Table(t3, title = "IP´s", headers = ips_headers)
    ips_tab.pack()
    ports_tab = Table(t3, title = "Puertos", headers = ports_headers)
    ports_tab.pack()

    conexion = mysql.connect(host = 'localhost', user = 'root', passwd = '', db='nmap')
    operacion = conexion.cursor()
    operacion.execute("SELECT direccion, status FROM ip")
    for row in operacion:
        ips_tab.add_row(row)
    operacion.execute("SELECT numero, status, servicio, direccion FROM puerto")
    for row in operacion:
        ports_tab.add_row(row)

ventana = tk.Tk()
ventana_principal(parent = ventana)
ventana.mainloop()