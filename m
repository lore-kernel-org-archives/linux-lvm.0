Message-ID: <3DAD24A0.814E4028@silicide.dk>
From: Jon Bendtsen <jon+lvm@silicide.dk>
MIME-Version: 1.0
Subject: Re: [linux-lvm] performance comparison soft-hardware RAID + LVM: bad
References: <3DAC940D.7010903@netland.nl>
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
Date: Wed Oct 16 03:57:53 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Ron Arts wrote:
> 
> Hello,
> 
> I am interested in performance for hardware/software RAID
> in combination with LVM

i've resently tested hardware vs. software on 3 different
3ware cards, and some IDE disks. My results showed that
software raid was somewhat faster than hardware, but i'd
still prefer hardware because of the handling of one
failing disk. (notice that if you dont get a warning when 
a disk fails, you might as well run without raid, or run
raid0)
I've got a repport in .pdf (and .LyX) in english if someone
wants it.

 
> So I took a server (Dual Xeon 2.4GHz, 1Gb RAM), a RAID adapter,
> some identical SCSI disks and configured it with several of these
> options (using RH 8.0) and ran a few bonnie++ benchmarks.

Mine was a single p3 800, with 512MB memory, and i used tiobench

 
> Results are below. Anyone care to comment? Especially LVM performance
> disappointed here.

I cant clearly see what is LVM setup and what isnt. Remember that LVM 
doesnt allocate blocks sequeltial, but by default the first one free.
So, when you create 3 lv's, and then you mkfs them, then you allocate
at least the first block. Then when you fill the rest of the
filesystem...
you allocate the next blocks. Results are one block in the beginning,
a wide gap, and then the rest of the blocks.


> LVM machine setup:
> 
> 2 18Gb disks. I created 3 partitions on both disks, 128Mb, 512Mb and 17Gb
> Equal partitions were combined into RAID-1 devices (md driver).
> First md device mounted on /boot, second for swapfile, and third
> as basis for LVM
> 
> Out of the volume group four LV were created and mounted as follows:
> 
> [root@nbs-126 root]# df
> Filesystem           1K-blocks      Used Available Use% Mounted on
> /dev/vg0/root          4225092   1293064   2717400  33% /
> /dev/md0                124323     11517    106387  10% /boot
> /dev/vg0/home          4225092     32828   3977636   1% /home
> none                    514996         0    514996   0% /dev/shm
> /dev/vg0/var           4225092     51720   3958744   2% /var
> /dev/vg0/mysql        16513960     32828  15642272   1% /var/lib/mysql
> 
> Is there a reason for the performance degradation I saw with LVM?

I've done 3 (or 0.5 + 0.5 + 1) benchmarks. The first 2 times i didnt do
it well enough. I dont believe you have done it well enough, you clearly
dont have enough numbers. I found that using tiobench i had to variate
the number of threads (concurrent read/write) and the blocksize, before
i
got the best performance. And it variates alot. (See my .pdf, which i
will
mail to you). I've got lots of numbers. I used gnuplot to create graphs,
but consider using iometer to run your benchmarks, i think it creates
the
graphs for you.
You dont have enough disks, 2 disks might be a widely used common setup,
but
other people use more disks, like 4, 8, ... especialy when using scsi,
which
for some reason doesnt seem to contain as much as IDE disks.
I saw a BIG performance drop when i tried to run tiobench on a smp
system, 
but using another benchmark tool, i saw that it was only tiobench, not
the
performance that suffered.
I also saw a _GIGANTIC_ performance drop when i ran software raid0 ontop
of
2 software raid1. (or was it the other way ? (request my repport and see
for
yourself, the included one is regular performance)





JonB
