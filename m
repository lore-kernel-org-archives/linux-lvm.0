Message-Id: <3C4AD059.4070800@sgi.com>
From: Stephen Lord <lord@sgi.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] LVM causing IO contention or slowdown?
References: <1011414567.2241.29.camel@UberGeek>
    <1011425563.3118.29.camel@UberGeek>
Content-Transfer-Encoding: 7bit
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
Date: Sun Jan 20 08:13:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

Austin Gonyou wrote:

>As a follow up to this I've done some more testing, and will test the
>rest of this weekend, using AIM db benchmark. 
>
>What I've found is that when mounting with logbufs=8 on my Quad Xeon 2MB
>cache 6450 with 8 Ultra-2 Drives, 4 RAID0 volumes, two of 3 disks each
>and two of 1 disk each. 
>
>The larger Volumes, the more "costly" volumes, when mounted using
>logbufs=8, outperformed the same volume addressed when not under LVM
>control. Not only did it out perform itself, but either WITH or WITHOUT
>LVM controlling the volume, I nearly doubled my throughput to those
>drives. 
>
>Here is what I'm talking about:
>
>#With LVM management
>Throughput 109.715 MB/sec (NB=137.144 MB/sec  1097.15 MBit/sec)  200
>procs
>
>#Without LVM management
>Throughput 100.803 MB/sec (NB=126.004 MB/sec  1008.03 MBit/sec)  200
>procs
>
>
>This only happened once though and I'm not sure exactly why. Still, the
>max I could get out of it for the same test more than once with LVM
>enabled was around 80-85 MB/s. Still a HUGE improvement over 43/44 MB/s.
>

Off topic for the lvm list, but....

The logbufs=8 parameter basically means you have 8 buffers capable of 
pushing
transactions out to disk. If you have lots of threads going at once in 
xfs then the
transactions tend to get throttled waiting for a buffer to do a log 
write into, so
adding more is good.

There is a perl script in the cmd/xfsmisc directory called xfs_stats.pl 
if you
run this it will format the output of the xfs /proc kernel statistics. 
You will
see a parameter called xs_log_noiclogs near the bottom of the first column.
This number means a transaction finished, but then had to wait for a log
buffer before it could hand off its data.

The downside of increasing the number of logbuffers is the amount of data
which can be lost after a crash (i.e. how many ops in the filesystem are
effectively undone by recovery). However,  looking at stats on my box,
each log write contains about 5 transactions, so you can never loose
much.

We have found adding more than 8 usually does not help, making them
bigger would be a different story, but that is actually a very non-trivial
change.

Steve
