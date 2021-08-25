# Trajectory and Communication Design for UAV Facilitated Wireless Networks

# Summary

This project develops and present a novel means of optimizing a Multi-UAV system where UAV-mounted mobile base stations are used to serve users on the ground.

<ul> 
<li> Mathematically encoded & designed a 10,000+ parameter non-linear and non-convex model of UAVs providing wireless services to ground users in MATLAB. Optimized the system via a synergy of convex and non-convex optimization approaches.
<li> Designed a K-means algorithm to cluster users, Gaussian Mixture Modeling to approximate traffic flow, genetic algorithm to initialize shortest flight paths, & sequential convex-optimization techniques to maximize data transfer. 
<li> Increased throughput (communication rates) by 33.57%, 87.4%, 53.2%, 600% for 1,2,3, & 17 UAV cases, respectively. 
</ul>

# Using this repository
_When optimizing, I perform block gradient descent, wherein each variable block is optimized while holding the others constant. Unless specified otherwise, Part 1/A refers to optimizing over user schedules, Part 2/B refers to optimizing over UAV Trajectories, and Part 3/C refers to optimizing Power Transmit Control. In case of questions or queries, feel free to contact the author._

**Helper Functions**
These are available in the folder entitled Utils. This contains functions for creating the simulation of UAVs and Users, enforces the specificied constraints, revelant equations for wireless communications, relevant equations for UAV movement, and more. 

**Notebooks** 
These are present in the folder entitled Notebooks. These contain the formulation for the optimization problems, the solvers used for solving them, constraint inputs, among other factors. These are used for actually performing the optimization.

# Preprint
Check out my paper entitled "Machine Learning Coupled Trajectory and Communication Design for UAV-Facilitated Wireless Networks" on https://arxiv.org/abs/2101.10454

# Paper Abstract
Augmenting wireless networks with Unmanned Aerial Vehicles (UAVs), commonly referred to as drones, offers a promising avenue for providing reliable, cost-effective, and on-demand wireless services to desired areas. However, existing UAV communication and trajectory schemes are inefficient as they assume limited drone mobility and static transmission power. Furthermore, they tend to rely upon convex approximations to highly non-linear functions and fail to adopt a combination of heuristic and convex methods. 

This paper considers a Multi-UAV system where UAV-mounted mobile base stations serve users on the ground. An iterative approach using block gradient descent is used to jointly optimize user scheduling, UAV trajectories, and transmission power for maximizing throughput over all users. Subsequently, an innovative technique for initial trajectory predictions was developed using a K-means clustering algorithm for partitioning users into subgroups and a genetic algorithm for initializing shortest flight paths within clusters. Finally, convex optimization solvers such as MATLAB's Fmincon are used for fine-tuning parameters. 

Extensive simulation and optimization results demonstrate a 33.57%, 87.4%, and 53.2% increase in system throughput for the 1, 2, and 3 UAV scenarios respectively when compared to existing trajectory and communication design schemes. Furthermore, the K-means and genetic algorithm reveal additional improvements in throughput by around 15%. Our results note diminished increases in throughput for increases in UAV trajectory period as the period approaches higher values. 

Further research into joint adoption of convex and non-convex schemes as well as consideration of environment-dependent channel models would allow for a faster and more optimal deployment of UAVs.

# Key Results

**1 UAV Case**

For the simplest case, 1 drone serving a set of users on the ground, the solution procedure is simpler and doesn't require power optimization. We note significant increases obtained through my presented algorithm when compared to traditional trajectory design schemes. 
<ul>
  <li> First we see that in the case of static deployment, and solutions found through circle-packing theory throughputs of 1.054 and 1.105 bps/Hz are attained respectively. 
  <li> In contrast, my algorithm is able to attain 1.380 bps/Hz and 1.476 bps/Hz depending on whether k-means clustering and the genetic algorithm. 
  <li> This corresponds to 40.25 and 33.57 % increases from the static and other benchmark schemes respectively.
</ul>

![Figure 7](https://user-images.githubusercontent.com/41270824/130841848-a290fd79-cdca-40a1-8205-91edb9478713.PNG)
-----------------------------------------------------------------------------------------------------------------
**2 UAV Case**
In the case of 2 UAVs serving users on the ground, one must effectively account for interference between drones and therefore the trajectory, user scheduling and power must be jointly optimized. 
<ul>
  <li> We note that we obtain 1.384 bps/hz and 1.084 bps/hz obtained through traditional static and circle packing schemes respectively. This however, raises the concern of static deployment outperforming the case of moving UAVs. This however, is explained through the problem formulation where the average signal rate is maximized rather than the minimum rate. Therefore, in the case of static deployment, where the UAV isn’t forced to initially move around, it may singularly serve one user at the expense of others. 
  <li> With our proposed algorithm, we obtain throughputs of 2.031 bps/Hz without power transmit control & 2.053 with Power transmit control. 
  <li> 44.7% and 87.4% increase in throughput from static and circular case
</ul> 
    
![Figure 9](https://user-images.githubusercontent.com/41270824/130841509-ece87beb-f423-4d5c-af0c-435766595bd2.PNG)
-----------------------------------------------------------------------------------------------------------------

**3 UAV Case**
Finally, a 3 UAV analysis shows the greatest values for system throughput. We note that the shorter flight paths allows for better transmission channels and a smaller dependence upon period. 
<ul>
  <li> We again note the effect of problem formulation upon the static case and optimize over a min-rate as well to present a fairer metric. Particularly, the benchmark schemes of static and circular planning attain throughputs of 2.247 and 1.712, respectively.
  <li> The difference between the min (1.105 bps/Hz) and mean rate (2.247) is further exacerbated.
  <li> Proposed algorithm outperforms both existing schemes with a 137% and 53.2% increase from the static and circular cases, respectively.
    
![Figure 10](https://user-images.githubusercontent.com/41270824/130841531-a838e661-e1ad-487b-9128-955c951e7c24.PNG)
  
    
</ul>
