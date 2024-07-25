(define (domain myDomain_ceramic_medium)
(:requirements :strips :equality :typing)
(:types 
Service - Thing
Capability
CeramicMaterial
Boolean
State
Service_pro3 Service_shi2 Service_enam1 Service_dry2 Service_shi1 Service_mou2 Service_enam2 Service_enam3 Service_fbak1 Service_fbak2 Service_pro1 Service_mou1 Service_dry1 Service_pain1 Service_pain2 Service_pro2 Service_shi3 Service_sbak1 Service_fbak3 Service_pro4 - Service
)
(:predicates 
(provides ?srv - Service ?c - Capability) 
(status ?o - Service ?b - State)
(provisioned ?o - CeramicMaterial ?b - Boolean)
(moulded ?o - CeramicMaterial ?b - Boolean)
(dried ?o - CeramicMaterial ?b - Boolean)
(firstbaked ?o - CeramicMaterial ?b - Boolean)
(enamelled ?o - CeramicMaterial ?b - Boolean)
(painted ?o - CeramicMaterial ?b - Boolean)
(secondbaked ?o - CeramicMaterial ?b - Boolean)
(shipped ?o - CeramicMaterial ?b - Boolean)
)
(:functions (total-cost))
(:action provision_3
:parameters (?srv - Service_pro3 ?s - CeramicMaterial)
:precondition (and (provides ?srv provisioning) (provisioned ?s false) (status ?srv available) )
:effect (and (provisioned ?s true) (not(provisioned ?s false)) (increase (total-cost) 3))
)
(:action shi_2
:parameters (?srv - Service_shi2 ?s - CeramicMaterial)
:precondition (and (provides ?srv shipping) (secondbaked ?s true) (shipped ?s false) (status ?srv available) )
:effect (and (shipped ?s true) (not(shipped ?s false)) (increase (total-cost) 2))
)
(:action enamel_1
:parameters (?srv - Service_enam1 ?s - CeramicMaterial)
:precondition (and (provides ?srv enamelling) (firstbaked ?s true) (enamelled ?s false) (status ?srv available) )
:effect (and (enamelled ?s true) (not(enamelled ?s false)) (increase (total-cost) 2))
)
(:action dry_2
:parameters (?srv - Service_dry2 ?s - CeramicMaterial)
:precondition (and (provides ?srv drying) (moulded ?s true) (dried ?s false) (status ?srv available) )
:effect (and (dried ?s true) (not(dried ?s false)) (increase (total-cost) 1))
)
(:action shi_1
:parameters (?srv - Service_shi1 ?s - CeramicMaterial)
:precondition (and (provides ?srv shipping) (secondbaked ?s true) (shipped ?s false) (status ?srv available) )
:effect (and (shipped ?s true) (not(shipped ?s false)) (increase (total-cost) 1))
)
(:action mould_2
:parameters (?srv - Service_mou2 ?s - CeramicMaterial)
:precondition (and (provides ?srv moulding) (provisioned ?s true) (moulded ?s false) (status ?srv available) )
:effect (and (moulded ?s true) (not(moulded ?s false)) (increase (total-cost) 12))
)
(:action enamel_2
:parameters (?srv - Service_enam2 ?s - CeramicMaterial)
:precondition (and (provides ?srv enamelling) (firstbaked ?s true) (enamelled ?s false) (status ?srv available) )
:effect (and (enamelled ?s true) (not(enamelled ?s false)) (increase (total-cost) 6))
)
(:action enamel_3
:parameters (?srv - Service_enam3 ?s - CeramicMaterial)
:precondition (and (provides ?srv enamelling) (firstbaked ?s true) (enamelled ?s false) (status ?srv available) )
:effect (and (enamelled ?s true) (not(enamelled ?s false)) (increase (total-cost) 3))
)
(:action f_bake_1
:parameters (?srv - Service_fbak1 ?s - CeramicMaterial)
:precondition (and (provides ?srv fbaking) (dried ?s true) (firstbaked ?s false) (status ?srv available) )
:effect (and (firstbaked ?s true) (not(firstbaked ?s false)) (increase (total-cost) 1))
)
(:action f_bake_2
:parameters (?srv - Service_fbak2 ?s - CeramicMaterial)
:precondition (and (provides ?srv fbaking) (dried ?s true) (firstbaked ?s false) (status ?srv available) )
:effect (and (firstbaked ?s true) (not(firstbaked ?s false)) (increase (total-cost) 2))
)
(:action provision_1
:parameters (?srv - Service_pro1 ?s - CeramicMaterial)
:precondition (and (provides ?srv provisioning) (provisioned ?s false) (status ?srv available) )
:effect (and (provisioned ?s true) (not(provisioned ?s false)) (increase (total-cost) 5))
)
(:action mould_1
:parameters (?srv - Service_mou1 ?s - CeramicMaterial)
:precondition (and (provides ?srv moulding) (provisioned ?s true) (moulded ?s false) (status ?srv available) )
:effect (and (moulded ?s true) (not(moulded ?s false)) (increase (total-cost) 2))
)
(:action dry_1
:parameters (?srv - Service_dry1 ?s - CeramicMaterial)
:precondition (and (provides ?srv drying) (moulded ?s true) (dried ?s false) (status ?srv available) )
:effect (and (dried ?s true) (not(dried ?s false)) (increase (total-cost) 6))
)
(:action paint_1
:parameters (?srv - Service_pain1 ?s - CeramicMaterial)
:precondition (and (provides ?srv painting) (enamelled ?s true) (painted ?s false) (status ?srv available) )
:effect (and (painted ?s true) (not(painted ?s false)) (increase (total-cost) 2))
)
(:action paint_2
:parameters (?srv - Service_pain2 ?s - CeramicMaterial)
:precondition (and (provides ?srv painting) (enamelled ?s true) (painted ?s false) (status ?srv available) )
:effect (and (painted ?s true) (not(painted ?s false)) (increase (total-cost) 22))
)
(:action provision_2
:parameters (?srv - Service_pro2 ?s - CeramicMaterial)
:precondition (and (provides ?srv provisioning) (provisioned ?s false) (status ?srv available) )
:effect (and (provisioned ?s true) (not(provisioned ?s false)) (increase (total-cost) 1))
)
(:action shi_3
:parameters (?srv - Service_shi3 ?s - CeramicMaterial)
:precondition (and (provides ?srv shipping) (secondbaked ?s true) (shipped ?s false) (status ?srv available) )
:effect (and (shipped ?s true) (not(shipped ?s false)) (increase (total-cost) 3))
)
(:action s_bake_1
:parameters (?srv - Service_sbak1 ?s - CeramicMaterial)
:precondition (and (provides ?srv sbaking) (painted ?s true) (secondbaked ?s false) (status ?srv available) )
:effect (and (secondbaked ?s true) (not(secondbaked ?s false)) (increase (total-cost) 1))
)
(:action f_bake_3
:parameters (?srv - Service_fbak3 ?s - CeramicMaterial)
:precondition (and (provides ?srv fbaking) (dried ?s true) (firstbaked ?s false) (status ?srv available) )
:effect (and (firstbaked ?s true) (not(firstbaked ?s false)) (increase (total-cost) 3))
)
(:action provision_4
:parameters (?srv - Service_pro4 ?s - CeramicMaterial)
:precondition (and (provides ?srv provisioning) (provisioned ?s false) (status ?srv available) )
:effect (and (provisioned ?s true) (not(provisioned ?s false)) (increase (total-cost) 4))
)

)