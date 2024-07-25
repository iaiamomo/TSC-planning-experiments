(define (problem myProblem_ceramic_xsmall)
(:domain myDomain_ceramic_xsmall)
(:objects 
ceramic - CeramicMaterial
true - Boolean
false - Boolean
available - State
broken - State
fbaking - Capability
drying - Capability
moulding - Capability
painting - Capability
enamelling - Capability
provisioning - Capability
sbaking - Capability
shipping - Capability
fbaker1usa - Service_fbak1
dryer1usa - Service_dry1
mould1usa - Service_mou1
painter1usa - Service_pain1
enameller1usa - Service_enam1
provisioner1usa - Service_pro1
sbaker1usa - Service_sbak1
shipper1usa - Service_shi1
)
(:init 
(provides fbaker1usa fbaking)
(provides dryer1usa drying)
(provides mould1usa moulding)
(provides painter1usa painting)
(provides enameller1usa enamelling)
(provides provisioner1usa provisioning)
(provides sbaker1usa sbaking)
(provides shipper1usa shipping)
(status fbaker1usa available)
(status dryer1usa available)
(provisioned ceramic false)
(moulded ceramic false)
(dried ceramic false)
(firstbaked ceramic false)
(enamelled ceramic false)
(painted ceramic false)
(secondbaked ceramic false)
(shipped ceramic false)
(status mould1usa available)
(status painter1usa available)
(status enameller1usa available)
(status provisioner1usa available)
(status sbaker1usa available)
(status shipper1usa available)
(= (total-cost) 0)
)
(:goal 
(and 
(shipped ceramic true)
)
)
(:metric minimize (total-cost))

)