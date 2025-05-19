from fpdf import FPDF

pdf = FPDF()
pdf.set_auto_page_break(auto=True, margin=15)
pdf.add_page()
pdf.set_font("Arial", size=12)

pdf.cell(200, 10, "AI News Digest - May 2025", ln=True, align="C")

for article in articles:
     pdf.cell(0, 10, article["title"], ln=True, align="L")
     pdf.multi_cell(0, 8, article["summary"])
     pdf.ln(5)

pdf.output("AI_News_Ebook_May.pdf")