Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i4VI7E031461
	for <linux-lvm@redhat.com>; Mon, 31 May 2004 14:07:14 -0400
Received: from mproxy.gmail.com (mproxy.gmail.com [216.239.56.251])
	by mx1.redhat.com (8.12.10/8.12.10) with SMTP id i4VI7Di5011587
	for <linux-lvm@redhat.com>; Mon, 31 May 2004 14:07:13 -0400
Received: by mproxy.gmail.com with SMTP id u33so53516cwc
	for <linux-lvm@redhat.com>; Mon, 31 May 2004 11:07:09 -0700 (PDT)
Message-ID: <9381209b040531110774fc820a@mail.gmail.com>
Date: Mon, 31 May 2004 11:07:09 -0700
From: Bernhard Beck <bernhard@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Terrible read performance with LVM
Reply-To: bbeck@lostentry.org,
	LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com

Hi all,

I'm fighting with terrible read performance on some RedHat 9 based server
systems when dealing with large log files. The symptoms are as follows:

- logrotate on large (> ~10MB) log files in /usr/local/logs  takes
forever (in the order of minutes) even without compressing
- sendmail processes doing i/o on the same volume (chrooted sendmail in
/usr/local/sendmail) hang in disk I/O while logrotate is running

- detailed output from pv/vg/lvdisplay is at the end of the email


ENVIRONMENT:

- hardware
dual xeon 2.4
2GB memory
2x 120GB IDE drives (master on dedicated channel))

s35:~# hdparm /dev/hda

/dev/hda:
 multcount    = 16 (on)
 IO_support   =  3 (32-bit w/sync)
 unmaskirq    =  0 (off)
 using_dma    =  1 (on)
 keepsettings =  0 (off)
 readonly     =  0 (off)
 readahead    =  8 (on)
 geometry     = 14593/255/63, sectors = 234441648, start = 0
s35:~# hdparm /dev/hdc

/dev/hdc:
 multcount    = 16 (on)
 IO_support   =  3 (32-bit w/sync)
 unmaskirq    =  0 (off)
 using_dma    =  1 (on)
 keepsettings =  0 (off)
 readonly     =  0 (off)
 readahead    =  8 (on)
 geometry     = 14593/255/63, sectors = 234441648, start = 0
s35:~# hdparm -t /dev/hda

/dev/hda:
 Timing buffered disk reads:  64 MB in  1.18 seconds = 54.24 MB/sec
s35:~# hdparm -t /dev/hdc

/dev/hdc:
 Timing buffered disk reads:  64 MB in  1.16 seconds = 55.17 MB/sec

These reported speeds are consistent with some speed tests I ran on
non-lvm filesystems.

- disk layout:
/dev/hda1 on / type ext3 (rw)
none on /proc type proc (rw)
none on /dev/pts type devpts (rw,gid=5,mode=620)
none on /dev/shm type tmpfs (rw)
/dev/hda5 on /usr type ext3 (rw)
/dev/sysvg/usrlocal on /usr/local type ext3 (rw)
/dev/sysvg/var on /var type ext3 (rw)


REPRODUCING THE PROBLEM:

I tried to destill this down to a few simple test cases:

4 locations:
/tmp      (in root partition on hda)
/usr/local/logs (in usrlocal volume of sysvg volume group
on hda)
/export/hdc1   (partition on hdc)
/export/hdc2   (in lvol1 volume of datavg volume group on hdc)

All locations are on a ext3 filesystem with journaling. Here are the
additional mount points:

/dev/hdc1 on /export/hdc1 type ext3 (rw)
/dev/datavg/lvol1 on /export/hdc2 type ext3 (rw)

These partitions were created with minimal set of parameters needed. All
files are 65MB and copies are twice in each partition (so that I can mix and
match without worrying too much about file system caching).
I rebooted the system before the test to make sure the file system cache
is empty. I ran each test multiple times with different files. The
results below for each test are typical for each test case.

Test 1: ext3/hda -> ext3/hdc

s35:~# time cp -f /tmp/1/bi2.log.1 /export/hdc1/1

