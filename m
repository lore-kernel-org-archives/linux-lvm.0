Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id jBF32Y119862
	for <linux-lvm@redhat.com>; Wed, 14 Dec 2005 22:02:34 -0500
Received: from zproxy.gmail.com (zproxy.gmail.com [64.233.162.201])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id jBF32RYn007617
	for <linux-lvm@redhat.com>; Wed, 14 Dec 2005 22:02:27 -0500
Received: by zproxy.gmail.com with SMTP id x3so296559nzd
	for <linux-lvm@redhat.com>; Wed, 14 Dec 2005 19:02:26 -0800 (PST)
Message-ID: <539807300512141902w3cfa6ecdk@mail.gmail.com>
Date: Thu, 15 Dec 2005 11:02:26 +0800
From: Lee Rocky <rocky366@gmail.com>
Subject: Re: [linux-lvm] Invalid new snapshot
In-Reply-To: <20051214145144.GO25866@agk.surrey.redhat.com>
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_214_2424176.1134615746822"
References: <539807300512131937s72661636h@mail.gmail.com>
	<20051214145144.GO25866@agk.surrey.redhat.com>
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
To: LVM general discussion and development <linux-lvm@redhat.com>

------=_Part_214_2424176.1134615746822
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Kernel =3D>  2.6.13 (dm-snapshot-bio_list-fix.patch patched)

lvm version =3D>
  LVM version:     2.02.01 (2005-11-23)
  Library version: 1.02.02 (2005-12-02)
  Driver version:  4.4.0

-bash-3.00# lvcreate -s -L3000 -n test2_1 /dev/VG01/test2
  Rounding up size to full physical extent 2.94 GB
  Logical volume "test2_1" created
-bash-3.00# lvcreate -s -L 3000 -n test2_2 /dev/VG01/test2
  Rounding up size to full physical extent 2.94 GB
  Logical volume "test2_2" created
-bash-3.00# lvcreate -s -L 3000 -n test2_3 /dev/VG01/test2
  Rounding up size to full physical extent 2.94 GB
  Logical volume "test2_3" created


lvs --segment -v
----------------------------------------------------------
    Finding all logical volumes
  /dev/VG01/test2_3: read failed after 0 of 4096 at 0: Input/output error
  LV      VG                       Attr   Start SSize   #Str Type   Stripe
Chunk
  lv1      VG01 -wi-ao    0  256.00M    1 linear     0     0
  lv2      VG01 -wi-ao    0    1.00G    1 linear     0     0
  lv3      VG01 -wi-a-    0   64.00M    1 linear     0     0
  lv4      VG01 -wi-ao    0  512.00M    1 linear     0     0
  lv5      VG01 -wi-ao    0  128.00M    1 linear     0     0
  test2   VG01owi-ao    0   29.31G    1 linear     0     0
  test2_1 VG01 swi-a-    0    2.94G    1 linear     0  8.00K
  test2_2 VG01 swi-a-    0    2.94G    1 linear     0  8.00K
  test2_3 VG01 Swi-I-    0    2.94G    1 linear     0  8.00K


-bash-3.00# lvs -a
  /dev/VG01/test2_3: read failed after 0 of 4096 at 0: Inpu/output error
  LV      VG      Attr   LSize   Origin Snap%  Move Log Copy%
  lv1       VG01  -wi-ao 256.00M
  lv2       VG01  -wi-ao   1.00G
  lv3       VG01  -wi-a-  64.00M
  lv4       VG01  -wi-ao 512.00M
  lv5       VG01  -wi-ao 128.00M
  test2   VG01 owi-ao  29.31G
  test2_1 VG01 swi-a-   2.94G test2   30.00
  test2_2 VG01 swi-a-   2.94G test2   29.99
  test2_3 VG01 Swi-I-   2.94G test2  100.00

 lvscan
----------------------------------------------------------
  /dev/VG01/test2_3: read failed after 0 of 4096 at 0: Input/output error
  ACTIVE                '/dev/VG01/lv1' [256.00 MB] inherit
  ACTIVE                '/dev/VG01/lv2' [1.00 GB] inherit
  ACTIVE                '/dev/VG01/lv3' [64.00 MB] inherit
  ACTIVE                '/dev/VG01/lv4' [512.00 MB] inherit
  ACTIVE                '/dev/VG01lv5' [128.00 MB] inherit
  ACTIVE   Original '/dev/VG01/test2' [29.31 GB] inherit
  ACTIVE   Snapshot '/dev/VG01/test2_1' [2.94 GB] inherit
  ACTIVE   Snapshot '/dev/VG01/test2_2' [2.94 GB] inherit
  ACTIVE   Snapshot '/dev/VG01/test2_3' [2.94 GB] inherit

