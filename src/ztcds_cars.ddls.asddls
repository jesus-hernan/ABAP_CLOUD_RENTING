@AbapCatalog.sqlViewName: 'ZTCARS'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Cars'
@Metadata.allowExtensions: true
@Search.searchable: true
@UI.headerInfo: { typeName       : 'Vehiculo',
                  typeNamePlural : 'Vehiculos',
                  title          : { type: #STANDARD, value: 'Marca'},
                  description    : { type: #STANDARD, value: 'Modelo'},
                  imageUrl       : 'Imagen'}
define view ztcds_cars
  as select from ztrent_cars as Cars
  association [1]    to ZTCDS_RENTING  as _Rent        on Cars.matricula = _Rent.Matricula
  association [0..*] to ztcds_brands   as _Brands      on Cars.marca = _Brands.Marca
  association [0..*] to ZTCDS_DET_CUST as _DetCustomer on Cars.matricula = _DetCustomer.Matricula
{
  key matricula      as Matricula,
      marca          as Marca,
      modelo         as Modelo,
      color          as Color,
      motor          as Motor,
      potencia       as Potencia,
      und_potencia   as Unidad,
      combustible    as Combustible,
      consumo        as Consumo,
      fecha_fabr     as FechaFabricacion,
      puertas        as Puertas,
      precio         as Precio,
      moneda         as Moneda,
      alquilado      as Alquilado,
      alq_desde      as Desde,
      alq_hasta      as Hasta,
      case
      when _Rent.Dias <= 0 then 0
      when _Rent.Dias between 1 and 30 then 1
      when _Rent.Dias between 31 and 100 then 2
      when _Rent.Dias > 100 then 3
       else 0
       end           as TiempoRenta,
      _Brands.Imagen as Imagen,
      _DetCustomer
}
