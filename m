From: Herbert Poetzl <herbert@13thfloor.at>
Message-ID: <20030513133707.GA31126@www.13thfloor.at>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] LVM on Raid 5 Performance?
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
Date: Tue May 13 08:36:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hi All!

I'm using LVM for a long time, usually on non RAID
systems to simplify storage space modifications ...

recently I configured a nice system (Dual Athlon,
with 4 18.2G U160 SCSI IBM (DDYS-T18350N) disks
on an Adaptec 29160N Ultra160. Because I had some
troubles with the Adaptec/SCSI cabeling I reduced
the bus speed to 40Mhz, which gives 80MB/s transfer
(theoretically) via SCSI, each disc seems to do
about 15MB/s (which seems a little low). I decided
to arrange the 4 discs in a RAID 5 array to gain
some speedup and redundancy (which resulted in
about 33MB/s burst, 25% below the, again theoretical 
limit of 45MB/s). Ontop of the RAID 5 array I 
configured LVM 1.0.7 to create several partitions
for further use ...

Now what happened was, that the performance (read)
dropped to about 18MB/s burst, which wasn't what
I expected at all ...

Has anybody any explanations why the LVM layer eats
up about 45% of the available throughput?
(in this configuration?)

    	    	raw disc    md(raid5)	lvm on md
-----------------------------------------------------
hdparm	    	14694.40    34129.92	18667.52
dd 1024k    	14988.22    34732.56	18647.98
dd 32k	    	15516.06    33945.48	18862.67

best,
Herbert

--- Technical Information ---

2.4.21-rc2 kernel (with 1.0.7 LVM patch, among others)

May 11 05:26:52 phoenix kernel: SCSI subsystem driver Revision: 1.00
May 11 05:26:52 phoenix kernel: scsi0 : Adaptec AIC7XXX EISA/VLB/PCI SCSI HBA DRIVER, Rev 6.2.33
May 11 05:26:52 phoenix kernel:         <Adaptec 29160N Ultra160 SCSI adapter>
May 11 05:26:52 phoenix kernel:         aic7892: Ultra160 Wide Channel A, SCSI Id=7, 32/253 SCBs
May 11 05:26:52 phoenix kernel: 
May 11 05:26:52 phoenix kernel: blk: queue c3667e18, I/O limit 4095Mb (mask 0xffffffff)
May 11 05:26:52 phoenix kernel: (scsi0:A:0): 80.000MB/s transfers (40.000MHz, offset 63, 16bit)
May 11 05:26:52 phoenix kernel: (scsi0:A:1): 80.000MB/s transfers (40.000MHz, offset 63, 16bit)
May 11 05:26:52 phoenix kernel: (scsi0:A:2): 80.000MB/s transfers (40.000MHz, offset 63, 16bit)
May 11 05:26:52 phoenix kernel: (scsi0:A:3): 80.000MB/s transfers (40.000MHz, offset 63, 16bit)

raiddev /dev/md/0

        raid-level      5
        nr-raid-disks   4
        nr-spare-disks  0
	chunk-size	32
	parity-algorithm left-symmetric
        persistent-superblock 1

        device          /dev/hd0/part5
        raid-disk       0
        device          /dev/hd1/part5
        raid-disk       1
        device          /dev/hd2/part5
        raid-disk       2
        device          /dev/hd3/part5
        raid-disk       3


pvcreate /dev/md/0 
vgcreate -A y vgs /dev/md/0
lvcreate -C y -L 3G -n usr -Z y vgs

--- Tests ---

# hdparm -tT /dev/hd0/disc 

/dev/hd0/disc:
 Timing buffer-cache reads:   128 MB in  0.50 seconds =256.00 MB/sec
 Timing buffered disk reads:  64 MB in  4.46 seconds = 14.35 MB/sec

# time dd if=/dev/hd0/disc of=/dev/null bs=1024k count=1024
1024+0 records in
1024+0 records out
0.00user 16.98system 1:09.96elapsed 24%CPU (0avgtext+0avgdata 0maxresident)k
0inputs+0outputs (111major+274minor)pagefaults 0swaps

# time dd if=/dev/hd0/disc of=/dev/null bs=32k count=32768
32768+0 records in
32768+0 records out
0.02user 14.66system 1:07.58elapsed 21%CPU (0avgtext+0avgdata 0maxresident)k
0inputs+0outputs (110major+26minor)pagefaults 0swaps

------------

# hdparm -tT /dev/md/0

/dev/md/0:
 Timing buffer-cache reads:   128 MB in  0.49 seconds =261.22 MB/sec
 Timing buffered disk reads:  64 MB in  1.92 seconds = 33.33 MB/sec

# time dd if=/dev/md/0 of=/dev/null bs=1024k count=1024
1024+0 records in
1024+0 records out
0.00user 12.09system 0:30.19elapsed 40%CPU (0avgtext+0avgdata 0maxresident)k
0inputs+0outputs (111major+274minor)pagefaults 0swaps

# time dd if=/dev/md/0 of=/dev/null bs=32k count=32768
32768+0 records in
32768+0 records out
0.00user 10.52system 0:30.89elapsed 34%CPU (0avgtext+0avgdata 0maxresident)k
0inputs+0outputs (110major+26minor)pagefaults 0swaps

-------------

# hdparm -tT /dev/vgs/usr 

/dev/vgs/usr:
 Timing buffer-cache reads:   128 MB in  0.50 seconds =256.00 MB/sec
 Timing buffered disk reads:  64 MB in  3.51 seconds = 18.23 MB/sec

# time dd if=/dev/vgs/usr of=/dev/null bs=1024k count=1024
1024+0 records in
1024+0 records out
0.01user 18.66system 0:56.23elapsed 33%CPU (0avgtext+0avgdata 0maxresident)k
0inputs+0outputs (111major+274minor)pagefaults 0swaps

# time dd if=/dev/vgs/usr of=/dev/null bs=32k count=32768
32768+0 records in
32768+0 records out
0.07user 13.43system 0:55.59elapsed 24%CPU (0avgtext+0avgdata 0maxresident)k
0inputs+0outputs (110major+26minor)pagefaults 0swaps