dmesg after created
----------------------------------------------------------
attempt to access beyond end of device
dm-11: rw=3D17, want=3D2271285024, limit=3D6160384
device-mapper: Error reading/writing snapshot
device-mapper: snapshot is marked invalid

dmesg after tried to mount
----------------------------------------------------------
printk: 1 messages suppressed.
Buffer I/O error on device dm-12, logical block 0
Buffer I/O error on device dm-12, logical block 1
Buffer I/O error on device dm-12, logical block 2
Buffer I/O error on device dm-12, logical block 3
Buffer I/O error on device dm-12, logical block 4
Buffer I/O error on device dm-12, logical block 5
Buffer I/O error on device dm-12, logical block 6
Buffer I/O error on device dm-12, logical block 7
Buffer I/O error on device dm-12, logical block 0
Buffer I/O error on device dm-12, logical block 8
FAT: Unrecognized mount option "nouuid" or missing value


I create snapshot while test2 is busy. (I/O origin volume)
but even I stopped writing data (already got error), sometime it still
happen. 1 out of 3
-bash-3.00# lvs -a
  /dev/VG01/test2_4: read failed after 0 of 4096 at 0: Input/output error
  /dev/VG01/test2_7: read failed after 0 of 4096 at 0: Input/output error
  /dev/VG01/test2_10: read failed after 0 of 4096 at 0: Input/output error
  lv1        VG01 -wi-ao 256.00M
  lv2        VG01 -wi-ao   1.00G
  lv3        VG01 -wi-a-  64.00M
  lv4        VG01 -wi-ao 512.00M
  lv5        VG01 -wi-ao 128.00M
  test2     VG01 owi-ao  29.31G
  test2_1  VG01 swi-a-   2.94G test2   38.28
  test2_10 VG01 Swi-I-   2.94G test2  100.00
  test2_2  VG01 swi-a-   2.94G test2   38.27
  test2_3  VG01 swi-a-   2.94G test2    0.01
  test2_4  VG01 Swi-I-   2.94G test2  100.00
  test2_5  VG01 swi-a-   2.94G test2    0.00
  test2_6  VG01 swi-a-   2.94G test2    0.00
  test2_7  VG01 Swi-I-   2.94G test2  100.00
  test2_8  VG01 swi-a-   2.94G test2    0.00
  test2_9  VG01 swi-a-   2.94G test2    0.00

Rocky

