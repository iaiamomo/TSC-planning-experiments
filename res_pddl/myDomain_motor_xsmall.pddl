(define (domain myDomain_motor_xsmall)
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
Service_ass1 Service_inv_us Service_pain1 Service_tes1 Service_sma_tes1 Service_run1 - Service
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
(:action assemble_1
:parameters (?srv - Service_ass1 ?s - MotorObject ?i - InverterMaterial ?r - RotorMaterial ?d - StatorMaterial)
:precondition (and (provides ?srv assembling) (taken ?i true) (taken ?r true) (taken ?d true) (assembled ?s false) (status ?srv available) )
:effect (and (assembled ?s true) (not(assembled ?s false)) (increase (total-cost) 5))
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
(:action paint_1
:parameters (?srv - Service_pain1 ?s - MotorObject)
:precondition (and (provides ?srv painting) (painted ?s false) (run ?s true) (status ?srv available) )
:effect (and (painted ?s true) (not(painted ?s false)) (increase (total-cost) 5))
)
(:action test_1
:parameters (?srv - Service_tes1 ?a - MotorObject)
:precondition (and (provides ?srv testing) (painted ?a true) (tested ?a false) (status ?srv available) )
:effect (and (tested ?a true) (not(tested ?a false)) (increase (total-cost) 5))
)
(:action sma_test_1
:parameters (?srv - Service_sma_tes1 ?a - MotorObject)
:precondition (and (provides ?srv smart_testing) (painted ?a true) (tested ?a false) (status ?srv available) )
:effect (and (tested ?a true) (not(tested ?a false)) (increase (total-cost) 5))
)
(:action run_1
:parameters (?srv - Service_run1 ?a - MotorObject)
:precondition (and (provides ?srv running) (assembled ?a true) (run ?a false) (status ?srv available) )
:effect (and (run ?a true) (not(run ?a false)) (increase (total-cost) 5))
)

)