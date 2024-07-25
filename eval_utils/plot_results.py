import matplotlib.pyplot as plt
import pandas as pd

if __name__ == "__main__":
    df = pd.read_csv("experimental_results.csv")
    print(df)

    case_studies = ["ceramic", "chip", "motor"]
    dimensions = ["xsmall", "small", "medium", "large"]
    dimensions_num = [0, 10, 20, 30]
    
    for case_study in case_studies:

        mems = []
        times_comp = []
        for dimension in dimensions:
            mems.append(df[(df["case_study"] == case_study) & (df["dimension"] == dimension)]["mem_tot"].values[0])
            times_comp.append(df[(df["case_study"] == case_study) & (df["dimension"] == dimension)]["comp_time"].values[0])
        
        plt.figure(f"Memory usage - planning - {case_study}")
        plt.title(f'Memory usage - planning - {case_study}')
        plt.plot(dimensions_num, mems, '-o', label='Planning')
        plt.xticks(dimensions_num, dimensions)
        plt.xlabel('Dimension')
        plt.ylabel('Memory (MiB)')
        plt.grid()
        plt.savefig(f'memory_consumption_{case_study}.png')
        plt.show(block=False)


        plt.figure(f"Solution computation time - {case_study}")
        plt.title('Planning - Time consumption')
        plt.plot(dimensions_num, times_comp, '-o', label='Planning')
        plt.xticks(dimensions_num, dimensions)
        plt.xlabel('Number of services')
        plt.ylabel('Time (s)')
        plt.legend()
        plt.grid()
        plt.savefig(f'time_consumption_{case_study}.png')
        plt.show(block=False)