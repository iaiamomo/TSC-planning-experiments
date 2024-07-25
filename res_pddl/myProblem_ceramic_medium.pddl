(define (problem myProblem_ceramic_medium)
(:domain myDomain_ceramic_medium)
(:objects 
ceramic - CeramicMaterial
true - Boolean
false - Boolean
available - State
broken - State
provisioning - Capability
shipping - Capability
enamelling - Capability
drying - Capability
moulding - Capability
fbaking - Capability
painting - Capability
sbaking - Capability
provisioner3usa - Service_pro3
shipper2usa - Service_shi2
enameller1usa - Service_enam1
dryer2usa - Service_dry2
shipper1usa - Service_shi1
mould2usa - Service_mou2
enameller2usa - Service_enam2
enameller3usa - Service_enam3
fbaker1usa - Service_fbak1
fbaker2usa - Service_fbak2
provisioner1usa - Service_pro1
mould1usa - Service_mou1
dryer1usa - Service_dry1
painter1usa - Service_pain1
painter2usa - Service_pain2
provisioner2usa - Service_pro2
shipper3usa - Service_shi3
sbaker1usa - Service_sbak1
fbaker3usa - Service_fbak3
provisioner4usa - Service_pro4
)
(:init 
(provides provisioner3usa provisioning)
(provides shipper2usa shipping)
(provides enameller1usa enamelling)
(provides dryer2usa drying)
(provides shipper1usa shipping)
(provides mould2usa moulding)
(provides enameller2usa enamelling)
(provides enameller3usa enamelling)
(provides fbaker1usa fbaking)
(provides fbaker2usa fbaking)
(provides provisioner1usa provisioning)
(provides mould1usa moulding)
(provides dryer1usa drying)
(provides painter1usa painting)
(provides painter2usa painting)
(provides provisioner2usa provisioning)
(provides shipper3usa shipping)
(provides sbaker1usa sbaking)
(provides fbaker3usa fbaking)
(provides provisioner4usa provisioning)
(status provisioner3usa available)
(status shipper2usa available)
(provisioned ceramic false)
(moulded ceramic false)
(dried ceramic false)
(firstbaked ceramic false)
(enamelled ceramic false)
(painted ceramic false)
(secondbaked ceramic false)
(shipped ceramic false)
(status enameller1usa available)
(status dryer2usa available)
(status shipper1usa available)
(status mould2usa available)
(status enameller2usa available)
(status enameller3usa available)
(status fbaker1usa available)
(status fbaker2usa available)
(status provisioner1usa available)
(status mould1usa available)
(status dryer1usa available)
(status painter1usa available)
(status painter2usa available)
(status provisioner2usa available)
(status shipper3usa available)
(status sbaker1usa available)
(status fbaker3usa available)
(status provisioner4usa available)
(= (total-cost) 0)
)
(:goal 
(and 
(shipped ceramic true)
)
)
(:metric minimize (total-cost))

)