Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id k1D6vb117018
	for <linux-lvm@redhat.com>; Mon, 13 Feb 2006 01:57:37 -0500
Received: from wip-ec-wd.wipro.com (wip-ec-wd.wipro.com [203.91.193.32])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id k1D6vJFj013377
	for <linux-lvm@redhat.com>; Mon, 13 Feb 2006 01:57:22 -0500
Received: from wip-ec-wd.wipro.com (localhost.wipro.com [127.0.0.1])
	by localhost (Postfix) with ESMTP id CCDA1205FB
	for <linux-lvm@redhat.com>; Mon, 13 Feb 2006 12:11:34 +0530 (IST)
Received: from blr-ec-bh01.wipro.com (blr-ec-bh01.wipro.com [10.201.50.91])
	by wip-ec-wd.wipro.com (Postfix) with ESMTP id A8CD0205E6
	for <linux-lvm@redhat.com>; Mon, 13 Feb 2006 12:11:34 +0530 (IST)
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="----_=_NextPart_001_01C6306A.9FE7741B"
Subject: RE: [linux-lvm] Symbolic Link Related Query
Date: Mon, 13 Feb 2006 12:26:33 +0530
Message-ID: <DBFC31836FE4044AAC43F361228CA2F801A04352@blr-m1-msg.wipro.com>
From: <deepak.barua@wipro.com>
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@redhat.com
Cc: betasam@gmail.com

This is a multi-part message in MIME format.

------_=_NextPart_001_01C6306A.9FE7741B
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_002_01C6306A.9FE7741B"


------_=_NextPart_002_01C6306A.9FE7741B
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Guy's=20
I think you are right could be something wrong with the ls command you
see the i-node number output of the ls command does not match the stat
command i-node number .
$ /bin/ls -i h j k
 176016 h   176016 j   176016 k
$ stat h j k
  File: `h'
  Size: 0               Blocks: 0          IO Block: 4096   Regular File
Device: 3a0ah/14858d    Inode: 176016      Links: 2
Access: (0644/-rw-r--r--)  Uid: (   55/  sp92pt)   Gid: (  202/ xb__adm)
Access: 2006-02-13 01:47:45.000000000 -0500
Modify: 2006-02-13 01:47:45.000000000 -0500
Change: 2006-02-13 01:47:50.000000000 -0500
=20
  File: `j'
  Size: 0               Blocks: 0          IO Block: 4096   Regular File
Device: 3a0ah/14858d    Inode: 176016      Links: 2
Access: (0644/-rw-r--r--)  Uid: (   55/  sp92pt)   Gid: (  202/ xb__adm)
Access: 2006-02-13 01:47:45.000000000 -0500
Modify: 2006-02-13 01:47:45.000000000 -0500
Change: 2006-02-13 01:47:50.000000000 -0500
=20
  File: `k' -> `h'
  Size: 1               Blocks: 0          IO Block: 4096   Symbolic
Link
Device: 3a0ah/14858d    Inode: 176018      Links: 1
Access: (0777/lrwxrwxrwx)  Uid: (   55/  sp92pt)   Gid: (  202/ xb__adm)
Access: 2006-02-13 01:48:06.000000000 -0500
Modify: 2006-02-13 01:47:54.000000000 -0500
Change: 2006-02-13 01:47:54.000000000 -0500
=20
Also i did a strace of the command's and put the output in the
respective files=20
=20
1. $ strace -o ls.trace /bin/ls -i h j k
 176016 h   176016 j   176016 k
file name =3D ls.trace
=20
2.  $ strace -o stat.trace stat h j k
  File: `h'
  Size: 0               Blocks: 0          IO Block: 4096   Regular File
Device: 3a0ah/14858d    Inode: 176016      Links: 2
Access: (0644/-rw-r--r--)  Uid: (   55/  sp92pt)   Gid: (  202/ xb__adm)
Access: 2006-02-13 01:47:45.000000000 -0500
Modify: 2006-02-13 01:47:45.000000000 -0500
Change: 2006-02-13 01:47:50.000000000 -0500
=20
  File: `j'
  Size: 0               Blocks: 0          IO Block: 4096   Regular File
Device: 3a0ah/14858d    Inode: 176016      Links: 2
Access: (0644/-rw-r--r--)  Uid: (   55/  sp92pt)   Gid: (  202/ xb__adm)
Access: 2006-02-13 01:47:45.000000000 -0500
Modify: 2006-02-13 01:47:45.000000000 -0500
Change: 2006-02-13 01:47:50.000000000 -0500
=20
  File: `k' -> `h'
  Size: 1               Blocks: 0          IO Block: 4096   Symbolic
Link
Device: 3a0ah/14858d    Inode: 176018      Links: 1
Access: (0777/lrwxrwxrwx)  Uid: (   55/  sp92pt)   Gid: (  202/ xb__adm)
Access: 2006-02-13 01:49:39.000000000 -0500
Modify: 2006-02-13 01:47:54.000000000 -0500
Change: 2006-02-13 01:47:54.000000000 -0500
file name =3D stat.trace
=20
=20
Thanks for the help and i would appreciate your co-operation in furthur
isolating the problem .
Regards
Deepak

-----Original Message-----
From: linux-lvm-bounces@redhat.com [mailto:linux-lvm-bounces@redhat.com]
On Behalf Of deepak.barua@wipro.com
Sent: Friday, February 10, 2006 7:08 PM
To: linux-lvm@redhat.com
Subject: [linux-lvm] Symbolic Link Related Query


=20

=20
Hi All=20
        I am facing a unique problem here in my workplace machine which
run's on  (redhat enterprise linux) 2.4.21-37.EL #1 SMP, i have the
following LVM running
LVM module LVM version 1.0.8-2(26/05/2004)

Total: 2 VGs 2 PVs 43 LVs (20 LVs open 20 times)

Global: 475792 bytes malloced IOP version: 10 79 days 16:15:15 active

The basic problem is when i create a symbolic link the i-node number
reamins the same as the original file i-node number , i don't know if it
some configuration in the LVM's as they are pretty configurable.

My Step's

$ touch h
$ ln h j
$ ln -s h k
$ ls -i h j k
 176016 h   176016 j   176016 k
$


You can see that the i-node number is same for all the original file the
hard link and the soft link can this version of LVM do this kind of
configuration.?

Thank's In Advance=20

Regards

Deepak

=20

=20

The other machine detail's from proc are listed below=20

Cat /proc/cpuinfo

$ cat cpuinfo

processor : 0

vendor_id : GenuineIntel

cpu family : 15

model : 4

model name : Intel(R) Xeon(TM) CPU 3.80GHz

physical id : 0

siblings : 2

runqueue : 0

stepping : 3

cpu MHz : 3800.342

cache size : 2048 KB

fpu : yes

fpu_exception : yes

cpuid level : 5

wp : yes

flags : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov
pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm ferr syscall lm
sse3 monit or ds-cpl gv3 tm2 cnxt-id

bogomips : 7575.96

clflush size : 64

address sizes : 36 bits physical, 48 bits virtual

power management:

processor : 1

vendor_id : GenuineIntel

cpu family : 15

model : 4

model name : Intel(R) Xeon(TM) CPU 3.80GHz

physical id : 3

siblings : 2

runqueue : 1

stepping : 3

cpu MHz : 3800.342

cache size : 2048 KB

fpu : yes

fpu_exception : yes

cpuid level : 5

wp : yes

flags : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov
pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm ferr syscall lm
sse3 monit or ds-cpl gv3 tm2 cnxt-id

bogomips : 7575.96

clflush size : 64

address sizes : 36 bits physical, 48 bits virtual

power management:

processor : 2

vendor_id : GenuineIntel

cpu family : 15

model : 4

model name : Intel(R) Xeon(TM) CPU 3.80GHz

physical id : 0

siblings : 2

runqueue : 0

stepping : 3

cpu MHz : 3800.342

cache size : 2048 KB

fpu : yes

fpu_exception : yes

cpuid level : 5

wp : yes

flags : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov
pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm ferr syscall lm
sse3 monit or ds-cpl gv3 tm2 cnxt-id

bogomips : 7575.96

clflush size : 64

address sizes : 36 bits physical, 48 bits virtual

power management:

processor : 3

vendor_id : GenuineIntel

cpu family : 15

model : 4

model name : Intel(R) Xeon(TM) CPU 3.80GHz

physical id : 3

siblings : 2

runqueue : 1

stepping : 3

cpu MHz : 3800.342

cache size : 2048 KB

fpu : yes

fpu_exception : yes

cpuid level : 5

wp : yes

flags : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov
pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm ferr syscall lm
sse3 monit or ds-cpl gv3 tm2 cnxt-id

bogomips : 7575.96

clflush size : 64

address sizes : 36 bits physical, 48 bits virtual

power management:

=20

$ cat filesystems

nodev rootfs

nodev bdev

nodev proc

nodev sockfs

nodev tmpfs

nodev shm

nodev pipefs

ext2

nodev ramfs

nodev hugetlbfs

iso9660

nodev devpts

ext3

nodev usbdevfs

nodev usbfs

nodev autofs

vfat

udf

nodev nfs

=20

$ cat partitions

major minor #blocks name rio rmerge rsect ruse wio wmerge wsect wuse
running use aveq

58 0 516096 lvma 0 0 0 0 0 0 0 0 0 0 0

58 1 10240000 lvmb 0 0 0 0 0 0 0 0 0 0 0

58 2 512000 lvmc 0 0 0 0 0 0 0 0 0 0 0

58 3 1024000 lvmd 0 0 0 0 0 0 0 0 0 0 0

58 4 5120000 lvme 0 0 0 0 0 0 0 0 0 0 0

58 5 4096000 lvmf 0 0 0 0 0 0 0 0 0 0 0

58 6 512000 lvmg 0 0 0 0 0 0 0 0 0 0 0

58 7 716800 lvmh 0 0 0 0 0 0 0 0 0 0 0

58 8 2048000 lvmi 0 0 0 0 0 0 0 0 0 0 0

58 9 1024000 lvmj 0 0 0 0 0 0 0 0 0 0 0

58 10 2048000 lvmk 0 0 0 0 0 0 0 0 0 0 0

58 11 7168000 lvml 0 0 0 0 0 0 0 0 0 0 0

58 12 819200 lvmm 0 0 0 0 0 0 0 0 0 0 0

58 13 10240000 lvmn 0 0 0 0 0 0 0 0 0 0 0

58 14 10240000 lvmo 0 0 0 0 0 0 0 0 0 0 0

58 15 1581056 lvmp 0 0 0 0 0 0 0 0 0 0 0

58 16 102400 lvmq 0 0 0 0 0 0 0 0 0 0 0

58 17 102400 lvmr 0 0 0 0 0 0 0 0 0 0 0

58 18 102400 lvms 0 0 0 0 0 0 0 0 0 0 0

58 19 102400 lvmt 0 0 0 0 0 0 0 0 0 0 0

58 20 53248 lvmu 0 0 0 0 0 0 0 0 0 0 0

58 21 102400 lvmv 0 0 0 0 0 0 0 0 0 0 0

58 22 180224 lvmw 0 0 0 0 0 0 0 0 0 0 0

58 23 77824 lvmx 0 0 0 0 0 0 0 0 0 0 0

58 24 307200 lvmy 0 0 0 0 0 0 0 0 0 0 0

58 25 307200 lvmz 0 0 0 0 0 0 0 0 0 0 0

58 26 180224 lvm{ 0 0 0 0 0 0 0 0 0 0 0

58 27 180224 lvm| 0 0 0 0 0 0 0 0 0 0 0

58 28 180224 lvm} 0 0 0 0 0 0 0 0 0 0 0

58 29 53248 lvm~ 0 0 0 0 0 0 0 0 0 0 0

58 30 53248 lv 0 0 0 0 0 0 0 0 0 0 0

58 31 53248 lvm 0 0 0 0 0 0 0 0 0 0 0

58 32 53248 lvm 0 0 0 0 0 0 0 0 0 0 0

58 33 53248 lvm 0 0 0 0 0 0 0 0 0 0 0

58 34 53248 lvm 0 0 0 0 0 0 0 0 0 0 0

58 35 548864 lvm

0 0 0 0 0 0 0 0 0 0 0

58 36 286720 lvm

0 0 0 0 0 0 0 0 0 0 0

58 37 286720 lvm 0 0 0 0 0 0 0 0 0 0 0

58 38 262144 lvm 0 0 0 0 0 0 0 0 0 0 0

58 39 51200000 lvm 0 0 0 0 0 0 0 0 0 0 0

58 40 3072000 lvm 0 0 0 0 0 0 0 0 0 0 0

58 41 3072000 lvm 0 0 0 0 0 0 0 0 0 0 0

58 42 5120000 lvm 0 0 0 0 0 0 0 0 0 0 0

8 0 40986624 sda 1961725 2015893 27022764 17458480 15681142 6125806
123811888 25062727 0 5751090 42587897

8 1 204784 sda1 3645 27773 62836 78090 897 369 2532 35100 0 29790 113190

8 2 40781824 sda2 1958053 1988015 26959664 17380360 15680245 6125437
123809356 25027677 0 5740860 42474547

8 16 245760000 sdb 149842410 88015370 1895282582 12721644 170899976
88685576 2054639674 2879121 0 34958021 15936396

8 17 245759984 sdb1 149842392 88015301 1895282406 12723394 170899976
88685576 2054639674 2880291 0 34955871 15923066

