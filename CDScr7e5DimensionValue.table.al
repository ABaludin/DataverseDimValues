table 50105 "AWR_CDS cr7e5_DimensionValue"
{
    ExternalName = 'cr7e5_dimensionvalue';
    TableType = CDS;
    Description = '';

    fields
    {
        field(1; "cr7e5_DimensionValueId"; GUID)
        {
            ExternalName = 'cr7e5_dimensionvalueid';
            ExternalType = 'Uniqueidentifier';
            ExternalAccess = Insert;
            Description = 'Unique identifier for entity instances';
            Caption = 'Dimension Value';
        }
        field(2; CreatedOn; Datetime)
        {
            ExternalName = 'createdon';
            ExternalType = 'DateTime';
            ExternalAccess = Read;
            Description = 'Date and time when the record was created.';
            Caption = 'Created On';
        }
        field(4; ModifiedOn; Datetime)
        {
            ExternalName = 'modifiedon';
            ExternalType = 'DateTime';
            ExternalAccess = Read;
            Description = 'Date and time when the record was modified.';
            Caption = 'Modified On';
        }
        field(24; statecode; Option)
        {
            ExternalName = 'statecode';
            ExternalType = 'State';
            ExternalAccess = Modify;
            Description = 'Status of the Dimension Value';
            Caption = 'Status';
            InitValue = " ";
            OptionMembers = " ",Active,Inactive;
            OptionOrdinalValues = -1, 0, 1;
        }
        field(26; statuscode; Option)
        {
            ExternalName = 'statuscode';
            ExternalType = 'Status';
            Description = 'Reason for the status of the Dimension Value';
            Caption = 'Status Reason';
            InitValue = " ";
            OptionMembers = " ",Active,Inactive;
            OptionOrdinalValues = -1, 1, 2;
        }
        field(28; VersionNumber; BigInteger)
        {
            ExternalName = 'versionnumber';
            ExternalType = 'BigInt';
            ExternalAccess = Read;
            Description = 'Version Number';
            Caption = 'Version Number';
        }
        field(29; ImportSequenceNumber; Integer)
        {
            ExternalName = 'importsequencenumber';
            ExternalType = 'Integer';
            ExternalAccess = Insert;
            Description = 'Sequence number of the import that created this record.';
            Caption = 'Import Sequence Number';
        }
        field(30; OverriddenCreatedOn; Date)
        {
            ExternalName = 'overriddencreatedon';
            ExternalType = 'DateTime';
            ExternalAccess = Insert;
            Description = 'Date and time that the record was migrated.';
            Caption = 'Record Created On';
        }
        field(31; TimeZoneRuleVersionNumber; Integer)
        {
            ExternalName = 'timezoneruleversionnumber';
            ExternalType = 'Integer';
            Description = 'For internal use only.';
            Caption = 'Time Zone Rule Version Number';
        }
        field(32; UTCConversionTimeZoneCode; Integer)
        {
            ExternalName = 'utcconversiontimezonecode';
            ExternalType = 'Integer';
            Description = 'Time zone code that was in use when the record was created.';
            Caption = 'UTC Conversion Time Zone Code';
        }
        field(33; "cr7e5_EntryNo"; Text[100])
        {
            ExternalName = 'cr7e5_entryno';
            ExternalType = 'String';
            Description = 'Required name field';
            Caption = 'Dimension Value ID';
        }
        field(34; "cr7e5_DimensionCode"; Text[100])
        {
            ExternalName = 'cr7e5_dimensioncode';
            ExternalType = 'String';
            Description = '';
            Caption = 'Dimension Code';
        }
        field(35; "cr7e5_Name"; Text[100])
        {
            ExternalName = 'cr7e5_name';
            ExternalType = 'String';
            Description = '';
            Caption = 'Name';
        }
        field(36; "cr7e5_Code"; Text[100])
        {
            ExternalName = 'cr7e5_code';
            ExternalType = 'String';
            Description = '';
            Caption = 'Code';
        }
        field(37; "cr7e5_GlobalDimensionNo"; Integer)
        {
            ExternalName = 'cr7e5_globaldimensionno';
            ExternalType = 'Integer';
            Description = '';
            Caption = 'Global Dimension No.';
        }
    }
    keys
    {
        key(PK; cr7e5_DimensionValueId)
        {
            Clustered = true;
        }
        key(Name; cr7e5_EntryNo)
        {
        }
    }
    fieldgroups
    {
        fieldgroup(Dropdown; cr7e5_EntryNo)
        {
        }
    }
}