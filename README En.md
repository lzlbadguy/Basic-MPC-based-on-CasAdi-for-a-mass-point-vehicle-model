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
# 自述文件

这是一个基于Matlab和CasADi的动力学车辆模型的模型预测控制（MPC）实现。这个控制的主要目标是在考虑车辆和控制的约束的同时，使车辆尽可能小的偏离预定义的参考点。

## 动力学车辆模型函数

`kinematic_vehicle_model` 函数模拟了一个简单的车辆模型。它以车辆的状态 `x`（包含车辆的x和y坐标、速度和行驶角度），控制输入 `u`（包含加速度和角速度），以及采样时间 `Ts` 作为输入。根据这些输入，它更新车辆的状态。

## MPC控制器

MPC控制器优化了给定状态 `X` 和期望的参考点 `P` 的控制输入 `U`，同时考虑到车辆的能力（例如，最大速度，最大转向角度）和控制限制（例如，最大加速度，最大角速度）。

MPC优化过程最小化成本函数 `J`，该函数是控制输入的平方和以及与参考点的偏差的平方的加权和。

## 模拟循环

模拟循环在指定的模拟时间 `simtime` 内运行。它首先设置期望的参考点 `P` 和初始状态 `X0`。然后，它调用MPC求解器找到最优的控制输入 `U`。然后，这些控制输入被应用到车辆模型中以获取更新的状态 `x`。这个过程在整个模拟时间内重复。

在模拟结束时，它绘制车辆速度、y坐标、加速度和角速度与时间的关系图。

## 运行代码

确保您的机器上已安装Matlab和CasADi。将代码复制到新的Matlab脚本文件（.m文件）中并运行。

## 依赖项
- Matlab: 此代码是用Matlab编写的。确保您有一个与CasADi工具箱兼容的Matlab版本。
- CasADi: 此工具箱用于定义MPC控制器的优化问题并解决它。您可以从[这里](https://web.casadi.org/get/)下载CasADi。

**注意：** 此脚本仅用于研究和模拟目的。真实的车辆控制涉及更多的因素和安全考虑。
