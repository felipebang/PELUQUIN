PGDMP     1    9        	        {            peluquin    15.0    15.0 n    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16800    peluquin    DATABASE     {   CREATE DATABASE peluquin WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Spain.1252';
    DROP DATABASE peluquin;
                peluquin    false            �            1255    16801    c_cambios(integer) 	   PROCEDURE     �  CREATE PROCEDURE public.c_cambios(INOUT estado integer)
    LANGUAGE plpgsql
    AS $$

	
DECLARE
c_datos integer ;

	
	BEGIN
	 c_datos  := (select COUNT(*) from public.h_cambios_tmp hpot);
		if c_datos >= 1
		then
		
			RAISE notice 'Hay datos para insertar en la tabla de hechos.';
		
			delete from public.h_cambios --ene e feb
			where fecha_datos in (select distinct fecha_datos from public.h_cambios_tmp);
				-------
			insert into public.h_cambios 
			select * from public.h_cambios_tmp;
				-------
			delete from public.h_cambios_tmp
			where fecha_datos in (select distinct fecha_datos from public.h_cambios);
		     estado := 0;
		else
		
		 estado := -1;	RAISE notice 'No hay datos para insertar en la tabla de hechos';
		
		end if;
	exception when others then
      INSERT INTO public.tb_if_log_carga_arch(
	sb_nombre_archivo, sb_estado_ejec, sb_detalle_ejec, dt_ultima_ejec)
	VALUES ('Table h_cambios', 'Error', SQLERRM || '-- '||SQLSTATE , current_date);
    	delete from public.h_cambios_tmp;
	END;

$$;
 7   DROP PROCEDURE public.c_cambios(INOUT estado integer);
       public          peluquin    false            �            1255    16802    c_candidatos(integer) 	   PROCEDURE     	  CREATE PROCEDURE public.c_candidatos(INOUT estado integer)
    LANGUAGE plpgsql
    AS $$

	
DECLARE
c_datos integer ;
	
	BEGIN
	  c_datos  := (select COUNT(*) from public.candidatos_tmp hpot);
		if c_datos >= 1
		then
		
			RAISE notice 'Hay datos para insertar en la tabla de hechos.';
		
			delete from public.candidatos --ene e feb
			where fecha_datos in (select distinct fecha_datos from public.candidatos_tmp);
				-------
			insert into public.candidatos 
			select * from public.candidatos_tmp;
				-------
			delete from public.candidatos_tmp
			where fecha_datos in (select distinct fecha_datos from public.candidatos);
		     estado := 0;
		else
		
		 estado := -1;	RAISE notice 'No hay datos para insertar en la tabla de hechos';
		
		end if;
	exception when others then
      INSERT INTO public.tb_if_log_carga_arch(
	sb_nombre_archivo, sb_estado_ejec, sb_detalle_ejec, dt_ultima_ejec)
	VALUES ('Table candidatos', 'Error', SQLERRM || '-- '||SQLSTATE , current_date);
    	delete from public.candidatos_tmp;
	END;

$$;
 :   DROP PROCEDURE public.c_candidatos(INOUT estado integer);
       public          peluquin    false            �            1255    16803 #   c_dedicacion_plantilla_eyp(integer) 	   PROCEDURE     �  CREATE PROCEDURE public.c_dedicacion_plantilla_eyp(INOUT estado integer)
    LANGUAGE plpgsql
    AS $$

	
DECLARE
c_datos integer;
	
	BEGIN
   c_datos := (select COUNT(*) from public.dedicacion_plantilla_eyp_tmp hpot);
		if c_datos >= 1
		then
		
			RAISE notice 'Hay datos para insertar en la tabla de hechos.';
		
			delete from public.dedicacion_plantilla_eyp --ene e feb
			where fecha_datos in (select distinct fecha_datos from public.dedicacion_plantilla_eyp_tmp);
				-------
			insert into public.dedicacion_plantilla_eyp 
			select * from public.dedicacion_plantilla_eyp_tmp;
				-------
			delete from public.dedicacion_plantilla_eyp_tmp
			where fecha_datos in (select distinct fecha_datos from public.dedicacion_plantilla_eyp);
		    estado := 0;
		else
		
			estado := -1; RAISE notice 'No hay datos para insertar en la tabla de hechos';
		
		end if;
		exception when others then
 INSERT INTO public.tb_if_log_carga_arch(
	sb_nombre_archivo, sb_estado_ejec, sb_detalle_ejec, dt_ultima_ejec)
	VALUES ('Table dedicacion_plantilla_eyp', 'Error', SQLERRM || '-- '||SQLSTATE , current_date);
    	delete from public.dedicacion_plantilla_eyp_tmp;
	END;

$$;
 H   DROP PROCEDURE public.c_dedicacion_plantilla_eyp(INOUT estado integer);
       public          peluquin    false            �            1255    16804    c_dedicaciones_offshore() 	   PROCEDURE     e  CREATE PROCEDURE public.c_dedicaciones_offshore()
    LANGUAGE plpgsql
    AS $$
	
DECLARE
c_datos INT := (select COUNT(*) from public.h_dedicaciones_offshore_tmp hpot);
	
	BEGIN
	
		if c_datos >= 1
		then
		
			RAISE notice 'Hay datos para insertar en la tabla de hechos.';
		
			delete from public.h_dedicaciones_offshore
			where h_dedi_offs_mes in (select distinct h_dedi_offs_mes from public.h_dedicaciones_offshore_tmp);
				-------
			insert into public.h_dedicaciones_offshore 
			select * from public.h_dedicaciones_offshore_tmp;
				-------
			delete from public.h_dedicaciones_offshore_tmp
			where h_dedi_offs_mes in (select distinct h_dedi_offs_mes from public.h_dedicaciones_offshore);
		
		else
		
			RAISE notice 'No hay datos para insertar en la tabla de hechos';
		--	select COUNT(*) from public.h_dedicaciones_offshore_tmp;
		
		end if;
	
	END;

$$;
 1   DROP PROCEDURE public.c_dedicaciones_offshore();
       public          peluquin    false            �            1255    16805    c_movimientos(integer) 	   PROCEDURE     J  CREATE PROCEDURE public.c_movimientos(INOUT estado integer)
    LANGUAGE plpgsql
    AS $$

	
DECLARE
c_datos integer ;

	
	BEGIN
	 c_datos  := (select COUNT(*) from public.h_movimientos_tmp hpot);
		if c_datos >= 1
		then
		
			RAISE notice 'Hay datos para insertar en la tabla de hechos.';
		
			delete from public.h_movimientos --ene e feb
			where fecha_datos in (select distinct fecha_datos from public.h_movimientos_tmp);
				-------
			insert into public.h_movimientos 
			select * from public.h_movimientos_tmp ;
				-------
			delete from public.h_movimientos_tmp 
			where fecha_datos in (select distinct fecha_datos from public.h_movimientos);
		     estado := 0;
		else
		
		 estado := -1;	RAISE notice 'No hay datos para insertar en la tabla de hechos';
		
		end if;
	exception when others then
      INSERT INTO public.tb_if_log_carga_arch(
	sb_nombre_archivo, sb_estado_ejec, sb_detalle_ejec, dt_ultima_ejec)
	VALUES ('Table h_movimientos', 'Error', SQLERRM || '-- '||SQLSTATE , current_date);
    	delete from public.h_movimientos_tmp;
	END;

$$;
 ;   DROP PROCEDURE public.c_movimientos(INOUT estado integer);
       public          peluquin    false            �            1255    16806    c_necesidad(integer) 	   PROCEDURE     �  CREATE PROCEDURE public.c_necesidad(INOUT estado integer)
    LANGUAGE plpgsql
    AS $$

	
DECLARE
c_datos integer;
	
	BEGIN
	c_datos  := (select COUNT(*) from public.necesidad_tmp hpot);
		if c_datos >= 1
		then
		
			RAISE notice 'Hay datos para insertar en la tabla de hechos.';
		
			delete from public.necesidad --ene e feb
			where fecha_datos in (select distinct fecha_datos from public.necesidad_tmp);
				-------
			insert into public.necesidad 
			select * from public.necesidad_tmp;
				-------
			delete from public.necesidad_tmp
			where fecha_datos in (select distinct fecha_datos from public.necesidad);
		 estado := 0;
		else
		
		estado := -1;	RAISE notice 'No hay datos para insertar en la tabla de hechos';
		
		end if;
		exception when others then
      INSERT INTO public.tb_if_log_carga_arch(
	sb_nombre_archivo, sb_estado_ejec, sb_detalle_ejec, dt_ultima_ejec)
	VALUES ('Table necesidad', 'Error', SQLERRM || '-- '||SQLSTATE , current_date);
    	delete from public.necesidad_tmp;
	END;

$$;
 9   DROP PROCEDURE public.c_necesidad(INOUT estado integer);
       public          peluquin    false            �            1255    16807    c_plantilha_offshore(integer) 	   PROCEDURE     �  CREATE PROCEDURE public.c_plantilha_offshore(INOUT estado integer)
    LANGUAGE plpgsql
    AS $$
	
DECLARE
c_datos integer; 
	
	BEGIN
	c_datos := (select COUNT(*) from public.h_plantilla_offshore_tmp hpot);
		if c_datos >= 1
		then
		
			RAISE notice 'Hay datos para insertar en la tabla de hechos.';
		
			delete from public.h_plantilla_offshore --ene e feb
			where h_mes in (select distinct h_mes from public.h_plantilla_offshore_tmp);
				-------
			insert into public.h_plantilla_offshore 
			select * from public.h_plantilla_offshore_tmp;
				-------
			delete from public.h_plantilla_offshore_tmp
			where h_mes in (select distinct h_mes from public.h_plantilla_offshore);
		 estado := 0;
		else
		
		 estado := -1;	RAISE notice 'No hay datos para insertar en la tabla de hechos';
		--	select COUNT(*) from public.h_plantilla_offshore_tmp;
		
		end if;
	exception when others then
 INSERT INTO public.tb_if_log_carga_arch(
	sb_nombre_archivo, sb_estado_ejec, sb_detalle_ejec, dt_ultima_ejec)
	VALUES ('Table h_plantilla_offshore', 'Error', SQLERRM || '-- '||SQLSTATE , current_date);
    	delete from public.h_plantilla_offshore_tmp;
	END;

$$;
 B   DROP PROCEDURE public.c_plantilha_offshore(INOUT estado integer);
       public          peluquin    false            �            1255    16808    c_proyectos(integer) 	   PROCEDURE       CREATE PROCEDURE public.c_proyectos(INOUT estado integer)
    LANGUAGE plpgsql
    AS $$
	
DECLARE
c_datos integer; 
	
	BEGIN
	c_datos := (select COUNT(*) from public.d_proyectos_tmp hpot);
		if c_datos >= 1
		then
		
			RAISE notice 'Hay datos para insertar en la tabla de hechos.';
		
			delete from public.d_proyectos --ene e feb
			where mes in (select distinct mes from public.d_proyectos_tmp);
				-------
			insert into public.d_proyectos 
			select * from public.d_proyectos_tmp;
				-------
			delete from public.d_proyectos_tmp
			where mes in (select distinct mes from public.d_proyectos);
		 estado := 0;
		else
		
		estado := -1;	RAISE notice 'No hay datos para insertar en la tabla de hechos';
		--	select COUNT(*) from public.d_proyectos_tmp;
		
		end if;
			exception when others then
 INSERT INTO public.tb_if_log_carga_arch(
	sb_nombre_archivo, sb_estado_ejec, sb_detalle_ejec, dt_ultima_ejec)
	VALUES ('Table d_proyectos', 'Error', SQLERRM || '-- '||SQLSTATE , current_date);
    	delete from public.d_proyectos_tmp;
	END;

$$;
 9   DROP PROCEDURE public.c_proyectos(INOUT estado integer);
       public          peluquin    false            �            1255    16809    c_seguimiento(integer) 	   PROCEDURE       CREATE PROCEDURE public.c_seguimiento(INOUT estado integer)
    LANGUAGE plpgsql
    AS $$

	
DECLARE
c_datos integer; 
	
	BEGIN
	c_datos := (select COUNT(*) from public.seguimiento_tmp hpot);
		if c_datos >= 1
		then
		
			RAISE notice 'Hay datos para insertar en la tabla de hechos.';
		
			delete from public.seguimiento --ene e feb
			where fecha_datos in (select distinct fecha_datos from public.seguimiento_tmp);
				-------
			insert into public.seguimiento 
			select * from public.seguimiento_tmp;
				-------
			delete from public.seguimiento_tmp
			where fecha_datos in (select distinct fecha_datos from public.seguimiento);
		estado := 0;
		else
		
		 estado := -1;	RAISE notice 'No hay datos para insertar en la tabla de hechos';
		
		end if;
exception when others then
 INSERT INTO public.tb_if_log_carga_arch(
	sb_nombre_archivo, sb_estado_ejec, sb_detalle_ejec, dt_ultima_ejec)
	VALUES ('Table Seguimiento', 'Error', SQLERRM || '-- '||SQLSTATE , current_date);
    	delete from public.seguimiento_tmp;
	END;

$$;
 ;   DROP PROCEDURE public.c_seguimiento(INOUT estado integer);
       public          peluquin    false            �            1255    16810 G   pcd_cargar_candidatos_tmp(character varying, integer, integer, integer) 	   PROCEDURE     �  CREATE PROCEDURE public.pcd_cargar_candidatos_tmp(IN sbarchivo character varying, IN idfilearcho integer, INOUT onuestado integer, IN totlineas integer)
    LANGUAGE plpgsql
    AS $$
DECLARE
    --
    sbCargaArchivo   VARCHAR(1000);
    dtFechaEjecucion    DATE;
    fecha               VARCHAR(20);
    sbcadenaInsert      VARCHAR(4000);
    --   
    nu_id_log_carga     INTEGER;
    --   
    sbEstadoEjec        VARCHAR(1000);
    nuPosCadena         INTEGER;
    -- 
    sb_desc_estado_pend VARCHAR(20):= 'Pendiente';
    sb_code_error_ejec  VARCHAR(2) := '-1';
    sb_error_ejec_file1 VARCHAR(100):= 'Error, el proyecto_tmp aun no se carga';
    -- 
    sb_Verifica_paramet VARCHAR(4000);
    sb_msg_error        VARCHAR(4000);
    -- 
BEGIN
    RAISE notice '<<<<<< INICIO EJECUCIÓN pcd_cargar_candidatos_tmp >>>>>>';

    --

RAISE NOTICE 'pcd_cargar_candidatos_tmp: Llamado a pcd_cargar_candidatos_tmp -> %',sbArchivo;
    sbCargaArchivo   := fnc_migrar_candidatos_tmp(sbArchivo,totLineas);
	
    call pcdInsertLog(sbArchivo,sbCargaArchivo,idFileArcho);
 

EXCEPTION 
WHEN OTHERS THEN
    onuEstado := 1;
    raise notice 'fnc_migrar_candidatos_tmp: sqlstate % : sqlerrm %', SQLSTATE, SQLERRM;
    rollback;

END;
$$;
 �   DROP PROCEDURE public.pcd_cargar_candidatos_tmp(IN sbarchivo character varying, IN idfilearcho integer, INOUT onuestado integer, IN totlineas integer);
       public          peluquin    false                        1255    16811 W   pcd_cargar_dedicaciones_plantilla_ptp_tmp(character varying, integer, integer, integer) 	   PROCEDURE       CREATE PROCEDURE public.pcd_cargar_dedicaciones_plantilla_ptp_tmp(IN sbarchivo character varying, IN idfilearcho integer, INOUT onuestado integer, IN totlineas integer)
    LANGUAGE plpgsql
    AS $$
DECLARE
    --
    sbCargaArchivo   VARCHAR(1000);
    dtFechaEjecucion    DATE;
    fecha               VARCHAR(20);
    sbcadenaInsert      VARCHAR(4000);
    --   
    nu_id_log_carga     INTEGER;
    --   
    sbEstadoEjec        VARCHAR(1000);
    nuPosCadena         INTEGER;
    -- 
    sb_desc_estado_pend VARCHAR(20):= 'Pendiente';
    sb_code_error_ejec  VARCHAR(2) := '-1';
    sb_error_ejec_file1 VARCHAR(100):= 'Error, el proyecto_tmp aun no se carga';
    -- 
    sb_Verifica_paramet VARCHAR(4000);
    sb_msg_error        VARCHAR(4000);
    -- 
BEGIN
    RAISE notice '<<<<<< INICIO EJECUCIÓN pcd_cargar_candidatos_tmp >>>>>>';

    --

RAISE NOTICE 'pcd_cargar_candidatos_tmp: Llamado a pcd_cargar_dedicaciones_plantilla_ptp_tmp -> %',sbArchivo;
    sbCargaArchivo   := fnc_migrar_dedicaciones_plantilla_ptp_tmp(sbArchivo,totlineas);
    call pcdInsertLog(sbArchivo,sbCargaArchivo,idFileArcho);
 

EXCEPTION 
WHEN OTHERS THEN
    onuEstado := 1;
    raise notice 'fnc_migrar_dedicaciones_plantilla_ptp_tmpp: sqlstate % : sqlerrm %', SQLSTATE, SQLERRM;
    rollback;

END;
$$;
 �   DROP PROCEDURE public.pcd_cargar_dedicaciones_plantilla_ptp_tmp(IN sbarchivo character varying, IN idfilearcho integer, INOUT onuestado integer, IN totlineas integer);
       public          peluquin    false                       1255    16812 F   pcd_cargar_h_cambios_tmp(character varying, integer, integer, integer) 	   PROCEDURE     N  CREATE PROCEDURE public.pcd_cargar_h_cambios_tmp(IN sbarchivo character varying, IN idfilearcho integer, INOUT onuestado integer, IN totlineas integer)
    LANGUAGE plpgsql
    AS $$
DECLARE
    sbCargaArchivo   VARCHAR(1000);
    dtFechaEjecucion    DATE;
	
    fecha               VARCHAR(20);
    sbcadenaInsert      VARCHAR(4000);
	
    nu_id_log_carga     INTEGER;
    sbEstadoEjec        VARCHAR(1000);
    nuPosCadena         INTEGER;
	
    sb_desc_estado_pend VARCHAR(20):= 'Pendiente';
    sb_code_error_ejec  VARCHAR(2) := '-1';
    sb_error_ejec_file1 VARCHAR(100):= 'Error, el proyecto_tmp aun no se carga';
   
    sb_Verifica_paramet VARCHAR(4000);
    sb_msg_error        VARCHAR(4000);
   
BEGIN

    RAISE NOTICE 'pcd_cargar_candidatos_tmp: Llamado a pcd_cargar_candidatos_tmp -> %',sbArchivo;
    sbCargaArchivo   := fnc_migra_h_cambios_tmp(sbArchivo,totLineas);
    call pcdInsertLog(sbArchivo,sbCargaArchivo,idFileArcho);

EXCEPTION 
WHEN OTHERS THEN
    onuEstado := 1;
    raise notice 'fnc_migra_h_cambios_tmp: sqlstate % : sqlerrm %', SQLSTATE, SQLERRM;
    rollback;

END;
$$;
 �   DROP PROCEDURE public.pcd_cargar_h_cambios_tmp(IN sbarchivo character varying, IN idfilearcho integer, INOUT onuestado integer, IN totlineas integer);
       public          peluquin    false                       1255    16813 J   pcd_cargar_h_movimientos_tmp(character varying, integer, integer, integer) 	   PROCEDURE     b  CREATE PROCEDURE public.pcd_cargar_h_movimientos_tmp(IN sbarchivo character varying, IN idfilearcho integer, INOUT onuestado integer, IN totlineas integer)
    LANGUAGE plpgsql
    AS $$
DECLARE
    sbCargaArchivo      VARCHAR(1000);
    dtFechaEjecucion    DATE;
	
    fecha               VARCHAR(20);
    sbcadenaInsert      VARCHAR(4000);
	
    nu_id_log_carga     INTEGER;
    sbEstadoEjec        VARCHAR(1000);
    nuPosCadena         INTEGER;
	
    sb_desc_estado_pend VARCHAR(20):= 'Pendiente';
    sb_code_error_ejec  VARCHAR(2) := '-1';
    sb_error_ejec_file1 VARCHAR(100):= 'Error, en movimientos_tmp aun no se carga';
   
    sb_Verifica_paramet VARCHAR(4000);
    sb_msg_error        VARCHAR(4000);
   
BEGIN

    RAISE NOTICE 'pcd_cargar_movimientos_tmp: Llamado a pcd_cargar_movimientos_tmp -> %',sbArchivo;
    sbCargaArchivo   := fnc_migra_h_movimientos_tmp(sbArchivo,totLineas);
    call pcdInsertLog(sbArchivo,sbCargaArchivo,idFileArcho);

EXCEPTION 
WHEN OTHERS THEN
    onuEstado := 1;
    raise notice 'fnc_migra_h_movimientos_tmp: sqlstate % : sqlerrm %', SQLSTATE, SQLERRM;
    rollback;

END;
$$;
 �   DROP PROCEDURE public.pcd_cargar_h_movimientos_tmp(IN sbarchivo character varying, IN idfilearcho integer, INOUT onuestado integer, IN totlineas integer);
       public          peluquin    false                       1255    16814 H   pcd_cargar_necesidades_tmp(character varying, integer, integer, integer) 	   PROCEDURE     �  CREATE PROCEDURE public.pcd_cargar_necesidades_tmp(IN sbarchivo character varying, IN idfilearcho integer, INOUT onuestado integer, IN totlineas integer)
    LANGUAGE plpgsql
    AS $$
DECLARE
    --
    sbCargaArchivo   VARCHAR(1000);
    dtFechaEjecucion    DATE;
    fecha               VARCHAR(20);
    sbcadenaInsert      VARCHAR(4000);
    --   
    nu_id_log_carga     INTEGER;
    --   
    sbEstadoEjec        VARCHAR(1000);
    nuPosCadena         INTEGER;
    -- 
    sb_desc_estado_pend VARCHAR(20):= 'Pendiente';
    sb_code_error_ejec  VARCHAR(2) := '-1';
    sb_error_ejec_file1 VARCHAR(100):= 'Error, el proyecto_tmp aun no se carga';
    -- 
    sb_Verifica_paramet VARCHAR(4000);
    sb_msg_error        VARCHAR(4000);
    -- 
BEGIN
    RAISE notice '<<<<<< INICIO EJECUCIÓN pcd_cargar_seguimiento_tmp >>>>>>';

    --

RAISE NOTICE 'pcd_cargar_necesidades_tmp: Llamado a fnc_migrar_necesidades_tmp -> %',sbArchivo;
   sbCargaArchivo   := fnc_migrar_necesidades_tmp(sbArchivo,totlineas);
    call pcdInsertLog(sbArchivo,sbCargaArchivo,idFileArcho);
 

EXCEPTION 
WHEN OTHERS THEN
    onuEstado := 1;
    raise notice 'fnc_migrar_necesidades_tmp: sqlstate % : sqlerrm %', SQLSTATE, SQLERRM;
    rollback;

END;
$$;
 �   DROP PROCEDURE public.pcd_cargar_necesidades_tmp(IN sbarchivo character varying, IN idfilearcho integer, INOUT onuestado integer, IN totlineas integer);
       public          peluquin    false                       1255    16815 O   pcd_cargar_plantilla_offshore_tmp(character varying, integer, integer, integer) 	   PROCEDURE     �  CREATE PROCEDURE public.pcd_cargar_plantilla_offshore_tmp(IN sbarchivo character varying, IN idfilearcho integer, INOUT onuestado integer, IN totlineas integer)
    LANGUAGE plpgsql
    AS $$
DECLARE
    --
    sbCargaArchivo   VARCHAR(1000);
    dtFechaEjecucion    DATE;
    fecha               VARCHAR(20);
    sbcadenaInsert      VARCHAR(4000);
    --   
    nu_id_log_carga     INTEGER;
    --   
    sbEstadoEjec        VARCHAR(1000);
    nuPosCadena         INTEGER;
    -- 
    sb_desc_estado_pend VARCHAR(20):= 'Pendiente';
    sb_code_error_ejec  VARCHAR(2) := '-1';
    sb_error_ejec_file1 VARCHAR(100):= 'Error, el proyecto_tmp aun no se carga';
    -- 
    sb_Verifica_paramet VARCHAR(4000);
    sb_msg_error        VARCHAR(4000);
    -- 
BEGIN
    RAISE notice '<<<<<< INICIO EJECUCIÓN pcd_cargar_plantilla_offshore_tmp >>>>>>';

    --

RAISE NOTICE 'pcd_cargar_plantilla_offshore_tmp: Llamado a pcd_cargar_plantilla_offshore_tmp -> %',sbArchivo;
    sbCargaArchivo   := fnc_migra_plantilla_offshore_tmp(sbArchivo,totlineas);
    call pcdInsertLog(sbArchivo,sbCargaArchivo,idFileArcho);
 

EXCEPTION 
WHEN OTHERS THEN
    onuEstado := 1;
    raise notice 'pcd_cargar_plantilla_offshore_tmp: sqlstate % : sqlerrm %', SQLSTATE, SQLERRM;
    rollback;

END;
$$;
 �   DROP PROCEDURE public.pcd_cargar_plantilla_offshore_tmp(IN sbarchivo character varying, IN idfilearcho integer, INOUT onuestado integer, IN totlineas integer);
       public          peluquin    false                       1255    16816 E   pcd_cargar_proyecto_tmp(character varying, integer, integer, integer) 	   PROCEDURE     �  CREATE PROCEDURE public.pcd_cargar_proyecto_tmp(IN sbarchivoproyecto character varying, IN idfilearcharbo integer, INOUT onuestado integer, IN totlineas integer)
    LANGUAGE plpgsql
    AS $$
DECLARE
    --
    sbCargaProyecto   VARCHAR(1000);
    dtFechaEjecucion    DATE;
    fecha               VARCHAR(20);
    sbcadenaInsert      VARCHAR(4000);
    --   
    nu_id_log_carga     INTEGER;
    --   
    sbEstadoEjec        VARCHAR(1000);
    nuPosCadena         INTEGER;
    -- 
    sb_desc_estado_pend VARCHAR(20):= 'Pendiente';
    sb_code_error_ejec  VARCHAR(2) := '-1';
    sb_error_ejec_file1 VARCHAR(100):= 'Error, el proyecto_tmp aun no se carga';
    -- 
    sb_Verifica_paramet VARCHAR(4000);
    sb_msg_error        VARCHAR(4000);
    -- 
BEGIN
    RAISE notice '<<<<<< INICIO EJECUCIÓN pcd_cargar_proyecto_tmp >>>>>>';

    --

RAISE NOTICE 'pcd_cargar_proyecto_tmp: Llamado a fnc_migra_proyecto_tmp -> %',sbArchivoProyecto;
    sbCargaProyecto   := fnc_migra_proyecto_tmp(sbArchivoProyecto,totlineas);
    call pcdInsertLog(sbArchivoProyecto,sbCargaProyecto,idFileArchArbo);
 

EXCEPTION 
WHEN OTHERS THEN
    onuEstado := 1;
    raise notice 'pcd_cargar_proyecto_tmp: sqlstate % : sqlerrm %', SQLSTATE, SQLERRM;
    rollback;

END;
$$;
 �   DROP PROCEDURE public.pcd_cargar_proyecto_tmp(IN sbarchivoproyecto character varying, IN idfilearcharbo integer, INOUT onuestado integer, IN totlineas integer);
       public          peluquin    false                       1255    16817 H   pcd_cargar_seguimiento_tmp(character varying, integer, integer, integer) 	   PROCEDURE     �  CREATE PROCEDURE public.pcd_cargar_seguimiento_tmp(IN sbarchivo character varying, IN idfilearcho integer, INOUT onuestado integer, IN totlineas integer)
    LANGUAGE plpgsql
    AS $$
DECLARE
    --
    sbCargaArchivo   VARCHAR(1000);
    dtFechaEjecucion    DATE;
    fecha               VARCHAR(20);
    sbcadenaInsert      VARCHAR(4000);
    --   
    nu_id_log_carga     INTEGER;
    --   
    sbEstadoEjec        VARCHAR(1000);
    nuPosCadena         INTEGER;
    -- 
    sb_desc_estado_pend VARCHAR(20):= 'Pendiente';
    sb_code_error_ejec  VARCHAR(2) := '-1';
    sb_error_ejec_file1 VARCHAR(100):= 'Error, el proyecto_tmp aun no se carga';
    -- 
    sb_Verifica_paramet VARCHAR(4000);
    sb_msg_error        VARCHAR(4000);
    -- 
BEGIN
    RAISE notice '<<<<<< INICIO EJECUCIÓN pcd_cargar_seguimiento_tmp >>>>>>';

    --

RAISE NOTICE 'pcd_cargar_seguimiento_tmp: Llamado a fnc_migrar_seguimiento_tmp -> %',sbArchivo;
    sbCargaArchivo   := fnc_migrar_seguimiento_tmp(sbArchivo,totlineas);
    call pcdInsertLog(sbArchivo,sbCargaArchivo,idFileArcho);
 

EXCEPTION 
WHEN OTHERS THEN
    onuEstado := 1;
    raise notice 'fnc_migrar_seguimiento_tmp: sqlstate % : sqlerrm %', SQLSTATE, SQLERRM;
    rollback;

END;
$$;
 �   DROP PROCEDURE public.pcd_cargar_seguimiento_tmp(IN sbarchivo character varying, IN idfilearcho integer, INOUT onuestado integer, IN totlineas integer);
       public          peluquin    false                       1255    16818 ;   pcdinsertlog(character varying, character varying, integer) 	   PROCEDURE     �  CREATE PROCEDURE public.pcdinsertlog(IN sb_nombre_archivo character varying, IN sbcadenaejecucion character varying, IN nuidlogarchivo integer)
    LANGUAGE plpgsql
    AS $$
DECLARE
    nu_id_log_carga INTEGER;
    dtFechaEjecuc   TIMESTAMP;
    sbEstadoEjec    VARCHAR(1000);
    sbDescripEjec   VARCHAR(4000);
    nuPosCadena     INTEGER;
BEGIN
    --
    nuPosCadena :=  position('|' in sbCadenaEjecucion);
    --
    IF nuPosCadena > 0
    THEN
        --
        sbEstadoEjec  :=substr(sbCadenaEjecucion,1,position('|' in sbCadenaEjecucion)-1); 
        sbDescripEjec :=substr(sbCadenaEjecucion,position('|' in sbCadenaEjecucion)+1); 
        -- 
    ELSE 
        --
        sbEstadoEjec  := sbCadenaEjecucion;
        sbDescripEjec := sbCadenaEjecucion;
        --
    END IF;
    --
    dtFechaEjecuc :=   current_timestamp;
    -- 
    UPDATE "public".tb_if_log_carga_arch
       SET dt_ultima_ejec = dtFechaEjecuc,
           sb_estado_ejec  = sbEstadoEjec  , 
           sb_detalle_ejec = sbDescripEjec 
     WHERE nu_id_log       =nuIdLogArchivo;  
    --
EXCEPTION 
WHEN OTHERS 
then
    raise notice 'Haré ROLLBACK';
    --
    ROLLBACK;
    --
END;
$$;
 �   DROP PROCEDURE public.pcdinsertlog(IN sb_nombre_archivo character varying, IN sbcadenaejecucion character varying, IN nuidlogarchivo integer);
       public          peluquin    false            �            1259    16819 	   ganancias    TABLE     �   CREATE TABLE public.ganancias (
    id_ganancias integer NOT NULL,
    id integer NOT NULL,
    ganancia_valor character varying(20) NOT NULL,
    created_at date NOT NULL
);
    DROP TABLE public.ganancias;
       public         heap    postgres    false            �            1259    16822    ganancias_id_ganancias_seq    SEQUENCE     �   CREATE SEQUENCE public.ganancias_id_ganancias_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.ganancias_id_ganancias_seq;
       public          postgres    false    214            �           0    0    ganancias_id_ganancias_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.ganancias_id_ganancias_seq OWNED BY public.ganancias.id_ganancias;
          public          postgres    false    215            �            1259    16823    historia_ganancias    TABLE     �   CREATE TABLE public.historia_ganancias (
    id_historia_ganancias integer NOT NULL,
    id_ganancias integer NOT NULL,
    ganancia_valor character varying(20) NOT NULL,
    created_at date NOT NULL
);
 &   DROP TABLE public.historia_ganancias;
       public         heap    postgres    false            �            1259    16826 ,   historia_ganancias_id_historia_ganancias_seq    SEQUENCE     �   CREATE SEQUENCE public.historia_ganancias_id_historia_ganancias_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 C   DROP SEQUENCE public.historia_ganancias_id_historia_ganancias_seq;
       public          postgres    false    216            �           0    0 ,   historia_ganancias_id_historia_ganancias_seq    SEQUENCE OWNED BY     }   ALTER SEQUENCE public.historia_ganancias_id_historia_ganancias_seq OWNED BY public.historia_ganancias.id_historia_ganancias;
          public          postgres    false    217            �            1259    16827    modulo_id_seq    SEQUENCE     ~   CREATE SEQUENCE public.modulo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;
 $   DROP SEQUENCE public.modulo_id_seq;
       public          peluquin    false            �            1259    16828    modulo    TABLE     �   CREATE TABLE public.modulo (
    id bigint DEFAULT nextval('public.modulo_id_seq'::regclass) NOT NULL,
    codigo character varying(15) NOT NULL,
    estado boolean NOT NULL,
    nombre character varying(255) NOT NULL,
    id_padre bigint
);
    DROP TABLE public.modulo;
       public         heap    peluquin    false    218            �            1259    16832    permiso    TABLE     �   CREATE TABLE public.permiso (
    id bigint NOT NULL,
    codigo character varying(15) NOT NULL,
    descripcion character varying(255)
);
    DROP TABLE public.permiso;
       public         heap    peluquin    false            �            1259    16835    permiso_rol    TABLE        CREATE TABLE public.permiso_rol (
    id_rol bigint NOT NULL,
    id_modulo bigint NOT NULL,
    id_permiso bigint NOT NULL
);
    DROP TABLE public.permiso_rol;
       public         heap    peluquin    false            �            1259    16838 
   porcentaje    TABLE     �   CREATE TABLE public.porcentaje (
    id_porcentaje integer NOT NULL,
    porcentaje_empl character varying(20) NOT NULL,
    created_at date NOT NULL
);
    DROP TABLE public.porcentaje;
       public         heap    postgres    false            �            1259    16841    porcentaje_id_porcentaje_seq    SEQUENCE     �   CREATE SEQUENCE public.porcentaje_id_porcentaje_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.porcentaje_id_porcentaje_seq;
       public          postgres    false    222            �           0    0    porcentaje_id_porcentaje_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.porcentaje_id_porcentaje_seq OWNED BY public.porcentaje.id_porcentaje;
          public          postgres    false    223            �            1259    16842    registro_cortes    TABLE       CREATE TABLE public.registro_cortes (
    id integer NOT NULL,
    id_porcentaje integer NOT NULL,
    nu_cod_empleado integer NOT NULL,
    numero_cortes character varying(20) NOT NULL,
    created_at date NOT NULL,
    valor_corte character varying(50)
);
 #   DROP TABLE public.registro_cortes;
       public         heap    postgres    false            �           0    0 "   COLUMN registro_cortes.valor_corte    COMMENT     ~   COMMENT ON COLUMN public.registro_cortes.valor_corte IS 'este campo es para guardar el valor del corte o servicio realizado';
          public          postgres    false    224            �            1259    16845    registro_cortes_id_seq    SEQUENCE     �   CREATE SEQUENCE public.registro_cortes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.registro_cortes_id_seq;
       public          postgres    false    224            �           0    0    registro_cortes_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.registro_cortes_id_seq OWNED BY public.registro_cortes.id;
          public          postgres    false    225            �            1259    16846    registro_pago    TABLE     �   CREATE TABLE public.registro_pago (
    id_pago integer NOT NULL,
    id integer NOT NULL,
    valor_pago character varying(20) NOT NULL,
    created_at date NOT NULL
);
 !   DROP TABLE public.registro_pago;
       public         heap    postgres    false            �            1259    16849    registro_de_pago_id_pago_seq    SEQUENCE     �   CREATE SEQUENCE public.registro_de_pago_id_pago_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.registro_de_pago_id_pago_seq;
       public          postgres    false    226            �           0    0    registro_de_pago_id_pago_seq    SEQUENCE OWNED BY     Z   ALTER SEQUENCE public.registro_de_pago_id_pago_seq OWNED BY public.registro_pago.id_pago;
          public          postgres    false    227            �            1259    16850 
   rol_id_seq    SEQUENCE     {   CREATE SEQUENCE public.rol_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;
 !   DROP SEQUENCE public.rol_id_seq;
       public          peluquin    false            �            1259    16851    rol    TABLE     �   CREATE TABLE public.rol (
    id integer DEFAULT nextval('public.rol_id_seq'::regclass) NOT NULL,
    codigo character varying(15) NOT NULL,
    descripcion character varying(100) NOT NULL,
    estado boolean NOT NULL
);
    DROP TABLE public.rol;
       public         heap    peluquin    false    228            �            1259    16855 "   tb_if_log_carga_arch_nu_id_log_seq    SEQUENCE     �   CREATE SEQUENCE public.tb_if_log_carga_arch_nu_id_log_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 9   DROP SEQUENCE public.tb_if_log_carga_arch_nu_id_log_seq;
       public          peluquin    false            �            1259    16856    tb_if_personas    TABLE     (  CREATE TABLE public.tb_if_personas (
    nu_cod_empleado integer NOT NULL,
    sb_nombre character varying(240) NOT NULL,
    sb_apellido character varying(45) NOT NULL,
    sb_direccion character varying(45),
    sb_email character varying(240) NOT NULL,
    sb_celular character varying(45)
);
 "   DROP TABLE public.tb_if_personas;
       public         heap    peluquin    false            �            1259    16861    usuario_id_seq    SEQUENCE        CREATE SEQUENCE public.usuario_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;
 %   DROP SEQUENCE public.usuario_id_seq;
       public          peluquin    false            �            1259    16862    usuario    TABLE     �   CREATE TABLE public.usuario (
    id integer DEFAULT nextval('public.usuario_id_seq'::regclass) NOT NULL,
    clave character varying(60) NOT NULL,
    usuario character varying(50) NOT NULL,
    cod_persona bigint NOT NULL
);
    DROP TABLE public.usuario;
       public         heap    peluquin    false    232            �            1259    16866    usuario_rol    TABLE     `   CREATE TABLE public.usuario_rol (
    id_rol bigint NOT NULL,
    id_usuario bigint NOT NULL
);
    DROP TABLE public.usuario_rol;
       public         heap    peluquin    false            �           2604    16869    ganancias id_ganancias    DEFAULT     �   ALTER TABLE ONLY public.ganancias ALTER COLUMN id_ganancias SET DEFAULT nextval('public.ganancias_id_ganancias_seq'::regclass);
 E   ALTER TABLE public.ganancias ALTER COLUMN id_ganancias DROP DEFAULT;
       public          postgres    false    215    214            �           2604    16870 (   historia_ganancias id_historia_ganancias    DEFAULT     �   ALTER TABLE ONLY public.historia_ganancias ALTER COLUMN id_historia_ganancias SET DEFAULT nextval('public.historia_ganancias_id_historia_ganancias_seq'::regclass);
 W   ALTER TABLE public.historia_ganancias ALTER COLUMN id_historia_ganancias DROP DEFAULT;
       public          postgres    false    217    216            �           2604    16871    porcentaje id_porcentaje    DEFAULT     �   ALTER TABLE ONLY public.porcentaje ALTER COLUMN id_porcentaje SET DEFAULT nextval('public.porcentaje_id_porcentaje_seq'::regclass);
 G   ALTER TABLE public.porcentaje ALTER COLUMN id_porcentaje DROP DEFAULT;
       public          postgres    false    223    222            �           2604    16872    registro_cortes id    DEFAULT     x   ALTER TABLE ONLY public.registro_cortes ALTER COLUMN id SET DEFAULT nextval('public.registro_cortes_id_seq'::regclass);
 A   ALTER TABLE public.registro_cortes ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    225    224            �           2604    16873    registro_pago id_pago    DEFAULT     �   ALTER TABLE ONLY public.registro_pago ALTER COLUMN id_pago SET DEFAULT nextval('public.registro_de_pago_id_pago_seq'::regclass);
 D   ALTER TABLE public.registro_pago ALTER COLUMN id_pago DROP DEFAULT;
       public          postgres    false    227    226            t          0    16819 	   ganancias 
   TABLE DATA           Q   COPY public.ganancias (id_ganancias, id, ganancia_valor, created_at) FROM stdin;
    public          postgres    false    214   \�       v          0    16823    historia_ganancias 
   TABLE DATA           m   COPY public.historia_ganancias (id_historia_ganancias, id_ganancias, ganancia_valor, created_at) FROM stdin;
    public          postgres    false    216   ��       y          0    16828    modulo 
   TABLE DATA           F   COPY public.modulo (id, codigo, estado, nombre, id_padre) FROM stdin;
    public          peluquin    false    219   ��       z          0    16832    permiso 
   TABLE DATA           :   COPY public.permiso (id, codigo, descripcion) FROM stdin;
    public          peluquin    false    220   x�       {          0    16835    permiso_rol 
   TABLE DATA           D   COPY public.permiso_rol (id_rol, id_modulo, id_permiso) FROM stdin;
    public          peluquin    false    221   ��       |          0    16838 
   porcentaje 
   TABLE DATA           P   COPY public.porcentaje (id_porcentaje, porcentaje_empl, created_at) FROM stdin;
    public          postgres    false    222   ��       ~          0    16842    registro_cortes 
   TABLE DATA           u   COPY public.registro_cortes (id, id_porcentaje, nu_cod_empleado, numero_cortes, created_at, valor_corte) FROM stdin;
    public          postgres    false    224   �       �          0    16846    registro_pago 
   TABLE DATA           L   COPY public.registro_pago (id_pago, id, valor_pago, created_at) FROM stdin;
    public          postgres    false    226   d�       �          0    16851    rol 
   TABLE DATA           >   COPY public.rol (id, codigo, descripcion, estado) FROM stdin;
    public          peluquin    false    229   ��       �          0    16856    tb_if_personas 
   TABLE DATA           u   COPY public.tb_if_personas (nu_cod_empleado, sb_nombre, sb_apellido, sb_direccion, sb_email, sb_celular) FROM stdin;
    public          peluquin    false    231   ��       �          0    16862    usuario 
   TABLE DATA           B   COPY public.usuario (id, clave, usuario, cod_persona) FROM stdin;
    public          peluquin    false    233   i�       �          0    16866    usuario_rol 
   TABLE DATA           9   COPY public.usuario_rol (id_rol, id_usuario) FROM stdin;
    public          peluquin    false    234   �       �           0    0    ganancias_id_ganancias_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.ganancias_id_ganancias_seq', 32, true);
          public          postgres    false    215            �           0    0 ,   historia_ganancias_id_historia_ganancias_seq    SEQUENCE SET     [   SELECT pg_catalog.setval('public.historia_ganancias_id_historia_ganancias_seq', 1, false);
          public          postgres    false    217            �           0    0    modulo_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.modulo_id_seq', 1, false);
          public          peluquin    false    218            �           0    0    porcentaje_id_porcentaje_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.porcentaje_id_porcentaje_seq', 1, false);
          public          postgres    false    223            �           0    0    registro_cortes_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.registro_cortes_id_seq', 168, true);
          public          postgres    false    225            �           0    0    registro_de_pago_id_pago_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.registro_de_pago_id_pago_seq', 26, true);
          public          postgres    false    227            �           0    0 
   rol_id_seq    SEQUENCE SET     8   SELECT pg_catalog.setval('public.rol_id_seq', 3, true);
          public          peluquin    false    228            �           0    0 "   tb_if_log_carga_arch_nu_id_log_seq    SEQUENCE SET     T   SELECT pg_catalog.setval('public.tb_if_log_carga_arch_nu_id_log_seq', 87927, true);
          public          peluquin    false    230            �           0    0    usuario_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.usuario_id_seq', 11, true);
          public          peluquin    false    232            �           2606    16875    modulo modulo_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.modulo
    ADD CONSTRAINT modulo_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.modulo DROP CONSTRAINT modulo_pkey;
       public            peluquin    false    219            �           2606    16877    permiso permiso_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.permiso
    ADD CONSTRAINT permiso_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.permiso DROP CONSTRAINT permiso_pkey;
       public            peluquin    false    220            �           2606    16879    permiso_rol permiso_rol_pkey 
   CONSTRAINT     u   ALTER TABLE ONLY public.permiso_rol
    ADD CONSTRAINT permiso_rol_pkey PRIMARY KEY (id_modulo, id_permiso, id_rol);
 F   ALTER TABLE ONLY public.permiso_rol DROP CONSTRAINT permiso_rol_pkey;
       public            peluquin    false    221    221    221            �           2606    16881    ganancias pk_ganancias 
   CONSTRAINT     ^   ALTER TABLE ONLY public.ganancias
    ADD CONSTRAINT pk_ganancias PRIMARY KEY (id_ganancias);
 @   ALTER TABLE ONLY public.ganancias DROP CONSTRAINT pk_ganancias;
       public            postgres    false    214            �           2606    16883 (   historia_ganancias pk_historia_ganancias 
   CONSTRAINT     y   ALTER TABLE ONLY public.historia_ganancias
    ADD CONSTRAINT pk_historia_ganancias PRIMARY KEY (id_historia_ganancias);
 R   ALTER TABLE ONLY public.historia_ganancias DROP CONSTRAINT pk_historia_ganancias;
       public            postgres    false    216            �           2606    16885    porcentaje pk_porcentaje 
   CONSTRAINT     a   ALTER TABLE ONLY public.porcentaje
    ADD CONSTRAINT pk_porcentaje PRIMARY KEY (id_porcentaje);
 B   ALTER TABLE ONLY public.porcentaje DROP CONSTRAINT pk_porcentaje;
       public            postgres    false    222            �           2606    16887 "   registro_cortes pk_registro_cortes 
   CONSTRAINT     `   ALTER TABLE ONLY public.registro_cortes
    ADD CONSTRAINT pk_registro_cortes PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.registro_cortes DROP CONSTRAINT pk_registro_cortes;
       public            postgres    false    224            �           2606    16889 !   registro_pago pk_registro_de_pago 
   CONSTRAINT     d   ALTER TABLE ONLY public.registro_pago
    ADD CONSTRAINT pk_registro_de_pago PRIMARY KEY (id_pago);
 K   ALTER TABLE ONLY public.registro_pago DROP CONSTRAINT pk_registro_de_pago;
       public            postgres    false    226            �           2606    16891    rol rol_pkey 
   CONSTRAINT     J   ALTER TABLE ONLY public.rol
    ADD CONSTRAINT rol_pkey PRIMARY KEY (id);
 6   ALTER TABLE ONLY public.rol DROP CONSTRAINT rol_pkey;
       public            peluquin    false    229            �           2606    16893 "   tb_if_personas tb_if_personas_pkey 
   CONSTRAINT     m   ALTER TABLE ONLY public.tb_if_personas
    ADD CONSTRAINT tb_if_personas_pkey PRIMARY KEY (nu_cod_empleado);
 L   ALTER TABLE ONLY public.tb_if_personas DROP CONSTRAINT tb_if_personas_pkey;
       public            peluquin    false    231            �           2606    16895 #   modulo uk_9d8qgvq3u05dixeak5100b9v5 
   CONSTRAINT     `   ALTER TABLE ONLY public.modulo
    ADD CONSTRAINT uk_9d8qgvq3u05dixeak5100b9v5 UNIQUE (codigo);
 M   ALTER TABLE ONLY public.modulo DROP CONSTRAINT uk_9d8qgvq3u05dixeak5100b9v5;
       public            peluquin    false    219            �           2606    16897     rol uk_fb7ghyrqk7vsxaqf6bx7m0pjd 
   CONSTRAINT     ]   ALTER TABLE ONLY public.rol
    ADD CONSTRAINT uk_fb7ghyrqk7vsxaqf6bx7m0pjd UNIQUE (codigo);
 J   ALTER TABLE ONLY public.rol DROP CONSTRAINT uk_fb7ghyrqk7vsxaqf6bx7m0pjd;
       public            peluquin    false    229            �           2606    16899 $   usuario uk_i02kr8ui5pqddyd7pkm3v4jbt 
   CONSTRAINT     b   ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT uk_i02kr8ui5pqddyd7pkm3v4jbt UNIQUE (usuario);
 N   ALTER TABLE ONLY public.usuario DROP CONSTRAINT uk_i02kr8ui5pqddyd7pkm3v4jbt;
       public            peluquin    false    233            �           2606    16901 $   usuario uk_qbeg87jpo5qdig7o6gtnobtpx 
   CONSTRAINT     f   ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT uk_qbeg87jpo5qdig7o6gtnobtpx UNIQUE (cod_persona);
 N   ALTER TABLE ONLY public.usuario DROP CONSTRAINT uk_qbeg87jpo5qdig7o6gtnobtpx;
       public            peluquin    false    233            �           2606    16903    usuario usuario_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.usuario DROP CONSTRAINT usuario_pkey;
       public            peluquin    false    233            �           2606    16905    usuario_rol usuario_rol_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.usuario_rol
    ADD CONSTRAINT usuario_rol_pkey PRIMARY KEY (id_usuario, id_rol);
 F   ALTER TABLE ONLY public.usuario_rol DROP CONSTRAINT usuario_rol_pkey;
       public            peluquin    false    234    234            �           1259    16906    ganancias_pk    INDEX     Q   CREATE UNIQUE INDEX ganancias_pk ON public.ganancias USING btree (id_ganancias);
     DROP INDEX public.ganancias_pk;
       public            postgres    false    214            �           1259    16907    historia_ganancias_pk    INDEX     l   CREATE UNIQUE INDEX historia_ganancias_pk ON public.historia_ganancias USING btree (id_historia_ganancias);
 )   DROP INDEX public.historia_ganancias_pk;
       public            postgres    false    216            �           1259    16908    odtiener_fk    INDEX     R   CREATE INDEX odtiener_fk ON public.historia_ganancias USING btree (id_ganancias);
    DROP INDEX public.odtiener_fk;
       public            postgres    false    216            �           1259    16909    porc_regis_fk    INDEX     R   CREATE INDEX porc_regis_fk ON public.registro_cortes USING btree (id_porcentaje);
 !   DROP INDEX public.porc_regis_fk;
       public            postgres    false    224            �           1259    16910    porcentaje_pk    INDEX     T   CREATE UNIQUE INDEX porcentaje_pk ON public.porcentaje USING btree (id_porcentaje);
 !   DROP INDEX public.porcentaje_pk;
       public            postgres    false    222            �           1259    16911    registra_fk    INDEX     R   CREATE INDEX registra_fk ON public.registro_cortes USING btree (nu_cod_empleado);
    DROP INDEX public.registra_fk;
       public            postgres    false    224            �           1259    16912    registro_cortes_pk    INDEX     S   CREATE UNIQUE INDEX registro_cortes_pk ON public.registro_cortes USING btree (id);
 &   DROP INDEX public.registro_cortes_pk;
       public            postgres    false    224            �           1259    16913    registro_de_pago_pk    INDEX     W   CREATE UNIQUE INDEX registro_de_pago_pk ON public.registro_pago USING btree (id_pago);
 '   DROP INDEX public.registro_de_pago_pk;
       public            postgres    false    226            �           1259    16914    relationship_6_fk    INDEX     I   CREATE INDEX relationship_6_fk ON public.registro_pago USING btree (id);
 %   DROP INDEX public.relationship_6_fk;
       public            postgres    false    226            �           1259    16915    relationship_7_fk    INDEX     E   CREATE INDEX relationship_7_fk ON public.ganancias USING btree (id);
 %   DROP INDEX public.relationship_7_fk;
       public            postgres    false    214            �           2606    16916 "   modulo fk1f1n6nskarmr0i67qsohbvoy1    FK CONSTRAINT     �   ALTER TABLE ONLY public.modulo
    ADD CONSTRAINT fk1f1n6nskarmr0i67qsohbvoy1 FOREIGN KEY (id_padre) REFERENCES public.modulo(id);
 L   ALTER TABLE ONLY public.modulo DROP CONSTRAINT fk1f1n6nskarmr0i67qsohbvoy1;
       public          peluquin    false    219    219    3260            �           2606    16921 '   usuario_rol fk3ftpt75ebughsiy5g03b11akt    FK CONSTRAINT     �   ALTER TABLE ONLY public.usuario_rol
    ADD CONSTRAINT fk3ftpt75ebughsiy5g03b11akt FOREIGN KEY (id_usuario) REFERENCES public.usuario(id);
 Q   ALTER TABLE ONLY public.usuario_rol DROP CONSTRAINT fk3ftpt75ebughsiy5g03b11akt;
       public          peluquin    false    233    3290    234            �           2606    16926 (   ganancias fk_ganancia_relations_registro    FK CONSTRAINT     �   ALTER TABLE ONLY public.ganancias
    ADD CONSTRAINT fk_ganancia_relations_registro FOREIGN KEY (id) REFERENCES public.registro_cortes(id) ON UPDATE RESTRICT ON DELETE RESTRICT;
 R   ALTER TABLE ONLY public.ganancias DROP CONSTRAINT fk_ganancia_relations_registro;
       public          postgres    false    3271    224    214            �           2606    16931 -   registro_cortes fk_registro_registra_personas    FK CONSTRAINT     �   ALTER TABLE ONLY public.registro_cortes
    ADD CONSTRAINT fk_registro_registra_personas FOREIGN KEY (nu_cod_empleado) REFERENCES public.tb_if_personas(nu_cod_empleado) ON UPDATE RESTRICT ON DELETE RESTRICT;
 W   ALTER TABLE ONLY public.registro_cortes DROP CONSTRAINT fk_registro_registra_personas;
       public          postgres    false    231    3284    224            �           2606    16936 ,   registro_pago fk_registro_relations_registro    FK CONSTRAINT     �   ALTER TABLE ONLY public.registro_pago
    ADD CONSTRAINT fk_registro_relations_registro FOREIGN KEY (id) REFERENCES public.registro_cortes(id) ON UPDATE RESTRICT ON DELETE RESTRICT;
 V   ALTER TABLE ONLY public.registro_pago DROP CONSTRAINT fk_registro_relations_registro;
       public          postgres    false    224    226    3271            �           2606    16941 '   permiso_rol fkbxtjtwlam8xueast8bvgvgggs    FK CONSTRAINT     �   ALTER TABLE ONLY public.permiso_rol
    ADD CONSTRAINT fkbxtjtwlam8xueast8bvgvgggs FOREIGN KEY (id_rol) REFERENCES public.rol(id);
 Q   ALTER TABLE ONLY public.permiso_rol DROP CONSTRAINT fkbxtjtwlam8xueast8bvgvgggs;
       public          peluquin    false    3280    221    229            �           2606    16946 '   permiso_rol fkew721nerv7hh0fnta230h6q65    FK CONSTRAINT     �   ALTER TABLE ONLY public.permiso_rol
    ADD CONSTRAINT fkew721nerv7hh0fnta230h6q65 FOREIGN KEY (id_modulo) REFERENCES public.modulo(id);
 Q   ALTER TABLE ONLY public.permiso_rol DROP CONSTRAINT fkew721nerv7hh0fnta230h6q65;
       public          peluquin    false    3260    219    221            �           2606    16951 '   permiso_rol fkjistwk3oxiw9e1yxjb0j0a0do    FK CONSTRAINT     �   ALTER TABLE ONLY public.permiso_rol
    ADD CONSTRAINT fkjistwk3oxiw9e1yxjb0j0a0do FOREIGN KEY (id_permiso) REFERENCES public.permiso(id);
 Q   ALTER TABLE ONLY public.permiso_rol DROP CONSTRAINT fkjistwk3oxiw9e1yxjb0j0a0do;
       public          peluquin    false    3264    221    220            �           2606    16956 '   usuario_rol fkkxcv7htfnm9x1wkofnud0ewql    FK CONSTRAINT     �   ALTER TABLE ONLY public.usuario_rol
    ADD CONSTRAINT fkkxcv7htfnm9x1wkofnud0ewql FOREIGN KEY (id_rol) REFERENCES public.rol(id);
 Q   ALTER TABLE ONLY public.usuario_rol DROP CONSTRAINT fkkxcv7htfnm9x1wkofnud0ewql;
       public          peluquin    false    3280    234    229            t   3   x�36�443�050�4202�50�52�26
[p�@�́�+F��� �Xf      v       x���44�41�4202�50�5������� 0T�      y   �   x�u�=� �������֏���&RH�[lHZ0/�d��)u�P��/O��IV5$`��w1����塭�.��/.�-��dЅ%�C�����Ggw�s�r[���1+͚�s1x�a\*!����<�>`���Jj�9'L6�n!
�n!b#R
      z   -   x�3����IM-�2�t�t.JM,�2�t�tL.)M�ɬrc���� �	�      {   #   x�3�4�4�2�F`�H�E�"�@�=... f�      |      x�3�43�4202�50�52����� &9L      ~   ?   x�]ʱ�0����)K����s�R��s/4l瞕J8�P̡�:�t�҇�	.I�/�.}      �   3   x�32�443�44275�4202�50�52�22�[pZ��́�+F��� �(�      �   9   x�3�tt��tL����,.)JL�/�,�2�t��qt�rt��t��ILʇ���qqq �<�      �   i   x�357067�LL��̃���%E�)�E���\���&Ʀ&&�n�9���N�y饩E���nN�~A�����~�z�.�z����E�
��
&�~���\1z\\\ ʧ      �   �   x�5�I�0  �s���<R1Y��)&^�Pe�~��y�`������>�X�i�XX�����:�ZÓ�7�F䖳Dql��Mn�p)�1�]�b"�T!�����t���. �����������iQ�~%.5N����f� ���g c�҈�t��A50�      �      x�3�4�2�44����� �     