Return-Path: <urs@isnogud.escape.de>
Subject: Re: [linux-lvm] LVM and *bad* performance (no striping)
References: <m2snl1phy5.fsf@isnogud.escape.de> <20010226203933.B2504@66bassett.freeserve.co.uk> <m27l2c2u6d.fsf@isnogud.escape.de> <20010228110554.T4361@srv.sistina.com>
From: Urs Thuermann <urs@isnogud.escape.de>
Date: 10 Apr 2001 21:30:09 +0200
In-Reply-To: <20010228110554.T4361@srv.sistina.com>; from "Heinz J. Mauelshagen" on Wed, 28 Feb 2001 11:05:54 +0000
Message-ID: <m2n19owo1q.fsf@isnogud.escape.de>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Today, I've found some time to make some further performance tests on
my system.

"Heinz J. Mauelshagen" <Mauelshagen@sistina.com> writes:

> Hi Urs,
> 
> I can't reproduce at all what you are seeing with your configuration.
> 
> 
> My test configuration is:
> 
>  - Dual Pentium II/350
>  - 256MB RAM
>  - Adaptec 2940UW
>  - HDD Vendor: QUANTUM  Model: XP34550W Rev: LXY4 (/dev/sdb)
>  - first 300M of the LV involved allocated contiguous at the beginning
>    of /dev/sdb1
>  - LVM 0.9.1 Beta 5
>  - Linux 2.4.2
>  - dd (GNU fileutils) 4.0

I find surprinsing that we get so different performance results since
my hardware is very similar to yours.  Here is it, again:

Mainboard: ASUS P2L97-S with UW-SCSI controller onboard
RAM: 128 MB
CPU: from /proc/cpuinfo:
    model name      : Pentium II (Deschutes)
    stepping        : 1
    cpu MHz         : 334.095
/dev/sda: from /proc/scsi/scsi:
    Host: scsi0 Channel: 00 Id: 00 Lun: 00
      Vendor: IBM      Model: DCAS-34330W      Rev: S65A
      Type:   Direct-Access                    ANSI SCSI revision: 02
SCSI controller: from /proc/scsi/aic7xxx/0:
    Adaptec AIC7xxx driver version: 6.1.5
    aic7880: Wide Channel A, SCSI Id=7, 16/255 SCBs
    Channel A Target 0 Negotiation Settings
    	    User: 40.000MB/s transfers (20.000MHz, offset 255, 16bit)
    	    Goal: 40.000MB/s transfers (20.000MHz, offset 8, 16bit)
    	    Curr: 40.000MB/s transfers (20.000MHz, offset 8, 16bit)
    	    Channel A Target 0 Lun 0 Settings
    		    Commands Queued 13557298
    		    Commands Active 0
    		    Command Openings 64
    		    Max Tagged Openings 64
    		    Device Queue Frozen Count 0
kernel: Linux-2.4.3

The size of /dev/sda5 is

    # fdisk -l /dev/sda | egrep '^[^/]|sda5'
    Disk /dev/sda: 255 heads, 63 sectors, 527 cylinders
    Units = cylinders of 16065 * 512 bytes
       Device Boot    Start       End    Blocks   Id  System
    /dev/sda5            80       399   2570368+  8e  Linux LVM
    
i.e. 627 PEs of 4MB each.  After 

    pvcreate /dev/sda5; vgcreate vg0 /dev/sda5; lvcreate -n test vg0 -l 627

