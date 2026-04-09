# 💻 CoreFix Solutions – Base de Datos

---

## 📌 Descripción del proyecto

Este proyecto consiste en el diseño e implementación de una base de datos para **CoreFix Solutions**, una empresa especializada en servicios informáticos:

- 🛠️ Reparación de equipos  
- 💻 Montaje de ordenadores  
- 🧹 Mantenimiento y optimización  
- 🦠 Eliminación de malware  
- ⚙️ Instalación de sistemas operativos  

---

## 🧠 Análisis del sistema

El sistema gestiona la siguiente información:
 
- 👤 Clientes 
- 🧑‍🔧 Técnicos 
- 💻 Equipos
- 🛠️ **Servicios**
- 📋 **Órdenes de trabajo**
- 🔗 **Detalle de servicios**

---

## 🧩 Diseño de la base de datos

### 📊 Modelo E/R (Chen)

Relaciones principales:

- CLIENTE → EQUIPO (1:N)
- CLIENTE → ORDEN (1:N)
- TECNICO → ORDEN (1:N)
- ORDEN ↔ SERVICIO (N:M)

---

### 🔄 Modelo Relacional

| Tabla | Descripción |
|------|------------|
| clientes | Información de clientes |
| tecnicos | Personal técnico |
| equipos | Dispositivos |
| servicios | Catálogo de servicios |
| ordenes | Órdenes de trabajo |
| detalle_servicios | Relación N:M |

---

## 🧱 Estructura de la base de datos

### 🔑 Claves primarias
 Todas las tablas tienen `PRIMARY KEY`

### 🔗 Claves foráneas

```sql
equipos.id_cliente → clientes.id_cliente
ordenes.id_cliente → clientes.id_cliente
ordenes.id_tecnico → tecnicos.id_tecnico
detalle_servicios.id_orden → ordenes.id_orden
detalle_servicios.id_servicio → servicios.id_servicio