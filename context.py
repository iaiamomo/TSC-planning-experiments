from translator import *

instances = {}

instances_chip = {"Design":["design"],
                    "SiliconMaterial":["silicon"],
                    "ImpurityMaterial":["impurity"],
                    "ResistMaterial":["resist"],
                    "ChemicalsMaterial":["chemicals"],
                    "ChipMaterial":["chip"],
                    "Boolean":["true","false"],
                    "State":["available","broken"]}

instances_motor = {"InverterMaterial":["inverter"],
                    "RotorMaterial":["rotor"],
                    "StatorMaterial":["stator"],
                    "MotorObject":["motor"],
                    "Boolean":["true","false"],
                    "State":["available","broken"]}

instances_ceramic = {"CeramicMaterial":["ceramic"],
                    "Boolean":["true","false"],
                    "State":["available","broken"]}

types = { "Object": [] }

# predicates
atomicTerms = []

atomicTerms_chip = [
                        atomicTerm("taken", "o - Design", "b - Boolean"),
                        atomicTerm("taken", "o - SiliconMaterial", "b - Boolean"),
                        atomicTerm("taken", "o - ImpurityMaterial", "b - Boolean"),
                        atomicTerm("taken", "o - ResistMaterial", "b - Boolean"),
                        atomicTerm("taken", "o - ChemicalsMaterial", "b - Boolean"),

                        atomicTerm("status", "o - Service", "b - State"),

                        atomicTerm("masked", "o - Design", "b - Boolean"),
                        atomicTerm("masked", "o - SiliconMaterial", "b - Boolean"), 
                        atomicTerm("masked", "o - ChipMaterial", "b - Boolean"),
                        
                        atomicTerm("lithographed", "o - SiliconMaterial", "b - Boolean"),
                        atomicTerm("lithographed", "o - ChipMaterial", "b - Boolean"),
                        
                        atomicTerm("implanted", "o - ChipMaterial", "b - Boolean"),
                        atomicTerm("implanted", "o - ImpurityMaterial", "b - Boolean"),
                        atomicTerm("implanted", "o - ResistMaterial", "b - Boolean"),
                        atomicTerm("implanted", "o - ChemicalsMaterial", "b - Boolean"),
                        
                        atomicTerm("tested", "o - ChipMaterial", "b - Boolean"),

                        atomicTerm("smart_tested", "o - ChipMaterial", "b - Boolean"),

                        atomicTerm("quality_checked", "o - ChipMaterial", "b - Boolean"),

                        atomicTerm("diced", "o - ChipMaterial", "b - Boolean"),
                        
                        atomicTerm("packed", "o - ChipMaterial", "b - Boolean"),

                        atomicTerm("packed_cool", "o - ChipMaterial", "b - Boolean"),
]

atomicTerms_motor = [
                        atomicTerm("taken", "o - InverterMaterial", "b - Boolean"),
                        atomicTerm("taken", "o - RotorMaterial", "b - Boolean"),
                        atomicTerm("taken", "o - StatorMaterial", "b - Boolean"),

                        atomicTerm("status", "o - Service", "b - State"),

                        atomicTerm("assembled", "o - MotorObject", "b - Boolean"),

                        atomicTerm("run", "o - MotorObject", "b - Boolean"),

                        atomicTerm("painted", "o - MotorObject", "b - Boolean"),

                        atomicTerm("tested", "o - MotorObject", "b - Boolean")
]

atomicTerms_ceramic = [
                        atomicTerm("status", "o - Service", "b - State"),
                        
                        atomicTerm("provisioned", "o - CeramicMaterial", "b - Boolean"),
                        
                        atomicTerm("moulded", "o - CeramicMaterial", "b - Boolean"),
                        
                        atomicTerm("dried", "o - CeramicMaterial", "b - Boolean"),
                        
                        atomicTerm("firstbaked", "o - CeramicMaterial", "b - Boolean"),
                        
                        atomicTerm("enamelled", "o - CeramicMaterial", "b - Boolean"),
                        
                        atomicTerm("painted", "o - CeramicMaterial", "b - Boolean"),
                        
                        atomicTerm("secondbaked", "o - CeramicMaterial", "b - Boolean"),
                        
                        atomicTerm("shipped", "o - CeramicMaterial", "b - Boolean")
]

# strips: strips style
# equality: "=" as built-in predicate
# typing: allow types names in declaration of variables
requirements = ["strips", "equality", "typing"]

# plan goal
goal = []
goal_chip = [groundAtomicTerm("packed", "chip", "true")]
goal_motor = [groundAtomicTerm("tested", "motor", "true")]
goal_ceramic = [groundAtomicTerm("shipped", "ceramic", "true")]
