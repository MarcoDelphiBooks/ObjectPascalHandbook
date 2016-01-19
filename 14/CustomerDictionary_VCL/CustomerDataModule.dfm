object DataModule1: TDataModule1
  OldCreateOrder = False
  Height = 234
  Width = 281
  object ClientDataSet1: TClientDataSet
    Aggregates = <>
    FileName = 'customer.cds'
    Params = <>
    Left = 104
    Top = 72
    object ClientDataSet1CustNo: TFloatField
      FieldName = 'CustNo'
    end
    object ClientDataSet1Company: TStringField
      FieldName = 'Company'
      Size = 30
    end
    object ClientDataSet1Addr1: TStringField
      FieldName = 'Addr1'
      Size = 30
    end
    object ClientDataSet1Addr2: TStringField
      FieldName = 'Addr2'
      Size = 30
    end
    object ClientDataSet1City: TStringField
      FieldName = 'City'
      Size = 15
    end
    object ClientDataSet1State: TStringField
      FieldName = 'State'
    end
    object ClientDataSet1Zip: TStringField
      FieldName = 'Zip'
      Size = 10
    end
    object ClientDataSet1Country: TStringField
      FieldName = 'Country'
    end
    object ClientDataSet1Phone: TStringField
      FieldName = 'Phone'
      Size = 15
    end
    object ClientDataSet1FAX: TStringField
      FieldName = 'FAX'
      Size = 15
    end
    object ClientDataSet1TaxRate: TFloatField
      FieldName = 'TaxRate'
    end
    object ClientDataSet1Contact: TStringField
      FieldName = 'Contact'
    end
    object ClientDataSet1LastInvoiceDate: TDateTimeField
      FieldName = 'LastInvoiceDate'
    end
  end
end
