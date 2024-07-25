(define (problem myProblem_motor_xsmall)
(:domain myDomain_motor_xsmall)
(:objects 
inverter - InverterMaterial
rotor - RotorMaterial
stator - StatorMaterial
motor - MotorObject
true - Boolean
false - Boolean
available - State
broken - State
assembling - Capability
taking_inverter - Capability
taking_rotor - Capability
taking_stator - Capability
painting - Capability
testing - Capability
smart_testing - Capability
running - Capability
assembler1usa - Service_ass1
inventoryusa - Service_inv_us
painter1usa - Service_pain1
tester1usa - Service_tes1
smarttester1usa - Service_sma_tes1
running1usa - Service_run1
)
(:init 
(provides assembler1usa assembling)
(provides inventoryusa taking_inverter)
(provides inventoryusa taking_rotor)
(provides inventoryusa taking_stator)
(provides painter1usa painting)
(provides tester1usa testing)
(provides smarttester1usa smart_testing)
(provides running1usa running)
(assembled motor false)
(run motor false)
(tested motor false)
(painted motor false)
(status assembler1usa available)
(status inventoryusa available)
(taken rotor false)
(assembled rotor false)
(taken inverter false)
(assembled inverter false)
(status painter1usa available)
(taken stator false)
(assembled stator false)
(status tester1usa available)
(status smarttester1usa available)
(status running1usa available)
(= (total-cost) 0)
)
(:goal 
(and 
(tested motor true)
)
)
(:metric minimize (total-cost))

)