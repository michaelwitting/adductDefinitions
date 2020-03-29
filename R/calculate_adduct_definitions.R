list_of_list <- list("[M+H]+"        = list(mass_multi = 1,
                                            mass_add =  1.007276,
                                            formula_add = "H",
                                            formula_sub = "C0",
                                            charge = 1),
                     "[M+NH4]+"      = list(mass_multi = 1,
                                            mass_add = 18.03383,
                                            formula_add = "NH4",
                                            formula_sub = "C0",
                                            charge = 1)
)

adduct_df <- as.data.frame(do.call(rbind, list_of_list), stringsAsFactors = FALSE)
adduct_df$names <- row.names(adduct_df)