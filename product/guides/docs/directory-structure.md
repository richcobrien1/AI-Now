root/
└── product/
    └── guides/    
        ├── source/                     # Your raw markdown files
        │   ├── Mastering_Copilot.md
        │   └── Mastering_ChatGPT.md
        │        └── ...
        ├── publish/                    # Output folder (auto-created)
        │   ├── Mastering_Copilot.zip
        │   │   ├── Mastering_Copilot.docx
        │   │   └── Mastering_Copilot.pdf
        │   └── Mastering_ChatGPT.zip
        │       ├── Mastering_ChatGPT.docx
        │       └── Mastering_ChatGPT.pdf
        ├── v2u_template.docx           # Your pre-styled Word reference doc
        └── convert_all.sh              # The script
