# Orchestration of services in Smart Manufacturing through automated synthesis - Deterministic instance planning approach

Repository containing the case studies and the experimental results of the deterministic instance planning approach (classical planning) for the paper "Orchestration of services in Smart Manufacturing through automated synthesis".

## Experiments

The experiments can be replicated using Docker.

### Use the Docker image

1. Build the image from the [Dockerfile](Dockerfile):
  ```sh
  docker build -t planning_controller .
  ```

2. Run a new container and open a terminal from the created image:
  ```sh
  docker run planning_controller bash
  ```

3. Set up the configuration file needed for the controller.

4. Run the controller:
  ```sh
  python3 main.py 
  ```

5. When the controller finishes its execution, it produces two log files (for each run) in the `experimental_results` folder. These files represent:
- `<timestamp>_profiling_<case_study>_<size>`: contains the time consumption of the plan computation
- `<timestamp>_profiling_downward_<case_study>_<size>`: contains the memory consumption of the plan computation

#### Configuration file
The configuration file  `config.json` contains basic information needed to run the experiments. 

It contains the basic information needed to run the experiments. The JSON key ``mode`` accept the values ``[plan]`` (it can be skipped), the key ``size`` accepts ``[xsmall, small, medium, large]`` values (related to the number of involved actors), the key `case_study` accepts ``["chip", "ceramic", "motor]`` values which serve to indicate which case study to use, the key `path_desc` can be skipped as it indicates to the Industrial API where the case study descriptions are.

An example with information of the key-value pairs is given below.
```json
{
    "mode": "plan",
    "size": "xsmall",
    "case_study": "chip",
    "path_desc": "src"
}
```

## Evaluation Results

Evaluation results of the experiments can be found in [eval_utils](eval_utils/). The [experimental_results.csv](eval_utils/experimental_results.csv) file contains the aggregated results of the memory and time consumption for the three case studies.


### Chip case study

#### Memory consumption
![memory chip](eval_utils/memory_consumption_chip.png)

#### Time consumption
![time chip](eval_utils/time_consumption_chip.png)



### Ceramic case study

#### Memory consumption
![memory ceramic](eval_utils/memory_consumption_ceramic.png)

#### Time consumption
![time ceramic](eval_utils/time_consumption_ceramic.png)


### Motor case study

#### Memory consumption
![memory motor](eval_utils/memory_consumption_motor.png)

#### Time consumption
![time motor](eval_utils/time_consumption_motor.png)


## Comulative Experimental Results - Chip case study

Comulative results (including also policy-based approachs) are available in [cum_exp](cum_exp).

#### Time consumption
![time chip](cum_exp/exe_time_chip.png)

#### Memory consumption
![mem chip](cum_exp/mem_usage_chip.png)


## User Study

A user study is realized with 8 participants to analyzing the tradeoff between the expressive power of the modeling approaches and the complexity for practitioners to apply them. \
We disseminated a questionnaire (which can be found [here](user_study/exercises.pdf)) with a description of the specifics of the two modeling approaches and two exercises to be solved. \
We measured the time employed by the participants to solve the exercise and then interviewed the participants on the solved exercises. 
- Results of ex1 can be found [here](user_study/res_ex1_tsc.pdf) 
- Results of ex2 can be found [here](user_study/res_ex2_tsc.pdf)
- Comulative results can be found [here](user_study/res.xlsx). Each solved exercise has been evaluated from 1 to 5, with 1 being wrong answer and 5 being correct answer (i.e., 1 wrong, 2 less than acceptable, 3 acceptable, 4 more than acceptable, 5 correct). The employed time is measured in minutes.

The results showed that MDP-based modeling was found to be more expressive, allowing for a detailed representation of manufacturing assets. However, it was also more time-consuming for participants to apply. Furthermore, some experts struggled to achieve the correct version of the model, indicating higher complexity.\
Flower graph modeling, in contrast, was simpler and faster for all participants. Every participant was able to model the services correctly within a shorter time frame, suggesting that this method, while less expressive, is more accessible.\
These findings show how, while MDPs provide more powerful representations, they may not be the best choice when speed or simplicity is required. On the contrary, flower graph should be employed when the control flow is not important.
