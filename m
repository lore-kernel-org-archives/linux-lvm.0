Return-Path: <urs@isnogud.escape.de>
Subject: Re: [linux-lvm] LVM and *bad* performance (no striping)
References: <m2snl1phy5.fsf@isnogud.escape.de> <20010226203933.B2504@66bassett.freeserve.co.uk>
From: Urs Thuermann <urs@isnogud.escape.de>
Date: 27 Feb 2001 13:21:14 +0100
In-Reply-To: <20010226203933.B2504@66bassett.freeserve.co.uk>; from Joe Thornber on Mon, 26 Feb 2001 20:39:33 +0000
Message-ID: <m27l2c2u6d.fsf@isnogud.escape.de>
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

Joe Thornber <joe@66bassett.freeserve.co.uk> writes:

> Every now and then someone posts to the list claiming LVM performance
> is really bad.  We go off and try it and find the overhead is
> typically less than 1%.
> 
> Normally people are trying to stripe to two partitions on the same
> device, but you aren't.
> 
> Is any one else on the list seeing a similar performance hit ?

I did some more tests to ensure that this is not a caching issue.
Also, I found the performance of dd on LVM depends much on the block
size.

I still have the effect that reading from LVM with small block size
(smaller than 8k on my system) is *much* slower than reading the
physical disk directly.  IMHO it'd be worth looking into it and
possibly fixing this performance hit.  Could it be possible, that the
read syscall on the LVM block device has so much overhead that reading
small blocks can't cope with SCSI disk's transfer rate, so that
additional disk revolutions are needed to read all the physical
blocks?  I find it noticable that when doubling the block size from
1k to 8k the time for reading quite exactly halves until it reaches
the performance of reading /dev/sda5 directly.

In case it matters, the machine I did the test on is a
	ASUS P2L97-S mainboard
	PII 333MHz
	128 MB RAM
	Adaptec AIC-7880U onboard UW-SCSI controller
	/dev/sda is a IBM DCAS-34330W
	kernel: Linux 2.4.2

I've put the commands into a script that uses "set -x" to show what is
exec'ed.  Here's the result:

Initialisation:

    + pvcreate /dev/sda5
    pvcreate -- physical volume "/dev/sda5" successfully created
    
    + vgcreate vg0 /dev/sda5
    vgcreate -- INFO: using default physical extent size 4 MB
    vgcreate -- INFO: maximum logical volume size is 255.99 Gigabyte
    vgcreate -- doing automatic backup of volume group "vg0"
    vgcreate -- volume group "vg0" successfully created and activated
    
    + lvcreate -n test /dev/vg0 -L 500M
    lvcreate -- doing automatic backup of "vg0"
    lvcreate -- logical volume "/dev/vg0/test" successfully created
    
    
The first test shows, that, with small block sizes, LVM over sda5 is
much slower than reading sda5 directly.  I do the reading three times
to see if any caching affects the numbers.  This is obviously not the
case:

    + dd if=/dev/sda5 of=/dev/null count=128k bs=512
    131072+0 records in
    131072+0 records out
    
    real    0m8.862s
    user    0m0.120s
    sys     0m1.690s
    + dd if=/dev/sda5 of=/dev/null count=128k bs=512
    131072+0 records in
    131072+0 records out
    
    real    0m8.860s
    user    0m0.200s
    sys     0m1.670s
    + dd if=/dev/sda5 of=/dev/null count=128k bs=512
    131072+0 records in
    131072+0 records out
    
    real    0m8.860s
    user    0m0.110s
    sys     0m1.800s
    + dd if=/dev/vg0/test of=/dev/null count=128k bs=512
    131072+0 records in
    131072+0 records out
    
    real    0m54.860s
    user    0m0.150s
    sys     0m2.780s
    + dd if=/dev/vg0/test of=/dev/null count=128k bs=512
    131072+0 records in
    131072+0 records out
    
    real    0m54.810s
    user    0m0.170s
    sys     0m2.660s
    + dd if=/dev/vg0/test of=/dev/null count=128k bs=512
    131072+0 records in
    131072+0 records out
    
    real    0m54.936s
    user    0m0.200s
    sys     0m3.010s
    

The next test shows that the performance of LVM is very dependend on
the blocksize but that of sda5 is not, which I find surprising since
the same physical device is involved.

    + dd if=/dev/sda5 of=/dev/null count=512 bs=128k
    512+0 records in
    512+0 records out
    
    real    0m8.857s
    user    0m0.010s
    sys     0m1.440s
    + dd if=/dev/vg0/test of=/dev/null count=128k bs=512
    131072+0 records in
    131072+0 records out
    
    real    0m55.120s
    user    0m0.190s
    sys     0m2.760s
    + dd if=/dev/vg0/test of=/dev/null count=64k bs=1k
    65536+0 records in
    65536+0 records out
    
    real    0m55.195s
    user    0m0.170s
    sys     0m2.970s
    + dd if=/dev/vg0/test of=/dev/null count=32k bs=2k
    32768+0 records in
    32768+0 records out
    
    real    0m28.470s
    user    0m0.090s
    sys     0m1.830s
    + dd if=/dev/vg0/test of=/dev/null count=16k bs=4k
    16384+0 records in
    16384+0 records out
    
    real    0m15.209s
    user    0m0.010s
    sys     0m1.860s
    + dd if=/dev/vg0/test of=/dev/null count=8k bs=8k
    8192+0 records in
    8192+0 records out
    
    real    0m8.859s
    user    0m0.010s
    sys     0m1.670s
    + dd if=/dev/vg0/test of=/dev/null count=4k bs=16k
    4096+0 records in
    4096+0 records out
    
    real    0m8.860s
    user    0m0.010s
    sys     0m1.570s
    + dd if=/dev/vg0/test of=/dev/null count=2k bs=32k
    2048+0 records in
    2048+0 records out
    
    real    0m8.873s
    user    0m0.010s
    sys     0m1.390s
    + dd if=/dev/vg0/test of=/dev/null count=1k bs=64k
    1024+0 records in
    1024+0 records out
    
    real    0m8.883s
    user    0m0.000s
    sys     0m1.380s
    + dd if=/dev/vg0/test of=/dev/null count=512 bs=128k
    512+0 records in
    512+0 records out
    
    real    0m8.862s
    user    0m0.000s
    sys     0m1.370s
    	    

Performance on filessystems on LVM is better, since the buffer cache
can be used.  I thought that the buffer cache works on block devices.
But this seems to suggest that it only works with files systems
mounted on the block device.  Is this really so and why?

    + mke2fs -q /dev/vg0/test
    mke2fs 1.19, 13-Jul-2000 for EXT2 FS 0.5b, 95/08/09
    + mount /dev/vg0/test /mnt
    + dd if=/dev/vg0/test of=/dev/null count=512 bs=128k
    512+0 records in
    512+0 records out
    
    real    0m8.792s
    user    0m0.000s
    sys     0m1.280s
    + dd if=/dev/vg0/test of=/dev/null count=512 bs=128k
    512+0 records in
    512+0 records out
    
    real    0m1.044s
    user    0m0.000s
    sys     0m1.050s
    

For tests like this it would be useful to be able to completely flush
the kernel's cache.  Is there a tool to do this?


urs
