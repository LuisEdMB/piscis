client
	-id (int - automatico)
    -cod_tipo_documento (int - relación a document)
    -des_documento (varchar 15)
    -des_nombre (varchar 30)
    -des_apellido (varchar 30)
    -cod_numero_pais (int - relación a country)
    -num_telefono (varchar 9)
    -des_ruta_foto_perfil (server - varchar(max)) o -img_foto_perfil (blob o varchar(max)) --null
    -ind_estado (boolean)
    -fec_registro (date)
    -fec_modificacion (date) --null
document
	-id (int - automatico)
    -des_documento (varchar 100)
    -fec_registro (date)
country
	-id (int - automatico)
    -des_pais (varchar 100)
    -cod_pais_telefono (char 2)
    -ind_estado (boolean)
    -fec_registro (date)
client_code
	-id (int - automatico)
    -cod_cliente (int - relación a client)
    -num_code (int)
    -ind_estado (boolean)
    -fec_registro (date)
    -fec_modificacion (date) --null
client_address
	-id (int -automatico)
    -cod_cliente (int - relación a client)
    -des_direccion (varchar 500)
    -des_referencia (varchar 500)
    -des_latitud (decimal)
    -des_longitud (decimal)
    -ind_estado (boolean)
    -fec_registro (date)
    -fec_modificacion (date) --null
dealer
	-id (int - automatico)
    -cod_tipo_documento (int - relación a document)
    -des_documento (varchar 15)
    -des_nombre (varchar 30)
    -des_apellido (varchar 30)
    -cod_numero_pais (int - relación a country)
    -num_telefono (varchar 9)
    -num_mac_telefono (varchar 17)
    -num_imei_telefono (varchar 16)
    -cod_tipo_vehiculo (int - relación a vehicle)
    -num_placa_vehiculo (varchar 7) --null
    -des_ruta_foto_perfil (server - varchar(max)) o -img_foto_perfil (blob o varchar(max)) --null
    -ind_estado (boolean)
    -fec_registro (date)
    -fec_modificacion (date) --null
vehicle
	-id (int - automatico)
    -des_vehiculo (varchar 50)
    -ind_estado (boolean)
    -fec_registro (date)
delivery
	-id (int - automatico) (nro orden)
    -cod_cliente (int - relación a client)
    -cod_repartidor (int - relación a dealer)
    -cod_estado_actual (int - relación a delivery_state) (ultimo estado)
    -cod_tipo_delivery (int - relación a delivery_type)
    -mon_sub_total (decimal)
    -mon_costo_delivery (decimal)
    -mon_total (decimal)
    -fec_registro (date)
    -fec_modificacion (date) --null
delivery_state
	-id (int - automatico)
    -des_estado (varchar 50)
    -fec_registro (date)
delivery_type
	-id (int - automatico)
    -des_tipo (varchar 50)
    -fec_registro (date)
delivery_info
	-id (int - automatico)
    -cod_delivery (int - relación a delivery)
    -des_comentario (varchar 500 - comentario del delivery) --null
    -cod_direccion_origen (int - relación opcional a client_address para encargo) o (dirección de la empresa para pedido)
    -cod_direccion_destino (int - relación a client_address)
    -cod_tipo_pago (int - relación a payment)
    -mon_pagare_efectivo (decimal) default 0.0
    -fec_registro (date)
payment
	-id (int - automatico)
    -des_tipo_pago (varchar 50)
    -des_ruta_logo (server - varchar(max)) o -img_logo (blob o varchar(max))
    -ind_estado (boolean)
    -fec_registro (date)
delivery_detail
	-id (int - automatico)
    -cod_delivery (int - relación a delivery)
    -cod_producto (int - relación a company_product)
    -num_cantidad (int)
    -mon_total (decimal)
    -fec_registro (date)
delivery_log
	-id (int - automatico)
    -cod_delivery (int - relación a delivery)
    -cod_estado (int - relación a delivery_state)
    -cod_motivo (int - relación a delivery_cause)
    -des_motivo (varchar 500)
    -fec_registro (date)
delivery_cause
	-id (int - automatico)
    -des_motivo (varchar 200)
    -ind_estado (boolean)
    -fec_registro (date)
company
	-id (int - automatico)
    -cod_tipo_documento (int - relación a document) (tipo RUC estatico)
    -cod_usuario (int - relación a system_user)
    -cod_categoria (int - relación company_category)
    -des_ruc (varchar 11)
    -des_razon_social (varchar 500)
    -des_nombre_empresa (varchar 500)
    -des_correo_electronico (varchar 200)
    -des_nombre_propiertario (varchar 200)
    -num_telefono (varchar 9)
    -ind_estado (boolean)
    -fec_registro (date)
    -fec_modificacion (date) --null
company_category
	-id (int - automatico)
    -des_categoria (varchar 200)
    -ind_estado (boolean)
    -fec_registro (date)
company_product
	-id (int - automatico)
    -cod_categoria (int - relación company_product_category)
    -nom_producto (varchar 200)
    -des_producto (varchar 500)
    -num_stock (int) default 0
    -flg_stock (boolean)
    -des_ruta_foto_producto (server - varchar(max)) o -img_foto_producto (blob o varchar(max)) --null
    -ind_estado (boolean)
    -fec_registro (date)
    -fec_modificacion (date) --null
company_product_category
	-id (int - automatico)
    -des_categoria (varchar 200)
    -ind_estado (boolean)
    -fec_registro (date)
    -fec_modificacion (date) --null
system_user
	-id (int - automatico)
    -cod_sistema (int - relación a system)
    -des_usuario (varchar 15)
    -des_contrasena (varchar MAX - encriptado)
    -ind_estado (boolean)
    -fec_registro (date)
    -fec_modificacion (date) --null
system
	-id (int - automatico)
    -des_sistema (varchar 50)
    -fec_registro (date)
configuration
	-id (int - automatico)
    -des_configuracion (varchar 200)
    -val_configuracion (varchar 100)
    -fec_registro (date)