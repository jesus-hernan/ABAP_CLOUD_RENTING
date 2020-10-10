@AbapCatalog.sqlViewName: 'ZTRENT'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Renting'
define view ZTCDS_RENTING
  as select from ztrent_cars
{
  key matricula                               as Matricula,
      marca                                   as Marca,     
      case 
       when alq_hasta <> '' then dats_days_between( cast( $session.system_date as abap.dats ), alq_hasta) 
      end as Dias
}
