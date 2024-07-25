(define (problem myProblem_motor_small)
(:domain myDomain_motor_small)
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
testing - Capability
smart_testing - Capability
painting - Capability
running - Capability
assembler1usa - Service_ass1
inventoryusa - Service_inv_us
tester1usa - Service_tes1
smarttester1usa - Service_sma_tes1
painter1usa - Service_pain1
running1usa - Service_run1
inventoryrus - Service_inv_ru
running2usa - Service_run2
inventorychile - Service_inv_ch
inventoryuk - Service_inv_uk
)
(:init 
(provides assembler1usa assembling)
(provides inventoryusa taking_inverter)
(provides inventoryusa taking_rotor)
(provides inventoryusa taking_stator)
(provides tester1usa testing)
(provides smarttester1usa smart_testing)
(provides painter1usa painting)
(provides running1usa running)
(provides inventoryrus taking_rotor)
(provides running2usa running)
(provides inventorychile taking_inverter)
(provides inventoryuk taking_stator)
(status assembler1usa available)
(status inventoryusa available)
(taken stator false)
(assembled stator false)
(taken inverter false)
(assembled inverter false)
(assembled motor false)
(run motor false)
(tested motor false)
(painted motor false)
(status tester1usa available)
(status smarttester1usa available)
(status painter1usa available)
(status running1usa available)
(status inventoryrus available)
(status running2usa available)
(status inventorychile available)
(taken rotor false)
(assembled rotor false)
(status inventoryuk available)
(= (total-cost) 0)
)
(:goal 
(and 
(tested motor true)
)
)
(:metric minimize (total-cost))

)