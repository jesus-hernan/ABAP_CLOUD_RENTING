@AbapCatalog.sqlViewName: 'ZTDETCUST'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Customer Detail'
@Metadata.allowExtensions: true -- Metadata Extension
define view ZTCDS_DET_CUST
  as select from ztrent_customers as Customer
{
  key doc_id,
  key matricula as Matricula,
      nombres   as Nombre,
      apellidos as Apellidos,
      email     as Correo,
      cntr_type as TipoContrato
}
