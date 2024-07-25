(define (problem myProblem_motor_medium)
(:domain myDomain_motor_medium)
(:objects 
inverter - InverterMaterial
rotor - RotorMaterial
stator - StatorMaterial
motor - MotorObject
true - Boolean
false - Boolean
available - State
broken - State
taking_rotor - Capability
taking_inverter - Capability
taking_stator - Capability
assembling - Capability
painting - Capability
running - Capability
testing - Capability
smart_testing - Capability
inventoryrus - Service_inv_ru
inventoryusa - Service_inv_us
assembler1usa - Service_ass1
painter1usa - Service_pain1
running2usa - Service_run2
inventorychile - Service_inv_ch
tester1usa - Service_tes1
running1usa - Service_run1
smarttester1usa - Service_sma_tes1
inventoryuk - Service_inv_uk
painter2usa - Service_pain2
inventorybr - Service_inv_br
smarttester2usa - Service_sma_tes2
)
(:init 
(provides inventoryrus taking_rotor)
(provides inventoryusa taking_inverter)
(provides inventoryusa taking_rotor)
(provides inventoryusa taking_stator)
(provides assembler1usa assembling)
(provides painter1usa painting)
(provides running2usa running)
(provides inventorychile taking_inverter)
(provides tester1usa testing)
(provides running1usa running)
(provides smarttester1usa smart_testing)
(provides inventoryuk taking_stator)
(provides painter2usa painting)
(provides inventorybr taking_inverter)
(provides inventorybr taking_rotor)
(provides smarttester2usa smart_testing)
(taken rotor false)
(assembled rotor false)
(status inventoryrus available)
(status inventoryusa available)
(status assembler1usa available)
(assembled motor false)
(run motor false)
(tested motor false)
(painted motor false)
(status painter1usa available)
(status running2usa available)
(status inventorychile available)
(status tester1usa available)
(status running1usa available)
(status smarttester1usa available)
(status inventoryuk available)
(status painter2usa available)
(status inventorybr available)
(status smarttester2usa available)
(taken stator false)
(assembled stator false)
(taken inverter false)
(assembled inverter false)
(= (total-cost) 0)
)
(:goal 
(and 
(tested motor true)
)
)
(:metric minimize (total-cost))

)