---
layout: post
title: "Reddit DailyProgrammer Computing Pi"
date: 2013-11-26 14:50
comments: true
categories: reddit, AlwaysBeCoding
---

Another reddit programming exercise, [this one](http://www.reddit.com/r/dailyprogrammer/comments/1qply1/111513_challenge_129_hard_baking_pi/) being classified as 'hard' and indeed it _did_ take a while longer, being a distributed programming setup.

### Implementation Notes

* In a real world application, I would use something like Protocol Buffers for serialization
* ditto for something like Thrift for RPCs
* I had to add a sleep to each client so the first client doesn't run through
  the whole batch on its own (machines are too fast these days!)
* The run was limited to 250 digits, seemed to exhaust accuracy after about 254 digits with my implementation
* Every client connects and sends '-1' before getting its first digit. On
subsequent connections it sends its current digit and computed value, and
receives the next digit to compute.


### Server Code

{% gist 7667732 %}

### Client Code

{% gist 7667742 %}

### Compiling

```sh
$ clang++ -std=c++0x pi-compute-server.cpp  -lPocoNet -lPocoFoundation -o server
$ clang++ -std=c++0x pi-compute-client.cpp  -lPocoNet -lPocoFoundation -o client
```

### Running

```sh
$ ./server
Waiting for clients ...
Received -1th digit as 1000
Sent *0*
Received 0th digit as 2
Divergence from PI (to 10000 accuracy) so far = 165.927
Sent *1*
Received -1th digit as 1000
Sent *2*
Received 1th digit as 4
Divergence from PI (to 10000 accuracy) so far = 9.67654
Sent *3*
Received 2th digit as 3
Divergence from PI (to 10000 accuracy) so far = 2.35232
Sent *4*
Received -1th digit as 1000
Sent *5*
Received 3th digit as 15
Divergence from PI (to 10000 accuracy) so far = 0.0634988
Sent *6*
Received 4th digit as 6
Divergence from PI (to 10000 accuracy) so far = 0.00627833
Sent *7*
...
Sent *249*
Received 246th digit as 1
Divergence from PI (to 10000 accuracy) so far = 0.00597909
Sent *250*
Received 247th digit as 0
Divergence from PI (to 10000 accuracy) so far = 0.00597909
Sent *251*
Received 248th digit as 11
Divergence from PI (to 10000 accuracy) so far = 0.00597909
Sent *252*
Received 249th digit as 3
Divergence from PI (to 10000 accuracy) so far = 0.00597909
Sent *253*
^C


$ ./client localhost 9090
Connecting to localhost:9090
Digit: 0...Value: 2
Digit: 1...Value: 4
Digit: 3...Value: f
Digit: 6...Value: 8
Digit: 9...Value: 5
Digit: 13...Value: 8
Digit: 17...Value: 0
Digit: 21...Value: 7
...
```