real    0m1.477s
user    0m0.010s
sys     0m0.530s

about 40MB/s. That's fine.


Test 2: ext3/hda -> ext3/lvm/hdc

s35:~# time cp -f /tmp/1/ni1.log.1 /export/hdc2/1

real    0m1.487s
user    0m0.010s
sys     0m0.580s

about 40MB/s. That's fine.


Test 3: ext3/lvm/hdc -> ext3/hda

s35:~# time cp -f /export/hdc1/1/ni1.log.1 /tmp/1

real    0m1.235s
user    0m0.010s
sys     0m0.760s

about 40MB/s throughput. ok.


Test 4: ext3/hdc -> ext3/lvm/hda

s35:~# time cp -f /export/hdc1/1/ni1.log.1 /usr/local/logs/

real    0m3.863s
user    0m0.010s
sys     0m0.560s

17MB/s. uhm, mediocre.


Test 5: ext3/lvm/hda -> ext3/hdc

s35:~# time cp -f /usr/local/logs/bi1.log.1 /export/hdc1/1

real    1m27.139s
user    0m0.000s
sys     0m0.610s

~800kByte/s. that's just flat out pathetic.

BUT, these ones are interesting. I did them right after the previous test run:

s35:~# time cp -f /usr/local/logs/bi2.log.1 /export/hdc1/1

real    0m3.012s
user    0m0.020s
sys     0m0.590s
s35:~# time cp -f /usr/local/logs/ni2.log.1 /export/hdc1/1

real    0m0.583s
user    0m0.000s
sys     0m0.580s
s35:~# time cp -f /usr/local/logs/ni1.log.1 /export/hdc1/1

real    0m0.583s
user    0m0.000s
sys     0m0.580s


However, this might be an anomaly during the test based on the files I
chose. It doesn't match with my real-world observations on the
affected server, and I
could reproduce this only once in testing. Somehow the files got into
the file system cache?

Also, picking another file of similar size brings us right back to:
s35:~# time cp /usr/local/logs/ns4.log.1 /export/hdc1/1
real    1m25.599s
user    0m0.020s
sys     0m0.720s