3 0 9977152 hda 31 30 150 6300 0 0 0 0 0 6300 6300

=20

=20

$ cat global

LVM module LVM version 1.0.8-2(26/05/2004)

Total: 2 VGs 2 PVs 43 LVs (20 LVs open 20 times)

Global: 475792 bytes malloced IOP version: 10 79 days 16:15:15 active

VG: vg00 [1 PV, 7 LV/7 open] PE Size: 8192 KB

Usage [KB/PE]: 40771584 /4977 total 22839296 /2788 used 17932288 /2189
free

PV: [AA] sda2 40771584 /4977 22839296 /2788 17932288 /2189

LVs: [AWDL ] root 516096 /63 1x open

[AWDL ] opt 1024000 /125 1x open

[AWDL ] tmp 1024000 /125 1x open

[AWDL ] users 2048000 /250 1x open

[AWDL ] usr 7168000 /875 1x open

[AWDL ] var 819200 /100 1x open

[AWDL ] swap1 10240000 /1250 1x open

VG: vg01 [1 PV, 36 LV/13 open] PE Size: 4096 KB

Usage [KB/PE]: 245751808 /59998 total 101212160 /24710 used 144539648
/35288 free

PV: [AA] sdb1 245751808 /59998 101212160 /24710 144539648 /35288

LVs: [AWDL ] export_linuxport 10240000 /2500 1x open

[AWDL ] galaxy 512000 /125 1x open

[AWDL ] opt_force_oradat 5120000 /1250 1x open

[AWDL ] oracl9207 4096000 /1000 1x open

[AWDL ] rougewave8 512000 /125 1x open

[AWDL ] visibrokerbes65p 716800 /175 1x open

[AWDL ] rdbmsLog_f91lnx 2048000 /500 1x open

[AWDL ] lv_xbflnxpt 10240000 /2500 1x open

[AWDL ] rdbmsLog_xbflnxpt 1581056 /386 1x open

[AWDL ] xbflnxpt_temp1 102400 /25 close

[AWDL ] xbflnxpt_user_temp1 102400 /25 close

[AWDL ] xbflnxpt_user_temp2 102400 /25 close

[AWDL ] xbflnxpt_user_temp3 102400 /25 close

[AWDL ] xbflnxpt_ftr_data1 53248 /13 close

[AWDL ] xbflnxpt_queue1 102400 /25 close

[AWDL ] xbflnxpt_ref_data1 180224 /44 close

[AWDL ] xbflnxpt_wl_data1 77824 /19 close

[AWDL ] xbflnxpt_wr_data1 307200 /75 close

[AWDL ] xbflnxpt_wr_data2 307200 /75 close

[AWDL ] xbflnxpt_rbs1 180224 /44 close

[AWDL ] xbflnxpt_rbs2 180224 /44 close

[AWDL ] xbflnxpt_rbs3 180224 /44 close

[AWDL ] xbflnxpt_redoLog1 53248 /13 close

[AWDL ] xbflnxpt_redoLog1m 53248 /13 close

[AWDL ] xbflnxpt_redoLog2 53248 /13 close

[AWDL ] xbflnxpt_redoLog2m 53248 /13 close

[AWDL ] xbflnxpt_redoLog3 53248 /13 close

[AWDL ] xbflnxpt_redoLog3m 53248 /13 close

[AWDL ] xbflnxpt_syst 548864 /134 close

[AWDL ] xbflnxpt_index1 286720 /70 close

[AWDL ] xbflnxpt_index2_data1 286720 /70 close

[AWDL ] xbflnxpt_hist_data1 262144 /64 close

[AWDL ] opt_sysp_frc1_xbf_databases

51200000 /12500 1x open

[AWDL ] opt_sysp_frc1 3072000 /750 1x open

[AWDL ] opt_app_frc1 3072000 /750 1x open

[AWDL ] rdbmsLog_frc1 5120000 /1250 1x open

=20


------_=_NextPart_002_01C6306A.9FE7741B
Content-Type: text/html;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3Dus-ascii">
<TITLE>Message</TITLE>

<META content=3D"MSHTML 6.00.2800.1528" name=3DGENERATOR></HEAD>
<BODY>
<DIV><FONT face=3DArial color=3D#0000ff size=3D2><SPAN =
class=3D734170207-13022006>Hi=20
Guy's </SPAN></FONT></DIV>
<DIV><FONT face=3DArial color=3D#0000ff size=3D2><SPAN =
class=3D734170207-13022006>I=20
think you are right could be something wrong with the ls command you see =
the=20
i-node number output of the ls command does not match the stat command =
i-node=20
number .</SPAN></FONT></DIV>
<DIV><FONT face=3DArial color=3D#ff0000 size=3D2><SPAN =
class=3D734170207-13022006>$=20
/bin/ls -i h j k<BR>&nbsp;176016 h&nbsp;&nbsp; 176016 j&nbsp;&nbsp; =
176016=20
k<BR>$ stat h j k<BR>&nbsp; File: `h'<BR>&nbsp; Size:=20
0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;=20
Blocks: 0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; IO =
Block:=20
4096&nbsp;&nbsp; Regular File<BR>Device: 3a0ah/14858d&nbsp;&nbsp;&nbsp; =
Inode:=20
176016&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Links: 2<BR>Access: =
(0644/-rw-r--r--)&nbsp;=20
Uid: (&nbsp;&nbsp; 55/&nbsp; sp92pt)&nbsp;&nbsp; Gid: (&nbsp; 202/=20
xb__adm)<BR>Access: 2006-02-13 01:47:45.000000000 -0500<BR>Modify: =
2006-02-13=20
01:47:45.000000000 -0500<BR>Change: 2006-02-13 01:47:50.000000000=20
-0500</SPAN></FONT></DIV>
<DIV><FONT face=3DArial color=3D#ff0000 size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial color=3D#ff0000 size=3D2><SPAN =
class=3D734170207-13022006>&nbsp;=20
File: `j'<BR>&nbsp; Size:=20
0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;=20
Blocks: 0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; IO =
Block:=20
4096&nbsp;&nbsp; Regular File<BR>Device: 3a0ah/14858d&nbsp;&nbsp;&nbsp; =
Inode:=20
176016&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Links: 2<BR>Access: =
(0644/-rw-r--r--)&nbsp;=20
Uid: (&nbsp;&nbsp; 55/&nbsp; sp92pt)&nbsp;&nbsp; Gid: (&nbsp; 202/=20
xb__adm)<BR>Access: 2006-02-13 01:47:45.000000000 -0500<BR>Modify: =
2006-02-13=20
01:47:45.000000000 -0500<BR>Change: 2006-02-13 01:47:50.000000000=20
-0500</SPAN></FONT></DIV>
<DIV><FONT face=3DArial color=3D#ff0000 size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial color=3D#ff0000 size=3D2><SPAN =
class=3D734170207-13022006>&nbsp;=20
File: `k' -&gt; `h'<BR>&nbsp; Size:=20
1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;=20
Blocks: 0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; IO =
Block:=20
4096&nbsp;&nbsp; Symbolic Link<BR>Device: 3a0ah/14858d&nbsp;&nbsp;&nbsp; =
Inode:=20
176018&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Links: 1<BR>Access: =
(0777/lrwxrwxrwx)&nbsp;=20
Uid: (&nbsp;&nbsp; 55/&nbsp; sp92pt)&nbsp;&nbsp; Gid: (&nbsp; 202/=20
xb__adm)<BR>Access: 2006-02-13 01:48:06.000000000 -0500<BR>Modify: =
2006-02-13=20
01:47:54.000000000 -0500<BR>Change: 2006-02-13 01:47:54.000000000=20
-0500</SPAN></FONT></DIV>
<DIV><FONT face=3DArial color=3D#ff0000 size=3D2><SPAN=20
class=3D734170207-13022006></SPAN></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial color=3D#0000ff size=3D2><SPAN =
class=3D734170207-13022006>Also i=20
did a strace of the command's and put the output in the respective files =

</SPAN></FONT></DIV>
<DIV><FONT face=3DArial color=3D#0000ff size=3D2><SPAN=20
class=3D734170207-13022006></SPAN></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial color=3D#ff0000 size=3D2><SPAN =
class=3D734170207-13022006>1. $=20
strace -o ls.trace /bin/ls -i h j k<BR>&nbsp;176016 h&nbsp;&nbsp; 176016 =

j&nbsp;&nbsp; 176016 k</SPAN></FONT></DIV>
<DIV><FONT face=3DArial color=3D#ff0000 size=3D2><SPAN =
class=3D734170207-13022006>file=20
name =3D ls.trace</SPAN></FONT></DIV>
<DIV><FONT face=3DArial color=3D#ff0000 size=3D2><SPAN=20
class=3D734170207-13022006></SPAN></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial color=3D#ff0000 size=3D2><SPAN =
class=3D734170207-13022006>2.=20
&nbsp;$ strace -o stat.trace stat h j k<BR>&nbsp; File: `h'<BR>&nbsp; =
Size:=20
0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;=20
Blocks: 0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; IO =
Block:=20
4096&nbsp;&nbsp; Regular File<BR>Device: 3a0ah/14858d&nbsp;&nbsp;&nbsp; =
Inode:=20
176016&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Links: 2<BR>Access: =
(0644/-rw-r--r--)&nbsp;=20
Uid: (&nbsp;&nbsp; 55/&nbsp; sp92pt)&nbsp;&nbsp; Gid: (&nbsp; 202/=20
xb__adm)<BR>Access: 2006-02-13 01:47:45.000000000 -0500<BR>Modify: =
2006-02-13=20
01:47:45.000000000 -0500<BR>Change: 2006-02-13 01:47:50.000000000=20
-0500</SPAN></FONT></DIV>
<DIV><FONT face=3DArial color=3D#ff0000 size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial color=3D#ff0000 size=3D2><SPAN =
class=3D734170207-13022006>&nbsp;=20
File: `j'<BR>&nbsp; Size:=20
0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;=20
Blocks: 0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; IO =
Block:=20
4096&nbsp;&nbsp; Regular File<BR>Device: 3a0ah/14858d&nbsp;&nbsp;&nbsp; =
Inode:=20
176016&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Links: 2<BR>Access: =
(0644/-rw-r--r--)&nbsp;=20
Uid: (&nbsp;&nbsp; 55/&nbsp; sp92pt)&nbsp;&nbsp; Gid: (&nbsp; 202/=20
xb__adm)<BR>Access: 2006-02-13 01:47:45.000000000 -0500<BR>Modify: =
2006-02-13=20
01:47:45.000000000 -0500<BR>Change: 2006-02-13 01:47:50.000000000=20
-0500</SPAN></FONT></DIV>
<DIV><FONT face=3DArial color=3D#ff0000 size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial color=3D#ff0000 size=3D2><SPAN =
class=3D734170207-13022006>&nbsp;=20
File: `k' -&gt; `h'<BR>&nbsp; Size:=20
1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;=20
Blocks: 0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; IO =
Block:=20
4096&nbsp;&nbsp; Symbolic Link<BR>Device: 3a0ah/14858d&nbsp;&nbsp;&nbsp; =
Inode:=20
176018&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Links: 1<BR>Access: =
(0777/lrwxrwxrwx)&nbsp;=20
Uid: (&nbsp;&nbsp; 55/&nbsp; sp92pt)&nbsp;&nbsp; Gid: (&nbsp; 202/=20
xb__adm)<BR>Access: 2006-02-13 01:49:39.000000000 -0500<BR>Modify: =
2006-02-13=20
01:47:54.000000000 -0500<BR>Change: 2006-02-13 01:47:54.000000000=20
-0500</SPAN></FONT></DIV>
<DIV><FONT face=3DArial color=3D#ff0000 size=3D2><SPAN =
class=3D734170207-13022006>file=20
name =3D stat.trace</SPAN></FONT></DIV>
<DIV><FONT face=3DArial color=3D#ff0000 size=3D2><SPAN=20
class=3D734170207-13022006></SPAN></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial color=3D#ff0000 size=3D2><SPAN=20
class=3D734170207-13022006></SPAN></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial color=3D#0000ff size=3D2><SPAN =
class=3D734170207-13022006>Thanks=20
for the help and i would appreciate your co-operation in furthur =
isolating the=20
problem .</SPAN></FONT></DIV>
<DIV><FONT face=3DArial color=3D#0000ff size=3D2><SPAN=20
class=3D734170207-13022006>Regards</SPAN></FONT></DIV>
<DIV><FONT face=3DArial color=3D#0000ff size=3D2><SPAN=20
class=3D734170207-13022006>Deepak</SPAN></FONT></DIV>
<BLOCKQUOTE dir=3Dltr style=3D"MARGIN-RIGHT: 0px">
  <DIV></DIV>
  <DIV class=3DOutlookMessageHeader lang=3Den-us dir=3Dltr =
align=3Dleft><FONT=20
  face=3DTahoma size=3D2>-----Original Message-----<BR><B>From:</B>=20
  linux-lvm-bounces@redhat.com [mailto:linux-lvm-bounces@redhat.com] =
<B>On=20
  Behalf Of </B>deepak.barua@wipro.com<BR><B>Sent:</B> Friday, February =
10, 2006=20
  7:08 PM<BR><B>To:</B> linux-lvm@redhat.com<BR><B>Subject:</B> =
