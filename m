Return-Path: <root@srv.sistina.com>
Date: Wed, 28 Feb 2001 11:05:54 +0000
From: "Heinz J. Mauelshagen" <Mauelshagen@sistina.com>
Subject: Re: [linux-lvm] LVM and *bad* performance (no striping)
Message-ID: <20010228110554.T4361@srv.sistina.com>
References: <m2snl1phy5.fsf@isnogud.escape.de> <20010226203933.B2504@66bassett.freeserve.co.uk> <m27l2c2u6d.fsf@isnogud.escape.de>
Mime-Version: 1.0
In-Reply-To: <m27l2c2u6d.fsf@isnogud.escape.de>; from urs@isnogud.escape.de on Tue, Feb 27, 2001 at 01:21:14PM +0100
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
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hi Urs,

I can't reproduce at all what you are seeing with your configuration.


My test configuration is:

 - Dual Pentium II/350
 - 256MB RAM
 - Adaptec 2940UW
 - HDD Vendor: QUANTUM  Model: XP34550W Rev: LXY4 (/dev/sdb)
 - first 300M of the LV involved allocated contiguous at the beginning
   of /dev/sdb1
 - LVM 0.9.1 Beta 5
 - Linux 2.4.2
 - dd (GNU fileutils) 4.0


This table records test runs which where run one after the other
*without* any additional load on the machine using dd to copy 300m
into /dev/null. Each run performed twice with little difference + build average.

		1k	2k	4k	8k	16k
-----------------------------------------------------------
sdb1		32.63	32.8	32,7	32.55	32.9
vg00/u1		32.58	33.1	32.63	32.4	32.4


This gives *no* hint to me that there's any basical overhead invloved
with LVM as oposed to the native device beeing used at all.


Therefore I guess that the allocation policy of LVM might have an impact here.

LVM calculates the offset of the first PE from the end of the PV.
There could be drives used which suffer from that placement with
regard to drive internal caching, latency or other model specific issues.


Could everybody who posts with regard to this performance subject please provide

   - "lvdisplay -v" of the test LV
   - the drive vendor and model
   - the host adaptor used to access it
   - the motherboard and CPU(s)
   - the RAM size

in order to get a better understanding.


BTW: Rik van Riel's assumption in another mail of this thread, that LVM
     does some sort of read ahead is correct (as you can see with the
     above numbers).
     Even though we still only have a per block major read ahead in the kernel
     *and* multithreading will make the actual read ahead implementation fail
     with regard parallel access LVs (as Andrea Arcangeli pointed out a while
     ago), it hits quite good on not too heavy loaded systems.
     Taking into account that a lot of users most likely don't change the
     read ahead default of LVs, it won't have an impact at all.


Regards,
Heinz    -- The LVM Guy --



