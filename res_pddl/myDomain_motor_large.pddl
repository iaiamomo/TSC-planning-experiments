(define (domain myDomain_motor_large)
(:requirements :strips :equality :typing)
(:types 
Service - Thing
Capability
InverterMaterial
RotorMaterial
StatorMaterial
MotorObject
Boolean
State
Service_run2 Service_run1 Service_sma_tes1 Service_inv_uk Service_inv_ci Service_run3 Service_ass2 Service_inv_br Service_pain1 Service_pain2 Service_ass1 Service_inv_ru Service_inv_ch Service_tes1 Service_sma_tes2 Service_inv_us - Service
)
(:predicates 
(provides ?srv - Service ?c - Capability) 
(taken ?o - InverterMaterial ?b - Boolean)
(taken ?o - RotorMaterial ?b - Boolean)
(taken ?o - StatorMaterial ?b - Boolean)
(status ?o - Service ?b - State)
(assembled ?o - MotorObject ?b - Boolean)
(run ?o - MotorObject ?b - Boolean)
(painted ?o - MotorObject ?b - Boolean)
(tested ?o - MotorObject ?b - Boolean)
)
(:functions (total-cost))
(:action run_2
:parameters (?srv - Service_run2 ?a - MotorObject)
:precondition (and (provides ?srv running) (assembled ?a true) (run ?a false) (status ?srv available) )
:effect (and (run ?a true) (not(run ?a false)) (increase (total-cost) 1))
)
(:action run_1
:parameters (?srv - Service_run1 ?a - MotorObject)
:precondition (and (provides ?srv running) (assembled ?a true) (run ?a false) (status ?srv available) )
:effect (and (run ?a true) (not(run ?a false)) (increase (total-cost) 5))
)
(:action sma_test_1
:parameters (?srv - Service_sma_tes1 ?a - MotorObject)
:precondition (and (provides ?srv smart_testing) (painted ?a true) (tested ?a false) (status ?srv available) )
:effect (and (tested ?a true) (not(tested ?a false)) (increase (total-cost) 5))
)
(:action take_stator_uk
:parameters (?srv - Service_inv_uk ?b - StatorMaterial)
:precondition (and (provides ?srv taking_stator) (taken ?b false) (status ?srv available) )
:effect (and (taken ?b true) (not(taken ?b false)) (increase (total-cost) 5))
)
(:action take_rotor_ci
:parameters (?srv - Service_inv_ci ?b - RotorMaterial)
:precondition (and (provides ?srv taking_rotor) (taken ?b false) (status ?srv available) )
:effect (and (taken ?b true) (not(taken ?b false)) (increase (total-cost) 4))
)
(:action take_stator_ci
:parameters (?srv - Service_inv_ci ?b - StatorMaterial)
:precondition (and (provides ?srv taking_stator) (taken ?b false) (status ?srv available) )
:effect (and (taken ?b true) (not(taken ?b false)) (increase (total-cost) 5))
)
(:action run_3
:parameters (?srv - Service_run3 ?a - MotorObject)
:precondition (and (provides ?srv running) (assembled ?a true) (run ?a false) (status ?srv available) )
:effect (and (run ?a true) (not(run ?a false)) (increase (total-cost) 3))
)
(:action assemble_2
:parameters (?srv - Service_ass2 ?s - MotorObject ?i - InverterMaterial ?r - RotorMaterial ?d - StatorMaterial)
:precondition (and (provides ?srv assembling) (taken ?i true) (taken ?r true) (taken ?d true) (assembled ?s false) (status ?srv available) )
:effect (and (assembled ?s true) (not(assembled ?s false)) (increase (total-cost) 6))
)
(:action take_inverter_br
:parameters (?srv - Service_inv_br ?b - InverterMaterial)
:precondition (and (provides ?srv taking_inverter) (taken ?b false) (status ?srv available) )
:effect (and (taken ?b true) (not(taken ?b false)) (increase (total-cost) 2))
)
(:action take_rotor_br
:parameters (?srv - Service_inv_br ?b - RotorMaterial)
:precondition (and (provides ?srv taking_rotor) (taken ?b false) (status ?srv available) )
:effect (and (taken ?b true) (not(taken ?b false)) (increase (total-cost) 2))
)
(:action paint_1
:parameters (?srv - Service_pain1 ?s - MotorObject)
:precondition (and (provides ?srv painting) (painted ?s false) (run ?s true) (status ?srv available) )
:effect (and (painted ?s true) (not(painted ?s false)) (increase (total-cost) 5))
)
(:action paint_2
:parameters (?srv - Service_pain2 ?s - MotorObject)
:precondition (and (provides ?srv painting) (painted ?s false) (run ?s true) (status ?srv available) )
:effect (and (painted ?s true) (not(painted ?s false)) (increase (total-cost) 15))
)
(:action assemble_1
:parameters (?srv - Service_ass1 ?s - MotorObject ?i - InverterMaterial ?r - RotorMaterial ?d - StatorMaterial)
:precondition (and (provides ?srv assembling) (taken ?i true) (taken ?r true) (taken ?d true) (assembled ?s false) (status ?srv available) )
:effect (and (assembled ?s true) (not(assembled ?s false)) (increase (total-cost) 5))
)
(:action take_rotor_ru
:parameters (?srv - Service_inv_ru ?b - RotorMaterial)
:precondition (and (provides ?srv taking_rotor) (taken ?b false) (status ?srv available) )
:effect (and (taken ?b true) (not(taken ?b false)) (increase (total-cost) 20))
)
(:action take_inverter_ch
:parameters (?srv - Service_inv_ch ?b - InverterMaterial)
:precondition (and (provides ?srv taking_inverter) (taken ?b false) (status ?srv available) )
:effect (and (taken ?b true) (not(taken ?b false)) (increase (total-cost) 2))
)
(:action test_1
:parameters (?srv - Service_tes1 ?a - MotorObject)
:precondition (and (provides ?srv testing) (painted ?a true) (tested ?a false) (status ?srv available) )
:effect (and (tested ?a true) (not(tested ?a false)) (increase (total-cost) 5))
)
(:action sma_test_2
:parameters (?srv - Service_sma_tes2 ?a - MotorObject)
:precondition (and (provides ?srv smart_testing) (painted ?a true) (tested ?a false) (status ?srv available) )
:effect (and (tested ?a true) (not(tested ?a false)) (increase (total-cost) 3))
)
(:action take_inverter_us
:parameters (?srv - Service_inv_us ?b - InverterMaterial)
:precondition (and (provides ?srv taking_inverter) (taken ?b false) (status ?srv available) )
:effect (and (taken ?b true) (not(taken ?b false)) (increase (total-cost) 1))
)
(:action take_rotor_us
:parameters (?srv - Service_inv_us ?b - RotorMaterial)
:precondition (and (provides ?srv taking_rotor) (taken ?b false) (status ?srv available) )
:effect (and (taken ?b true) (not(taken ?b false)) (increase (total-cost) 1))
)
(:action take_stator_us
:parameters (?srv - Service_inv_us ?b - StatorMaterial)
:precondition (and (provides ?srv taking_stator) (taken ?b false) (status ?srv available) )
:effect (and (taken ?b true) (not(taken ?b false)) (increase (total-cost) 1))
)

)