[linux-lvm]=20
  Symbolic Link Related Query<BR><BR></FONT></DIV>
  <DIV><FONT face=3DArial color=3D#0000ff size=3D2></FONT>&nbsp;</DIV>
  <DIV></DIV>
  <DIV class=3DOutlookMessageHeader lang=3Den-us dir=3Dltr =
align=3Dleft><FONT=20
  face=3DTahoma size=3D2><BR></FONT>&nbsp;</DIV>
  <DIV><FONT face=3DArial size=3D2><SPAN class=3D953302406-03022006>Hi =
All=20
  </SPAN></FONT></DIV>
  <DIV><FONT face=3DArial size=3D2><SPAN=20
  class=3D953302406-03022006>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
I am=20
  facing a unique problem here in my workplace machine which run's =
on&nbsp;=20
  <FONT size=3D2>(redhat enterprise linux) 2.4.21-37.EL #1 SMP, i have =
the=20
  following LVM running</FONT></SPAN></FONT></DIV>
  <DIV><FONT size=3D+0><SPAN class=3D953302406-03022006>
  <P><FONT face=3DArial size=3D2>LVM module LVM version=20
  1.0.8-2(26/05/2004)</FONT></P>
  <P><FONT face=3DArial size=3D2>Total: 2 VGs 2 PVs 43 LVs (20 LVs open =
20=20
  times)</FONT></P>
  <P><FONT face=3DArial><FONT size=3D2>Global: 475792 bytes malloced IOP =
version: 10=20
  79 days 16:15:15 activ<SPAN=20
class=3D953302406-03022006>e</SPAN></FONT></FONT></P>
  <P><FONT face=3DArial><FONT size=3D2><SPAN =
class=3D953302406-03022006><STRONG>The=20
  basic problem is when i create a symbolic link the i-node number =
reamins the=20
  same as the original file i-node number , i don't know if it some=20
  configuration in the LVM's as they are pretty=20
  configurable.</STRONG></SPAN></FONT></FONT></P>
  <P><FONT face=3DArial><FONT size=3D2><SPAN =
class=3D953302406-03022006><STRONG>My=20
  Step's</STRONG></SPAN></FONT></FONT></P>
  <P><FONT face=3DArial><FONT size=3D2><SPAN =
class=3D953302406-03022006><FONT=20
  face=3D"Times New Roman" color=3D#ff0000>$ touch h<BR>$ ln h =
j</FONT><BR><FONT=20
  face=3D"Times New Roman" color=3D#ff0000>$ ln -s h k<BR>$ ls -i h j=20
  k<BR>&nbsp;176016 h&nbsp;&nbsp; 176016 j&nbsp;&nbsp; 176016=20
  k<BR>$</FONT><BR></SPAN></FONT></FONT></P>
  <P><FONT face=3DArial><FONT size=3D2><SPAN =
class=3D953302406-03022006><STRONG>You=20
  can see that the i-node number is same for all the original file the =
hard link=20
  and the soft link can this version of LVM do this kind of=20
  configuration.?</STRONG></SPAN></FONT></FONT></P>
  <P><FONT face=3DArial><FONT size=3D2><SPAN=20
  class=3D953302406-03022006><STRONG>Thank's In Advance=20
  </STRONG></SPAN></FONT></FONT></P>
  <P><FONT face=3DArial><FONT size=3D2><SPAN=20
  =
class=3D953302406-03022006><STRONG>Regards</STRONG></SPAN></FONT></FONT><=
/P>
  <P><FONT face=3DArial><FONT size=3D2><SPAN=20
  =
class=3D953302406-03022006><STRONG>Deepak</STRONG></SPAN></FONT></FONT></=
P>
  <P><FONT face=3DArial><FONT size=3D2><SPAN=20
  =
class=3D953302406-03022006><STRONG></STRONG>&nbsp;</P></SPAN></FONT></FON=
T>
  <P><FONT face=3DArial><FONT size=3D2><SPAN=20
  =
class=3D953302406-03022006><STRONG></STRONG></SPAN></FONT></FONT>&nbsp;</=
P>
  <P><FONT face=3DArial><FONT size=3D2><SPAN =
class=3D953302406-03022006>The other=20
  machine detail's from proc are listed below =
</SPAN></FONT></FONT></P><FONT=20
  face=3DArial><FONT size=3D2><SPAN class=3D953302406-03022006><FONT =
size=3D2>
  <P>Cat /proc/cpuinfo</P>
  <P>$ cat cpuinfo</P>
  <P>processor : 0</P>
  <P>vendor_id : GenuineIntel</P>
  <P>cpu family : 15</P>
  <P>model : 4</P>
  <P>model name : Intel(R) Xeon(TM) CPU 3.80GHz</P>
  <P>physical id : 0</P>
  <P>siblings : 2</P>
  <P>runqueue : 0</P>
  <P>stepping : 3</P>
  <P>cpu MHz : 3800.342</P>
  <P>cache size : 2048 KB</P>
  <P>fpu : yes</P>
  <P>fpu_exception : yes</P>
  <P>cpuid level : 5</P>
  <P>wp : yes</P>
  <P>flags : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca =
cmov pat=20
  pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm ferr syscall lm sse3 =
monit=20
  or ds-cpl gv3 tm2 cnxt-id</P>
  <P>bogomips : 7575.96</P>
  <P>clflush size : 64</P>
  <P>address sizes : 36 bits physical, 48 bits virtual</P>
  <P>power management:</P>
  <P>processor : 1</P>
  <P>vendor_id : GenuineIntel</P>
  <P>cpu family : 15</P>
  <P>model : 4</P>
  <P>model name : Intel(R) Xeon(TM) CPU 3.80GHz</P>
  <P>physical id : 3</P>
  <P>siblings : 2</P>
  <P>runqueue : 1</P>
  <P>stepping : 3</P>
  <P>cpu MHz : 3800.342</P>
  <P>cache size : 2048 KB</P>
  <P>fpu : yes</P>
  <P>fpu_exception : yes</P>
  <P>cpuid level : 5</P>
  <P>wp : yes</P>
  <P>flags : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca =
cmov pat=20
  pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm ferr syscall lm sse3 =
monit=20
  or ds-cpl gv3 tm2 cnxt-id</P>
  <P>bogomips : 7575.96</P>
  <P>clflush size : 64</P>
  <P>address sizes : 36 bits physical, 48 bits virtual</P>
  <P>power management:</P>
  <P>processor : 2</P>
  <P>vendor_id : GenuineIntel</P>
  <P>cpu family : 15</P>
  <P>model : 4</P>
  <P>model name : Intel(R) Xeon(TM) CPU 3.80GHz</P>
  <P>physical id : 0</P>
  <P>siblings : 2</P>
  <P>runqueue : 0</P>
  <P>stepping : 3</P>
  <P>cpu MHz : 3800.342</P>
  <P>cache size : 2048 KB</P>
  <P>fpu : yes</P>
  <P>fpu_exception : yes</P>
  <P>cpuid level : 5</P>
  <P>wp : yes</P>
  <P>flags : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca =
cmov pat=20
  pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm ferr syscall lm sse3 =
monit=20
  or ds-cpl gv3 tm2 cnxt-id</P>
  <P>bogomips : 7575.96</P>
  <P>clflush size : 64</P>
  <P>address sizes : 36 bits physical, 48 bits virtual</P>
  <P>power management:</P>
  <P>processor : 3</P>
  <P>vendor_id : GenuineIntel</P>
  <P>cpu family : 15</P>
  <P>model : 4</P>
  <P>model name : Intel(R) Xeon(TM) CPU 3.80GHz</P>
  <P>physical id : 3</P>
  <P>siblings : 2</P>
  <P>runqueue : 1</P>
  <P>stepping : 3</P>
  <P>cpu MHz : 3800.342</P>
  <P>cache size : 2048 KB</P>
  <P>fpu : yes</P>
  <P>fpu_exception : yes</P>
  <P>cpuid level : 5</P>
  <P>wp : yes</P>
  <P>flags : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca =
cmov pat=20
  pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm ferr syscall lm sse3 =
monit=20
  or ds-cpl gv3 tm2 cnxt-id</P>
  <P>bogomips : 7575.96</P>
  <P>clflush size : 64</P>
  <P>address sizes : 36 bits physical, 48 bits virtual</P>
  <P>power management:</P>
  <P>&nbsp;</P>
  <P>$ cat filesystems</P>
  <P>nodev rootfs</P>
  <P>nodev bdev</P>
  <P>nodev proc</P>
  <P>nodev sockfs</P>
  <P>nodev tmpfs</P>
  <P>nodev shm</P>
  <P>nodev pipefs</P>
  <P>ext2</P>
  <P>nodev ramfs</P>
  <P>nodev hugetlbfs</P>
  <P>iso9660</P>
  <P>nodev devpts</P>
  <P>ext3</P>
  <P>nodev usbdevfs</P>
  <P>nodev usbfs</P>
  <P>nodev autofs</P>
  <P>vfat</P>
  <P>udf</P>
  <P>nodev nfs</P>
  <P>&nbsp;</P>
  <P>$ cat partitions</P>
  <P>major minor #blocks name rio rmerge rsect ruse wio wmerge wsect =
wuse=20
  running use aveq</P>
  <P>58 0 516096 lvma 0 0 0 0 0 0 0 0 0 0 0</P>
  <P>58 1 10240000 lvmb 0 0 0 0 0 0 0 0 0 0 0</P>
  <P>58 2 512000 lvmc 0 0 0 0 0 0 0 0 0 0 0</P>
  <P>58 3 1024000 lvmd 0 0 0 0 0 0 0 0 0 0 0</P>
  <P>58 4 5120000 lvme 0 0 0 0 0 0 0 0 0 0 0</P>
  <P>58 5 4096000 lvmf 0 0 0 0 0 0 0 0 0 0 0</P>
  <P>58 6 512000 lvmg 0 0 0 0 0 0 0 0 0 0 0</P>
  <P>58 7 716800 lvmh 0 0 0 0 0 0 0 0 0 0 0</P>
  <P>58 8 2048000 lvmi 0 0 0 0 0 0 0 0 0 0 0</P>
  <P>58 9 1024000 lvmj 0 0 0 0 0 0 0 0 0 0 0</P>
  <P>58 10 2048000 lvmk 0 0 0 0 0 0 0 0 0 0 0</P>
  <P>58 11 7168000 lvml 0 0 0 0 0 0 0 0 0 0 0</P>
  <P>58 12 819200 lvmm 0 0 0 0 0 0 0 0 0 0 0</P>
  <P>58 13 10240000 lvmn 0 0 0 0 0 0 0 0 0 0 0</P>
  <P>58 14 10240000 lvmo 0 0 0 0 0 0 0 0 0 0 0</P>
  <P>58 15 1581056 lvmp 0 0 0 0 0 0 0 0 0 0 0</P>
  <P>58 16 102400 lvmq 0 0 0 0 0 0 0 0 0 0 0</P>
  <P>58 17 102400 lvmr 0 0 0 0 0 0 0 0 0 0 0</P>
  <P>58 18 102400 lvms 0 0 0 0 0 0 0 0 0 0 0</P>
  <P>58 19 102400 lvmt 0 0 0 0 0 0 0 0 0 0 0</P>
  <P>58 20 53248 lvmu 0 0 0 0 0 0 0 0 0 0 0</P>
  <P>58 21 102400 lvmv 0 0 0 0 0 0 0 0 0 0 0</P>
  <P>58 22 180224 lvmw 0 0 0 0 0 0 0 0 0 0 0</P>
  <P>58 23 77824 lvmx 0 0 0 0 0 0 0 0 0 0 0</P>
  <P>58 24 307200 lvmy 0 0 0 0 0 0 0 0 0 0 0</P>
  <P>58 25 307200 lvmz 0 0 0 0 0 0 0 0 0 0 0</P>
  <P>58 26 180224 lvm{ 0 0 0 0 0 0 0 0 0 0 0</P>
  <P>58 27 180224 lvm| 0 0 0 0 0 0 0 0 0 0 0</P>
  <P>58 28 180224 lvm} 0 0 0 0 0 0 0 0 0 0 0</P>
  <P>58 29 53248 lvm~ 0 0 0 0 0 0 0 0 0 0 0</P>
  <P>58 30 53248 lv 0 0 0 0 0 0 0 0 0 0 0</P>
  <P>58 31 53248 lvm 0 0 0 0 0 0 0 0 0 0 0</P>
  <P>58 32 53248 lvm 0 0 0 0 0 0 0 0 0 0 0</P>
  <P>58 33 53248 lvm 0 0 0 0 0 0 0 0 0 0 0</P>
  <P>58 34 53248 lvm 0 0 0 0 0 0 0 0 0 0 0</P>
  <P>58 35 548864 lvm</P>
  <P>0 0 0 0 0 0 0 0 0 0 0</P>
  <P>58 36 286720 lvm</P>
  <P>0 0 0 0 0 0 0 0 0 0 0</P>
  <P>58 37 286720 lvm 0 0 0 0 0 0 0 0 0 0 0</P>
  <P>58 38 262144 lvm 0 0 0 0 0 0 0 0 0 0 0</P>
  <P>58 39 51200000 lvm 0 0 0 0 0 0 0 0 0 0 0</P>
  <P>58 40 3072000 lvm 0 0 0 0 0 0 0 0 0 0 0</P>
  <P>58 41 3072000 lvm 0 0 0 0 0 0 0 0 0 0 0</P>
  <P>58 42 5120000 lvm 0 0 0 0 0 0 0 0 0 0 0</P>
  <P>8 0 40986624 sda 1961725 2015893 27022764 17458480 15681142 6125806 =

  123811888 25062727 0 5751090 42587897</P>
  <P>8 1 204784 sda1 3645 27773 62836 78090 897 369 2532 35100 0 29790=20