I have
    # vgdisplay -v
    --- Volume group ---
    VG Name               vg0
    VG Access             read/write
    VG Status             available/resizable
    VG #                  0
    MAX LV                256
    Cur LV                1
    Open LV               0
    MAX LV Size           255.99 GB
    Max PV                256
    Cur PV                1
    Act PV                1
    VG Size               2.45 GB
    PE Size               4 MB
    Total PE              627
    Alloc PE / Size       627 / 2.45 GB
    Free  PE / Size       0 / 0
    VG UUID               zmdKrC-eis5-rgWV-C5rz-TcJE-8tTI-iUUeBj
    
    --- Logical volume ---
    LV Name                /dev/vg0/test
    VG Name                vg0
    LV Write Access        read/write
    LV Status              available
    LV #                   1
    # open                 0
    LV Size                2.45 GB
    Current LE             627
    Allocated LE           627
    Allocation             next free
    Read ahead sectors     120
    Block device           58:0
    
    
    --- Physical volumes ---
    PV Name (#)           /dev/sda5 (1)
    PV Status             available / allocatable
    Total PE / Free PE    627 / 0

and lvdisplay -v /dev/vg0/test shows a mapping of     

   --- Logical extents ---
   LE    PV                        PE     reads      writes
   00000 /dev/sda5                 00000  278528     2        
   00001 /dev/sda5                 00001  266240     0        
   00002 /dev/sda5                 00002  266240     0        
   00003 /dev/sda5                 00003  266240     0        
   ...
   00625 /dev/sda5                 00625  266240     0        
   00626 /dev/sda5                 00626  266240     0       


> This table records test runs which where run one after the other
> *without* any additional load on the machine using dd to copy 300m
> into /dev/null. Each run performed twice with little difference +
> build average.
> 
> 		1k	2k	4k	8k	16k
> -----------------------------------------------------------
> sdb1		32.63	32.8	32,7	32.55	32.9
> vg00/u1		32.58	33.1	32.63	32.4	32.4


For me, numbers look quite different.  I have then run the following
test, which reads all the 627 PEs (2.45 GB) from /dev/vg0/test and the
same amount from /dev/sda5 at different block sizes.  The system was
otherwise almost idle when I ran this test.

    #!/bin/sh
    
    function doit() {
    
    	time dd if=/dev/sda5 of=/dev/null count=$1 bs=$2
    	time dd if=/dev/sda5 of=/dev/null count=$1 bs=$2
    	time dd if=/dev/sda5 of=/dev/null count=$1 bs=$2
    	time dd if=/dev/sda5 of=/dev/null count=$1 bs=$2
    
    	time dd if=/dev/vg0/test of=/dev/null count=$1 bs=$2
    	time dd if=/dev/vg0/test of=/dev/null count=$1 bs=$2
    	time dd if=/dev/vg0/test of=/dev/null count=$1 bs=$2
    	time dd if=/dev/vg0/test of=/dev/null count=$1 bs=$2
    }
    
    set -x
    
    doit   40128 64k
    doit   80256 32k
    doit  160512 16k
    doit  321024  8k
    doit  642048  4k
    doit 1284096  2k
    doit 2568192  1k
    doit 5136384 512
    
The elapsed times of the 4 runs of each test are averaged, where for
each test the variations among the 4 times were less than 1% of the
average time (times in seconds):

		  64k	  32k	  16k	  8k	  4k	  2k	  1k	  512
------------------------------------------------------------------------------
/dev/sda5	 389.4	 389.4	 388.9	 388.7	 388.5	 388.6	 389.1	 388.9
/dev/vg0/test	 389.3	 389.6	 390.9	 393.1	 607.5	1147.2	2194.9	2195.8




> Therefore I guess that the allocation policy of LVM might have an
> impact here.
> 
> LVM calculates the offset of the first PE from the end of the PV.
> There could be drives used which suffer from that placement with
> regard to drive internal caching, latency or other model specific
> issues.

I think you mean that when I read a number of blocks from /dev/sda5 I
read them from the beginning of /dev/sda5 while when reading the same
number of blocks from /dev/vg0/test I read from the end of the PV
/dev/sda5 since the PE are allocated from the end, right.

But in my test, I read the whole /dev/sda5 and the whole LV which
has allocated all PEs of /dev/sda5 to it.  So about the same sectors
are read, just the order is different.  Do you think that can reduce
the performance from 2.45GB/390s = 6.43MB/s to 2.45GB/2195s = 1.14MB/s?
I find this very unlikely.

Is there any other explanation for this performance degradation?


urs