On Tue, Feb 27, 2001 at 01:21:14PM +0100, Urs Thuermann wrote:
> Joe Thornber <joe@66bassett.freeserve.co.uk> writes:
> 
> > Every now and then someone posts to the list claiming LVM performance
> > is really bad.  We go off and try it and find the overhead is
> > typically less than 1%.
> > 
> > Normally people are trying to stripe to two partitions on the same
> > device, but you aren't.
> > 
> > Is any one else on the list seeing a similar performance hit ?
> 
> I did some more tests to ensure that this is not a caching issue.
> Also, I found the performance of dd on LVM depends much on the block
> size.
> 
> I still have the effect that reading from LVM with small block size
> (smaller than 8k on my system) is *much* slower than reading the
> physical disk directly.  IMHO it'd be worth looking into it and
> possibly fixing this performance hit.  Could it be possible, that the
> read syscall on the LVM block device has so much overhead that reading
> small blocks can't cope with SCSI disk's transfer rate, so that
> additional disk revolutions are needed to read all the physical
> blocks?  I find it noticable that when doubling the block size from
> 1k to 8k the time for reading quite exactly halves until it reaches
> the performance of reading /dev/sda5 directly.
> 
> In case it matters, the machine I did the test on is a
> 	ASUS P2L97-S mainboard
> 	PII 333MHz
> 	128 MB RAM
> 	Adaptec AIC-7880U onboard UW-SCSI controller
> 	/dev/sda is a IBM DCAS-34330W
> 	kernel: Linux 2.4.2
> 
> I've put the commands into a script that uses "set -x" to show what is
> exec'ed.  Here's the result:
> 
> Initialisation:
> 
>     + pvcreate /dev/sda5
>     pvcreate -- physical volume "/dev/sda5" successfully created
>     
>     + vgcreate vg0 /dev/sda5
>     vgcreate -- INFO: using default physical extent size 4 MB
>     vgcreate -- INFO: maximum logical volume size is 255.99 Gigabyte
>     vgcreate -- doing automatic backup of volume group "vg0"
>     vgcreate -- volume group "vg0" successfully created and activated
>     
>     + lvcreate -n test /dev/vg0 -L 500M
>     lvcreate -- doing automatic backup of "vg0"
>     lvcreate -- logical volume "/dev/vg0/test" successfully created
>     
>     
> The first test shows, that, with small block sizes, LVM over sda5 is
> much slower than reading sda5 directly.  I do the reading three times
> to see if any caching affects the numbers.  This is obviously not the
> case:
> 
>     + dd if=/dev/sda5 of=/dev/null count=128k bs=512
>     131072+0 records in
>     131072+0 records out
>     
>     real    0m8.862s
>     user    0m0.120s
>     sys     0m1.690s
>     + dd if=/dev/sda5 of=/dev/null count=128k bs=512
>     131072+0 records in
>     131072+0 records out
>     
>     real    0m8.860s
>     user    0m0.200s
>     sys     0m1.670s
>     + dd if=/dev/sda5 of=/dev/null count=128k bs=512
>     131072+0 records in
>     131072+0 records out
>     
>     real    0m8.860s
>     user    0m0.110s
>     sys     0m1.800s
>     + dd if=/dev/vg0/test of=/dev/null count=128k bs=512
>     131072+0 records in
>     131072+0 records out
>     
>     real    0m54.860s
>     user    0m0.150s
>     sys     0m2.780s
>     + dd if=/dev/vg0/test of=/dev/null count=128k bs=512
>     131072+0 records in
>     131072+0 records out
>     
>     real    0m54.810s
>     user    0m0.170s
>     sys     0m2.660s
>     + dd if=/dev/vg0/test of=/dev/null count=128k bs=512
>     131072+0 records in
>     131072+0 records out
>     
>     real    0m54.936s
>     user    0m0.200s
>     sys     0m3.010s
>     
> 
> The next test shows that the performance of LVM is very dependend on
> the blocksize but that of sda5 is not, which I find surprising since
> the same physical device is involved.
> 
>     + dd if=/dev/sda5 of=/dev/null count=512 bs=128k
>     512+0 records in
>     512+0 records out
>     
>     real    0m8.857s
>     user    0m0.010s
>     sys     0m1.440s
>     + dd if=/dev/vg0/test of=/dev/null count=128k bs=512
>     131072+0 records in
>     131072+0 records out
>     
>     real    0m55.120s
>     user    0m0.190s
>     sys     0m2.760s
>     + dd if=/dev/vg0/test of=/dev/null count=64k bs=1k
>     65536+0 records in
>     65536+0 records out
>     
>     real    0m55.195s
>     user    0m0.170s
>     sys     0m2.970s
>     + dd if=/dev/vg0/test of=/dev/null count=32k bs=2k
>     32768+0 records in
>     32768+0 records out
>     
>     real    0m28.470s
>     user    0m0.090s
>     sys     0m1.830s
>     + dd if=/dev/vg0/test of=/dev/null count=16k bs=4k
>     16384+0 records in
>     16384+0 records out
>     
>     real    0m15.209s
>     user    0m0.010s
>     sys     0m1.860s
>     + dd if=/dev/vg0/test of=/dev/null count=8k bs=8k
>     8192+0 records in
>     8192+0 records out
>     
>     real    0m8.859s
>     user    0m0.010s
>     sys     0m1.670s
>     + dd if=/dev/vg0/test of=/dev/null count=4k bs=16k
>     4096+0 records in
>     4096+0 records out
>     
>     real    0m8.860s
>     user    0m0.010s
>     sys     0m1.570s
>     + dd if=/dev/vg0/test of=/dev/null count=2k bs=32k
>     2048+0 records in
>     2048+0 records out
>     
>     real    0m8.873s
>     user    0m0.010s
>     sys     0m1.390s
>     + dd if=/dev/vg0/test of=/dev/null count=1k bs=64k
>     1024+0 records in
>     1024+0 records out
>     
>     real    0m8.883s
>     user    0m0.000s
>     sys     0m1.380s
>     + dd if=/dev/vg0/test of=/dev/null count=512 bs=128k
>     512+0 records in
>     512+0 records out
>     
>     real    0m8.862s
>     user    0m0.000s
>     sys     0m1.370s
>     	    
> 
> Performance on filessystems on LVM is better, since the buffer cache
> can be used.  I thought that the buffer cache works on block devices.
> But this seems to suggest that it only works with files systems
> mounted on the block device.  Is this really so and why?
> 
>     + mke2fs -q /dev/vg0/test
>     mke2fs 1.19, 13-Jul-2000 for EXT2 FS 0.5b, 95/08/09
>     + mount /dev/vg0/test /mnt
>     + dd if=/dev/vg0/test of=/dev/null count=512 bs=128k
>     512+0 records in
>     512+0 records out
>     
>     real    0m8.792s
>     user    0m0.000s
>     sys     0m1.280s
>     + dd if=/dev/vg0/test of=/dev/null count=512 bs=128k
>     512+0 records in
>     512+0 records out
>     
>     real    0m1.044s
>     user    0m0.000s
>     sys     0m1.050s
>     
> 
> For tests like this it would be useful to be able to completely flush
> the kernel's cache.  Is there a tool to do this?
> 
> 
> urs
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm


*** Software bugs are stupid.
    Nevertheless it needs not so stupid people to solve them ***

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                 Sistina Software Inc.
Senior Consultant/Developer                       Am Sonnenhang 11
                                                  56242 Marienrachdorf
                                                  Germany
Mauelshagen@Sistina.com                           +49 2626 141200
                                                       FAX 924446
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
