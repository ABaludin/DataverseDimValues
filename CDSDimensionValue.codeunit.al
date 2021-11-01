codeunit 50104 "AWR_CDS Dimension Value"
{

    local procedure InsertIntegrationTableMapping(var IntegrationTableMapping: Record "Integration Table Mapping"; MappingName: Code[20]; TableNo: Integer; IntegrationTableNo: Integer; IntegrationTableUIDFieldNo: Integer; IntegrationTableModifiedFieldNo: Integer; TableConfigTemplateCode: Code[10]; IntegrationTableConfigTemplateCode: Code[10]; SynchOnlyCoupledRecords: Boolean)
    begin
        IntegrationTableMapping.CreateRecord(MappingName, TableNo, IntegrationTableNo, IntegrationTableUIDFieldNo, IntegrationTableModifiedFieldNo, TableConfigTemplateCode, IntegrationTableConfigTemplateCode, SynchOnlyCoupledRecords, IntegrationTableMapping.Direction::ToIntegrationTable, 'CDS');
    end;

    procedure InsertIntegrationFieldMapping(IntegrationTableMappingName: Code[20]; TableFieldNo: Integer; IntegrationTableFieldNo: Integer; SynchDirection: Option; ConstValue: Text; ValidateField: Boolean; ValidateIntegrationTableField: Boolean)
    var
        IntegrationFieldMapping: Record "Integration Field Mapping";
    begin
        IntegrationFieldMapping.CreateRecord(IntegrationTableMappingName, TableFieldNo, IntegrationTableFieldNo, SynchDirection,
            ConstValue, ValidateField, ValidateIntegrationTableField);
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"CDS Setup Defaults", 'OnAfterResetConfiguration', '', true, true)]
    local procedure HandleOnAfterResetConfiguration(CDSConnectionSetup: Record "CDS Connection Setup")
    begin
        CreateDimensionValueMapping();
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"CRM Integration Management", 'OnBeforeHandleCustomIntegrationTableMapping', '', false, false)]
    local procedure HandleCustomIntegrationTableMappingReset(var IsHandled: Boolean; IntegrationTableMappingName: Code[20])
    begin
        if IntegrationTableMappingName = 'DimensionValue' then begin
            CreateDimensionValueMapping();
            IsHandled := true;
        end;
    end;

    local procedure CreateDimensionValueMapping()
    var
        IntegrationTableMapping: Record "Integration Table Mapping";
        IntegrationFieldMapping: Record "Integration Field Mapping";
        DimensionValue: Record "Dimension Value";
        CDScr7e5DimensionValue: Record "AWR_CDS cr7e5_DimensionValue";
    begin
        InsertIntegrationTableMapping(
        IntegrationTableMapping, 'DimensionValue',
        DATABASE::"dimension value", DATABASE::"AWR_CDS cr7e5_DimensionValue",
        CDScr7e5DimensionValue.FieldNo(cr7e5_DimensionValueId), CDScr7e5DimensionValue.FieldNo(ModifiedOn),
        '', '', false);

        InsertIntegrationFieldMapping('DimensionValue', DimensionValue.FieldNo("Dimension Value ID"), CDScr7e5DimensionValue.FieldNo(cr7e5_EntryNo), IntegrationFieldMapping.Direction::ToIntegrationTable, '', true, false);
        InsertIntegrationFieldMapping('DimensionValue', DimensionValue.FieldNo(Code), CDScr7e5DimensionValue.FieldNo(cr7e5_Code), IntegrationFieldMapping.Direction::ToIntegrationTable, '', true, false);
        InsertIntegrationFieldMapping('DimensionValue', DimensionValue.FieldNo("Dimension Code"), CDScr7e5DimensionValue.FieldNo(cr7e5_DimensionCode), IntegrationFieldMapping.Direction::ToIntegrationTable, '', true, false);
        InsertIntegrationFieldMapping('DimensionValue', DimensionValue.FieldNo("Global Dimension No."), CDScr7e5DimensionValue.FieldNo(cr7e5_GlobalDimensionNo), IntegrationFieldMapping.Direction::ToIntegrationTable, '', true, false);
        InsertIntegrationFieldMapping('DimensionValue', DimensionValue.FieldNo(Name), CDScr7e5DimensionValue.FieldNo(cr7e5_Name), IntegrationFieldMapping.Direction::ToIntegrationTable, '', true, false);
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"CRM Setup Defaults", 'OnGetCDSTableNo', '', false, false)]
    local procedure HandleOnGetCDSTableNo(BCTableNo: Integer; var CDSTableNo: Integer; var handled: Boolean)
    begin
        if BCTableNo = DATABASE::"Dimension Value" then begin
            CDSTableNo := DATABASE::"AWR_CDS cr7e5_DimensionValue";
            handled := true;
        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"CRM Integration Management", 'OnIsCRMIntegrationRecord', '', true, true)]
    local procedure HandleOnIsIntegrationRecord(TableID: Integer; var isIntegrationRecord: Boolean)
    begin
        if TableID = DATABASE::"Dimension Value" then
            isIntegrationRecord := true;
    end;
}