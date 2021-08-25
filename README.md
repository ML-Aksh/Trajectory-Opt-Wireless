# Trajectory and Communication Design for UAV Facilitated Wireless Networks

# Preprint
Check out my paper entitled "Machine Learning Coupled Trajectory and Communication Design for UAV-Facilitated Wireless Networks" on https://arxiv.org/abs/2101.10454

# Paper Abstract
Augmenting wireless networks with Unmanned Aerial Vehicles (UAVs), commonly referred to as drones, offers a promising avenue for providing reliable, cost-effective, and on-demand wireless services to desired areas. However, existing UAV communication and trajectory schemes are inefficient as they assume limited drone mobility and static transmission power. Furthermore, they tend to rely upon convex approximations to highly non-linear functions and fail to adopt a combination of heuristic and convex methods. 

This paper considers a Multi-UAV system where UAV-mounted mobile base stations serve users on the ground. An iterative approach using block gradient descent is used to jointly optimize user scheduling, UAV trajectories, and transmission power for maximizing throughput over all users. Subsequently, an innovative technique for initial trajectory predictions was developed using a K-means clustering algorithm for partitioning users into subgroups and a genetic algorithm for initializing shortest flight paths within clusters. Finally, convex optimization solvers such as MATLAB's Fmincon are used for fine-tuning parameters. 

Extensive simulation and optimization results demonstrate a 33.57%, 87.4%, and 53.2% increase in system throughput for the 1, 2, and 3 UAV scenarios respectively when compared to existing trajectory and communication design schemes. Furthermore, the K-means and genetic algorithm reveal additional improvements in throughput by around 15%. Our results note diminished increases in throughput for increases in UAV trajectory period as the period approaches higher values. 

Further research into joint adoption of convex and non-convex schemes as well as consideration of environment-dependent channel models would allow for a faster and more optimal deployment of UAVs.

# Results
![image](https://user-images.githubusercontent.com/41270824/130836151-0f3c7fff-b407-4bc5-9b36-900d9411ebac.png)





# Figures



