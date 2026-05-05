---
title: 00 All About Rooflines
description: Roofline 模型详解 - 理解硬件性能上限与优化方向
date: 2026-04-30
tags:
  - Scaling-Book
  - Performance
  - Roofline
---

# 00 All About Rooflines

## 📖 前置介绍

> https://jax-ml.github.io/scaling-book/roofline/

当我们在硬件上运行一个算法时，运行时间主要被三类资源限制：

- 算力限制：机器每秒能做多少次运算，单位是 OP/s
- 带宽限制：机器每秒能搬运多少数据，单位是 bytes/s
- 容量限制：机器总共能存多少数据，单位是 bytes

硬件能力可以抽象为三个参数：

- $P$：峰值算力，单位为 OP/s
- $W$：带宽，单位为 bytes/s
- $C$：总内存容量，单位为 bytes

算法需求也可以抽象为三个参数：

- $F$：总计算量，单位为 OP
- $B$：总数据搬运量，单位为 bytes
- $M$：运行时需要同时存储的数据量，单位为 bytes

计算时间由总计算量和硬件峰值算力决定：

$$
T_{\text{compute}} \ge \frac{F}{P}
$$

通信时间由总数据搬运量和带宽决定：

$$
T_{\text{communicate}} \ge \frac{B}{W}
$$

算法运行时需要同时存储的数据量不能超过硬件总内存容量：

$$
M \le C
$$

如果计算和通信可以重叠，那么总运行时间的理论下界为：

$$
T \ge \max\left(T_{\text{compute}}, T_{\text{communicate}}\right)
$$

进一步代入可得：

$$
T \ge \max\left(\frac{F}{P}, \frac{B}{W}\right)
$$

前提是满足内存容量约束：

$$
M \le C
$$

还有一个算术强度(Arithmetic Intensity)的概念

> 每搬运 1 byte 数据，能做多少次计算

$$
\text{Arithmetic Intensity} = \frac{\text{Computation FLOPs}}{\text{Communication Bytes}}
$$

也即

$$
I = \frac{F}{B}
$$

## 🎯 核心概念

### 什么是 Roofline？

Roofline 模型通过两个关键指标来分析性能：

- **计算强度 (Arithmetic Intensity)**: 每字节数据传输执行的浮点运算次数
- **性能上限 (Performance Ceiling)**: 硬件的理论峰值性能
