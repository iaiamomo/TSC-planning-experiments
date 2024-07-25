(define (problem myProblem_motor_large)
(:domain myDomain_motor_large)
(:objects 
inverter - InverterMaterial
rotor - RotorMaterial
stator - StatorMaterial
motor - MotorObject
true - Boolean
false - Boolean
available - State
broken - State
running - Capability
smart_testing - Capability
taking_stator - Capability
taking_rotor - Capability
assembling - Capability
taking_inverter - Capability
painting - Capability
testing - Capability
running2usa - Service_run2
running1usa - Service_run1
smarttester1usa - Service_sma_tes1
inventoryuk - Service_inv_uk
inventorycina - Service_inv_ci
running3usa - Service_run3
assembler2usa - Service_ass2
inventorybr - Service_inv_br
painter1usa - Service_pain1
painter2usa - Service_pain2
assembler1usa - Service_ass1
inventoryrus - Service_inv_ru
inventorychile - Service_inv_ch
tester1usa - Service_tes1
smarttester2usa - Service_sma_tes2
inventoryusa - Service_inv_us
)
(:init 
(provides running2usa running)
(provides running1usa running)
(provides smarttester1usa smart_testing)
(provides inventoryuk taking_stator)
(provides inventorycina taking_rotor)
(provides inventorycina taking_stator)
(provides running3usa running)
(provides assembler2usa assembling)
(provides inventorybr taking_inverter)
(provides inventorybr taking_rotor)
(provides painter1usa painting)
(provides painter2usa painting)
(provides assembler1usa assembling)
(provides inventoryrus taking_rotor)
(provides inventorychile taking_inverter)
(provides tester1usa testing)
(provides smarttester2usa smart_testing)
(provides inventoryusa taking_inverter)
(provides inventoryusa taking_rotor)
(provides inventoryusa taking_stator)
(status running2usa available)
(assembled motor false)
(run motor false)
(tested motor false)
(painted motor false)
(status running1usa available)
(status smarttester1usa available)
(taken rotor false)
(assembled rotor false)
(status inventoryuk available)
(taken inverter false)
(assembled inverter false)
(status inventorycina available)
(status running3usa available)
(status assembler2usa available)
(status inventorybr available)
(status painter1usa available)
(status painter2usa available)
(status assembler1usa available)
(status inventoryrus available)
(status inventorychile available)
(taken stator false)
(assembled stator false)
(status tester1usa available)
(status smarttester2usa available)
(status inventoryusa available)
(= (total-cost) 0)
)
(:goal 
(and 
(tested motor true)
)
)
(:metric minimize (total-cost))

)