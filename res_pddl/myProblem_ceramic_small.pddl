(define (problem myProblem_ceramic_small)
(:domain myDomain_ceramic_small)
(:objects 
ceramic - CeramicMaterial
true - Boolean
false - Boolean
available - State
broken - State
painting - Capability
provisioning - Capability
enamelling - Capability
fbaking - Capability
shipping - Capability
drying - Capability
moulding - Capability
sbaking - Capability
painter1usa - Service_pain1
provisioner1usa - Service_pro1
enameller1usa - Service_enam1
fbaker1usa - Service_fbak1
shipper2usa - Service_shi2
shipper1usa - Service_shi1
provisioner2usa - Service_pro2
dryer1usa - Service_dry1
mould1usa - Service_mou1
sbaker1usa - Service_sbak1
painter2usa - Service_pain2
enameller2usa - Service_enam2
)
(:init 
(provides painter1usa painting)
(provides provisioner1usa provisioning)
(provides enameller1usa enamelling)
(provides fbaker1usa fbaking)
(provides shipper2usa shipping)
(provides shipper1usa shipping)
(provides provisioner2usa provisioning)
(provides dryer1usa drying)
(provides mould1usa moulding)
(provides sbaker1usa sbaking)
(provides painter2usa painting)
(provides enameller2usa enamelling)
(status painter1usa available)
(status provisioner1usa available)
(status enameller1usa available)
(status fbaker1usa available)
(provisioned ceramic false)
(moulded ceramic false)
(dried ceramic false)
(firstbaked ceramic false)
(enamelled ceramic false)
(painted ceramic false)
(secondbaked ceramic false)
(shipped ceramic false)
(status shipper2usa available)
(status shipper1usa available)
(status provisioner2usa available)
(status dryer1usa available)
(status mould1usa available)
(status sbaker1usa available)
(status painter2usa available)
(status enameller2usa available)
(= (total-cost) 0)
)
(:goal 
(and 
(shipped ceramic true)
)
)
(:metric minimize (total-cost))

)