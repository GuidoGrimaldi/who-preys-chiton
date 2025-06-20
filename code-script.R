
library(flextable)
library(officer)
library(tidyverse)
table1 <- read.csv("Table1.csv", sep = ";")

set_flextable_defaults(
  post_process_html = autofit,
  post_process_pdf = autofit,
  post_process_docx = autofit,
  font.family = "Aptos"
)

ft <- flextable(table1) %>%
  color(part = "footer", color = "#666666") %>%
  set_caption(caption = as_paragraph(
    as_b("Table 1: "),
    "Studies reporting chiton predators. The scientific names were used according to the currently accepted nomenclature in WoRMS.")
) %>%
  italic(j = c(2:3)) %>%
  bold(part = "header", bold = TRUE) %>%
  bold(j = 1, i = ~ !is.na(Animals), bold = TRUE, part = "body") %>%
  footnote(i = c(18,23,48), j = 4,
           value = as_paragraph("Method not specified by original authors."),
           ref_symbols = "*",
           part = "body") %>%
  align_text_col(align = "center", header = TRUE, footer = FALSE) %>%
  merge_v(j = 1 ) %>%
  hline(i = c(5,14,15,25,27,45,91,104), part = "body",
        border = fp_border(color = "black", style = "dashed", width = 1)
)
ft

sect_properties <- prop_section(
  page_size = page_size(
    orient = "landscape",
    width = 10, height = 11.7
  ),
  type = "continuous",
  page_margins = page_mar()
)

save_as_docx(ft,  path = "Table1.docx", pr_section = sect_properties
)

