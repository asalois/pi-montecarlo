from mpi4py import MPI  # import MPI
import numpy  # import python numeric framework

comm = MPI.COMM_WORLD  # MPI communication channel
rank = comm.Get_rank()  # MPI process number

if rank == 0:  # if this the first process
    data = {"a": 7, "b": 3.14}
    comm.send(data, dest=1)  # send data to second process
elif rank == 1:  # if this is the second process
    data = comm.recv(source=0)  # receive data from first process
    print("On process 1, data is ", data)
