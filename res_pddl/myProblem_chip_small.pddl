(define (problem myProblem_chip_small)
(:domain myDomain_chip_small)
(:objects 
design - Design
silicon - SiliconMaterial
impurity - ImpurityMaterial
resist - ResistMaterial
chemicals - ChemicalsMaterial
chip - ChipMaterial
true - Boolean
false - Boolean
available - State
broken - State
implanting - Capability
taking_resist - Capability
taking_design - Capability
testing - Capability
photolithography - Capability
smart_testing - Capability
checking_quality - Capability
taking_impurity - Capability
taking_silicon - Capability
mask_creating - Capability
taking_chemicals - Capability
packaging - Capability
packaging_cooling - Capability
dicing - Capability
implanter1usa - Service_imp1
inventorycanada - Service_inv_ca
designerchina - Service_des_ch
tester1usa - Service_tes1
lithographer1usa - Service_lit1
smarttester1usa - Service_sma_tes1
quality1usa - Service_qua1
inventorychile - Service_inv_cl
implanter2usa - Service_imp2
inventorybrazil - Service_inv_br
creator1usa - Service_cre1
inventoryusa - Service_inv_us
packager1usa - Service_pac1
packager2usa - Service_pac2
lithographer2usa - Service_lit2
packager_cooling1usa - Service_pac_cool1
designerusa - Service_des_us
dicer1usa - Service_dic1
)
(:init 
(provides implanter1usa implanting)
(provides inventorycanada taking_resist)
(provides designerchina taking_design)
(provides tester1usa testing)
(provides lithographer1usa photolithography)
(provides smarttester1usa smart_testing)
(provides quality1usa checking_quality)
(provides inventorychile taking_impurity)
(provides implanter2usa implanting)
(provides inventorybrazil taking_silicon)
(provides creator1usa mask_creating)
(provides inventoryusa taking_impurity)
(provides inventoryusa taking_silicon)
(provides inventoryusa taking_resist)
(provides inventoryusa taking_chemicals)
(provides packager1usa packaging)
(provides packager2usa packaging)
(provides lithographer2usa photolithography)
(provides packager_cooling1usa packaging_cooling)
(provides designerusa taking_design)
(provides dicer1usa dicing)
(status implanter1usa available)
(status inventorycanada available)
(status designerchina available)
(status tester1usa available)
(status lithographer1usa available)
(status smarttester1usa available)
(status quality1usa available)
(taken design false)
(masked design false)
(status inventorychile available)
(status implanter2usa available)
(taken silicon false)
(masked silicon false)
(lithographed silicon false)
(status inventorybrazil available)
(taken chemicals false)
(implanted chemicals false)
(status creator1usa available)
(status inventoryusa available)
(status packager1usa available)
(status packager2usa available)
(masked chip false)
(lithographed chip false)
(implanted chip false)
(tested chip false)
(diced chip false)
(packed chip false)
(status lithographer2usa available)
(status packager_cooling1usa available)
(taken resist false)
(implanted resist false)
(status designerusa available)
(taken impurity false)
(implanted impurity false)
(status dicer1usa available)
(= (total-cost) 0)
)
(:goal 
(and 
(packed chip true)
)
)
(:metric minimize (total-cost))

)