113190</P>
  <P>8 2 40781824 sda2 1958053 1988015 26959664 17380360 15680245 =
6125437=20
  123809356 25027677 0 5740860 42474547</P>
  <P>8 16 245760000 sdb 149842410 88015370 1895282582 12721644 170899976 =

  88685576 2054639674 2879121 0 34958021 15936396</P>
  <P>8 17 245759984 sdb1 149842392 88015301 1895282406 12723394 =
170899976=20
  88685576 2054639674 2880291 0 34955871 15923066</P>
  <P>3 0 9977152 hda 31 30 150 6300 0 0 0 0 0 6300 6300</P>
  <P>&nbsp;</P>
  <P>&nbsp;</P>
  <P>$ cat global</P>
  <P>LVM module LVM version 1.0.8-2(26/05/2004)</P>
  <P>Total: 2 VGs 2 PVs 43 LVs (20 LVs open 20 times)</P>
  <P>Global: 475792 bytes malloced IOP version: 10 79 days 16:15:15 =
active</P>
  <P>VG: vg00 [1 PV, 7 LV/7 open] PE Size: 8192 KB</P>
  <P>Usage [KB/PE]: 40771584 /4977 total 22839296 /2788 used 17932288 =
/2189=20
  free</P>
  <P>PV: [AA] sda2 40771584 /4977 22839296 /2788 17932288 /2189</P>
  <P>LVs: [AWDL ] root 516096 /63 1x open</P>
  <P>[AWDL ] opt 1024000 /125 1x open</P>
  <P>[AWDL ] tmp 1024000 /125 1x open</P>
  <P>[AWDL ] users 2048000 /250 1x open</P>
  <P>[AWDL ] usr 7168000 /875 1x open</P>
  <P>[AWDL ] var 819200 /100 1x open</P>
  <P>[AWDL ] swap1 10240000 /1250 1x open</P>
  <P>VG: vg01 [1 PV, 36 LV/13 open] PE Size: 4096 KB</P>
  <P>Usage [KB/PE]: 245751808 /59998 total 101212160 /24710 used =
144539648=20
  /35288 free</P>
  <P>PV: [AA] sdb1 245751808 /59998 101212160 /24710 144539648 =
/35288</P>
  <P>LVs: [AWDL ] export_linuxport 10240000 /2500 1x open</P>
  <P>[AWDL ] galaxy 512000 /125 1x open</P>
  <P>[AWDL ] opt_force_oradat 5120000 /1250 1x open</P>
  <P>[AWDL ] oracl9207 4096000 /1000 1x open</P>
  <P>[AWDL ] rougewave8 512000 /125 1x open</P>
  <P>[AWDL ] visibrokerbes65p 716800 /175 1x open</P>
  <P>[AWDL ] rdbmsLog_f91lnx 2048000 /500 1x open</P>
  <P>[AWDL ] lv_xbflnxpt 10240000 /2500 1x open</P>
  <P>[AWDL ] rdbmsLog_xbflnxpt 1581056 /386 1x open</P>
  <P>[AWDL ] xbflnxpt_temp1 102400 /25 close</P>
  <P>[AWDL ] xbflnxpt_user_temp1 102400 /25 close</P>
  <P>[AWDL ] xbflnxpt_user_temp2 102400 /25 close</P>
  <P>[AWDL ] xbflnxpt_user_temp3 102400 /25 close</P>
  <P>[AWDL ] xbflnxpt_ftr_data1 53248 /13 close</P>
  <P>[AWDL ] xbflnxpt_queue1 102400 /25 close</P>
  <P>[AWDL ] xbflnxpt_ref_data1 180224 /44 close</P>
  <P>[AWDL ] xbflnxpt_wl_data1 77824 /19 close</P>
  <P>[AWDL ] xbflnxpt_wr_data1 307200 /75 close</P>
  <P>[AWDL ] xbflnxpt_wr_data2 307200 /75 close</P>
  <P>[AWDL ] xbflnxpt_rbs1 180224 /44 close</P>
  <P>[AWDL ] xbflnxpt_rbs2 180224 /44 close</P>
  <P>[AWDL ] xbflnxpt_rbs3 180224 /44 close</P>
  <P>[AWDL ] xbflnxpt_redoLog1 53248 /13 close</P>
  <P>[AWDL ] xbflnxpt_redoLog1m 53248 /13 close</P>
  <P>[AWDL ] xbflnxpt_redoLog2 53248 /13 close</P>
  <P>[AWDL ] xbflnxpt_redoLog2m 53248 /13 close</P>
  <P>[AWDL ] xbflnxpt_redoLog3 53248 /13 close</P>
  <P>[AWDL ] xbflnxpt_redoLog3m 53248 /13 close</P>
  <P>[AWDL ] xbflnxpt_syst 548864 /134 close</P>
  <P>[AWDL ] xbflnxpt_index1 286720 /70 close</P>
  <P>[AWDL ] xbflnxpt_index2_data1 286720 /70 close</P>
  <P>[AWDL ] xbflnxpt_hist_data1 262144 /64 close</P>
  <P>[AWDL ] opt_sysp_frc1_xbf_databases</P>
  <P>51200000 /12500 1x open</P>
  <P>[AWDL ] opt_sysp_frc1 3072000 /750 1x open</P>
  <P>[AWDL ] opt_app_frc1 3072000 /750 1x open</P>
  <P>[AWDL ] rdbmsLog_frc1 5120000 /1250 1x=20
  open</P></FONT></SPAN></FONT></FONT></SPAN></FONT></DIV>
  <DIV><FONT face=3DArial size=3D2><SPAN=20
  =
class=3D953302406-03022006></SPAN></FONT>&nbsp;</DIV></BLOCKQUOTE></BODY>=
</HTML>

------_=_NextPart_002_01C6306A.9FE7741B--

------_=_NextPart_001_01C6306A.9FE7741B
Content-Type: application/octet-stream;
	name="ls.trace"
Content-Transfer-Encoding: base64
Content-Description: ls.trace
Content-Disposition: attachment;
	filename="ls.trace"

