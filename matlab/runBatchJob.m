%% ParPools
clear; clc; close all;

c=parcluster;
c.AdditionalProperties.WallTime = '0-0:30:00';
c.AdditionalProperties.QueueName = 'legacy';
c.AdditionalProperties.AccountName = 'group-rci';
c.AdditionalProperties.MemUsage = '2gb';
c.AdditionalProperties.GpusPerNode = 0;
c.AdditionalProperties.IdentityFile = '\\wsl$\Debian\home\alex\.ssh\id_ed25519';
jin = {1024,1E8};
j1 = c.batch(@calculatePi,2,jin);
j4 = c.batch(@calculatePiPar,2,jin, 'Pool', 3);
j8 = c.batch(@calculatePiPar,2,jin, 'Pool', 7);
j16 = c.batch(@calculatePiPar,2,jin, 'Pool', 15);
j32 = c.batch(@calculatePiPar,2,jin, 'Pool', 31);
j64 = c.batch(@calculatePiPar,2,jin, 'Pool', 63);
j100 = c.batch(@calculatePiPar,2,jin, 'Pool', 99);
j200 = c.batch(@calculatePiPar,2,jin, 'Pool', 199);

%% GPUs
g=parcluster;
g.AdditionalProperties.WallTime = '0-0:30:00';
% g.AdditionalProperties.ProcsPerNode = 8;
g.AdditionalProperties.MemUsage='64gb';
g.AdditionalProperties.QueueName='gpuunsafe';
g.AdditionalProperties.AccountName='group-rci';   
g.AdditionalProperties.GpuCard = 'a40'
g.AdditionalProperties.GpusPerNode = 1;
ja40 = g.batch(@testGPU,2,{28});


g.AdditionalProperties.WallTime = '0-0:30:00';
% g.AdditionalProperties.ProcsPerNode = 8;
g.AdditionalProperties.MemUsage='64gb';
g.AdditionalProperties.QueueName='gpuunsafe';
g.AdditionalProperties.AccountName='group-rci';   
g.AdditionalProperties.GpuCard = 'a100'
g.AdditionalProperties.GpusPerNode = 1;
ja100 = g.batch(@testGPU,2,{28});
%% Multi tasks
c=parcluster;
c.AdditionalProperties.WallTime = '0-0:05:00';
c.AdditionalProperties.ProcsPerNode = 0;
c.AdditionalProperties.MemUsage='2gb';
c.AdditionalProperties.QueueName='legacy';
c.AdditionalProperties.AccountName='group-rci';                 
c.AdditionalProperties.GpusPerNode = 0;

job =createJob(c);
for i = 1:800
    createTask(job, @bench, 1, {});
end
submit(job)