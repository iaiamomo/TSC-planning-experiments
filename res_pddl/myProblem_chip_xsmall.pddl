(define (problem myProblem_chip_xsmall)
(:domain myDomain_chip_xsmall)
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
taking_impurity - Capability
taking_silicon - Capability
taking_resist - Capability
taking_chemicals - Capability
photolithography - Capability
packaging_cooling - Capability
dicing - Capability
mask_creating - Capability
checking_quality - Capability
taking_design - Capability
smart_testing - Capability
testing - Capability
packaging - Capability
implanter1usa - Service_imp1
inventoryusa - Service_inv_us
lithographer1usa - Service_lit1
packager_cooling1usa - Service_pac_cool1
dicer1usa - Service_dic1
creator1usa - Service_cre1
quality1usa - Service_qua1
designerusa - Service_des_us
smarttester1usa - Service_sma_tes1
tester1usa - Service_tes1
packager1usa - Service_pac1
)
(:init 
(provides implanter1usa implanting)
(provides inventoryusa taking_impurity)
(provides inventoryusa taking_silicon)
(provides inventoryusa taking_resist)
(provides inventoryusa taking_chemicals)
(provides lithographer1usa photolithography)
(provides packager_cooling1usa packaging_cooling)
(provides dicer1usa dicing)
(provides creator1usa mask_creating)
(provides quality1usa checking_quality)
(provides designerusa taking_design)
(provides smarttester1usa smart_testing)
(provides tester1usa testing)
(provides packager1usa packaging)
(masked chip false)
(lithographed chip false)
(implanted chip false)
(tested chip false)
(diced chip false)
(packed chip false)
(status implanter1usa available)
(status inventoryusa available)
(status lithographer1usa available)
(status packager_cooling1usa available)
(taken resist false)
(implanted resist false)
(status dicer1usa available)
(status creator1usa available)
(taken silicon false)
(masked silicon false)
(lithographed silicon false)
(status quality1usa available)
(status designerusa available)
(taken design false)
(masked design false)
(taken chemicals false)
(implanted chemicals false)
(status smarttester1usa available)
(status tester1usa available)
(taken impurity false)
(implanted impurity false)
(status packager1usa available)
(= (total-cost) 0)
)
(:goal 
(and 
(packed chip true)
)
)
(:metric minimize (total-cost))

)