import glob
import pandas as pd

if __name__ == "__main__":
    case_studies = ["ceramic", "chip", "motor"]
    dimensions = ["xsmall", "small", "medium", "large"]

    results = []
    for case_study in case_studies:
        for dimension in dimensions:
            time_comp = 0
            fn_time = glob.glob(f"../experimental_results/*profiling_{case_study}_{dimension}.txt")[0]
            fn_mem = glob.glob(f"../experimental_results/*profiling_downward_{case_study}_{dimension}.txt")[0]
            with open(fn_mem, 'r') as file:
                file_lines = file.readlines()
            mem_comp = float(file_lines[8].split()[1].strip())
            with open(fn_time, 'r') as file:
                file_lines = file.readlines()
            time_comp = float(file_lines[0].split(":")[1].strip())
            time_comp = time_comp / 10**9

            results.append([case_study, dimension, mem_comp, time_comp])

    df = pd.DataFrame(results, columns=["case_study", "dimension", "mem_tot", "comp_time"])
    print(df)
    df.to_csv("experimental_results.csv", sep=",", index=False)
