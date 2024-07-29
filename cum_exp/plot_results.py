import matplotlib.pyplot as plt
import pandas as pd

if __name__ == "__main__":
    df_mdp = pd.read_csv("chip_mdp.csv")
    print(df_mdp)

    df_plan = pd.read_csv("chip_plan.csv")
    print(df_plan)

    moded = ["mdp", "plan"]
    modes_mdp = ["automata", "ltlf"]
    dimensions = ["xsmall", "small", "medium", "large"]
    services = [14, 21, 28, 35]
    case_study = "chip"

    line_styles_mem = ['solid', 'dashed', 'dotted']
    line_styles_tim = ['solid', 'dashed', 'dotted']
    
    mems = {'automata': [], 'ltlf': [], 'plan': []}
    times_comp = {'automata': [], 'ltlf': [], 'plan': []}
    times_gamma_pol = {'automata': {0.9: []}, 'ltlf': {0.9: []}}

    for dimension in dimensions:
        mems['plan'].append(df_plan[(df_plan["case_study"] == case_study) & (df_plan["dimension"] == dimension)]["mem_tot"].values[0])
        times_comp['plan'].append(df_plan[(df_plan["case_study"] == case_study) & (df_plan["dimension"] == dimension)]["comp_time"].values[0])
    
    for mode_mdp in modes_mdp:
        for dimension in dimensions:
            mems[mode_mdp].append(df_mdp[(df_mdp["case_study"] == case_study) & (df_mdp["dimension"] == dimension) & (df_mdp["mode"] == mode_mdp)]["mem_tot"].values[0])
            times_comp[mode_mdp].append(df_mdp[(df_mdp["case_study"] == case_study) & (df_mdp["dimension"] == dimension) & (df_mdp["mode"] == mode_mdp)]["comp_time"].values[0])
            times_gamma_pol[mode_mdp][0.9].append(df_mdp[(df_mdp["case_study"] == case_study) & (df_mdp["dimension"] == dimension) & (df_mdp["mode"] == mode_mdp)]["policy_time"].values[0])
    
    fig = plt.figure(f"Memory usage - {case_study}")

    ax1 = fig.add_subplot(111)

    color = 'tab:red'
    lns1 = ax1.plot(services, mems['automata'], '-o', color=color, label='Automata', linestyle=line_styles_mem[0])
    ax1.set_xticks(services)
    ax1.set_xlabel('Services')
    ax1.set_ylabel('Memory (MiB)')
    ax1.tick_params(axis='y', labelcolor=color)

    color = 'tab:blue'
    ax2 = ax1.twinx()  # instantiate a second axes that shares the same x-axis
    lns2 = ax2.plot(services, mems['ltlf'], '-o', color=color, label='LTLf', linestyle=line_styles_mem[1])
    ax2.set_ylabel('')
    ax2.tick_params(axis='y', labelcolor=color)

    color = 'tab:green'
    ax3 = ax1.twinx()
    ax3.spines['right'].set_position(('outward', 38))  # Move the third axis outward
    lns3 = ax3.plot(services, mems['plan'], '-o', color=color, label='Planning', linestyle=line_styles_mem[2])
    #set y axis values
    ax3.set_yticks(list(range(24, 34, 2)))
    ax3.set_ylabel('')
    ax3.tick_params(axis='y', labelcolor=color)

    lns = lns1+lns2+lns3
    labs = [l.get_label() for l in lns]
    ax1.legend(lns, labs, loc=0, bbox_to_anchor=(0.4, 1.0))
    ax1.grid()
    fig.tight_layout()  # otherwise the right y-label is slightly clipped
    plt.savefig(f'mem_usage_{case_study}.png')
    plt.show(block=False)


    time_comp_automata = times_comp['automata']
    time_comp_ltlf = times_comp['ltlf']
    time_pol_automata = times_gamma_pol["automata"]
    time_pol_ltlf = times_gamma_pol["ltlf"]

    tot_time_automata = [sum(x) for x in zip(time_comp_automata, time_pol_automata[0.9])]
    tot_time_ltlf = [sum(x) for x in zip(time_comp_ltlf, time_pol_ltlf[0.9])]

    fig = plt.figure(f"Execution time - {case_study}")

    ax1 = fig.add_subplot(111)

    color = 'tab:red'
    lns1 = ax1.plot(services, tot_time_automata, '-o', color=color, label='Automata', linestyle=line_styles_tim[0])
    ax1.set_xticks(services)
    ax1.set_xlabel('Services')
    ax1.set_ylabel('Time (s)')
    ax1.tick_params(axis='y', labelcolor=color)

    color = 'tab:blue'
    ax2 = ax1.twinx()  # instantiate a second axes that shares the same x-axis
    lns2 = ax2.plot(services, tot_time_ltlf, '-o', color=color, label='LTLf', linestyle=line_styles_tim[1])
    ax2.set_ylabel('')
    ax2.tick_params(axis='y', labelcolor=color)

    color = 'tab:green'
    ax3 = ax1.twinx()
    ax3.spines['right'].set_position(('outward', 38))  # Move the third axis outward
    lns3 = ax3.plot(services, times_comp['plan'], '-o', color=color, label='Planning', linestyle=line_styles_tim[2])
    ax3.set_ylabel('')
    ax3.tick_params(axis='y', labelcolor=color)

    lns = lns1+lns2+lns3
    labs = [l.get_label() for l in lns]
    ax1.legend(lns, labs, loc=0)
    ax1.grid()
    fig.tight_layout()  # otherwise the right y-label is slightly clipped
    plt.savefig(f'exe_time_{case_study}.png')
    plt.show(block=False)