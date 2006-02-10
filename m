Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id k1ADbt112420
	for <linux-lvm@redhat.com>; Fri, 10 Feb 2006 08:37:55 -0500
Received: from wip-ec-wd.wipro.com (wip-ec-wd.wipro.com [203.91.193.32])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id k1ADbmR6002594
	for <linux-lvm@redhat.com>; Fri, 10 Feb 2006 08:37:50 -0500
Received: from wip-ec-wd.wipro.com (localhost.wipro.com [127.0.0.1])
	by localhost (Postfix) with ESMTP id 3F3EB205FB
	for <linux-lvm@redhat.com>; Fri, 10 Feb 2006 18:52:44 +0530 (IST)
Received: from blr-ec-bh01.wipro.com (blr-ec-bh01.wipro.com [10.201.50.91])
	by wip-ec-wd.wipro.com (Postfix) with ESMTP id 24260205EB
	for <linux-lvm@redhat.com>; Fri, 10 Feb 2006 18:52:44 +0530 (IST)
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C62E47.2972FF8D"
Subject: [linux-lvm] Symbolic Link Related Query
Date: Fri, 10 Feb 2006 19:07:39 +0530
Message-ID: <DBFC31836FE4044AAC43F361228CA2F801A0427A@blr-m1-msg.wipro.com>
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

This is a multi-part message in MIME format.

------_=_NextPart_001_01C62E47.2972FF8D
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

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

------_=_NextPart_001_01C62E47.2972FF8D
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
<DIV><FONT face=3DArial color=3D#0000ff size=3D2></FONT>&nbsp;</DIV>
<DIV></DIV>
<DIV class=3DOutlookMessageHeader lang=3Den-us dir=3Dltr =
align=3Dleft><FONT face=3DTahoma=20
size=3D2><BR></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2><SPAN class=3D953302406-03022006>Hi All =

</SPAN></FONT></DIV>
<DIV><FONT face=3DArial size=3D2><SPAN=20
class=3D953302406-03022006>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; I =
am facing=20
a unique problem here in my workplace machine which run's on&nbsp; <FONT =

size=3D2>(redhat enterprise linux) 2.4.21-37.EL #1 SMP, i have the =
following LVM=20
running</FONT></SPAN></FONT></DIV>
<DIV><FONT size=3D+0><SPAN class=3D953302406-03022006>
<P><FONT face=3DArial size=3D2>LVM module LVM version =
1.0.8-2(26/05/2004)</FONT></P>
<P><FONT face=3DArial size=3D2>Total: 2 VGs 2 PVs 43 LVs (20 LVs open 20 =

times)</FONT></P>
<P><FONT face=3DArial><FONT size=3D2>Global: 475792 bytes malloced IOP =
version: 10=20
79 days 16:15:15 activ<SPAN =
class=3D953302406-03022006>e</SPAN></FONT></FONT></P>
<P><FONT face=3DArial><FONT size=3D2><SPAN =
class=3D953302406-03022006><STRONG>The=20
basic problem is when i create a symbolic link the i-node number reamins =
the=20
same as the original file i-node number , i don't know if it some =
configuration=20
in the LVM's as they are pretty =
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
class=3D953302406-03022006><STRONG>You can=20
see that the i-node number is same for all the original file the hard =
link and=20
the soft link can this version of LVM do this kind of=20
configuration.?</STRONG></SPAN></FONT></FONT></P>
<P><FONT face=3DArial><FONT size=3D2><SPAN =
class=3D953302406-03022006><STRONG>Thank's=20
In Advance </STRONG></SPAN></FONT></FONT></P>
<P><FONT face=3DArial><FONT size=3D2><SPAN=20
class=3D953302406-03022006><STRONG>Regards</STRONG></SPAN></FONT></FONT><=
/P>
<P><FONT face=3DArial><FONT size=3D2><SPAN=20
class=3D953302406-03022006><STRONG>Deepak</STRONG></SPAN></FONT></FONT></=
P>
<P><FONT face=3DArial><FONT size=3D2><SPAN=20
class=3D953302406-03022006><STRONG></STRONG>&nbsp;</P></SPAN></FONT></FON=
T>
<P><FONT face=3DArial><FONT size=3D2><SPAN=20
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
<P>flags : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov =
pat=20
pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm ferr syscall lm sse3 =
monit or=20
ds-cpl gv3 tm2 cnxt-id</P>
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
<P>flags : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov =
pat=20
pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm ferr syscall lm sse3 =
monit or=20
ds-cpl gv3 tm2 cnxt-id</P>
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
<P>flags : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov =
pat=20
pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm ferr syscall lm sse3 =
monit or=20
ds-cpl gv3 tm2 cnxt-id</P>
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
<P>flags : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov =
pat=20
pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm ferr syscall lm sse3 =
monit or=20
ds-cpl gv3 tm2 cnxt-id</P>
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
<P>major minor #blocks name rio rmerge rsect ruse wio wmerge wsect wuse =
running=20
use aveq</P>
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
123811888=20
25062727 0 5751090 42587897</P>
<P>8 1 204784 sda1 3645 27773 62836 78090 897 369 2532 35100 0 29790 =
113190</P>
<P>8 2 40781824 sda2 1958053 1988015 26959664 17380360 15680245 6125437=20
123809356 25027677 0 5740860 42474547</P>
<P>8 16 245760000 sdb 149842410 88015370 1895282582 12721644 170899976 =
88685576=20
2054639674 2879121 0 34958021 15936396</P>
<P>8 17 245759984 sdb1 149842392 88015301 1895282406 12723394 170899976 =
88685576=20
2054639674 2880291 0 34955871 15923066</P>
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
<P>Usage [KB/PE]: 245751808 /59998 total 101212160 /24710 used 144539648 =
/35288=20
free</P>
<P>PV: [AA] sdb1 245751808 /59998 101212160 /24710 144539648 /35288</P>
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
class=3D953302406-03022006></SPAN></FONT>&nbsp;</DIV></BODY></HTML>

------_=_NextPart_001_01C62E47.2972FF8D--
