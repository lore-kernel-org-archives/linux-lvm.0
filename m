Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j8FNUTV09096
	for <linux-lvm@redhat.com>; Thu, 15 Sep 2005 19:30:29 -0400
Received: from zproxy.gmail.com (zproxy.gmail.com [64.233.162.194])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id j8FNUIvC019064
	for <linux-lvm@redhat.com>; Thu, 15 Sep 2005 19:30:18 -0400
Received: by zproxy.gmail.com with SMTP id z3so648421nzf
	for <linux-lvm@redhat.com>; Thu, 15 Sep 2005 16:30:13 -0700 (PDT)
Message-ID: <432A0282.5020905@gmail.com>
Date: Fri, 16 Sep 2005 02:23:46 +0300
From: Suleyman Kutlu <suleyman.kutlu@gmail.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Device mapper problems..
References: <432986DA.50107@gmail.com> <43299B1A.3090200@novell.com>
In-Reply-To: <43299B1A.3090200@novell.com>
Content-Type: multipart/mixed; boundary="------------060704020206080409040502"
Reply-To: suleyman.kutlu@gmail.com,
	LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <http://redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: Fabian Herschel <fabian.herschel@novell.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

This is a multi-part message in MIME format.
--------------060704020206080409040502
Content-Type: multipart/alternative;
	boundary="------------010604000903050503050704"


--------------010604000903050503050704
Content-Type: text/plain; charset=ISO-8859-9; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

Thanks for your reply.

Here is the results from my system:

Two VGs.

systemvg on /dev/sda4
datavg on /dev/sdb1

ls -la /dev/mapper


total 124
drwxr-xr-x   2 root root    4096 Sep 16  2005 .
drwxr-xr-x  36 root root  118784 Sep 16 01:49 ..
crw-------   1 root root  10, 63 Sep 16  2005 control
brw-------   1 root root 253,  8 Sep 16  2005 datavg-backup
brw-------   1 root root 253,  6 Jul 16 20:32 datavg-rootlv
brw-------   1 root root 253,  7 Jul 16 22:40 datavg-snk2lv
brw-------   1 root root 253,  0 Jun  5 03:24 systemvg-optlv
brw-------   1 root root 253,  1 May 10 03:08 systemvg-rootlv
brw-------   1 root root 253,  4 Jun  5 03:27 systemvg-temp
brw-------   1 root root 253,  2 Jun  5 03:26 systemvg-tmplv
brw-------   1 root root 253,  3 Jun  5 03:26 systemvg-usrlv
brw-------   1 root root 253,  1 Jun  5 03:25 systemvg-varlv


df -h output is follows:

Filesystem                    Size  Used Avail Use% Mounted on
/dev/root/rootlv             1008M  255M  702M  27% /
tmpfs                         500M   24K  500M   1% /dev/shm
/dev/sda2                      54M  7.1M   44M  14% /boot
/dev/mapper/systemvg-optlv    3.0G  607M  2.4G  20% /opt         <--,  
These filesystems and their
/dev/mapper/systemvg-tmplv    4.0G  2.7G  1.4G  67% /usr         <---  
mapped devices are scrambled
/dev/mapper/systemvg-usrlv    2.0G  442M  1.6G  22% /var         <---  
and I found this combination
/dev/mapper/systemvg-varlv    2.0G  4.7M  2.0G   1% /tmp         <--'  
by try-and-find !!
/dev/mapper/datavg-backup      69G   33M   69G   1% /mnt/backup
/dev/mapper/datavg-rootlv    1020M  261M  760M  26% /mnt/datavg-rootlv
/dev/mapper/datavg-snk2lv     4.0G  2.7G  1.4G  68% /mnt/datavg-snk2   
   <---- This filesystem is broken
/dev/mapper/systemvg-rootlv   2.0G  4.7M  2.0G   1% /mnt/systemvg-rootlv
/dev/mapper/systemvg-temp      91G   63G   29G  69% /mnt/systemvg-temp

dmsetup ls output is:

systemvg-temp  (253, 4)
systemvg-usrlv (253, 2)
systemvg-tmplv (253, 1)
systemvg-rootlv   (253, 5)
systemvg-varlv (253, 3)
datavg-backup  (253, 8)
datavg-snk2lv  (253, 7)
datavg-rootlv  (253, 6)
systemvg-optlv (253, 0)


dmsetup table output is:

