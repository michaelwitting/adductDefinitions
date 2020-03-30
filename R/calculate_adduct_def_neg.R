# load required libraries
library(rcdk)

# ==============================================================================
# calculate all negative adducts
# ==============================================================================
## create list with all the adduct definitoins
adduct_list_neg <- list(
  # triple charged -----------------------------------------------------------
  "[M-3H]3-"      = list(mass_multi = 1 / 3,
                         mass_add = - (3 * get.formula("H", charge = 1)@mass) / 3,
                         formula_add = NA_character_,
                         formula_sub = "H3",
                         charge = -3),
  
  # double charged -----------------------------------------------------------
  "[M-2H]2-"      = list(mass_multi = 1 / 2,
                         mass_add = - (2 * get.formula("H", charge = 1)@mass) / 2,
                         formula_add = NA_character_,
                         formula_sub = "H2",
                         charge = -2),
  
  # single charged -----------------------------------------------------------
  "[M-H]-"        = list(mass_multi = 1 ,
                         mass_add = - get.formula("H", charge = 1)@mass,
                         formula_add = NA_character_,
                         formula_sub = "H",
                         charge = -1),
  "[M+Na-2H]-"    = list(mass_multi = 1,
                         mass_add = - 2 * get.formula("H", charge = 1)@mass + get.formula("Na", charge = 1)@mass,
                         formula_add = "Na",
                         formula_sub = "H2",
                         charge = -1),
  "[M+Cl]-"       = list(mass_multi = 1,
                         mass_add = get.formula("Cl", charge = -1)@mass,
                         formula_add = "Cl",
                         formula_sub = NA_character_,
                         charge = -1),
  "[M+K-2H]-"     = list(mass_multi = 1,
                         mass_add = - 2 * get.formula("H", charge = 1)@mass + get.formula("K", charge = 1)@mass,
                         formula_add = "K",
                         formula_sub = "H2",
                         charge = -1),
  "[M+C2H3N-H]-"  = list(mass_multi = 1,
                         mass_add = get.formula("C2H3N", charge = 0)@mass - get.formula("H", charge = 1)@mass,
                         formula_add = "C2H3N",
                         formula_sub = "H",
                         charge = -1),
  "[M+CHO2]-"     = list(mass_multi = 1,
                         mass_add = get.formula("CHO2", charge = -1)@mass,
                         formula_add = "CHO2",
                         formula_sub = NA_character_,
                         charge = -1),
  "[M+C2H3O2]-"    = list(mass_multi = 1,
                          mass_add = get.formula("C2H3O2", charge = -1)@mass,
                          formula_add = "C2H3O2",
                          formula_sub = NA_character_,
                          charge = -1),
  "[M+Br]-"       = list(mass_multi = 1,
                         mass_add = get.formula("Br", charge = -1)@mass,
                         formula_add = "Br",
                         formula_sub = NA_character_,
                         charge = -1),
  "[M+C2F3O2]-"= list(mass_multi = 1,
                      mass_add = get.formula("C2F3O2", charge = -1)@mass,
                      formula_add = "C2F3O2",
                      formula_sub = NA_character_,
                      charge = -1),
  
  # dimers -------------------------------------------------------------------
  "[2M-H]-"       = list(mass_multi = 2,
                         mass_add =  - get.formula("H", charge = 1)@mass,
                         formula_add = NA_character_,
                         formula_sub = "H",
                         charge = -1),
  "[2M+CHO2]-" = list(mass_multi = 2,
                      mass_add = get.formula("CHO2", charge = -1)@mass,
                      formula_add = "CHO2",
                      formula_sub = NA_character_,
                      charge = -1),
  "[2M+C2H3O2]-"= list(mass_multi = 2,
                       mass_add = get.formula("C2H3O2", charge = -1)@mass,
                       formula_add = "C2H3O2",
                       formula_sub = NA_character_,
                       charge = -1),
  
  # trimers ------------------------------------------------------------------
  "[3M-H]-"      = list(mass_multi = 3 ,
                        mass_add = - get.formula("H", charge = 1)@mass,
                        formula_add = NA_character_,
                        formula_sub = "H",
                        charge = -1)
)
# make df from list of list
adduct_df_neg <- data.frame(do.call(rbind, adduct_list_neg), stringsAsFactors = FALSE)
adduct_df_neg$adduct <- row.names(adduct_df_neg)
adduct_df_neg <- adduct_df_neg[,order(names(adduct_df_neg))]

adduct_df_neg$charge <- unlist(adduct_df_neg$charge)
adduct_df_neg$formula_add <- unlist(adduct_df_neg$formula_add)
adduct_df_neg$formula_sub <- unlist(adduct_df_neg$formula_sub)
adduct_df_neg$mass_add <- unlist(adduct_df_neg$mass_add)
adduct_df_neg$mass_multi <- unlist(adduct_df_neg$mass_multi)

# write negative file
write.table(adduct_df_neg, file = "adducts_neg.txt", sep = "\t", quote = FALSE, col.names = TRUE, row.names = FALSE)
