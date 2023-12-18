const fakedata = '''[
  {"General": [
    {
      "title": "Application",
      "icon": "Icons.app_registration_outlined",
      "options": [
        {
          "title": "Language",
          "type": "DropDown",
          "values": ["English"]
        },
        {
          "title": "Business Currency",
          "type": "DropDown",
          "values": ["\$"]
        },
        {"title": "Decimal Places", "type": "Decimal", "values": 1},
        {
          "title": "Date Format",
          "type": "DropDown",
          "values": ["dd/mm/yy", "mm/dd/yy"]
        },
        {
          "title": "Change Vyapar Theme",
          "type": "DropDown",
          "values": ["Standard","trending","moden"]
        },
        {
          "title": "Show warning for unsaved changes",
          "type": "boolean",
          "values": false
        }
      ]
    },
    {
      "title": "Security",
      "icon": "Icons.lock_outline",
      "options": [
        {
          "title": "Passcode / Fingerprint (if present)",
          "type": "boolean",
          "values": false
        }
      ]
    },
    {
      "title": "MultiFirm",
      "icon": "Icons.plagiarism_outlined",
      "icon_second": "Icons.list_alt_outlined",
      "options": [
        {"title": "Multifirm", "type": "text", "values": false}
      ]
    },
    {
      "title": "BackUp",
      "subtitle": "AutoBackup Setting",
      "icon": "Icons.backup_outlined",
      "type": "form",
      "options": [
        {
          "title": "Enable Autobackup",
          "type": "boolean",
          "description": "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.",
          "suffix": "days",
          "values": true
        },
        {
          "title": "Manual Backup Reminder",
          "type": "Decimal",
          "description": "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.",
          "suffix": "days",
          "values": 0
        }
      ]
    },
    {
      "title": "More Transaction",
      "icon": "Icons.compare_arrows_outlined",
      "options": [
        {
          "title": "Estimate/Quotation(Proforma Invoice)",
          "type": "boolean",
          "values": true
        },
        {"title": "OtherIncome", "type": "boolean", "values": false},
        {"title": "Sale/Purchase Order", "type": "boolean", "values": true},
        {"title": "Fixed Assets(FA)", "type": "boolean", "values": false},
        {"title": "Delivery Challan", "type": "boolean", "values": true},
        {
          "title": "Goods Return on Delivery Challan",
          "type": "boolean",
          "values": true
        },
        {"title": "Print Amount on Challan", "type": "boolean", "values": false}
      ]
    }
  ]},
  {"Transaction": [
    {
      "title": "Transaction Header",
      "icon": "Icons.text_snippet_sharp",
      "options": [
        {"title": "Invoice/Bill Number", "type": "boolean", "values": true},
        {"title": "Cash Sale by default", "type": "boolean", "values": false},
        {
          "title": "Billing name of Parties",
          "type": "boolean",
          "values": false
        },
        {
          "title": "PO Details (of Customer)",
          "type": "boolean",
          "values": false
        },
        {
          "title": "Add Time on Transactions",
          "type": "boolean",
          "values": false
        }
      ]
    },
    {
      "title": "items Table",
      "icon": "Icons.table_chart_outlined",
      "options": [
        {
          "title": "Allow inclusive/Exclusive tax on Rate (Price/Unit)",
          "type": "boolean",
          "values": true
        },
        {"title": "Display Purchase Price", "type": "boolean", "values": true},
        {"title": "Free Item Quantity", "type": "boolean", "values": false},
        {
          "title": "Count",
          "icon": "icon_name",
          "type": "boolean",
          "values": false
        },
        {
          "title": "Barcode scanning for item",
          "type": "boolean",
          "values": false
        }
      ]
    },
     {
      "title": "Taxes, Discount & Total",
      "icon": "Icons.text_snippet_sharp",
      "options": [
        {
          "title": "Transaction wise Tax",
          "type": "boolean",
          "values": false
        },
        {"title": "Transaction wise Discount", "type": "boolean", "values": false},
        {"title": "Round off Transaction amount", "type": "boolean", "values": false}
      ]
    },
    {
      "title": "More Transaction Features",
      "icon": "Icons.hotel_class_outlined",
      "options": [
        {
          "title": "Share Transaction as",
          "type": "DropDown",
          "default_value": "ask me every time",
          "values": ["Share as PDF"]
        },
        {
          "title": "Passcode for edit/delete",
          "type": "boolean",
          "values": true
        },
        {
          "title": "Discount during Payment",
          "type": "boolean",
          "values": false
        },
        {
          "title": "Link Payments to Invoice",
          "type": "boolean",
          "values": false
        },
        {"title": "Due Dates & Payment terms", "type": "Tile", "values": []},
        {"title": "Enable Invoice Preview", "type": "boolean", "values": false},
        {"title": "Additional Field", "type": "Tile", "values": []},
        {"title": "Transportation Details", "type": "Tile", "values": []},
        {"title": "Additional Changes", "type": "Tile", "values": []},
        {
          "title": "Show profile while making Sale Invoice",
          "type": "boolean",
          "values": true
        }
      ]
    },
    {
      "title": "GST",
      "icon": "Icons.text_snippet_sharp",
      "options": [
        {"title": "Reverse Charge", "type": "boolean", "values": false},
        {"title": "State of Supply", "type": "boolean", "values": false},
        {"title": "E-Way Bill No", "type": "boolean", "values": false}
      ]
    },
    {
      "title": "Transaction prefixes",
      "icon": "Icons.hotel_class_outlined",
      "type" : "GridDropDown",
      "options": [
        {
          "title": "Firm",
          "type": "DropDown",
          "values": ["firm"]
        },
        {
          "title": "Sale Invoice",
          "type": "GridDropDown",
          "values": ["None"]
        },
        {
          "title": "Credit Note",
          "type": "GridDropDown",
          "values": ["None"]
        },
        {
          "title": "Sale Order",
          "type": "GridDropDown",
          "values": ["None"]
        },
        {
          "title": "Purchase Order",
          "type": "GridDropDown",
          "values": ["None"]
        },
        {
          "title": "Estimate",
          "type": "GridDropDown",
          "values": ["None"]
        },
        {
          "title": "Delivery Challan",
          "type": "GridDropDown",
          "values": ["None"]
        },
        {
          "title": "Payment In",
          "type": "GridDropDown",
          "values": ["None"]
        }
      ]
    }
  ]},
 { "Invoice Print": [
    {
      "title" : "Invoice Print",
      "type": "Switcher",
      "options": [
        {
          "title": "",
          "type": "Switcher",
          "values": ["Regular", "Thermal"],
          "currentValue": "Regular"
        }
      ]
    },
    {
      "title": "Make Regular Printer Default",
      "type": "boolean",
      "values": true
    },
    {
      "title": "Printer Settings",
      "icon": "Icons.print_outlined",
      "type": "Tile",
      "values": []
    },
    {
      "title": "Print Company Info/Header",
      "icon": "Icons.print_outlined",
      "type": "Tile",
      "values": []
    }
  ],"categoryType": "Switcher"},
  {"Taxes & GST": [
    {"title": "Taxes & GST", "icon": "icon_name", "options": []}
  ]},
  {"User Management": [
    {"title": "User Management", "icon": "icon_name", "options": []}
  ]},
  {"Transaction SMS": [
    {"title": "Transaction SMS", "icon": "icon_name", "options": []}
  ]},
  {"Payment Reminder": [
    {"title": "Payment Reminder", "icon": "icon_name", "options": []}
  ]},
  {"Party": [
    {"title": "Party", "icon": "icon_name", "options": []}
  ]},
  {"Item": [
    {"title": "Item", "icon": "icon_name", "options": []}
  ]}
]''';
