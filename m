Return-Path: <pwk.linuxfan@gmx.de>
From: Peter Kirk <pwk.linuxfan@gmx.de>
Subject: System goes very slow (was: Re: [linux-lvm] Test of LVM)
Date: Sun, 27 May 2001 04:56:24 +0200
References: <01052614354500.00527@notch> <20010526154903.A1477@dardhal.mired.net>
In-Reply-To: <20010526154903.A1477@dardhal.mired.net>
MIME-Version: 1.0
Message-Id: <01052704562400.02599@notch>
Content-Transfer-Encoding: 8bit
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

This is what bonnie gives me

Am Samstag, 26. Mai 2001 17:49 schrieben Sie:
> On Saturday, 26 May 2001, at 14:35:45 +0200,
>
> Peter Kirk wrote:
> > Hi,
> >
> > I have two disks in one Logical Volume, and all "Partitions" in the LV
> > are striped over the disks, the two disks are both:
>
> I suppose you mean "a VG consiting of the two disks, with LV created with
> --stripe=2, that is like a RAID-0 would do" :)
I have no idea of what I mean, in the setup with SuSE`s installer (yast) 
there was this place to set the stripe option, which I set to two.
>
> > Now I would like to know, how to test if my LVM is performing as it
> > should, [...]
>
> Depending on what you want to test, you can use several methods/tools
> ranging from dd'ing data in and out, recursive copying, hdparm, bonnie,
> bonnie++ and mongo. Check http://bulma.lug.net/static to see some
> filesystem-oriented test you could try.
I tried bonnie, is this result what I should have expected ?
root@notch:/home/pwk > bonnie -s 1024MB
Bonnie 1.2: File './Bonnie.2815', size: 1073741824, volumes: 1
Writing with putc()...         	done:   3270 kB/s  35.4 %CPU
Rewriting...                   	done:   1505 kB/s  19.3 %CPU
Writing intelligently...       	done:   4682 kB/s  11.4 %CPU
[I stopped bonnie here, do you need more output ?]

I don't know what this test does, but surely more than 3MB/sec of writing 
performance should be ??
I'm not certain if this problem I am about to describe is LVM specific, but I 
think that the most propable cause:

When I do e.g. a run of bonnie (-> My disks have work to do), the entire 
System goes *extremly* slow (each key hit takes about 1sec to apear on the 
terminal, from the command top to the coming up of the ascii chart there is a 
time gap of ~20sec...) 
As Andreas Dilger pointed out, I can't have to disks on one Controler doing 
things simultanously. Might this somehow be the reason why my systems snails 
on disk usage ?
There is something I tested in such times of slowness, and that is the output 
of top

top [normal running system + X + KDE]
  319 root      	17   0  196M 196M  2352 S   	0.7 39.2   6:33 X
 2586 pwk       	12   0 12856  12M 11092 S   	0.1  2.5   0:43 kdeinit
 2887 root      	16   0   980  980   764 R     	0.1  0.1   0:00 top
    1 root       	9   0   216  216   180 S     	0.0  0.0   0:07 init
    2 root       	9   0     0    0     0 SW    	0.0  0.0   0:00 keventd
    3 root       	9   0     0    0     0 SW    	0.0  0.0   0:35 kswapd
    4 root       	9   0     0    0     0 SW    	0.0  0.0   0:00 kreclaimd
    5 root       	9   0     0    0     0 SW    	0.0  0.0   0:14 bdflush
    6 root       	9   0     0    0     0 SW    	0.0  0.0   0:07 kupdated
top [system with bonnie running]
2815 root      17   0   544  544   440 R    	37.5  0.1   4:50 bonnie
  319 root      16   0  196M 196M  2352 R    	15.4 39.2   6:01 X
 2599 pwk       15   0 19344  18M 12580 S    	12.5  3.7   1:58 kmail
 2189 pwk       10   0 11540  11M  7048 S    	9.9  2.2   3:21 kmix
  865 pwk        9   0  3168 3168  2272 S     	1.7  0.6   0:53 artsd
  896 pwk        9   0 11436  11M 10220 S     	1.1  2.2   1:29 kdeinit
  893 pwk        9   0 14448  14M 12344 S     	0.9  2.8   1:03 kdeinit
 2885 pwk       12   0   980  980   764 R    	0.7  0.1   0:00 top
  891 pwk       10   0 14916  14M 12904 S   	0.1  2.9   0:40 kdeinit
 2586 pwk        9   0 12840  12M 11076 S   	0.1  2.5   0:42 kdeinit
    1 root       9   0   216  216   180 S    		0.0  0.0   0:07 init

As you see, all processes seam to take much more CPU time when bonnie is 
running [noting that I am not using any of the programms activly, there are 
only running].

I would realy love to get rid of this problem, so please help. If you think I 
should try one of my HD on the second controler, could you please give me 
some hints of how not to destroy my linux system by doing this (where do I 
have to change things)


>
> My (little) experience with stripped LVs is that throughput is quite lower
> that the achieved with kernel's software RAID-0: the latter achieved
> nearly the sum of the disks's R/W KB/s, while stripped LVs performance
> felt quite behind.
>
> But this was a _very_ simple test with a Pentium75 machine, with 16 MB RAM
> and two disks, 400 MB one and 800 MB the other (tested with bonnie). So
> results can be far from true under more realistic setups :).
>
Can anybody comment on the speed difference between softraid0 and LVM ?

Thank you in advance