ZXhlY3ZlKCIvYmluL2xzIiwgWyIvYmluL2xzIiwgIi1pIiwgImgiLCAiaiIsICJrIl0sIFsvKiA1
MyB2YXJzICovXSkgPSAwCnVuYW1lKHtzeXM9IkxpbnV4Iiwgbm9kZT0idGhvciIsIC4uLn0pICA9
IDAKYnJrKDApICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgID0gMHg1MTMwMDAKbW1h
cChOVUxMLCA0MDk2LCBQUk9UX1JFQUR8UFJPVF9XUklURSwgTUFQX1BSSVZBVEV8TUFQX0FOT05Z
TU9VUywgLTEsIDApID0gMHgyYTk1NjZjMDAwCm9wZW4oIi9ldGMvbGQuc28ucHJlbG9hZCIsIE9f
UkRPTkxZKSAgICA9IC0xIEVOT0VOVCAoTm8gc3VjaCBmaWxlIG9yIGRpcmVjdG9yeSkKb3Blbigi
L29wdC94YmZsbnhwdC9tdy94YmIvNV83X0xOWC9saWIvdGxzL3g4Nl82NC9saWJhY2wuc28uMSIs
IE9fUkRPTkxZKSA9IC0xIEVOT0VOVCAoTm8gc3VjaCBmaWxlIG9yIGRpcmVjdG9yeSkKc3RhdCgi
L29wdC94YmZsbnhwdC9tdy94YmIvNV83X0xOWC9saWIvdGxzL3g4Nl82NCIsIDB4N2ZiZmZmYTZk
MCkgPSAtMSBFTk9FTlQgKE5vIHN1Y2ggZmlsZSBvciBkaXJlY3RvcnkpCm9wZW4oIi9vcHQveGJm
bG54cHQvbXcveGJiLzVfN19MTlgvbGliL3Rscy9saWJhY2wuc28uMSIsIE9fUkRPTkxZKSA9IC0x
IEVOT0VOVCAoTm8gc3VjaCBmaWxlIG9yIGRpcmVjdG9yeSkKc3RhdCgiL29wdC94YmZsbnhwdC9t
dy94YmIvNV83X0xOWC9saWIvdGxzIiwgMHg3ZmJmZmZhNmQwKSA9IC0xIEVOT0VOVCAoTm8gc3Vj
aCBmaWxlIG9yIGRpcmVjdG9yeSkKb3BlbigiL29wdC94YmZsbnhwdC9tdy94YmIvNV83X0xOWC9s
aWIveDg2XzY0L2xpYmFjbC5zby4xIiwgT19SRE9OTFkpID0gLTEgRU5PRU5UIChObyBzdWNoIGZp
bGUgb3IgZGlyZWN0b3J5KQpzdGF0KCIvb3B0L3hiZmxueHB0L213L3hiYi81XzdfTE5YL2xpYi94
ODZfNjQiLCAweDdmYmZmZmE2ZDApID0gLTEgRU5PRU5UIChObyBzdWNoIGZpbGUgb3IgZGlyZWN0
b3J5KQpvcGVuKCIvb3B0L3hiZmxueHB0L213L3hiYi81XzdfTE5YL2xpYi9saWJhY2wuc28uMSIs
IE9fUkRPTkxZKSA9IC0xIEVOT0VOVCAoTm8gc3VjaCBmaWxlIG9yIGRpcmVjdG9yeSkKc3RhdCgi
L29wdC94YmZsbnhwdC9tdy94YmIvNV83X0xOWC9saWIiLCB7c3RfbW9kZT1TX0lGRElSfDA3NTUs
IHN0X3NpemU9NDA5NiwgLi4ufSkgPSAwCm9wZW4oIi9vcHQveGJmbG54cHQvbXcvU3lzUGlsb3Qv
aW5zdGFuY2VzL3hiZmxueHB0L2xpYi90bHMveDg2XzY0L2xpYmFjbC5zby4xIiwgT19SRE9OTFkp
ID0gLTEgRU5PRU5UIChObyBzdWNoIGZpbGUgb3IgZGlyZWN0b3J5KQpzdGF0KCIvb3B0L3hiZmxu
eHB0L213L1N5c1BpbG90L2luc3RhbmNlcy94YmZsbnhwdC9saWIvdGxzL3g4Nl82NCIsIDB4N2Zi
ZmZmYTZkMCkgPSAtMSBFTk9FTlQgKE5vIHN1Y2ggZmlsZSBvciBkaXJlY3RvcnkpCm9wZW4oIi9v
cHQveGJmbG54cHQvbXcvU3lzUGlsb3QvaW5zdGFuY2VzL3hiZmxueHB0L2xpYi90bHMvbGliYWNs
LnNvLjEiLCBPX1JET05MWSkgPSAtMSBFTk9FTlQgKE5vIHN1Y2ggZmlsZSBvciBkaXJlY3Rvcnkp
CnN0YXQoIi9vcHQveGJmbG54cHQvbXcvU3lzUGlsb3QvaW5zdGFuY2VzL3hiZmxueHB0L2xpYi90
bHMiLCAweDdmYmZmZmE2ZDApID0gLTEgRU5PRU5UIChObyBzdWNoIGZpbGUgb3IgZGlyZWN0b3J5
KQpvcGVuKCIvb3B0L3hiZmxueHB0L213L1N5c1BpbG90L2luc3RhbmNlcy94YmZsbnhwdC9saWIv
eDg2XzY0L2xpYmFjbC5zby4xIiwgT19SRE9OTFkpID0gLTEgRU5PRU5UIChObyBzdWNoIGZpbGUg
b3IgZGlyZWN0b3J5KQpzdGF0KCIvb3B0L3hiZmxueHB0L213L1N5c1BpbG90L2luc3RhbmNlcy94
YmZsbnhwdC9saWIveDg2XzY0IiwgMHg3ZmJmZmZhNmQwKSA9IC0xIEVOT0VOVCAoTm8gc3VjaCBm
aWxlIG9yIGRpcmVjdG9yeSkKb3BlbigiL29wdC94YmZsbnhwdC9tdy9TeXNQaWxvdC9pbnN0YW5j
ZXMveGJmbG54cHQvbGliL2xpYmFjbC5zby4xIiwgT19SRE9OTFkpID0gLTEgRU5PRU5UIChObyBz
dWNoIGZpbGUgb3IgZGlyZWN0b3J5KQpzdGF0KCIvb3B0L3hiZmxueHB0L213L1N5c1BpbG90L2lu
c3RhbmNlcy94YmZsbnhwdC9saWIiLCB7c3RfbW9kZT1TX0lGRElSfDA3NTUsIHN0X3NpemU9NDA5
NiwgLi4ufSkgPSAwCm9wZW4oIi9vcHQvdmVuZG9yL3Zicm9rZXIvYmVzLTYuNS9saWIvdGxzL3g4
Nl82NC9saWJhY2wuc28uMSIsIE9fUkRPTkxZKSA9IC0xIEVOT0VOVCAoTm8gc3VjaCBmaWxlIG9y
IGRpcmVjdG9yeSkKc3RhdCgiL29wdC92ZW5kb3IvdmJyb2tlci9iZXMtNi41L2xpYi90bHMveDg2
XzY0IiwgMHg3ZmJmZmZhNmQwKSA9IC0xIEVOT0VOVCAoTm8gc3VjaCBmaWxlIG9yIGRpcmVjdG9y
eSkKb3BlbigiL29wdC92ZW5kb3IvdmJyb2tlci9iZXMtNi41L2xpYi90bHMvbGliYWNsLnNvLjEi
LCBPX1JET05MWSkgPSAtMSBFTk9FTlQgKE5vIHN1Y2ggZmlsZSBvciBkaXJlY3RvcnkpCnN0YXQo
Ii9vcHQvdmVuZG9yL3Zicm9rZXIvYmVzLTYuNS9saWIvdGxzIiwgMHg3ZmJmZmZhNmQwKSA9IC0x
IEVOT0VOVCAoTm8gc3VjaCBmaWxlIG9yIGRpcmVjdG9yeSkKb3BlbigiL29wdC92ZW5kb3IvdmJy
b2tlci9iZXMtNi41L2xpYi94ODZfNjQvbGliYWNsLnNvLjEiLCBPX1JET05MWSkgPSAtMSBFTk9F
TlQgKE5vIHN1Y2ggZmlsZSBvciBkaXJlY3RvcnkpCnN0YXQoIi9vcHQvdmVuZG9yL3Zicm9rZXIv
YmVzLTYuNS9saWIveDg2XzY0IiwgMHg3ZmJmZmZhNmQwKSA9IC0xIEVOT0VOVCAoTm8gc3VjaCBm
aWxlIG9yIGRpcmVjdG9yeSkKb3BlbigiL29wdC92ZW5kb3IvdmJyb2tlci9iZXMtNi41L2xpYi9s
aWJhY2wuc28uMSIsIE9fUkRPTkxZKSA9IC0xIEVOT0VOVCAoTm8gc3VjaCBmaWxlIG9yIGRpcmVj
dG9yeSkKc3RhdCgiL29wdC92ZW5kb3IvdmJyb2tlci9iZXMtNi41L2xpYiIsIHtzdF9tb2RlPVNf
SUZESVJ8MDc3NSwgc3Rfc2l6ZT00MDk2LCAuLi59KSA9IDAKb3BlbigiL2V0Yy9sZC5zby5jYWNo
ZSIsIE9fUkRPTkxZKSAgICAgID0gMwpmc3RhdCgzLCB7c3RfbW9kZT1TX0lGUkVHfDA2NDQsIHN0
X3NpemU9OTg2OTcsIC4uLn0pID0gMAptbWFwKE5VTEwsIDk4Njk3LCBQUk9UX1JFQUQsIE1BUF9Q
UklWQVRFLCAzLCAwKSA9IDB4MmE5NTY2ZDAwMApjbG9zZSgzKSAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgPSAwCm9wZW4oIi9saWI2NC9saWJhY2wuc28uMSIsIE9fUkRPTkxZKSAgICA9
IDMKcmVhZCgzLCAiXDE3N0VMRlwyXDFcMVwwXDBcMFwwXDBcMFwwXDBcMFwzXDA+XDBcMVwwXDBc
MEBcMzNcMFwwIi4uLiwgNjQwKSA9IDY0MApmc3RhdCgzLCB7c3RfbW9kZT1TX0lGUkVHfDA2NDQs
IHN0X3NpemU9MjQyMDgsIC4uLn0pID0gMAptbWFwKE5VTEwsIDEwNzEwMzIsIFBST1RfUkVBRHxQ
Uk9UX0VYRUMsIE1BUF9QUklWQVRFLCAzLCAwKSA9IDB4MmE5NTY4NjAwMAptcHJvdGVjdCgweDJh
OTU2OGMwMDAsIDEwNDY0NTYsIFBST1RfTk9ORSkgPSAwCm1tYXAoMHgyYTk1NzhiMDAwLCA0MDk2
LCBQUk9UX1JFQUR8UFJPVF9XUklURSwgTUFQX1BSSVZBVEV8TUFQX0ZJWEVELCAzLCAweDUwMDAp
ID0gMHgyYTk1NzhiMDAwCmNsb3NlKDMpICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA9
IDAKbXByb3RlY3QoMHg3ZmJmZmZiMDAwLCA0MDk2LCBQUk9UX1JFQUR8UFJPVF9XUklURXxQUk9U
X0VYRUN8UFJPVF9HUk9XU0RPV04pID0gMApvcGVuKCIvb3B0L3hiZmxueHB0L213L3hiYi81Xzdf
TE5YL2xpYi9saWJ0ZXJtY2FwLnNvLjIiLCBPX1JET05MWSkgPSAtMSBFTk9FTlQgKE5vIHN1Y2gg
ZmlsZSBvciBkaXJlY3RvcnkpCm9wZW4oIi9vcHQveGJmbG54cHQvbXcvU3lzUGlsb3QvaW5zdGFu
Y2VzL3hiZmxueHB0L2xpYi9saWJ0ZXJtY2FwLnNvLjIiLCBPX1JET05MWSkgPSAtMSBFTk9FTlQg
KE5vIHN1Y2ggZmlsZSBvciBkaXJlY3RvcnkpCm9wZW4oIi9vcHQvdmVuZG9yL3Zicm9rZXIvYmVz
LTYuNS9saWIvbGlidGVybWNhcC5zby4yIiwgT19SRE9OTFkpID0gLTEgRU5PRU5UIChObyBzdWNo
IGZpbGUgb3IgZGlyZWN0b3J5KQpvcGVuKCIvbGliNjQvbGlidGVybWNhcC5zby4yIiwgT19SRE9O
TFkpID0gMwpyZWFkKDMsICJcMTc3RUxGXDJcMVwxXDBcMFwwXDBcMFwwXDBcMFwwXDNcMD5cMFwx
XDBcMFwwXDIwMFwyM1wwIi4uLiwgNjQwKSA9IDY0MApmc3RhdCgzLCB7c3RfbW9kZT1TX0lGUkVH
fDA3NTUsIHN0X3NpemU9MTUwNDAsIC4uLn0pID0gMAptbWFwKE5VTEwsIDEwNjE5NjgsIFBST1Rf
UkVBRHxQUk9UX0VYRUMsIE1BUF9QUklWQVRFLCAzLCAwKSA9IDB4MmE5NTc4YzAwMAptcHJvdGVj
dCgweDJhOTU3OTAwMDAsIDEwNDU1ODQsIFBST1RfTk9ORSkgPSAwCm1tYXAoMHgyYTk1ODhmMDAw
LCA0MDk2LCBQUk9UX1JFQUR8UFJPVF9XUklURSwgTUFQX1BSSVZBVEV8TUFQX0ZJWEVELCAzLCAw
eDMwMDApID0gMHgyYTk1ODhmMDAwCmNsb3NlKDMpICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICA9IDAKb3BlbigiL29wdC94YmZsbnhwdC9tdy94YmIvNV83X0xOWC9saWIvbGliYy5zby42
IiwgT19SRE9OTFkpID0gLTEgRU5PRU5UIChObyBzdWNoIGZpbGUgb3IgZGlyZWN0b3J5KQpvcGVu
KCIvb3B0L3hiZmxueHB0L213L1N5c1BpbG90L2luc3RhbmNlcy94YmZsbnhwdC9saWIvbGliYy5z
by42IiwgT19SRE9OTFkpID0gLTEgRU5PRU5UIChObyBzdWNoIGZpbGUgb3IgZGlyZWN0b3J5KQpv
cGVuKCIvb3B0L3ZlbmRvci92YnJva2VyL2Jlcy02LjUvbGliL2xpYmMuc28uNiIsIE9fUkRPTkxZ
KSA9IC0xIEVOT0VOVCAoTm8gc3VjaCBmaWxlIG9yIGRpcmVjdG9yeSkKb3BlbigiL2xpYjY0L3Rs
cy9saWJjLnNvLjYiLCBPX1JET05MWSkgID0gMwpyZWFkKDMsICJcMTc3RUxGXDJcMVwxXDBcMFww
XDBcMFwwXDBcMFwwXDNcMD5cMFwxXDBcMFwwXDIwMFwzMjIiLi4uLCA2NDApID0gNjQwCmZzdGF0
KDMsIHtzdF9tb2RlPVNfSUZSRUd8MDc1NSwgc3Rfc2l6ZT0xNjY5NzI4LCAuLi59KSA9IDAKbW1h
cChOVUxMLCA0MDk2LCBQUk9UX1JFQUR8UFJPVF9XUklURSwgTUFQX1BSSVZBVEV8TUFQX0FOT05Z
TU9VUywgLTEsIDApID0gMHgyYTk1ODkwMDAwCm1tYXAoTlVMTCwgMjM3NjA0MCwgUFJPVF9SRUFE
fFBST1RfRVhFQywgTUFQX1BSSVZBVEUsIDMsIDApID0gMHgyYTk1ODkxMDAwCm1wcm90ZWN0KDB4
MmE5NTljZDAwMCwgMTA4MTcwNCwgUFJPVF9OT05FKSA9IDAKbW1hcCgweDJhOTVhY2MwMDAsIDIw
NDgwLCBQUk9UX1JFQUR8UFJPVF9XUklURSwgTUFQX1BSSVZBVEV8TUFQX0ZJWEVELCAzLCAweDEz
YjAwMCkgPSAweDJhOTVhY2MwMDAKbW1hcCgweDJhOTVhZDEwMDAsIDE2NzQ0LCBQUk9UX1JFQUR8
UFJPVF9XUklURSwgTUFQX1BSSVZBVEV8TUFQX0ZJWEVEfE1BUF9BTk9OWU1PVVMsIC0xLCAwKSA9
IDB4MmE5NWFkMTAwMApjbG9zZSgzKSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPSAw
Cm9wZW4oIi9vcHQveGJmbG54cHQvbXcveGJiLzVfN19MTlgvbGliL2xpYmF0dHIuc28uMSIsIE9f
UkRPTkxZKSA9IC0xIEVOT0VOVCAoTm8gc3VjaCBmaWxlIG9yIGRpcmVjdG9yeSkKb3BlbigiL29w
dC94YmZsbnhwdC9tdy9TeXNQaWxvdC9pbnN0YW5jZXMveGJmbG54cHQvbGliL2xpYmF0dHIuc28u
MSIsIE9fUkRPTkxZKSA9IC0xIEVOT0VOVCAoTm8gc3VjaCBmaWxlIG9yIGRpcmVjdG9yeSkKb3Bl
bigiL29wdC92ZW5kb3IvdmJyb2tlci9iZXMtNi41L2xpYi9saWJhdHRyLnNvLjEiLCBPX1JET05M
WSkgPSAtMSBFTk9FTlQgKE5vIHN1Y2ggZmlsZSBvciBkaXJlY3RvcnkpCm9wZW4oIi9saWI2NC9s
aWJhdHRyLnNvLjEiLCBPX1JET05MWSkgICA9IDMKcmVhZCgzLCAiXDE3N0VMRlwyXDFcMVwwXDBc
MFwwXDBcMFwwXDBcMFwzXDA+XDBcMVwwXDBcMEBcMTdcMFwwIi4uLiwgNjQwKSA9IDY0MApmc3Rh
dCgzLCB7c3RfbW9kZT1TX0lGUkVHfDA2NDQsIHN0X3NpemU9MTA2NDgsIC4uLn0pID0gMAptbWFw
KE5VTEwsIDEwNTc0NzIsIFBST1RfUkVBRHxQUk9UX0VYRUMsIE1BUF9QUklWQVRFLCAzLCAwKSA9
IDB4MmE5NWFkNjAwMAptcHJvdGVjdCgweDJhOTVhZDgwMDAsIDEwNDkyODAsIFBST1RfTk9ORSkg
PSAwCm1tYXAoMHgyYTk1YmQ4MDAwLCA0MDk2LCBQUk9UX1JFQUR8UFJPVF9XUklURSwgTUFQX1BS
SVZBVEV8TUFQX0ZJWEVELCAzLCAweDIwMDApID0gMHgyYTk1YmQ4MDAwCmNsb3NlKDMpICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICA9IDAKbW1hcChOVUxMLCA0MDk2LCBQUk9UX1JFQUR8
UFJPVF9XUklURSwgTUFQX1BSSVZBVEV8TUFQX0FOT05ZTU9VUywgLTEsIDApID0gMHgyYTk1YmQ5
MDAwCmFyY2hfcHJjdGwoQVJDSF9TRVRfRlMsIDB4MmE5NWJkOTRjMCkgICA9IDAKbXVubWFwKDB4
MmE5NTY2ZDAwMCwgOTg2OTcpICAgICAgICAgICAgID0gMApicmsoMCkgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgPSAweDUxMzAwMApicmsoMHg1MzQwMDApICAgICAgICAgICAgICAg
ICAgICAgICAgICAgPSAweDUzNDAwMApicmsoMCkgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgPSAweDUzNDAwMApvcGVuKCIvdXNyL2xpYi9sb2NhbGUvbG9jYWxlLWFyY2hpdmUiLCBP
X1JET05MWSkgPSAzCmZzdGF0KDMsIHtzdF9tb2RlPVNfSUZSRUd8MDY0NCwgc3Rfc2l6ZT0zMjE0
ODk3NiwgLi4ufSkgPSAwCm1tYXAoTlVMTCwgMzIxNDg5NzYsIFBST1RfUkVBRCwgTUFQX1BSSVZB
VEUsIDMsIDApID0gMHgyYTk1YmRhMDAwCmNsb3NlKDMpICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICA9IDAKcnRfc2lnYWN0aW9uKFNJR1RFUk0sIHsweDQwMjMwMCwgW1RFUk1dLCBTQV9S
RVNUT1JFUnxTQV9SRVNUQVJULCAweDJhOTU4YzBhMjB9LCB7U0lHX0RGTH0sIDgpID0gMApydF9z
aWdhY3Rpb24oU0lHS0lMTCwgezB4NDAyMzAwLCBbS0lMTF0sIFNBX1JFU1RPUkVSfFNBX1JFU1RB
UlQsIDB4MmE5NThjMGEyMH0sIHtTSUdfREZMfSwgOCkgPSAtMSBFSU5WQUwgKEludmFsaWQgYXJn
dW1lbnQpCnJ0X3NpZ2FjdGlvbihTSUdTVE9QLCB7MHg0MDIzMDAsIFtTVE9QXSwgU0FfUkVTVE9S
RVJ8U0FfUkVTVEFSVCwgMHgyYTk1OGMwYTIwfSwge1NJR19ERkx9LCA4KSA9IC0xIEVJTlZBTCAo
SW52YWxpZCBhcmd1bWVudCkKaW9jdGwoMSwgU05EQ1RMX1RNUl9USU1FQkFTRSBvciBUQ0dFVFMs
IHtCMzg0MDAgb3Bvc3QgaXNpZyBpY2Fub24gZWNobyAuLi59KSA9IDAKaW9jdGwoMSwgVElPQ0dX
SU5TWiwge3dzX3Jvdz00NCwgd3NfY29sPTEyNSwgd3NfeHBpeGVsPTAsIHdzX3lwaXhlbD0wfSkg
PSAwCnN0YXQoImgiLCB7c3RfbW9kZT1TX0lGUkVHfDA2NDQsIHN0X3NpemU9MCwgLi4ufSkgPSAw
CnN0YXQoImoiLCB7c3RfbW9kZT1TX0lGUkVHfDA2NDQsIHN0X3NpemU9MCwgLi4ufSkgPSAwCnN0
YXQoImsiLCB7c3RfbW9kZT1TX0lGUkVHfDA2NDQsIHN0X3NpemU9MCwgLi4ufSkgPSAwCmZzdGF0
KDEsIHtzdF9tb2RlPVNfSUZDSFJ8MDYyMCwgc3RfcmRldj1tYWtlZGV2KDEzNiwgMyksIC4uLn0p
ID0gMAptbWFwKE5VTEwsIDQwOTYsIFBST1RfUkVBRHxQUk9UX1dSSVRFLCBNQVBfUFJJVkFURXxN
QVBfQU5PTllNT1VTLCAtMSwgMCkgPSAweDJhOTU2NmQwMDAKd3JpdGUoMSwgIiAxNzYwMTYgaCAg
IDE3NjAxNiBqICAgMTc2MDE2IGtcbiIsIDMyKSA9IDMyCm11bm1hcCgweDJhOTU2NmQwMDAsIDQw
OTYpICAgICAgICAgICAgICA9IDAKZXhpdF9ncm91cCgwKSAgICAgICAgICAgICAgICAgICAgICAg
ICAgID0gPwo=