------=_Part_214_2424176.1134615746822
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Kernel =3D&gt;&nbsp; 2.6.13 (dm-snapshot-bio_list-fix.patch patched)<br>
<br>
lvm version =3D&gt;<br>
&nbsp; LVM version:&nbsp;&nbsp;&nbsp;&nbsp; 2.02.01 (2005-11-23)<br>
&nbsp; Library version: 1.02.02 (2005-12-02)<br>
&nbsp; Driver version:&nbsp; 4.4.0<br>
<br>
-bash-3.00# lvcreate -s -L3000 -n test2_1 /dev/VG01/test2<br>
&nbsp; Rounding up size to full physical extent 2.94 GB<br>
&nbsp; Logical volume &quot;test2_1&quot; created<br>
-bash-3.00# lvcreate -s -L 3000 -n test2_2 /dev/VG01/test2<br>
&nbsp; Rounding up size to full physical extent 2.94 GB<br>
&nbsp; Logical volume &quot;test2_2&quot; created<br>
-bash-3.00# lvcreate -s -L 3000 -n test2_3 /dev/VG01/test2<br>
&nbsp; Rounding up size to full physical extent 2.94 GB<br>
&nbsp; Logical volume &quot;test2_3&quot; created<br>
<br>
<br>lvs --segment -v<br>
----------------------------------------------------------<br>
&nbsp;&nbsp;&nbsp; Finding all logical volumes<br>
&nbsp; /dev/VG01/test2_3: read failed after 0 of 4096 at 0: Input/output er=
ror<br>
&nbsp; LV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
VG&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
Attr&nbsp;&nbsp; Start SSize&nbsp;&nbsp; #Str Type&nbsp;&nbsp; Stripe
Chunk<br>
&nbsp; lv1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; VG01 -wi-ao&nbsp;&nbsp;&nbsp;
0&nbsp; 256.00M&nbsp;&nbsp;&nbsp; 1 linear&nbsp;&nbsp;&nbsp;&nbsp;
0&nbsp;&nbsp;&nbsp;&nbsp; 0<br>
&nbsp; lv2 &nbsp; &nbsp;&nbsp; VG01 -wi-ao&nbsp;&nbsp;&nbsp;
0&nbsp;&nbsp;&nbsp; 1.00G&nbsp;&nbsp;&nbsp; 1
linear&nbsp;&nbsp;&nbsp;&nbsp; 0&nbsp;&nbsp;&nbsp;&nbsp; 0<br>
&nbsp; lv3 &nbsp; &nbsp;&nbsp; VG01 -wi-a-&nbsp;&nbsp;&nbsp;
0&nbsp;&nbsp; 64.00M&nbsp;&nbsp;&nbsp; 1 linear&nbsp;&nbsp;&nbsp;&nbsp;
0&nbsp;&nbsp;&nbsp;&nbsp; 0<br>
&nbsp; lv4&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; VG01 -wi-ao&nbsp;&nbsp;&nbsp;
0&nbsp; 512.00M&nbsp;&nbsp;&nbsp; 1 linear&nbsp;&nbsp;&nbsp;&nbsp;
0&nbsp;&nbsp;&nbsp;&nbsp; 0<br>
&nbsp; lv5 &nbsp; &nbsp;&nbsp; VG01 -wi-ao&nbsp;&nbsp;&nbsp; 0&nbsp;
128.00M&nbsp;&nbsp;&nbsp; 1 linear&nbsp;&nbsp;&nbsp;&nbsp;
0&nbsp;&nbsp;&nbsp;&nbsp; 0<br>
&nbsp; test2 &nbsp; VG01owi-ao&nbsp;&nbsp;&nbsp; 0&nbsp;&nbsp;
29.31G&nbsp;&nbsp;&nbsp; 1 linear&nbsp;&nbsp;&nbsp;&nbsp;
0&nbsp;&nbsp;&nbsp;&nbsp; 0<br>
&nbsp; test2_1 VG01 swi-a-&nbsp;&nbsp;&nbsp; 0&nbsp;&nbsp;&nbsp;
2.94G&nbsp;&nbsp;&nbsp; 1 linear&nbsp;&nbsp;&nbsp;&nbsp; 0&nbsp; 8.00K<br>
&nbsp; test2_2 VG01 swi-a-&nbsp;&nbsp;&nbsp; 0&nbsp;&nbsp;&nbsp;
2.94G&nbsp;&nbsp;&nbsp; 1 linear&nbsp;&nbsp;&nbsp;&nbsp; 0&nbsp; 8.00K<br>
&nbsp; test2_3 VG01 Swi-I-&nbsp;&nbsp;&nbsp; 0&nbsp;&nbsp;&nbsp;
2.94G&nbsp;&nbsp;&nbsp; 1 linear&nbsp;&nbsp;&nbsp;&nbsp; 0&nbsp; 8.00K<br>
<br>
<br>
-bash-3.00# lvs -a<br>
&nbsp; /dev/VG01/test2_3: read failed after 0 of 4096 at 0: Inpu/output err=
or<br>
&nbsp; LV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
VG&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Attr&nbsp;&nbsp; LSize&nbsp;&nbsp;
Origin Snap%&nbsp; Move Log Copy%<br>
&nbsp; lv1&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; VG01&nbsp; -wi-ao 256.00M<br>
&nbsp; lv2&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; VG01&nbsp; -wi-ao&nbsp;&nbsp=
; 1.00G<br>
&nbsp; lv3&nbsp; &nbsp; &nbsp;&nbsp; VG01&nbsp; -wi-a-&nbsp; 64.00M<br>
&nbsp; lv4&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; VG01&nbsp; -wi-ao 512.00M<br=
>
&nbsp; lv5&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; VG01&nbsp; -wi-ao 128.00M<br=
>
&nbsp; test2&nbsp;&nbsp; VG01 owi-ao&nbsp; 29.31G<br>
&nbsp; test2_1 VG01 swi-a-&nbsp;&nbsp; 2.94G test2&nbsp;&nbsp; 30.00<br>
&nbsp; test2_2 VG01 swi-a-&nbsp;&nbsp; 2.94G test2&nbsp;&nbsp; 29.99<br>
&nbsp; test2_3 VG01 Swi-I-&nbsp;&nbsp; 2.94G test2&nbsp; 100.00<br>
<br>&nbsp;lvscan<br>
----------------------------------------------------------<br>
&nbsp; /dev/VG01/test2_3: read failed after 0 of 4096 at 0: Input/output er=
ror<br>
&nbsp;
ACTIVE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp; &nbsp;&nbsp; '/dev/VG01/lv1' [256.00 MB] inherit<br>
&nbsp; ACTIVE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &=
nbsp; &nbsp;&nbsp; '/dev/VG01/lv2' [1.00 GB] inherit<br>
&nbsp; ACTIVE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &=
nbsp; &nbsp;&nbsp; '/dev/VG01/lv3' [64.00 MB] inherit<br>
&nbsp;
ACTIVE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp; &nbsp;&nbsp; '/dev/VG01/lv4' [512.00 MB] inherit<br>
&nbsp; ACTIVE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; =
&nbsp; &nbsp; '/dev/VG01lv5' [128.00 MB] inherit<br>
&nbsp; ACTIVE&nbsp;&nbsp; Original '/dev/VG01/test2' [29.31 GB] inherit<br>
&nbsp; ACTIVE&nbsp;&nbsp; Snapshot '/dev/VG01/test2_1' [2.94 GB] inherit<br=
>
&nbsp; ACTIVE&nbsp;&nbsp; Snapshot '/dev/VG01/test2_2' [2.94 GB] inherit<br=
>
&nbsp; ACTIVE&nbsp;&nbsp; Snapshot '/dev/VG01/test2_3' [2.94 GB] inherit<br=
>&nbsp; <br>
dmesg after created<br>
----------------------------------------------------------<br>attempt to ac=
cess beyond end of device<br>
dm-11: rw=3D17, want=3D2271285024, limit=3D6160384<br>
device-mapper: Error reading/writing snapshot<br>
device-mapper: snapshot is marked invalid<br>
<br>
dmesg after tried to mount <br>
----------------------------------------------------------<br>
printk: 1 messages suppressed.<br>
Buffer I/O error on device dm-12, logical block 0<br>
Buffer I/O error on device dm-12, logical block 1<br>
Buffer I/O error on device dm-12, logical block 2<br>
Buffer I/O error on device dm-12, logical block 3<br>
Buffer I/O error on device dm-12, logical block 4<br>
Buffer I/O error on device dm-12, logical block 5<br>
Buffer I/O error on device dm-12, logical block 6<br>
Buffer I/O error on device dm-12, logical block 7<br>
Buffer I/O error on device dm-12, logical block 0<br>
Buffer I/O error on device dm-12, logical block 8<br>
FAT: Unrecognized mount option &quot;nouuid&quot; or missing value<br>
<br>
<br>
 I create snapshot while test2 is busy. (I/O origin volume)<br>