I suspect, there is some over-aggressive read-caching at work here that
is caching the wrong data, or dual-caching, or something is inhibiting
access to the lvm volume on a regular basis (e.g. the sendmail procesess
mentioned earlier completed immediately when I Ctrl-Z'ed logrotate). 

I can't figure out why only /dev/sysvg on hda would be affected by this.

I verified this behaviour on 4 different servers that were installed
with the same RH9 image with kernels 2.4.20-20.9 and 2.4.20-30.9, so I
doubt it is hardware specific, but rather how the volume group is
configured.

The only differences I am aware of between "sysvg" on hda and "datavg" on hdc:
- sysvg has three logical volumes, datavg has only one
- I created datavg myself for testing a few days ago, while sysvg has
been on the system since it was installed several months ago

If anyone could help shed some light on this I'd be really grateful.
I'd be happy to provide more information if needed.

Thanks,
Bernhard


Here is the output from [pv,vg,lv]display:

s35:~# pvscan
pvscan -- reading all physical volumes (this may take a while...)
pvscan -- ACTIVE   PV "/dev/hdc2" of VG "datavg" [37.25 GB / 17.25 GB free]
pvscan -- ACTIVE   PV "/dev/hda3" of VG "sysvg"  [100.07 GB / 40.50 GB free]
pvscan -- total: 2 [137.34 GB] / in use: 2 [137.34 GB] / in no VG: 0 [0]

s35:~# pvdisplay /dev/hda3
--- Physical volume ---
PV Name               /dev/hda3
VG Name               sysvg
PV Size               100.08 GB [209873160 secs] / NOT usable 4.25 MB
[LVM: 228 KB]
PV#                   1
PV Status             available
Allocatable           yes
Cur LV                3
PE Size (KByte)       4096
Total PE              25618
Free PE               10368
Allocated PE          15250
PV UUID               8rssk7-asXx-WB7X-gSFq-eYC0-2b6R-8lJi1i

s35:~# pvdisplay /dev/hdc2
--- Physical volume ---
PV Name               /dev/hdc2
VG Name               datavg
PV Size               37.26 GB [78140160 secs] / NOT usable 4.19 MB
[LVM: 165 KB]
PV#                   1
PV Status             available
Allocatable           yes
Cur LV                1
PE Size (KByte)       4096
Total PE              9537
Free PE               4417
Allocated PE          5120
PV UUID               ug7pK9-PVu1-1oUI-QakH-yn12-OVbs-5j9C4i

s35:~# vgscan
vgscan -- reading all physical volumes (this may take a while...)
vgscan -- found active volume group "datavg"
vgscan -- found active volume group "sysvg"
vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
vgscan -- WARNING: This program does not do a VGDA backup of your volume groups

s35:~# vgdisplay sysvg
--- Volume group ---
VG Name               sysvg
VG Access             read/write
VG Status             available/resizable
VG #                  0
MAX LV                256
Cur LV                3
Open LV               2
MAX LV Size           255.99 GB
Max PV                256
Cur PV                1
Act PV                1
VG Size               100.07 GB
PE Size               4 MB
Total PE              25618
Alloc PE / Size       15250 / 59.57 GB
Free  PE / Size       10368 / 40.50 GB
VG UUID               UnR7jD-QX7T-4UAR-xqhb-zrtQ-xxbv-0o03qY


s35:~# vgdisplay datavg
--- Volume group ---
VG Name               datavg
VG Access             read/write
VG Status             available/resizable
VG #                  1
MAX LV                256
Cur LV                1
Open LV               1
MAX LV Size           255.99 GB
Max PV                256
Cur PV                1
Act PV                1
VG Size               37.25 GB
PE Size               4 MB
Total PE              9537
Alloc PE / Size       5120 / 20 GB
Free  PE / Size       4417 / 17.25 GB
VG UUID               IAnx3t-0pyn-8ZPB-bh07-YJFp-X57A-mN4JRW

s35:~# lvscan
lvscan -- ACTIVE            "/dev/datavg/lvol1" [20 GB]
lvscan -- ACTIVE            "/dev/sysvg/freespacetouse" [7.81 GB]
lvscan -- ACTIVE            "/dev/sysvg/usrlocal" [43.95 GB]
lvscan -- ACTIVE            "/dev/sysvg/var" [7.81 GB]
lvscan -- 4 logical volumes with 79.57 GB total in 2 volume groups
lvscan -- 4 active logical volumes

s35:~# lvdisplay /dev/sysvg/var
--- Logical volume ---
LV Name                /dev/sysvg/var
VG Name                sysvg
LV Write Access        read/write
LV Status              available
LV #                   3
# open                 1
LV Size                7.81 GB
Current LE             2000
Allocated LE           2000
Allocation             next free
Read ahead sectors     1024
Block device           58:2


s35:~# lvdisplay /dev/sysvg/usrlocal
--- Logical volume ---
LV Name                /dev/sysvg/usrlocal
VG Name                sysvg
LV Write Access        read/write
LV Status              available
LV #                   2
# open                 1
LV Size                43.95 GB
Current LE             11250
Allocated LE           11250
Allocation             next free
Read ahead sectors     1024
Block device           58:1


s35:~# lvdisplay /dev/sysvg/freespacetouse
--- Logical volume ---
LV Name                /dev/sysvg/freespacetouse
VG Name                sysvg
LV Write Access        read/write
LV Status              available
LV #                   1
# open                 0
LV Size                7.81 GB
Current LE             2000
Allocated LE           2000
Allocation             next free
Read ahead sectors     1024
Block device           58:0


s35:~# lvdisplay /dev/datavg/lvol1
--- Logical volume ---
LV Name                /dev/datavg/lvol1
VG Name                datavg
LV Write Access        read/write
LV Status              available
LV #                   1
# open                 1
LV Size                20 GB
Current LE             5120
Allocated LE           5120
Allocation             next free
Read ahead sectors     1024
Block device           58:3
