(define (problem myProblem_ceramic_large)
(:domain myDomain_ceramic_large)
(:objects 
ceramic - CeramicMaterial
true - Boolean
false - Boolean
available - State
broken - State
moulding - Capability
fbaking - Capability
enamelling - Capability
drying - Capability
shipping - Capability
provisioning - Capability
painting - Capability
sbaking - Capability
mould2usa - Service_mou2
fbaker1usa - Service_fbak1
enameller2usa - Service_enam2
dryer1usa - Service_dry1
shipper1usa - Service_shi1
mould1usa - Service_mou1
provisioner1usa - Service_pro1
fbaker3usa - Service_fbak3
painter1usa - Service_pain1
provisioner2usa - Service_pro2
dryer2usa - Service_dry2
shipper3usa - Service_shi3
enameller1usa - Service_enam1
shipper2usa - Service_shi2
fbaker2usa - Service_fbak2
painter2usa - Service_pain2
provisioner3usa - Service_pro3
provisioner4usa - Service_pro4
enameller3usa - Service_enam3
sbaker1usa - Service_sbak1
)
(:init 
(provides mould2usa moulding)
(provides fbaker1usa fbaking)
(provides enameller2usa enamelling)
(provides dryer1usa drying)
(provides shipper1usa shipping)
(provides mould1usa moulding)
(provides provisioner1usa provisioning)
(provides fbaker3usa fbaking)
(provides painter1usa painting)
(provides provisioner2usa provisioning)
(provides dryer2usa drying)
(provides shipper3usa shipping)
(provides enameller1usa enamelling)
(provides shipper2usa shipping)
(provides fbaker2usa fbaking)
(provides painter2usa painting)
(provides provisioner3usa provisioning)
(provides provisioner4usa provisioning)
(provides enameller3usa enamelling)
(provides sbaker1usa sbaking)
(status mould2usa available)
(status fbaker1usa available)
(status enameller2usa available)
(status dryer1usa available)
(status shipper1usa available)
(status mould1usa available)
(status provisioner1usa available)
(status fbaker3usa available)
(status painter1usa available)
(status provisioner2usa available)
(provisioned ceramic false)
(moulded ceramic false)
(dried ceramic false)
(firstbaked ceramic false)
(enamelled ceramic false)
(painted ceramic false)
(secondbaked ceramic false)
(shipped ceramic false)
(status dryer2usa available)
(status shipper3usa available)
(status enameller1usa available)
(status shipper2usa available)
(status fbaker2usa available)
(status painter2usa available)
(status provisioner3usa available)
(status provisioner4usa available)
(status enameller3usa available)
(status sbaker1usa available)
(= (total-cost) 0)
)
(:goal 
(and 
(shipped ceramic true)
)
)
(:metric minimize (total-cost))

)