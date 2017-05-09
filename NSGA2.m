clc;
clear;
close all;

%CostFunction=@(x) parabolas(x);      % Cost Function

nVar = 1;           %Number of Decision Variables
varSize=[1 nVar];   % Size of Decision Variables Matrix

%interval
varMin = -15;
varMax = 17;

MaxIt=1000;         % Maximum Number of Iterations

nPop=20;            % Population Size

pCrossover=1.0; %100%                   % Crossover Percentage
nCrossover=2*round(pCrossover*nPop/2);  % Number of Parnets (Offsprings)

pMutation=0.1; %10%                     % Mutation Percentage
nMutation=round(pMutation*nPop);        % Number of Mutants

%mu=0.02;                                % Mutation Rate

%sigma=0.1*(varMax-varMin);  % Mutation Step Size

%Definition individual
individual.x=[];
individual.cost=[];
individual.rank=[];
individual.dominationSet=[];
individual.dominatedCount=[];
individual.crowdingDistance=[];

%Create population cleaning
pop=repmat(individual,nPop,1);

%Generate initial population
for i=1:nPop
    
    pop(i).x=unifrnd(varMin,varMax,varSize);
    
    pop(i).cost= cost_function(pop(i).x);
end

%Crossover
pop_c = generate_population_children (pop, nPop, nCrossover, individual);

%mutation
%pop_c = mutation_children (pop_c);

%merge
pop = [pop; pop_c];

%fast_non_dominated_sort
[pop, F]=fast_non_dominated_sort(pop);