but even I stopped writing data (already got error), sometime it still happ=
en. 1 out of 3<br>
-bash-3.00# lvs -a<br>
&nbsp; /dev/VG01/test2_4: read failed after 0 of 4096 at 0: Input/output er=
ror<br>
&nbsp; /dev/VG01/test2_7: read failed after 0 of 4096 at 0: Input/output er=
ror<br>
&nbsp; /dev/VG01/test2_10: read failed after 0 of 4096 at 0: Input/output e=
rror<br>
&nbsp; lv1 &nbsp; &nbsp; &nbsp;&nbsp; VG01 -wi-ao 256.00M<br>
&nbsp; lv2&nbsp;&nbsp;&nbsp; &nbsp; &nbsp; VG01 -wi-ao&nbsp;&nbsp; 1.00G<br=
>
&nbsp; lv3&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; VG01 -wi-a-&nbsp; 64.00M<br=
>
&nbsp; lv4&nbsp;&nbsp;&nbsp; &nbsp; &nbsp; VG01 -wi-ao 512.00M<br>
&nbsp; lv5&nbsp; &nbsp; &nbsp; &nbsp; VG01 -wi-ao 128.00M<br>
&nbsp; test2&nbsp;&nbsp; &nbsp; VG01 owi-ao&nbsp; 29.31G<br>
&nbsp; test2_1&nbsp; VG01 swi-a-&nbsp;&nbsp; 2.94G test2&nbsp;&nbsp; 38.28<=
br>
&nbsp; test2_10 VG01 Swi-I-&nbsp;&nbsp; 2.94G test2&nbsp; 100.00<br>
&nbsp; test2_2&nbsp; VG01 swi-a-&nbsp;&nbsp; 2.94G test2&nbsp;&nbsp; 38.27<=
br>
&nbsp; test2_3&nbsp; VG01 swi-a-&nbsp;&nbsp; 2.94G test2&nbsp;&nbsp;&nbsp; =
0.01<br>
&nbsp; test2_4&nbsp; VG01 Swi-I-&nbsp;&nbsp; 2.94G test2&nbsp; 100.00<br>
&nbsp; test2_5&nbsp; VG01 swi-a-&nbsp;&nbsp; 2.94G test2&nbsp;&nbsp;&nbsp; =
0.00<br>
&nbsp; test2_6&nbsp; VG01 swi-a-&nbsp;&nbsp; 2.94G test2&nbsp;&nbsp;&nbsp; =
0.00<br>
&nbsp; test2_7&nbsp; VG01 Swi-I-&nbsp;&nbsp; 2.94G test2&nbsp; 100.00<br>
&nbsp; test2_8&nbsp; VG01 swi-a-&nbsp;&nbsp; 2.94G test2&nbsp;&nbsp;&nbsp; =
0.00<br>
&nbsp; test2_9&nbsp; VG01 swi-a-&nbsp;&nbsp; 2.94G test2&nbsp;&nbsp;&nbsp; =
0.00<br>
<br>
Rocky<br>


------=_Part_214_2424176.1134615746822--
