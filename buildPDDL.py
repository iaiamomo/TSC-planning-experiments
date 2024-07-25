from description import *
from actorsAPI import *
import config
import context

def buildPDDL(domain, problem, case_study = None):
    servicesAPI = searchServices()

    services = [] 
    capabilities = [] 
    tasks = [] 
    groundAtomicTerms = []
 
    if case_study == None:
        goal = context.goal
        atomicTerms = context.atomicTerms
        instances = context.instances
    elif case_study == "motor":
        goal = context.goal_motor
        atomicTerms = context.atomicTerms_motor
        instances = context.instances_motor
    elif case_study == "chip":
        goal = context.goal_chip
        atomicTerms = context.atomicTerms_chip
        instances = context.instances_chip
    elif case_study == "ceramic":
        goal = context.goal_ceramic
        atomicTerms = context.atomicTerms_ceramic
        instances = context.instances_ceramic
    requirements = context.requirements

    instances_mine = {}
    for service in servicesAPI:
        if "attributes" in service and "Service" not in service["attributes"]["type"]:
            attributes = service["attributes"]
            asset_type = attributes["type"]
            if asset_type not in instances_mine:
                instances_mine[asset_type] = []
            if service["id"] not in instances_mine[asset_type]:
                instances_mine[asset_type].append(service["id"])
        """ if "features" in service and "Service" in service["attributes"]["type"]:
            features = service["features"]
            for f in features:
                if f == "status":
                    if "State" not in instances_mine:
                        instances_mine["State"] = []
                    if features[f]["properties"]["value"] not in instances_mine["State"]:
                        instances_mine["State"].append(features[f]["properties"]["value"]) """
    instances_mine["Boolean"] = ["true","false"]
    instances_mine["State"] = ["available","broken"]

    atomicTerms_mine = []
    for service in servicesAPI:
        if "Service" not in service["attributes"]["type"]:
            features = service["features"].keys()
            for f in features:
                value_elem = service["features"][f]["properties"]["value"]
                value_elem_type = next((key for key, value in instances_mine.items() if value_elem in value), None)
                atomicTerms_mine.append(atomicTerm(f,f'o - {service["attributes"]["type"]}',f"b - {value_elem_type}"))
    atomicTerms_mine.append(atomicTerm("status","o - Service","b - State"))

    subtypes_service = []

    for service in servicesAPI:
        s = service["id"]
        services.append(s)

        features = service["features"]
        attributes = service["attributes"]
        serviceType = attributes["type"]

        for f in features.keys():
            feature = features[f]
            value = feature["properties"]["value"]
            groundAtomicTerms.append(groundAtomicTerm(f,s,value))

        if "Service" in serviceType:
            subtypes_service.append(serviceType)       
            actions = attributes["actions"]
            for a in actions:
                action = actions[a]
                props = action["properties"]
                featureType = props["type"]
                
                if featureType == "operation":
                    capabilities.append(a)
                    name = props["command"]
                    cost = props["cost"]
                    params = props["parameters"]
                    
                    posPrec = []
                    negPrec = []
                    addEff = []
                    delEff = []
                    try:
                        posPrec = props["requirements"]["positive"]
                    except KeyError:
                        pass
                    try:
                        negPrec = props["requirements"]["negative"]
                    except KeyError:
                        pass
                    try:
                        addEff = props["effects"]["added"]
                    except KeyError:
                        pass
                    try:
                        delEff = props["effects"]["deleted"]
                    except KeyError:
                        pass

                    providedBy = s 
                    
                    task = Task(name,
                                params,
                                posPrec,
                                negPrec,
                                addEff,
                                delEff,
                                providedBy,
                                a,
                                cost,
                                serviceType
                                )
                    tasks.append(task)
                
    desc = Description(services,capabilities,
                       instances,subtypes_service,tasks,atomicTerms,
                       groundAtomicTerms)

    domain_name = domain[:domain.rfind(".")]
    problem_name = problem[:problem.rfind(".")]

    domainFile = open(f"{domain}", 'w+')
    domainFile.write(desc.getPDDLDomain(domain_name,requirements))
    domainFile.close()

    problemFile = open(f"{problem}", 'w+')
    problemFile.write(desc.getPDDLProblem(domain_name,problem_name,goal))
    problemFile.close()

    return desc
    
if __name__ == "__main__":
    size = "large"
    domain = f"{config.PDDL['domainName']}_{size}.pddl"
    problem = f"{config.PDDL['problemName']}_{size}.pddl"
    buildPDDL(domain, problem)             
    