systemvg-temp: 0 190791680 linear 8:4 33554816
systemvg-usrlv: 0 8388608 linear 8:4 20971904
systemvg-tmplv: 0 4194304 linear 8:4 16777600
systemvg-rootlv: 0 2097152 linear 8:4 384
systemvg-varlv: 0 4194304 linear 8:4 29360512
datavg-backup: 0 104857600 linear 8:17 41943424
datavg-backup: 104857600 37830656 linear 8:17 274727296
datavg-snk2lv: 0 39845888 linear 8:17 2097536
datavg-snk2lv: 39845888 127926272 linear 8:17 146801024
datavg-rootlv: 0 2097152 linear 8:17 384
systemvg-optlv: 0 6291456 linear 8:4 10486144

LV Dsplay for /dev/datavg/snk2lv :

  --- Logical volume ---
  LV Name                /dev/datavg/snk2lv
  VG Name                datavg
  LV UUID                MCuj5G-XO1e-z3OE-BT9N-Lr5p-SbCO-3U8D4K
  LV Write Access        read/write
  LV Status              available
  # open                 1
  LV Size                80.00 GB
  Current LE             20480
  Segments               2
  Allocation             inherit
  Read ahead sectors     0
  Block device           253:7

As you can see it is 80 GB but in df -h output, it is only 4 GB, and the 
contents of the filesystem  is something like the contents of /usr, I 
think a snapshot of /usr@the time when this error occured.

Also here are the vgdisplay -v output  and dmsetup info output....

Also here is the fdisk -l output, incase needed..


fdisk -l

Disk /dev/sda: 160.0 GB, 160041885696 bytes
255 heads, 63 sectors/track, 19457 cylinders
Units = cylinders of 16065 * 512 = 8225280 bytes

   Device Boot      Start         End      Blocks   Id  System
/dev/sda1   *           1        5222    41945683+   7  HPFS/NTFS
/dev/sda2            5223        5229       56227+  83  Linux
/dev/sda3            5230        5491     2104515   82  Linux swap / Solaris
/dev/sda4            5492       19456   112173862+  8e  Linux LVM

Disk /dev/sdb: 160.0 GB, 160041885696 bytes
255 heads, 63 sectors/track, 19457 cylinders
Units = cylinders of 16065 * 512 = 8225280 bytes

   Device Boot      Start         End      Blocks   Id  System
/dev/sdb1               1       19456   156280288+  8e  Linux LVM




What I am trying to do is:

- At least get the directory contents of the filesystem 
/dev/datavg/snk2lv inorder to know what I have lost. Is it possible to 
get this with jfsutils ?? Any experience ?
- If there is a way to fix-up the device-mapper tables and get my 
filesystems back, it is ofcourse welcome.


Thanks in advance....


Fabian Herschel wrote:

