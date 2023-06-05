# Basic-MPC-based-on-CasAdi-for-a-mass-point-vehicle-model
# README

This is a Matlab and CasADi based Model Predictive Control (MPC) implementation for a kinematic vehicle model. The primary goal of this control is to drive the vehicle to follow a predefined reference point with minimum deviation, while considering the constraints of the vehicle and controls. 

## The kinematic_vehicle_model Function

The `kinematic_vehicle_model` function simulates a simple vehicle model. It takes as inputs the state of the vehicle `x` (containing x and y coordinates, velocity, and heading angle of the vehicle), the control inputs `u` (consisting of acceleration and angular velocity), and the sampling time `Ts`. It updates the state of the vehicle according to these inputs.

## MPC Controller

The MPC controller optimizes the control inputs `U` for a given state `X` and desired reference point `P`, subject to the constraints of the vehicle's capabilities (e.g., maximum speed, maximum steering angle) and control limits (e.g., maximum acceleration, maximum angular velocity).

The MPC optimization process minimizes the cost function `J`, which is a weighted sum of the squares of the control inputs and the squares of the deviations from the reference point. 

## Simulation Loop

The simulation loop runs for a specified simulation time `simtime`. It first sets the desired reference point `P` and the initial state `X0`. Then it calls the MPC solver to find the optimal control inputs `U`. These control inputs are then applied to the vehicle model to get the updated state `x`. This process is repeated for the entire simulation time.

At the end of the simulation, it plots the velocity of the vehicle, y coordinate, acceleration, and angular velocity against time.

## Running the Code

Ensure that you have both Matlab and CasADi installed on your machine. Copy the code to a new Matlab script file (.m file) and run it.

## Dependencies
- Matlab: This code has been written in Matlab. Ensure you have a version of Matlab that's compatible with the CasADi toolbox.
- CasADi: This toolbox is used for defining the optimization problem for the MPC controller and solving it. You can download CasADi from [here](https://web.casadi.org/get/).

**Note:** This script is intended for research and simulation purposes only. Real-world vehicle control involves many more factors and safety considerations.