------_=_NextPart_001_01C6306A.9FE7741B
Content-Type: application/octet-stream;
	name="stat.trace"
Content-Transfer-Encoding: base64
Content-Description: stat.trace
Content-Disposition: attachment;
	filename="stat.trace"

ZXhlY3ZlKCIvdXNyL2Jpbi9zdGF0IiwgWyJzdGF0IiwgImgiLCAiaiIsICJrIl0sIFsvKiA1MyB2
YXJzICovXSkgPSAwCnVuYW1lKHtzeXM9IkxpbnV4Iiwgbm9kZT0idGhvciIsIC4uLn0pICA9IDAK
YnJrKDApICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgID0gMHg1MDgwMDAKbW1hcChO
VUxMLCA0MDk2LCBQUk9UX1JFQUR8UFJPVF9XUklURSwgTUFQX1BSSVZBVEV8TUFQX0FOT05ZTU9V
UywgLTEsIDApID0gMHgyYTk1NjZjMDAwCm9wZW4oIi9ldGMvbGQuc28ucHJlbG9hZCIsIE9fUkRP
TkxZKSAgICA9IC0xIEVOT0VOVCAoTm8gc3VjaCBmaWxlIG9yIGRpcmVjdG9yeSkKb3BlbigiL29w
dC94YmZsbnhwdC9tdy94YmIvNV83X0xOWC9saWIvdGxzL3g4Nl82NC9saWJjLnNvLjYiLCBPX1JE
T05MWSkgPSAtMSBFTk9FTlQgKE5vIHN1Y2ggZmlsZSBvciBkaXJlY3RvcnkpCnN0YXQoIi9vcHQv
eGJmbG54cHQvbXcveGJiLzVfN19MTlgvbGliL3Rscy94ODZfNjQiLCAweDdmYmZmZmE5ZTApID0g
LTEgRU5PRU5UIChObyBzdWNoIGZpbGUgb3IgZGlyZWN0b3J5KQpvcGVuKCIvb3B0L3hiZmxueHB0
L213L3hiYi81XzdfTE5YL2xpYi90bHMvbGliYy5zby42IiwgT19SRE9OTFkpID0gLTEgRU5PRU5U
IChObyBzdWNoIGZpbGUgb3IgZGlyZWN0b3J5KQpzdGF0KCIvb3B0L3hiZmxueHB0L213L3hiYi81
XzdfTE5YL2xpYi90bHMiLCAweDdmYmZmZmE5ZTApID0gLTEgRU5PRU5UIChObyBzdWNoIGZpbGUg
b3IgZGlyZWN0b3J5KQpvcGVuKCIvb3B0L3hiZmxueHB0L213L3hiYi81XzdfTE5YL2xpYi94ODZf
NjQvbGliYy5zby42IiwgT19SRE9OTFkpID0gLTEgRU5PRU5UIChObyBzdWNoIGZpbGUgb3IgZGly
ZWN0b3J5KQpzdGF0KCIvb3B0L3hiZmxueHB0L213L3hiYi81XzdfTE5YL2xpYi94ODZfNjQiLCAw
eDdmYmZmZmE5ZTApID0gLTEgRU5PRU5UIChObyBzdWNoIGZpbGUgb3IgZGlyZWN0b3J5KQpvcGVu
KCIvb3B0L3hiZmxueHB0L213L3hiYi81XzdfTE5YL2xpYi9saWJjLnNvLjYiLCBPX1JET05MWSkg
PSAtMSBFTk9FTlQgKE5vIHN1Y2ggZmlsZSBvciBkaXJlY3RvcnkpCnN0YXQoIi9vcHQveGJmbG54
cHQvbXcveGJiLzVfN19MTlgvbGliIiwge3N0X21vZGU9U19JRkRJUnwwNzU1LCBzdF9zaXplPTQw
OTYsIC4uLn0pID0gMApvcGVuKCIvb3B0L3hiZmxueHB0L213L1N5c1BpbG90L2luc3RhbmNlcy94
YmZsbnhwdC9saWIvdGxzL3g4Nl82NC9saWJjLnNvLjYiLCBPX1JET05MWSkgPSAtMSBFTk9FTlQg
KE5vIHN1Y2ggZmlsZSBvciBkaXJlY3RvcnkpCnN0YXQoIi9vcHQveGJmbG54cHQvbXcvU3lzUGls
b3QvaW5zdGFuY2VzL3hiZmxueHB0L2xpYi90bHMveDg2XzY0IiwgMHg3ZmJmZmZhOWUwKSA9IC0x
IEVOT0VOVCAoTm8gc3VjaCBmaWxlIG9yIGRpcmVjdG9yeSkKb3BlbigiL29wdC94YmZsbnhwdC9t
dy9TeXNQaWxvdC9pbnN0YW5jZXMveGJmbG54cHQvbGliL3Rscy9saWJjLnNvLjYiLCBPX1JET05M
WSkgPSAtMSBFTk9FTlQgKE5vIHN1Y2ggZmlsZSBvciBkaXJlY3RvcnkpCnN0YXQoIi9vcHQveGJm
bG54cHQvbXcvU3lzUGlsb3QvaW5zdGFuY2VzL3hiZmxueHB0L2xpYi90bHMiLCAweDdmYmZmZmE5
ZTApID0gLTEgRU5PRU5UIChObyBzdWNoIGZpbGUgb3IgZGlyZWN0b3J5KQpvcGVuKCIvb3B0L3hi
ZmxueHB0L213L1N5c1BpbG90L2luc3RhbmNlcy94YmZsbnhwdC9saWIveDg2XzY0L2xpYmMuc28u
NiIsIE9fUkRPTkxZKSA9IC0xIEVOT0VOVCAoTm8gc3VjaCBmaWxlIG9yIGRpcmVjdG9yeSkKc3Rh
dCgiL29wdC94YmZsbnhwdC9tdy9TeXNQaWxvdC9pbnN0YW5jZXMveGJmbG54cHQvbGliL3g4Nl82
NCIsIDB4N2ZiZmZmYTllMCkgPSAtMSBFTk9FTlQgKE5vIHN1Y2ggZmlsZSBvciBkaXJlY3Rvcnkp
Cm9wZW4oIi9vcHQveGJmbG54cHQvbXcvU3lzUGlsb3QvaW5zdGFuY2VzL3hiZmxueHB0L2xpYi9s
aWJjLnNvLjYiLCBPX1JET05MWSkgPSAtMSBFTk9FTlQgKE5vIHN1Y2ggZmlsZSBvciBkaXJlY3Rv
cnkpCnN0YXQoIi9vcHQveGJmbG54cHQvbXcvU3lzUGlsb3QvaW5zdGFuY2VzL3hiZmxueHB0L2xp
YiIsIHtzdF9tb2RlPVNfSUZESVJ8MDc1NSwgc3Rfc2l6ZT00MDk2LCAuLi59KSA9IDAKb3Blbigi
L29wdC92ZW5kb3IvdmJyb2tlci9iZXMtNi41L2xpYi90bHMveDg2XzY0L2xpYmMuc28uNiIsIE9f
UkRPTkxZKSA9IC0xIEVOT0VOVCAoTm8gc3VjaCBmaWxlIG9yIGRpcmVjdG9yeSkKc3RhdCgiL29w
dC92ZW5kb3IvdmJyb2tlci9iZXMtNi41L2xpYi90bHMveDg2XzY0IiwgMHg3ZmJmZmZhOWUwKSA9
IC0xIEVOT0VOVCAoTm8gc3VjaCBmaWxlIG9yIGRpcmVjdG9yeSkKb3BlbigiL29wdC92ZW5kb3Iv
dmJyb2tlci9iZXMtNi41L2xpYi90bHMvbGliYy5zby42IiwgT19SRE9OTFkpID0gLTEgRU5PRU5U
IChObyBzdWNoIGZpbGUgb3IgZGlyZWN0b3J5KQpzdGF0KCIvb3B0L3ZlbmRvci92YnJva2VyL2Jl
cy02LjUvbGliL3RscyIsIDB4N2ZiZmZmYTllMCkgPSAtMSBFTk9FTlQgKE5vIHN1Y2ggZmlsZSBv
ciBkaXJlY3RvcnkpCm9wZW4oIi9vcHQvdmVuZG9yL3Zicm9rZXIvYmVzLTYuNS9saWIveDg2XzY0
L2xpYmMuc28uNiIsIE9fUkRPTkxZKSA9IC0xIEVOT0VOVCAoTm8gc3VjaCBmaWxlIG9yIGRpcmVj
dG9yeSkKc3RhdCgiL29wdC92ZW5kb3IvdmJyb2tlci9iZXMtNi41L2xpYi94ODZfNjQiLCAweDdm
YmZmZmE5ZTApID0gLTEgRU5PRU5UIChObyBzdWNoIGZpbGUgb3IgZGlyZWN0b3J5KQpvcGVuKCIv
b3B0L3ZlbmRvci92YnJva2VyL2Jlcy02LjUvbGliL2xpYmMuc28uNiIsIE9fUkRPTkxZKSA9IC0x
IEVOT0VOVCAoTm8gc3VjaCBmaWxlIG9yIGRpcmVjdG9yeSkKc3RhdCgiL29wdC92ZW5kb3IvdmJy
b2tlci9iZXMtNi41L2xpYiIsIHtzdF9tb2RlPVNfSUZESVJ8MDc3NSwgc3Rfc2l6ZT00MDk2LCAu
Li59KSA9IDAKb3BlbigiL2V0Yy9sZC5zby5jYWNoZSIsIE9fUkRPTkxZKSAgICAgID0gMwpmc3Rh
dCgzLCB7c3RfbW9kZT1TX0lGUkVHfDA2NDQsIHN0X3NpemU9OTg2OTcsIC4uLn0pID0gMAptbWFw
KE5VTEwsIDk4Njk3LCBQUk9UX1JFQUQsIE1BUF9QUklWQVRFLCAzLCAwKSA9IDB4MmE5NTY2ZDAw
MApjbG9zZSgzKSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPSAwCm9wZW4oIi9saWI2
NC90bHMvbGliYy5zby42IiwgT19SRE9OTFkpICA9IDMKcmVhZCgzLCAiXDE3N0VMRlwyXDFcMVww
XDBcMFwwXDBcMFwwXDBcMFwzXDA+XDBcMVwwXDBcMFwyMDBcMzIyIi4uLiwgNjQwKSA9IDY0MApm
c3RhdCgzLCB7c3RfbW9kZT1TX0lGUkVHfDA3NTUsIHN0X3NpemU9MTY2OTcyOCwgLi4ufSkgPSAw
Cm1tYXAoTlVMTCwgMjM3NjA0MCwgUFJPVF9SRUFEfFBST1RfRVhFQywgTUFQX1BSSVZBVEUsIDMs
IDApID0gMHgyYTk1Njg2MDAwCm1wcm90ZWN0KDB4MmE5NTdjMjAwMCwgMTA4MTcwNCwgUFJPVF9O
T05FKSA9IDAKbW1hcCgweDJhOTU4YzEwMDAsIDIwNDgwLCBQUk9UX1JFQUR8UFJPVF9XUklURSwg
TUFQX1BSSVZBVEV8TUFQX0ZJWEVELCAzLCAweDEzYjAwMCkgPSAweDJhOTU4YzEwMDAKbW1hcCgw
eDJhOTU4YzYwMDAsIDE2NzQ0LCBQUk9UX1JFQUR8UFJPVF9XUklURSwgTUFQX1BSSVZBVEV8TUFQ
X0ZJWEVEfE1BUF9BTk9OWU1PVVMsIC0xLCAwKSA9IDB4MmE5NThjNjAwMApjbG9zZSgzKSAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgPSAwCm1tYXAoTlVMTCwgNDA5NiwgUFJPVF9SRUFE
fFBST1RfV1JJVEUsIE1BUF9QUklWQVRFfE1BUF9BTk9OWU1PVVMsIC0xLCAwKSA9IDB4MmE5NThj
YjAwMAphcmNoX3ByY3RsKEFSQ0hfU0VUX0ZTLCAweDJhOTU4Y2I0YzApICAgPSAwCm11bm1hcCgw
eDJhOTU2NmQwMDAsIDk4Njk3KSAgICAgICAgICAgICA9IDAKYnJrKDApICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgID0gMHg1MDgwMDAKYnJrKDB4NTI5MDAwKSAgICAgICAgICAgICAg
ICAgICAgICAgICAgID0gMHg1MjkwMDAKYnJrKDApICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgID0gMHg1MjkwMDAKb3BlbigiL3Vzci9saWIvbG9jYWxlL2xvY2FsZS1hcmNoaXZlIiwg
T19SRE9OTFkpID0gMwpmc3RhdCgzLCB7c3RfbW9kZT1TX0lGUkVHfDA2NDQsIHN0X3NpemU9MzIx
NDg5NzYsIC4uLn0pID0gMAptbWFwKE5VTEwsIDMyMTQ4OTc2LCBQUk9UX1JFQUQsIE1BUF9QUklW
QVRFLCAzLCAwKSA9IDB4MmE5NThjYzAwMApjbG9zZSgzKSAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgPSAwCmxzdGF0KCJoIiwge3N0X21vZGU9U19JRlJFR3wwNjQ0LCBzdF9zaXplPTAs
IC4uLn0pID0gMApmc3RhdCgxLCB7c3RfbW9kZT1TX0lGQ0hSfDA2MjAsIHN0X3JkZXY9bWFrZWRl
digxMzYsIDMpLCAuLi59KSA9IDAKbW1hcChOVUxMLCA0MDk2LCBQUk9UX1JFQUR8UFJPVF9XUklU
RSwgTUFQX1BSSVZBVEV8TUFQX0FOT05ZTU9VUywgLTEsIDApID0gMHgyYTk1NjZkMDAwCm9wZW4o
Ii91c3Ivc2hhcmUvbG9jYWxlL2xvY2FsZS5hbGlhcyIsIE9fUkRPTkxZKSA9IDMKZnN0YXQoMywg
e3N0X21vZGU9U19JRlJFR3wwNjQ0LCBzdF9zaXplPTI2MDEsIC4uLn0pID0gMAptbWFwKE5VTEws
IDQwOTYsIFBST1RfUkVBRHxQUk9UX1dSSVRFLCBNQVBfUFJJVkFURXxNQVBfQU5PTllNT1VTLCAt
MSwgMCkgPSAweDJhOTU2NmUwMDAKcmVhZCgzLCAiIyBMb2NhbGUgbmFtZSBhbGlhcyBkYXRhIGJh
c2UuXG4jIi4uLiwgNDA5NikgPSAyNjAxCnJlYWQoMywgIiIsIDQwOTYpICAgICAgICAgICAgICAg
ICAgICAgICA9IDAKY2xvc2UoMykgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgID0gMApt
dW5tYXAoMHgyYTk1NjZlMDAwLCA0MDk2KSAgICAgICAgICAgICAgPSAwCm9wZW4oIi91c3Ivc2hh
cmUvbG9jYWxlL2VuX1VTLlVURi04L0xDX01FU1NBR0VTL2NvcmV1dGlscy5tbyIsIE9fUkRPTkxZ
KSA9IC0xIEVOT0VOVCAoTm8gc3VjaCBmaWxlIG9yIGRpcmVjdG9yeSkKb3BlbigiL3Vzci9zaGFy
ZS9sb2NhbGUvZW5fVVMudXRmOC9MQ19NRVNTQUdFUy9jb3JldXRpbHMubW8iLCBPX1JET05MWSkg
PSAtMSBFTk9FTlQgKE5vIHN1Y2ggZmlsZSBvciBkaXJlY3RvcnkpCm9wZW4oIi91c3Ivc2hhcmUv
bG9jYWxlL2VuX1VTL0xDX01FU1NBR0VTL2NvcmV1dGlscy5tbyIsIE9fUkRPTkxZKSA9IC0xIEVO
T0VOVCAoTm8gc3VjaCBmaWxlIG9yIGRpcmVjdG9yeSkKb3BlbigiL3Vzci9zaGFyZS9sb2NhbGUv
ZW4uVVRGLTgvTENfTUVTU0FHRVMvY29yZXV0aWxzLm1vIiwgT19SRE9OTFkpID0gLTEgRU5PRU5U
IChObyBzdWNoIGZpbGUgb3IgZGlyZWN0b3J5KQpvcGVuKCIvdXNyL3NoYXJlL2xvY2FsZS9lbi51
dGY4L0xDX01FU1NBR0VTL2NvcmV1dGlscy5tbyIsIE9fUkRPTkxZKSA9IC0xIEVOT0VOVCAoTm8g
c3VjaCBmaWxlIG9yIGRpcmVjdG9yeSkKb3BlbigiL3Vzci9zaGFyZS9sb2NhbGUvZW4vTENfTUVT
U0FHRVMvY29yZXV0aWxzLm1vIiwgT19SRE9OTFkpID0gLTEgRU5PRU5UIChObyBzdWNoIGZpbGUg
b3IgZGlyZWN0b3J5KQp3cml0ZSgxLCAiICBGaWxlOiBgaFwnXG4iLCAxMikgICAgICAgICAgPSAx
Mgp3cml0ZSgxLCAiICBTaXplOiAwICAgICAgICAgXHRCbG9ja3M6IDAgICAgIi4uLiwgNjgpID0g
NjgKd3JpdGUoMSwgIkRldmljZTogM2EwYWgvMTQ4NThkXHRJbm9kZTogMTc2MCIuLi4sIDUzKSA9
IDUzCm9wZW4oIi9ldGMvbnNzd2l0Y2guY29uZiIsIE9fUkRPTkxZKSAgICA9IDMKZnN0YXQoMywg
e3N0X21vZGU9U19JRlJFR3wwNjQ0LCBzdF9zaXplPTE2ODYsIC4uLn0pID0gMAptbWFwKE5VTEws
IDQwOTYsIFBST1RfUkVBRHxQUk9UX1dSSVRFLCBNQVBfUFJJVkFURXxNQVBfQU5PTllNT1VTLCAt
MSwgMCkgPSAweDJhOTU2NmUwMDAKcmVhZCgzLCAiI1xuIyAvZXRjL25zc3dpdGNoLmNvbmZcbiNc
biMgQW4gZXgiLi4uLCA0MDk2KSA9IDE2ODYKcmVhZCgzLCAiIiwgNDA5NikgICAgICAgICAgICAg
ICAgICAgICAgID0gMApjbG9zZSgzKSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPSAw
Cm11bm1hcCgweDJhOTU2NmUwMDAsIDQwOTYpICAgICAgICAgICAgICA9IDAKb3BlbigiL29wdC94
YmZsbnhwdC9tdy94YmIvNV83X0xOWC9saWIvbGlibnNzX2ZpbGVzLnNvLjIiLCBPX1JET05MWSkg
PSAtMSBFTk9FTlQgKE5vIHN1Y2ggZmlsZSBvciBkaXJlY3RvcnkpCm9wZW4oIi9vcHQveGJmbG54
cHQvbXcvU3lzUGlsb3QvaW5zdGFuY2VzL3hiZmxueHB0L2xpYi9saWJuc3NfZmlsZXMuc28uMiIs
IE9fUkRPTkxZKSA9IC0xIEVOT0VOVCAoTm8gc3VjaCBmaWxlIG9yIGRpcmVjdG9yeSkKb3Blbigi
L29wdC92ZW5kb3IvdmJyb2tlci9iZXMtNi41L2xpYi9saWJuc3NfZmlsZXMuc28uMiIsIE9fUkRP
TkxZKSA9IC0xIEVOT0VOVCAoTm8gc3VjaCBmaWxlIG9yIGRpcmVjdG9yeSkKb3BlbigiL2V0Yy9s
ZC5zby5jYWNoZSIsIE9fUkRPTkxZKSAgICAgID0gMwpmc3RhdCgzLCB7c3RfbW9kZT1TX0lGUkVH
fDA2NDQsIHN0X3NpemU9OTg2OTcsIC4uLn0pID0gMAptbWFwKE5VTEwsIDk4Njk3LCBQUk9UX1JF
QUQsIE1BUF9QUklWQVRFLCAzLCAwKSA9IDB4MmE5Nzc3NTAwMApjbG9zZSgzKSAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgPSAwCm9wZW4oIi9saWI2NC9saWJuc3NfZmlsZXMuc28uMiIs
IE9fUkRPTkxZKSA9IDMKcmVhZCgzLCAiXDE3N0VMRlwyXDFcMVwwXDBcMFwwXDBcMFwwXDBcMFwz
XDA+XDBcMVwwXDBcMFwyMDAlXDBcMCIuLi4sIDY0MCkgPSA2NDAKZnN0YXQoMywge3N0X21vZGU9
U19JRlJFR3wwNzU1LCBzdF9zaXplPTU5NDI0LCAuLi59KSA9IDAKbW1hcChOVUxMLCAxMDk2MzI4
LCBQUk9UX1JFQUR8UFJPVF9FWEVDLCBNQVBfUFJJVkFURSwgMywgMCkgPSAweDJhOTc3OGUwMDAK
bXByb3RlY3QoMHgyYTk3NzlhMDAwLCAxMDQ3MTc2LCBQUk9UX05PTkUpID0gMAptbWFwKDB4MmE5
Nzg5OTAwMCwgNDA5NiwgUFJPVF9SRUFEfFBST1RfV1JJVEUsIE1BUF9QUklWQVRFfE1BUF9GSVhF
RCwgMywgMHhiMDAwKSA9IDB4MmE5Nzg5OTAwMApjbG9zZSgzKSAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgPSAwCm11bm1hcCgweDJhOTc3NzUwMDAsIDk4Njk3KSAgICAgICAgICAgICA9
IDAKb3BlbigiL2V0Yy9wYXNzd2QiLCBPX1JET05MWSkgICAgICAgICAgID0gMwpmY250bCgzLCBG
X0dFVEZEKSAgICAgICAgICAgICAgICAgICAgICAgPSAwCmZjbnRsKDMsIEZfU0VURkQsIEZEX0NM
T0VYRUMpICAgICAgICAgICA9IDAKZnN0YXQoMywge3N0X21vZGU9U19JRlJFR3wwNjQ0LCBzdF9z
aXplPTIyOTQsIC4uLn0pID0gMAptbWFwKE5VTEwsIDQwOTYsIFBST1RfUkVBRHxQUk9UX1dSSVRF
LCBNQVBfUFJJVkFURXxNQVBfQU5PTllNT1VTLCAtMSwgMCkgPSAweDJhOTU2NmUwMDAKbHNlZWso
MywgMCwgU0VFS19DVVIpICAgICAgICAgICAgICAgICAgID0gMApzb2NrZXQoUEZfRklMRSwgU09D
S19TVFJFQU0sIDApICAgICAgICAgPSA0CmNvbm5lY3QoNCwge3NhX2ZhbWlseT1BRl9GSUxFLCBw
YXRoPSIvdmFyL3J1bi8ubnNjZF9zb2NrZXQifSwgMTEwKSA9IC0xIEVOT0VOVCAoTm8gc3VjaCBm
aWxlIG9yIGRpcmVjdG9yeSkKY2xvc2UoNCkgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ID0gMApsc2VlaygzLCAwLCBTRUVLX1NFVCkgICAgICAgICAgICAgICAgICAgPSAwCnJlYWQoMywg
InJvb3Q6eDowOjA6cm9vdDovcm9vdDovYmluL2Jhc2hcbiIuLi4sIDQwOTYpID0gMjI5NApjbG9z
ZSgzKSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPSAwCm11bm1hcCgweDJhOTU2NmUw
MDAsIDQwOTYpICAgICAgICAgICAgICA9IDAKb3BlbigiL2V0Yy9ncm91cCIsIE9fUkRPTkxZKSAg
ICAgICAgICAgID0gMwpmY250bCgzLCBGX0dFVEZEKSAgICAgICAgICAgICAgICAgICAgICAgPSAw
CmZjbnRsKDMsIEZfU0VURkQsIEZEX0NMT0VYRUMpICAgICAgICAgICA9IDAKZnN0YXQoMywge3N0
X21vZGU9U19JRlJFR3wwNjQ0LCBzdF9zaXplPTYzNiwgLi4ufSkgPSAwCm1tYXAoTlVMTCwgNDA5
NiwgUFJPVF9SRUFEfFBST1RfV1JJVEUsIE1BUF9QUklWQVRFfE1BUF9BTk9OWU1PVVMsIC0xLCAw
KSA9IDB4MmE5NTY2ZTAwMApsc2VlaygzLCAwLCBTRUVLX0NVUikgICAgICAgICAgICAgICAgICAg
PSAwCnNvY2tldChQRl9GSUxFLCBTT0NLX1NUUkVBTSwgMCkgICAgICAgICA9IDQKY29ubmVjdCg0
LCB7c2FfZmFtaWx5PUFGX0ZJTEUsIHBhdGg9Ii92YXIvcnVuLy5uc2NkX3NvY2tldCJ9LCAxMTAp
ID0gLTEgRU5PRU5UIChObyBzdWNoIGZpbGUgb3IgZGlyZWN0b3J5KQpjbG9zZSg0KSAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgPSAwCmxzZWVrKDMsIDAsIFNFRUtfU0VUKSAgICAgICAg
ICAgICAgICAgICA9IDAKcmVhZCgzLCAicm9vdDp4OjA6cm9vdFxuYmluOng6MTpyb290LGJpbixk
Ii4uLiwgNDA5NikgPSA2MzYKY2xvc2UoMykgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ID0gMAptdW5tYXAoMHgyYTk1NjZlMDAwLCA0MDk2KSAgICAgICAgICAgICAgPSAwCndyaXRlKDEs
ICJBY2Nlc3M6ICgwNjQ0Ly1ydy1yLS1yLS0pICBVaWQ6ICIuLi4sIDczKSA9IDczCm9wZW4oIi9l
dGMvbG9jYWx0aW1lIiwgT19SRE9OTFkpICAgICAgICA9IDMKZnN0YXQoMywge3N0X21vZGU9U19J
RlJFR3wwNjQ0LCBzdF9zaXplPTEyNjcsIC4uLn0pID0gMAptbWFwKE5VTEwsIDQwOTYsIFBST1Rf
UkVBRHxQUk9UX1dSSVRFLCBNQVBfUFJJVkFURXxNQVBfQU5PTllNT1VTLCAtMSwgMCkgPSAweDJh
OTU2NmUwMDAKcmVhZCgzLCAiVFppZlwwXDBcMFwwXDBcMFwwXDBcMFwwXDBcMFwwXDBcMFwwXDBc
MFwwXDRcMFwwXDBcNFwwIi4uLiwgNDA5NikgPSAxMjY3CmNsb3NlKDMpICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICA9IDAKbXVubWFwKDB4MmE5NTY2ZTAwMCwgNDA5NikgICAgICAgICAg
ICAgID0gMAp3cml0ZSgxLCAiQWNjZXNzOiAyMDA2LTAyLTEzIDAxOjQ3OjQ1LjAwMDAiLi4uLCA0
NCkgPSA0NAp3cml0ZSgxLCAiTW9kaWZ5OiAyMDA2LTAyLTEzIDAxOjQ3OjQ1LjAwMDAiLi4uLCA0
NCkgPSA0NAp3cml0ZSgxLCAiQ2hhbmdlOiAyMDA2LTAyLTEzIDAxOjQ3OjUwLjAwMDAiLi4uLCA0
NCkgPSA0NAp3cml0ZSgxLCAiXG4iLCAxKSAgICAgICAgICAgICAgICAgICAgICAgPSAxCmxzdGF0
KCJqIiwge3N0X21vZGU9U19JRlJFR3wwNjQ0LCBzdF9zaXplPTAsIC4uLn0pID0gMAp3cml0ZSgx
LCAiICBGaWxlOiBgalwnXG4iLCAxMikgICAgICAgICAgPSAxMgp3cml0ZSgxLCAiICBTaXplOiAw
ICAgICAgICAgXHRCbG9ja3M6IDAgICAgIi4uLiwgNjgpID0gNjgKd3JpdGUoMSwgIkRldmljZTog
M2EwYWgvMTQ4NThkXHRJbm9kZTogMTc2MCIuLi4sIDUzKSA9IDUzCm9wZW4oIi9ldGMvcGFzc3dk
IiwgT19SRE9OTFkpICAgICAgICAgICA9IDMKZmNudGwoMywgRl9HRVRGRCkgICAgICAgICAgICAg
ICAgICAgICAgID0gMApmY250bCgzLCBGX1NFVEZELCBGRF9DTE9FWEVDKSAgICAgICAgICAgPSAw
CmZzdGF0KDMsIHtzdF9tb2RlPVNfSUZSRUd8MDY0NCwgc3Rfc2l6ZT0yMjk0LCAuLi59KSA9IDAK
bW1hcChOVUxMLCA0MDk2LCBQUk9UX1JFQUR8UFJPVF9XUklURSwgTUFQX1BSSVZBVEV8TUFQX0FO
T05ZTU9VUywgLTEsIDApID0gMHgyYTk1NjZlMDAwCmxzZWVrKDMsIDAsIFNFRUtfQ1VSKSAgICAg
ICAgICAgICAgICAgICA9IDAKbHNlZWsoMywgMCwgU0VFS19TRVQpICAgICAgICAgICAgICAgICAg
ID0gMApyZWFkKDMsICJyb290Ong6MDowOnJvb3Q6L3Jvb3Q6L2Jpbi9iYXNoXG4iLi4uLCA0MDk2
KSA9IDIyOTQKY2xvc2UoMykgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgID0gMAptdW5t
YXAoMHgyYTk1NjZlMDAwLCA0MDk2KSAgICAgICAgICAgICAgPSAwCm9wZW4oIi9ldGMvZ3JvdXAi
LCBPX1JET05MWSkgICAgICAgICAgICA9IDMKZmNudGwoMywgRl9HRVRGRCkgICAgICAgICAgICAg
ICAgICAgICAgID0gMApmY250bCgzLCBGX1NFVEZELCBGRF9DTE9FWEVDKSAgICAgICAgICAgPSAw
CmZzdGF0KDMsIHtzdF9tb2RlPVNfSUZSRUd8MDY0NCwgc3Rfc2l6ZT02MzYsIC4uLn0pID0gMApt
bWFwKE5VTEwsIDQwOTYsIFBST1RfUkVBRHxQUk9UX1dSSVRFLCBNQVBfUFJJVkFURXxNQVBfQU5P
TllNT1VTLCAtMSwgMCkgPSAweDJhOTU2NmUwMDAKbHNlZWsoMywgMCwgU0VFS19DVVIpICAgICAg
ICAgICAgICAgICAgID0gMApsc2VlaygzLCAwLCBTRUVLX1NFVCkgICAgICAgICAgICAgICAgICAg
PSAwCnJlYWQoMywgInJvb3Q6eDowOnJvb3RcbmJpbjp4OjE6cm9vdCxiaW4sZCIuLi4sIDQwOTYp
ID0gNjM2CmNsb3NlKDMpICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA9IDAKbXVubWFw
KDB4MmE5NTY2ZTAwMCwgNDA5NikgICAgICAgICAgICAgID0gMAp3cml0ZSgxLCAiQWNjZXNzOiAo
MDY0NC8tcnctci0tci0tKSAgVWlkOiAiLi4uLCA3MykgPSA3Mwp3cml0ZSgxLCAiQWNjZXNzOiAy
MDA2LTAyLTEzIDAxOjQ3OjQ1LjAwMDAiLi4uLCA0NCkgPSA0NAp3cml0ZSgxLCAiTW9kaWZ5OiAy
MDA2LTAyLTEzIDAxOjQ3OjQ1LjAwMDAiLi4uLCA0NCkgPSA0NAp3cml0ZSgxLCAiQ2hhbmdlOiAy
MDA2LTAyLTEzIDAxOjQ3OjUwLjAwMDAiLi4uLCA0NCkgPSA0NAp3cml0ZSgxLCAiXG4iLCAxKSAg
ICAgICAgICAgICAgICAgICAgICAgPSAxCmxzdGF0KCJrIiwge3N0X21vZGU9U19JRkxOS3wwNzc3
LCBzdF9zaXplPTEsIC4uLn0pID0gMApyZWFkbGluaygiayIsICJoIiwgMTI4KSAgICAgICAgICAg
ICAgICAgPSAxCndyaXRlKDEsICIgIEZpbGU6IGBrXCcgLT4gYGhcJ1xuIiwgMTkpICA9IDE5Cndy
aXRlKDEsICIgIFNpemU6IDEgICAgICAgICBcdEJsb2NrczogMCAgICAiLi4uLCA2OSkgPSA2OQp3
cml0ZSgxLCAiRGV2aWNlOiAzYTBhaC8xNDg1OGRcdElub2RlOiAxNzYwIi4uLiwgNTMpID0gNTMK
b3BlbigiL2V0Yy9wYXNzd2QiLCBPX1JET05MWSkgICAgICAgICAgID0gMwpmY250bCgzLCBGX0dF
VEZEKSAgICAgICAgICAgICAgICAgICAgICAgPSAwCmZjbnRsKDMsIEZfU0VURkQsIEZEX0NMT0VY
RUMpICAgICAgICAgICA9IDAKZnN0YXQoMywge3N0X21vZGU9U19JRlJFR3wwNjQ0LCBzdF9zaXpl
PTIyOTQsIC4uLn0pID0gMAptbWFwKE5VTEwsIDQwOTYsIFBST1RfUkVBRHxQUk9UX1dSSVRFLCBN
QVBfUFJJVkFURXxNQVBfQU5PTllNT1VTLCAtMSwgMCkgPSAweDJhOTU2NmUwMDAKbHNlZWsoMywg
MCwgU0VFS19DVVIpICAgICAgICAgICAgICAgICAgID0gMApsc2VlaygzLCAwLCBTRUVLX1NFVCkg
ICAgICAgICAgICAgICAgICAgPSAwCnJlYWQoMywgInJvb3Q6eDowOjA6cm9vdDovcm9vdDovYmlu
L2Jhc2hcbiIuLi4sIDQwOTYpID0gMjI5NApjbG9zZSgzKSAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgPSAwCm11bm1hcCgweDJhOTU2NmUwMDAsIDQwOTYpICAgICAgICAgICAgICA9IDAK
b3BlbigiL2V0Yy9ncm91cCIsIE9fUkRPTkxZKSAgICAgICAgICAgID0gMwpmY250bCgzLCBGX0dF
VEZEKSAgICAgICAgICAgICAgICAgICAgICAgPSAwCmZjbnRsKDMsIEZfU0VURkQsIEZEX0NMT0VY
RUMpICAgICAgICAgICA9IDAKZnN0YXQoMywge3N0X21vZGU9U19JRlJFR3wwNjQ0LCBzdF9zaXpl
PTYzNiwgLi4ufSkgPSAwCm1tYXAoTlVMTCwgNDA5NiwgUFJPVF9SRUFEfFBST1RfV1JJVEUsIE1B
UF9QUklWQVRFfE1BUF9BTk9OWU1PVVMsIC0xLCAwKSA9IDB4MmE5NTY2ZTAwMApsc2VlaygzLCAw
LCBTRUVLX0NVUikgICAgICAgICAgICAgICAgICAgPSAwCmxzZWVrKDMsIDAsIFNFRUtfU0VUKSAg
ICAgICAgICAgICAgICAgICA9IDAKcmVhZCgzLCAicm9vdDp4OjA6cm9vdFxuYmluOng6MTpyb290
LGJpbixkIi4uLiwgNDA5NikgPSA2MzYKY2xvc2UoMykgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgID0gMAptdW5tYXAoMHgyYTk1NjZlMDAwLCA0MDk2KSAgICAgICAgICAgICAgPSAwCndy
aXRlKDEsICJBY2Nlc3M6ICgwNzc3L2xyd3hyd3hyd3gpICBVaWQ6ICIuLi4sIDczKSA9IDczCndy
aXRlKDEsICJBY2Nlc3M6IDIwMDYtMDItMTMgMDE6NDk6MzkuMDAwMCIuLi4sIDQ0KSA9IDQ0Cndy
aXRlKDEsICJNb2RpZnk6IDIwMDYtMDItMTMgMDE6NDc6NTQuMDAwMCIuLi4sIDQ0KSA9IDQ0Cndy
aXRlKDEsICJDaGFuZ2U6IDIwMDYtMDItMTMgMDE6NDc6NTQuMDAwMCIuLi4sIDQ0KSA9IDQ0Cndy
aXRlKDEsICJcbiIsIDEpICAgICAgICAgICAgICAgICAgICAgICA9IDEKbXVubWFwKDB4MmE5NTY2
ZDAwMCwgNDA5NikgICAgICAgICAgICAgID0gMApleGl0X2dyb3VwKDApICAgICAgICAgICAgICAg
ICAgICAgICAgICAgPSA/Cg==

------_=_NextPart_001_01C6306A.9FE7741B--
