
library(flextable)
library(officer)
table1 <- read.csv("Table1.csv", sep = ";")

set_flextable_defaults(
  post_process_html = autofit,
  post_process_pdf = autofit,
  post_process_docx = autofit,
  font.family = "Inconsolata"
)

ft <- flextable(table1)
ft <- color(ft, part = "footer", color = "#666666")
ft <- set_caption(ft, caption = as_paragraph(
                               as_b("Table 1: "), "Studies reporting chiton predators. The scientific names were used according to the currently accepted nomenclature in WoRMS.")
)
ft <- italic(ft, j= c(2:3))
ft <- bold(ft,part = "header", bold = TRUE)
ft <- bold(ft, j = 1, i = ~ !is.na(Animals), bold = TRUE, part = "body")
ft <- footnote(ft, i = c(18,23), j = 4,
               value = as_paragraph("Method not specified by original authors."),
               ref_symbols = "*",
               part = "body"
)
ft
ft <- align_text_col(ft, align = "center", header = TRUE, footer = FALSE)
ft
ft <- merge_v(ft, j = 1 )
ft
ft <- hline(ft, i = c(5,14,15,25,27,45,91,104), part = "body",
            border = fp_border(color = "black", style = "dashed", width = 1)
            )
ft
