Return-Path: <jdomingo@crosswinds.net>
Date: Mon, 20 Aug 2001 19:10:00 +0000
From: =?iso-8859-1?Q?Jos=E9_Luis_Domingo_L=F3pez?= <jdomingo@internautas.org>
Message-ID: <20010820190959.A827@dardhal.mired.net>
Mime-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] LVM 1.0 performance
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
Content-Type: text/plain; charset="utf-8"
To: linux-lvm@sistina.com

Hello:

I had the opportunity to play with a new Athlon 1200 box with IDE disks
for a couple of hours, and trying to verify whether the infamous VIA
chipset on the moderboard is of the buggy ones, I made some test with
software RAID and LVM 1.0.

Hardware and software setup as follows:
AMD K7 1200, KT133 northbridge and VIA 868b southbridge
128 MB RAM (don't know if 100 MHz or 133 MHz, sorry)
Linux Mandrake 8.0
Linux kernel 2.4.7 compiled with Athlon optimizations
hda: ST320413A, ATA DISK drive
hdc: ST315323A, ATA DISK drive
hda: 39102336 sectors (20020 MB) w/512KiB Cache, CHS=2434/255/63, UDMA(66)
hdc: 30008475 sectors (15364 MB) w/512KiB Cache, CHS=29770/16/63, UDMA(66)
Linux software RAID version 0.90.x and corresponding tools
Linux LVM 1.0

Performance tests where conducted using "bonnie", as shipped with Mandrake
8.0. Each test was run at least 5 times, with a test size double the size
of installed RAM (command line is: bonnie -s 256). Results are averages,
but those runs that deviate too much from the average are removed from the
calculation.

Although linux detects the 80-wire cables, hdparm shipped with Mandrake
seems to refuse setting disks for more than UDMA/33. It is not that
important, because what I was looking for is performance
improvements/degradations using RAID, LVM and both.

Now for the tests. All partitions used were 2 GB in size. Installed RAM
was 128 MB, test file size always 256 MB. Machine not in single user mode
(remote access to the machine), but no GUI and no background cron jobs and
the like. As said, results are "averages" on 5 consecutive runs.
Filesystem used was ext2 with 4-KB block size.

On the following bonnie results, "Sequential Output" _seems_ to refer to
writing tests, while "Sequential Input" _seems_ to refer to reads.


/dev/hda3 (ext2 with 4-KB block size)
cd /mnt/testdir ; bonnie -s 256
-------------------------------------
           -------Sequential Output-------- ---Sequential Input-- --Random--
           -Per Char- --Block--- -Rewrite-- -Per Char- --Block--- --Seeks---
Machine MB K/sec %CPU K/sec %CPU K/sec %CPU K/sec %CPU K/sec %CPU  /sec %CPU
       256 14009 99.3 27171 11.8  5919  3.6  8902 57.9 26205 10.4 124.3  0.4

/dev/hdc1 (ext2 with 4-KB block size)
cd /mnt/testdir ; bonnie -s 256
-------------------------------------
           -------Sequential Output-------- ---Sequential Input-- --Random--
           -Per Char- --Block--- -Rewrite-- -Per Char- --Block--- --Seeks---
Machine MB K/sec %CPU K/sec %CPU K/sec %CPU K/sec %CPU K/sec %CPU  /sec %CPU
       256 13992 99.3 22165 10.1  4543  2.5 12602 82.9 16431  6.0 160.1  0.8

/dev/md0 (software RAID-0, 4 KB chunk size, /dev/hda3 + /dev/hdc1)
cd /mnt/testdir ; bonnie -s 256
------------------------------------------------------------------
           -------Sequential Output-------- ---Sequential Input-- --Random--
           -Per Char- --Block--- -Rewrite-- -Per Char- --Block--- --Seeks---
Machine MB K/sec %CPU K/sec %CPU K/sec %CPU K/sec %CPU K/sec %CPU  /sec %CPU
       256 13901 98.9 32703 15.2 13347  9.1 13180 86.0 39043 17.0 182.6  1.1

/dev/md0 (software RAID-0, 32 KB chunk size, /dev/hda3 + /dev/hdc1)
cd /mnt/testdir ; bonnie -s 256
------------------------------------------------------------------
           -------Sequential Output-------- ---Sequential Input-- --Random--
           -Per Char- --Block--- -Rewrite-- -Per Char- --Block--- --Seeks---
Machine MB K/sec %CPU K/sec %CPU K/sec %CPU K/sec %CPU K/sec %CPU  /sec %CPU
       256 13905 98.8 32874 14.8 12834  8.5 13169 86.7 39357 17.0 230.6  0.7

/dev/VG00/LV00 (LVM 1.0, stripes=2, stripe_size=4 KB /dev/hda3 + /dev/hdc1)
cd /mnt/testdir ; bonnie -s 256
---------------------------------------------------------------------------
           -------Sequential Output-------- ---Sequential Input-- --Random--
           -Per Char- --Block--- -Rewrite-- -Per Char- --Block--- --Seeks---
Machine MB K/sec %CPU K/sec %CPU K/sec %CPU K/sec %CPU K/sec %CPU  /sec %CPU
       256 13890 98.5 31386 14.2  6445  3.7  9758 63.2 17441  7.5 180.3  0.7

/dev/VG00/LV00 (LVM 1.0, stripes=2, stripe_size=32 KB /dev/hda3 + /dev/hdc1)
cd /mnt/testdir ; bonnie -s 256
---------------------------------------------------------------------------
           -------Sequential Output-------- ---Sequential Input-- --Random--
           -Per Char- --Block--- -Rewrite-- -Per Char- --Block--- --Seeks---
Machine MB K/sec %CPU K/sec %CPU K/sec %CPU K/sec %CPU K/sec %CPU  /sec %CPU
       256 13891 98.7 32693 15.2  6503  4.5 10165 65.9 19506  7.4 247.9  0.7

/dev/VG00/LV00 (LVM 1.0, stripes=1, /dev/hda3)
cd /mnt/testdir ; bonnie -s 256
----------------------------------------------
           -------Sequential Output-------- ---Sequential Input-- --Random--
           -Per Char- --Block--- -Rewrite-- -Per Char- --Block--- --Seeks---
Machine MB K/sec %CPU K/sec %CPU K/sec %CPU K/sec %CPU K/sec %CPU  /sec %CPU
        56 13977 99.1 31341 13.9  7397  4.5  8848 57.8 26182 14.3 201.2  1.2


Maybe I forgot something in my tests, maybe they are not too well though
off, and maybe I didn't expressed myself correctly ;).

There are a couple of things that surprised me: it seems like LVM over a
single partition is even faster than the partition itself (??), random
seek rate grows with stripe size on both RAID and LVM, write performance
with striped LV is about the same as RAID-0 performance, but read
performance with striped LV is terribly slow compared to a similar setup
with RAID-0 (even slower that a LV with stripe=1).

Regards,

--
Jos� Luis Domingo L�pez
Linux Registered User #189436     Debian GNU/Linux Potato (P166 64 MB RAM)
 
jdomingo EN internautas PUNTO org  => � Spam ? Atente a las consecuencias
jdomingo AT internautas DOT   org  => Spam at your own risk