>You have a look which device path is used when mounting your both file
>systems (using mount).
>Than you can have a look at the major and minor device number of these
>devices (using ls -la).
>If these devices are using the same major/minor combination the kernel
>assumes these devices
>the be the same. This would show the effects you mentioned.
>
>ls -la /dev/mapper/*
>brw-------  1 root root 253, 3 Jun 21 16:09 /dev/mapper/rootvg-homlv
>brw-------  1 root root 253, 2 Jun 21 16:09 /dev/mapper/rootvg-optlv
>
>in this case rootvg-homlv has major 253 and minor 3, while rootvg-optlv
>has major 253 and minor 2.
>
>best regards
>Fabian Herschel
>
>
>Suleyman Kutlu schrieb:
>
>  
>
>>Hello all,
>>
>>
>>I have an AMD-64 machine running SuSE 9.2. I have one SATA disk (for
>>now, will add another later on) and a VG on it. I have created some LVs.
>>
>>Sometimes later, I realized that when I mount an LV (say lv_a) I see
>>the directory structure of another LV (say lv_b). If I issue a df -k,
>>I see a wrong size for lv_a, it is the size of lv_b. But in lvdisplay
>>output, the size for lv_a is correct.
>>
>>The file systems on lv_a and lv_b is JFS.
>>
>>/mnt is mounted as lv_b
>>/mnt2 is mounted as lv_a but has contents of lv_b
>>
>>
>>I thought that, filesystem structure is corrupted and started to work
>>on some filesystem level utilities, but later I see that,
>>another filesystem pair also got the same problem.
>>
>>
>>So I think it is a problem in device-mapper level, not the filesystem
>>level.
>>
>>What can be the possible works to get what is wrong and how to fix ?
>>If the corruption is at filesystem level, do you have any experience
>>on JFS-utils ? I just want to see what was stored in lv_a, what I lost
>>in lv_a...
>>
>>
>>I am new at device-mapper, I don't have enough experience on it and I
>>do not want to loose everything while there is something that can be
>>recovered...
>>
>>Any help is appreciated.
>>
>>Thanks and regards..
>>
>>* Suleyman Kutlu
>>* mailto: suleyman.kutlu@gmail.com
>>
>>_______________________________________________
>>linux-lvm mailing list
>>linux-lvm@redhat.com
>>https://www.redhat.com/mailman/listinfo/linux-lvm
>>read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>>    
>>
>
>
>
>  
>


--------------010604000903050503050704
Content-Type: text/html; charset="iso-8859-9"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
  <meta content=3D"text/html;charset=3DISO-8859-9" http-equiv=3D"Content-Ty=
pe">
  <title></title>
</head>
<body bgcolor=3D"#ffffff" text=3D"#000000">
Hello,<br>
<br>
Thanks for your reply.<br>
<br>
Here is the results from my system:<br>
<br>
Two VGs.<br>
<br>
systemvg on /dev/sda4<br>
datavg on /dev/sdb1<br>
<br>
ls -la /dev/mapper<br>
<br>
<br>
<tt>total 124<br>
drwxr-xr-x=EF=BF=BD=EF=BF=BD 2 root root=EF=BF=BD=EF=BF=BD=EF=BF=BD 4096 Se=
p 16=EF=BF=BD 2005 .<br>
drwxr-xr-x=EF=BF=BD 36 root root=EF=BF=BD 118784 Sep 16 01:49 ..<br>
crw-------=EF=BF=BD=EF=BF=BD 1 root root=EF=BF=BD 10, 63 Sep 16=EF=BF=BD 20=
05 control<br>
brw-------=EF=BF=BD=EF=BF=BD 1 root root 253,=EF=BF=BD 8 Sep 16=EF=BF=BD 20=
05 datavg-backup<br>
brw-------=EF=BF=BD=EF=BF=BD 1 root root 253,=EF=BF=BD 6 Jul 16 20:32 datav=
g-rootlv<br>
brw-------=EF=BF=BD=EF=BF=BD 1 root root 253,=EF=BF=BD 7 Jul 16 22:40 datav=
g-snk2lv<br>
brw-------=EF=BF=BD=EF=BF=BD 1 root root 253,=EF=BF=BD 0 Jun=EF=BF=BD 5 03:=
24 systemvg-optlv<br>
brw-------=EF=BF=BD=EF=BF=BD 1 root root 253,=EF=BF=BD 1 May 10 03:08 syste=
mvg-rootlv<br>
brw-------=EF=BF=BD=EF=BF=BD 1 root root 253,=EF=BF=BD 4 Jun=EF=BF=BD 5 03:=
27 systemvg-temp<br>
brw-------=EF=BF=BD=EF=BF=BD 1 root root 253,=EF=BF=BD 2 Jun=EF=BF=BD 5 03:=
26 systemvg-tmplv<br>
brw-------=EF=BF=BD=EF=BF=BD 1 root root 253,=EF=BF=BD 3 Jun=EF=BF=BD 5 03:=
26 systemvg-usrlv<br>
brw-------=EF=BF=BD=EF=BF=BD 1 root root 253,=EF=BF=BD 1 Jun=EF=BF=BD 5 03:=
25 systemvg-varlv<br>
</tt><br>
<br>
df -h output is follows:<br>
<br>
<tt>Filesystem=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=
=BD=EF=BF=BD =EF=BF=BD=EF=BF=BD =EF=BF=BD=EF=BF=BD=EF=BF=BD =EF=BF=BD =EF=
=BF=BD Size=EF=BF=BD Used Avail Use% Mounted on<br>
/dev/root/rootlv=EF=BF=BD=EF=BF=BD =EF=BF=BD =EF=BF=BD=EF=BF=BD=EF=BF=BD =
=EF=BF=BD =EF=BF=BD 1008M=EF=BF=BD 255M=EF=BF=BD 702M=EF=BF=BD 27% / <br>
tmpfs=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=
=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD =EF=BF=BD=EF=BF=
=BD =EF=BF=BD=EF=BF=BD =EF=BF=BD =EF=BF=BD 500M=EF=BF=BD=EF=BF=BD 24K=EF=BF=
=BD 500M=EF=BF=BD=EF=BF=BD 1% /dev/shm<br>
/dev/sda2=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=
=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD =EF=BF=BD=EF=BF=BD=EF=BF=BD =EF=BF=BD=EF=
=BF=BD=EF=BF=BD =EF=BF=BD 54M=EF=BF=BD 7.1M=EF=BF=BD=EF=BF=BD 44M=EF=BF=BD =
14% /boot<br>
/dev/mapper/systemvg-optlv=EF=BF=BD =EF=BF=BD 3.0G=EF=BF=BD 607M=EF=BF=BD 2=
.4G=EF=BF=BD 20% /opt=EF=BF=BD=EF=BF=BD =EF=BF=BD=EF=BF=BD =EF=BF=BD=EF=BF=
=BD
&lt;--,=EF=BF=BD </tt><tt>These filesystems and their</tt><br>
<tt>/dev/mapper/systemvg-tmplv=EF=BF=BD=EF=BF=BD=EF=BF=BD 4.0G=EF=BF=BD 2.7=
G=EF=BF=BD 1.4G=EF=BF=BD 67% /usr=EF=BF=BD=EF=BF=BD =EF=BF=BD=EF=BF=BD =EF=
=BF=BD=EF=BF=BD
&lt;---=EF=BF=BD </tt><tt>mapped devices are scrambled</tt><br>
<tt>/dev/mapper/systemvg-usrlv=EF=BF=BD=EF=BF=BD=EF=BF=BD 2.0G=EF=BF=BD 442=
M=EF=BF=BD 1.6G=EF=BF=BD 22% /var=EF=BF=BD=EF=BF=BD =EF=BF=BD=EF=BF=BD =EF=
=BF=BD=EF=BF=BD
&lt;---=EF=BF=BD </tt><tt>and I found this combination</tt><br>
<tt>/dev/mapper/systemvg-varlv=EF=BF=BD =EF=BF=BD 2.0G=EF=BF=BD 4.7M=EF=BF=
=BD 2.0G=EF=BF=BD=EF=BF=BD 1% /tmp=EF=BF=BD=EF=BF=BD =EF=BF=BD=EF=BF=BD =EF=
=BF=BD=EF=BF=BD
&lt;--'=EF=BF=BD </tt><tt>by try-and-find !!</tt><br>
<tt>/dev/mapper/datavg-backup=EF=BF=BD=EF=BF=BD =EF=BF=BD=EF=BF=BD 69G=EF=
=BF=BD=EF=BF=BD 33M=EF=BF=BD=EF=BF=BD 69G=EF=BF=BD=EF=BF=BD 1% /mnt/backup<=
br>
/dev/mapper/datavg-rootlv =EF=BF=BD=EF=BF=BD 1020M=EF=BF=BD 261M=EF=BF=BD 7=
60M=EF=BF=BD 26% /mnt/datavg-rootlv<br>
/dev/mapper/datavg-snk2lv=EF=BF=BD =EF=BF=BD=EF=BF=BD 4.0G=EF=BF=BD 2.7G=EF=
=BF=BD 1.4G=EF=BF=BD 68% /mnt/datavg-snk2=EF=BF=BD=EF=BF=BD
=EF=BF=BD=EF=BF=BD &lt;---- This filesystem is broken <br>
/dev/mapper/systemvg-rootlv =EF=BF=BD 2.0G=EF=BF=BD 4.7M=EF=BF=BD 2.0G=EF=
=BF=BD=EF=BF=BD 1% /mnt/systemvg-rootlv<br>
/dev/mapper/systemvg-temp=EF=BF=BD=EF=BF=BD =EF=BF=BD=EF=BF=BD 91G=EF=BF=BD=
=EF=BF=BD 63G=EF=BF=BD=EF=BF=BD 29G=EF=BF=BD 69% /mnt/systemvg-temp</tt><br>
<br>
dmsetup ls output is:<br>
<br>
<tt>systemvg-temp=EF=BF=BD (253, 4)<br>
systemvg-usrlv (253, 2)<br>
systemvg-tmplv (253, 1)<br>
systemvg-rootlv=EF=BF=BD=EF=BF=BD (253, 5)<br>
systemvg-varlv (253, 3)<br>
datavg-backup=EF=BF=BD (253, 8) <br>
datavg-snk2lv=EF=BF=BD (253, 7)<br>
datavg-rootlv=EF=BF=BD (253, 6)<br>
systemvg-optlv (253, 0)</tt><br>
<br>
<br>
dmsetup table output is:<br>
<br>
<tt>systemvg-temp: 0 190791680 linear 8:4 33554816<br>
systemvg-usrlv: 0 8388608 linear 8:4 20971904<br>
systemvg-tmplv: 0 4194304 linear 8:4 16777600<br>
systemvg-rootlv: 0 2097152 linear 8:4 384<br>
systemvg-varlv: 0 4194304 linear 8:4 29360512<br>
datavg-backup: 0 104857600 linear 8:17 41943424<br>
datavg-backup: 104857600 37830656 linear 8:17 274727296<br>
datavg-snk2lv: 0 39845888 linear 8:17 2097536<br>
datavg-snk2lv: 39845888 127926272 linear 8:17 146801024<br>
datavg-rootlv: 0 2097152 linear 8:17 384<br>
systemvg-optlv: 0 6291456 linear 8:4 10486144</tt><br>
<br>
LV Dsplay for /dev/datavg/snk2lv :<br>
<br>
<tt>=EF=BF=BD --- Logical volume ---<br>
=EF=BF=BD LV Name=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=
=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=
=BD /dev/datavg/snk2lv<br>
=EF=BF=BD VG Name=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=
=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=
=BD datavg<br>
=EF=BF=BD LV UUID=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=
=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=
=BD MCuj5G-XO1e-z3OE-BT9N-Lr5p-SbCO-3U8D4K<br>
=EF=BF=BD LV Write Access=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=
=BF=BD=EF=BF=BD read/write<br>
=EF=BF=BD LV Status=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=
=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD available<b=
r>
=EF=BF=BD # open=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=
=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=
=BD=EF=BF=BD 1<br>
=EF=BF=BD LV Size=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=
=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=
=BD 80.00 GB<br>
=EF=BF=BD Current LE=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=
=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD 20480<br>
=EF=BF=BD Segments=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=
=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD 2<br>
=EF=BF=BD Allocation=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=
=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD inherit<br>
=EF=BF=BD Read ahead sectors=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD 0<br>
=EF=BF=BD Block device=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=
=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD 253:7</tt><br>
<br>
As you can see it is 80 GB but in df -h output, it is only 4 GB, and
the contents of the filesystem=EF=BF=BD is something like the contents of /=
usr,
I think a snapshot of /usr at the time when this error occured.<br>
<br>
Also here are the vgdisplay -v output=EF=BF=BD and dmsetup info output....<=
br>
<br>
Also here is the fdisk -l output, incase needed.. <br>
<br>
<br>
<tt>fdisk -l<br>
<br>
Disk /dev/sda: 160.0 GB, 160041885696 bytes<br>
255 heads, 63 sectors/track, 19457 cylinders<br>
Units =3D cylinders of 16065 * 512 =3D 8225280 bytes<br>
<br>
=EF=BF=BD=EF=BF=BD Device Boot=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=
 Start=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=
=BD End=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD Blocks=EF=BF=BD=EF=BF=
=BD Id=EF=BF=BD System<br>
/dev/sda1=EF=BF=BD=EF=BF=BD *=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=
=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD 1=EF=BF=BD=EF=BF=BD=EF=BF=BD=
=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD 5222=EF=BF=BD=EF=BF=BD=EF=BF=BD 419456=
83+=EF=BF=BD=EF=BF=BD 7=EF=BF=BD HPFS/NTFS<br>
/dev/sda2=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=
=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD 5223=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=
=EF=BF=BD=EF=BF=BD=EF=BF=BD 5229=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=
=BD=EF=BF=BD 56227+=EF=BF=BD 83=EF=BF=BD Linux<br>
/dev/sda3=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=
=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD 5230=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=
=EF=BF=BD=EF=BF=BD=EF=BF=BD 5491=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD 210451=
5=EF=BF=BD=EF=BF=BD 82=EF=BF=BD Linux swap /
Solaris<br>
/dev/sda4=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=
=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD 5492=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=
=EF=BF=BD=EF=BF=BD 19456=EF=BF=BD=EF=BF=BD 112173862+=EF=BF=BD 8e=EF=BF=BD =
Linux LVM<br>
<br>
Disk /dev/sdb: 160.0 GB, 160041885696 bytes<br>
255 heads, 63 sectors/track, 19457 cylinders<br>
Units =3D cylinders of 16065 * 512 =3D 8225280 bytes<br>
<br>
=EF=BF=BD=EF=BF=BD Device Boot=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=
 Start=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=
=BD End=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD Blocks=EF=BF=BD=EF=BF=
=BD Id=EF=BF=BD System<br>
/dev/sdb1=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=
=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD 1=EF=BF=BD=EF=
=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD 19456=EF=BF=BD=EF=BF=BD 15628028=
8+=EF=BF=BD 8e=EF=BF=BD Linux LVM</tt><br>
<br>
<br>
<br>
<br>
What I am trying to do is:<br>
<br>
- At least get the directory contents of the filesystem
/dev/datavg/snk2lv inorder to know what I have lost. Is it possible to
get this with jfsutils ?? Any experience ?<br>
- If there is a way to fix-up the device-mapper tables and get my
filesystems back, it is ofcourse welcome.<br>
<br>
<br>
Thanks in advance.... <br>
<br>
<br>
Fabian Herschel wrote:
<blockquote cite=3D"mid43299B1A.3090200@novell.com" type=3D"cite">
  <pre wrap=3D"">You have a look which device path is used when mounting yo=
ur both file
systems (using mount).
Than you can have a look at the major and minor device number of these
devices (using ls -la).
If these devices are using the same major/minor combination the kernel
assumes these devices
the be the same. This would show the effects you mentioned.

ls -la /dev/mapper/*
brw-------  1 root root 253, 3 Jun 21 16:09 /dev/mapper/rootvg-homlv
brw-------  1 root root 253, 2 Jun 21 16:09 /dev/mapper/rootvg-optlv

in this case rootvg-homlv has major 253 and minor 3, while rootvg-optlv
has major 253 and minor 2.

best regards
Fabian Herschel


Suleyman Kutlu schrieb:

  </pre>
  <blockquote type=3D"cite">
    <pre wrap=3D"">Hello all,


I have an AMD-64 machine running SuSE 9.2. I have one SATA disk (for
now, will add another later on) and a VG on it. I have created some LVs.

Sometimes later, I realized that when I mount an LV (say lv_a) I see
the directory structure of another LV (say lv_b). If I issue a df -k,
I see a wrong size for lv_a, it is the size of lv_b. But in lvdisplay
output, the size for lv_a is correct.

The file systems on lv_a and lv_b is JFS.

/mnt is mounted as lv_b
/mnt2 is mounted as lv_a but has contents of lv_b


I thought that, filesystem structure is corrupted and started to work
on some filesystem level utilities, but later I see that,
another filesystem pair also got the same problem.


So I think it is a problem in device-mapper level, not the filesystem
level.

What can be the possible works to get what is wrong and how to fix ?
If the corruption is at filesystem level, do you have any experience
on JFS-utils ? I just want to see what was stored in lv_a, what I lost
in lv_a...


I am new at device-mapper, I don't have enough experience on it and I
do not want to loose everything while there is something that can be
recovered...

Any help is appreciated.

Thanks and regards..

* Suleyman Kutlu
* mailto: <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:suleyman.kut=
lu@gmail.com">suleyman.kutlu@gmail.com</a>

_______________________________________________
linux-lvm mailing list
<a class=3D"moz-txt-link-abbreviated" href=3D"mailto:linux-lvm@redhat.com">=
linux-lvm@redhat.com</a>
<a class=3D"moz-txt-link-freetext" href=3D"https://www.redhat.com/mailman/l=
istinfo/linux-lvm">https://www.redhat.com/mailman/listinfo/linux-lvm</a>
read the LVM HOW-TO at <a class=3D"moz-txt-link-freetext" href=3D"http://tl=
dp.org/HOWTO/LVM-HOWTO/">http://tldp.org/HOWTO/LVM-HOWTO/</a>
    </pre>
  </blockquote>
  <pre wrap=3D""><!---->


  </pre>
</blockquote>
<br>
</body>
</html>

--------------010604000903050503050704--

--------------060704020206080409040502
Content-Type: text/plain;
 name="dmsetup-info"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="dmsetup-info"

Name:              systemvg-temp
State:             ACTIVE
Tables present:    LIVE
Open count:        0
Event number:      0
Major, minor:      253, 4
Number of targets: 1
UUID: NBpEUO85TasBrz3w1zG1qeV6YJ1D380R1lB1QHaxrqO3824WjbP4Ia8rGK6R39cZ

Name:              systemvg-usrlv
State:             ACTIVE
Tables present:    LIVE
Open count:        1
Event number:      0
Major, minor:      253, 2
Number of targets: 1
UUID: NBpEUO85TasBrz3w1zG1qeV6YJ1D380RKxSrdJsnLLoKq1Cj718tbkaIAtppcUA0

Name:              systemvg-tmplv
State:             ACTIVE
Tables present:    LIVE
Open count:        1
Event number:      0
Major, minor:      253, 1
Number of targets: 1
UUID: NBpEUO85TasBrz3w1zG1qeV6YJ1D380RBiGpkqZ75i8iCg8ukgPLiBReBHbxckFe

Name:              systemvg-rootlv
State:             ACTIVE
Tables present:    LIVE
Open count:        1
Event number:      0
Major, minor:      253, 5
Number of targets: 1
UUID: NBpEUO85TasBrz3w1zG1qeV6YJ1D380RRe1LrraRY0VRL58HVtw6as8dpSztQeUx

Name:              systemvg-varlv
State:             ACTIVE
Tables present:    LIVE
Open count:        1
Event number:      0
Major, minor:      253, 3
Number of targets: 1
UUID: NBpEUO85TasBrz3w1zG1qeV6YJ1D380RhrM191wOE5WStGcJtNlMqKLOtmGUCDHB

Name:              datavg-backup
State:             ACTIVE
Tables present:    LIVE
Open count:        0
Event number:      0
Major, minor:      253, 8
Number of targets: 2
UUID: 3Fs7iVQxXMAuIG1gATnAhpEU1XkDcGLhQeHwNakVMOYf7R9lvlHtdj0NOwCREYNa

Name:              datavg-snk2lv
State:             ACTIVE
Tables present:    LIVE
Open count:        0
Event number:      0
Major, minor:      253, 7
Number of targets: 2
UUID: 3Fs7iVQxXMAuIG1gATnAhpEU1XkDcGLhMCuj5GXO1ez3OEBT9NLr5pSbCO3U8D4K

Name:              datavg-rootlv
State:             ACTIVE
Tables present:    LIVE
Open count:        0
Event number:      0
Major, minor:      253, 6
Number of targets: 1
UUID: 3Fs7iVQxXMAuIG1gATnAhpEU1XkDcGLh8iw0UWvVXtNev2yntd9sexBlTcsPCIrt

Name:              systemvg-optlv
State:             ACTIVE
Tables present:    LIVE
Open count:        1
Event number:      0
Major, minor:      253, 0
Number of targets: 1
UUID: NBpEUO85TasBrz3w1zG1qeV6YJ1D380RvY84ZiC41uoRRPkUkb5YQAWcl2QzjzNQ


--------------060704020206080409040502
Content-Type: text/plain;
 name="vgdisplay-v"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="vgdisplay-v"

    Finding all volume groups
    Finding volume group "datavg"
  --- Volume group ---
  VG Name               datavg
  System ID             
  Format                lvm2
  Metadata Areas        1
  Metadata Sequence No  32
  VG Access             read/write
  VG Status             resizable
  MAX LV                0
  Cur LV                3
  Open LV               3
  Max PV                0
  Cur PV                1
  Act PV                1
  VG Size               149.04 GB
  PE Size               4.00 MB
  Total PE              38154
  Alloc PE / Size       38154 / 149.04 GB
  Free  PE / Size       0 / 0   
  VG UUID               3Fs7iV-QxXM-AuIG-1gAT-nAhp-EU1X-kDcGLh
   
  --- Logical volume ---
  LV Name                /dev/datavg/rootlv
  VG Name                datavg
  LV UUID                8iw0UW-vVXt-Nev2-yntd-9sex-BlTc-sPCIrt
  LV Write Access        read/write
  LV Status              available
  # open                 1
  LV Size                1.00 GB
  Current LE             256
  Segments               1
  Allocation             inherit
  Read ahead sectors     0
  Block device           253:6
   
  --- Logical volume ---
  LV Name                /dev/datavg/snk2lv
  VG Name                datavg
  LV UUID                MCuj5G-XO1e-z3OE-BT9N-Lr5p-SbCO-3U8D4K
  LV Write Access        read/write
  LV Status              available
  # open                 1
  LV Size                80.00 GB
  Current LE             20480
  Segments               2
  Allocation             inherit
  Read ahead sectors     0
  Block device           253:7
   
  --- Logical volume ---
  LV Name                /dev/datavg/backup
  VG Name                datavg
  LV UUID                QeHwNa-kVMO-Yf7R-9lvl-Htdj-0NOw-CREYNa
  LV Write Access        read/write
  LV Status              available
  # open                 2
  LV Size                68.04 GB
  Current LE             17418
  Segments               2
  Allocation             inherit
  Read ahead sectors     0
  Block device           253:8
   
  --- Physical volumes ---
  PV Name               /dev/sdb1     
  PV UUID               coJGTK-1xHz-TAPI-vGCs-LB7y-1br2-Jp11wr
  PV Status             allocatable
  Total PE / Free PE    38154 / 0
   
    Finding volume group "systemvg"
  --- Volume group ---
  VG Name               systemvg
  System ID             
  Format                lvm2
  Metadata Areas        1
  Metadata Sequence No  15
  VG Access             read/write
  VG Status             resizable
  MAX LV                0
  Cur LV                6
  Open LV               6
  Max PV                0
  Cur PV                1
  Act PV                1
  VG Size               106.98 GB
  PE Size               4.00 MB
  Total PE              27386
  Alloc PE / Size       26362 / 102.98 GB
  Free  PE / Size       1024 / 4.00 GB
  VG UUID               NBpEUO-85Ta-sBrz-3w1z-G1qe-V6YJ-1D380R
   
  --- Logical volume ---
  LV Name                /dev/systemvg/optlv
  VG Name                systemvg
  LV UUID                vY84Zi-C41u-oRRP-kUkb-5YQA-Wcl2-QzjzNQ
  LV Write Access        read/write
  LV Status              available
  # open                 1
  LV Size                3.00 GB
  Current LE             768
  Segments               1
  Allocation             inherit
  Read ahead sectors     0
  Block device           253:0
   
  --- Logical volume ---
  LV Name                /dev/systemvg/tmplv
  VG Name                systemvg
  LV UUID                BiGpkq-Z75i-8iCg-8ukg-PLiB-ReBH-bxckFe
  LV Write Access        read/write
  LV Status              available
  # open                 1
  LV Size                2.00 GB
  Current LE             512
  Segments               1
  Allocation             inherit
  Read ahead sectors     0
  Block device           253:1
   
  --- Logical volume ---
  LV Name                /dev/systemvg/usrlv
  VG Name                systemvg
  LV UUID                KxSrdJ-snLL-oKq1-Cj71-8tbk-aIAt-ppcUA0
  LV Write Access        read/write
  LV Status              available
  # open                 1
  LV Size                4.00 GB
  Current LE             1024
  Segments               1
  Allocation             inherit
  Read ahead sectors     0
  Block device           253:2
   
  --- Logical volume ---
  LV Name                /dev/systemvg/varlv
  VG Name                systemvg
  LV UUID                hrM191-wOE5-WStG-cJtN-lMqK-LOtm-GUCDHB
  LV Write Access        read/write
  LV Status              available
  # open                 1
  LV Size                2.00 GB
  Current LE             512
  Segments               1
  Allocation             inherit
  Read ahead sectors     0
  Block device           253:3
   
  --- Logical volume ---
  LV Name                /dev/systemvg/temp
  VG Name                systemvg
  LV UUID                1lB1QH-axrq-O382-4Wjb-P4Ia-8rGK-6R39cZ
  LV Write Access        read/write
  LV Status              available
  # open                 1
  LV Size                90.98 GB
  Current LE             23290
  Segments               1
  Allocation             inherit
  Read ahead sectors     0
  Block device           253:4
   
  --- Logical volume ---
  LV Name                /dev/systemvg/rootlv
  VG Name                systemvg
  LV UUID                Re1Lrr-aRY0-VRL5-8HVt-w6as-8dpS-ztQeUx
  LV Write Access        read/write
  LV Status              available
  # open                 1
  LV Size                1.00 GB
  Current LE             256
  Segments               1
  Allocation             inherit
  Read ahead sectors     0
  Block device           253:5
   
  --- Physical volumes ---
  PV Name               /dev/sda4     
  PV UUID               yWbcPC-BBX6-50WJ-lW5n-QVIN-iYgF-x9BINp
  PV Status             allocatable
  Total PE / Free PE    27386 / 1024
   

--------------060704020206080409040502--
