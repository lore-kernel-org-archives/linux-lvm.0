From: YouMizuki <appendix@hatsune.cc>
Subject: Re: [linux-lvm] vgscan failed "no volume groups found"
In-Reply-To: <20011025014038.X23590@turbolinux.com>
References: <200110250515.OAA15476@center01.shooting-star.ne.jp> <20011025014038.X23590@turbolinux.com>
Message-Id: <20011027192708.3F87.APPENDIX@hatsune.cc>
MIME-Version: 1.0
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
Date: Sat Oct 27 05:33:01 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

I tried to do uuid_fixer.
But I had this message.

uuid_fixer  /dev/md2 /dev/md3 /dev/md4 /dev/md5 /dev/md6 /dev/md7 /dev/md8
/dev/md9 
Error: number of PVs passed in does not match number of PVs in /dev/md2's VG
       8 PVs were passed in and 10 were expected.

uuid_fixer2  /dev/md2 /dev/md3 /dev/md4 /dev/md5 /dev/md6 /dev/md7
/dev/md8 /dev/md9 /dev/md10
Error: number of PVs passed in does not match number of PVs in /dev/md2's VG
       9 PVs were passed in and 10 were expected.

My /dev/md10 is broken. but /dev/md2../dev/md9 alive.
I want to recover the remainder disks.
Please give some advice to me....


>I've a LVM one physical volume "vg0" that created on 9 RAID devices.
>It worked still the day.
>But one day, I have problem about vgscan reports that it can't find my
VG. 
>And recovery data /etc/lvmconf/vg0.conf was broken by other cause.
>Please help me..... or give me hints to recover it.

>My VG structure is following

>/dev/md2,md3,md4,md5,md6,md7,md8,md9,md10 => vg0

>Kernel Linux  2.4.5 #10 SMP

>The pvscan report is following
>pvscan
>pvscan -- reading all physical volumes (this may take a while...)
>pvscan -- inactive PV "/dev/md2"   is associated to an unknown VG (run
vgscan)
>pvscan -- inactive PV "/dev/md3"   is associated to an unknown VG (run
vgscan)
>pvscan -- inactive PV "/dev/md4"   is associated to an unknown VG (run
vgscan)
>pvscan -- inactive PV "/dev/md5"   is associated to an unknown VG (run
vgscan)
>pvscan -- inactive PV "/dev/md6"   is associated to an unknown VG (run
vgscan)
>pvscan -- inactive PV "/dev/md7"   is associated to an unknown VG (run
vgscan)
>pvscan -- inactive PV "/dev/md8"   is associated to an unknown VG (run
vgscan)
>pvscan -- inactive PV "/dev/md9"   is associated to an unknown VG (run
vgscan)
>pvscan -- inactive PV "/dev/md10" of VG "vg1" [4.48 GB / 4.48 GB free]
>pvscan -- total: 9 [68.48 GB] / in use: 9 [68.48 GB] / in no VG: 0 [0]

>The pvdata report is following
>>pvdata -U /dev/md2
>000: w1ozGmggQJ7LqDumRFhBWpxAcBuinvkV
>001: gyivka8v8Rs8N6UHW1mXO2A7pe3V2UtL
>002: N1rBqi3J4SXDpRwYCh65eXCtH98zrkYQ
>003: vy3JnFfm4b4j5t1kcnnmPBVnqvKE1454
>004: 3qwEJ6e08fnjyfEtYh2VUwNLSlAv7WHC
>005: bCf2F3RgkdCqz0qs605zpQiMDF738U7Q
>006: Ao8MnMZSLrDhk1pbTHatNA5KHiZXv5vG
>007: 3ztQ2cfoGMc15y1TTXQzSpSkTIBzLcas
>008: 9VW0My6FYEh4T1WnwBP3m0OSlMhdM7Gq
>009: BIxTWheupMeCfEjU8UuyW0LX8gAq4aoD

>>pvdata -PP pvdata -PP /dev/md2
>--- Physical volume ---
>PV Name               /dev/md2
>VG Name               vg0
>PV Size               8 GB / NOT usable 4 MB [LVM: 128 KB]
>PV#                   2
>PV Status             available
>Allocatable           yes (but full)
>Cur LV                1
>PE Size (KByte)       4096
>Total PE              2047
>Free PE               0
>Allocated PE          2047
>PV UUID               gyivka-8v8R-s8N6-UHW1-mXO2-A7pe-3V2UtL
>pv_dev                   0:9
>pv_on_disk.base          0
>pv_on_disk.size          1024
>vg_on_disk.base          1024
>vg_on_disk.size          4608
>pv_uuidlist_on_disk.base 6144
>pv_uuidlist_on_disk.size 32896
>lv_on_disk.base          39424
>lv_on_disk.size          84296
>pe_on_disk.base          123904
>pe_on_disk.size          4070400
