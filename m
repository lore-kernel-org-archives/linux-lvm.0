Received: from mx1.redhat.com (ext-mx16.extmail.prod.ext.phx2.redhat.com
	[10.5.110.21])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id rA6GPTF3012162
	for <linux-lvm@redhat.com>; Wed, 6 Nov 2013 11:25:29 -0500
Received: from mail-ea0-f180.google.com (mail-ea0-f180.google.com
	[209.85.215.180])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id rA6GPO3s009893
	for <linux-lvm@redhat.com>; Wed, 6 Nov 2013 11:25:24 -0500
Received: by mail-ea0-f180.google.com with SMTP id b11so1157718eae.11
	for <linux-lvm@redhat.com>; Wed, 06 Nov 2013 08:25:23 -0800 (PST)
MIME-Version: 1.0
Date: Wed, 6 Nov 2013 09:25:23 -0700
Message-ID: <CAFp1kvNfoptuFZvUy3Vvn-fb0FH6wPweRj-hNw_N=NpDyDwF8Q@mail.gmail.com>
From: Shi Jin <jinzishuai@gmail.com>
Content-Type: multipart/alternative; boundary=089e0160c1c29a61bf04ea84984e
Subject: [linux-lvm] Restore LVM2 RAID-1 without Reboot
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: LVM general discussion and development <linux-lvm@redhat.com>

--089e0160c1c29a61bf04ea84984e
Content-Type: text/plain; charset=UTF-8

Hi there,

I have set up a RAID-1 between two PVs on two different hard disks in a
RHEL-6 environment.
I am having a problem restoring the broken mirror without rebooting the OS.

Here is how to reproduce my problem.
1. First of all, we have set up a raid-1 LV that looks like this:
[root@shi-rhel63 home]# lvs -a -o +seg_pe_ranges|grep home
  lv_home             vg_root rwi-aom-  1.50g
100.00         lv_home_rimage_0:0-47 lv_home_rimage_1:0-47
  [lv_home_rimage_0]  vg_root iwi-aor-  1.50g
             /dev/sda2:192-239
  [lv_home_rimage_1]  vg_root iwi-aor-  1.50g
             /dev/sdb2:34-81
  [lv_home_rmeta_0]   vg_root ewi-aor- 32.00m
             /dev/sda2:177-177
  [lv_home_rmeta_1]   vg_root ewi-aor- 32.00m
             /dev/sdb2:33-33
[root@shi-rhel63 home]# pvs
  PV         VG      Fmt  Attr PSize  PFree
  /dev/sda2  vg_root lvm2 a--  17.84g 224.00m
  /dev/sdb2  vg_root lvm2 a--  18.84g   1.22g

I can test the mirror by performing a dd write and watch the iostat on both
physical disks:
[root@shi-rhel63 home]# dd if=/dev/zero of=test bs=1M count=10000 &
[1] 23388
[root@shi-rhel63 home]# iostat -x 1 sda sdb -m
Linux 2.6.32-279.el6.x86_64 (shi-rhel63) 06/11/13 _x86_64_ (1 CPU)

avg-cpu:  %user   %nice %system %iowait  %steal   %idle
           0.06    0.07    0.35    0.32    0.00   99.20

Device:         rrqm/s   wrqm/s     r/s     w/s    rMB/s    wMB/s avgrq-sz
avgqu-sz   await  svctm  %util
sda               0.05     0.78    0.38    0.14     0.00     0.00    22.14
    0.01   11.07   5.63   0.29
sdb               0.11     0.79    0.14    0.23     0.00     0.00    27.94
    0.00    5.60   3.71   0.14

avg-cpu:  %user   %nice %system %iowait  %steal   %idle
           0.00    0.00    7.14   92.86    0.00    0.00

Device:         rrqm/s   wrqm/s     r/s     w/s    rMB/s    wMB/s avgrq-sz
avgqu-sz   await  svctm  %util
sda               0.00  5702.04    1.02   56.12     0.01    22.46   805.25
   50.75  911.66  17.86 102.04
sdb               0.00  5173.47    0.00   71.43     0.00    20.42   585.43
    1.21   16.97   3.44  24.59

avg-cpu:  %user   %nice %system %iowait  %steal   %idle
           0.00    0.00    8.08   91.92    0.00    0.00

Device:         rrqm/s   wrqm/s     r/s     w/s    rMB/s    wMB/s avgrq-sz
avgqu-sz   await  svctm  %util
sda               0.00  5131.31    0.00   52.53     0.00    19.71   768.50
   51.39  894.83  19.23 101.01
sdb               0.00  5121.21    0.00   69.70     0.00    18.20   534.70
    1.15   15.96   3.41  23.74

As you may see, both sda and sdb gets similar write IOs so the miror is in
fact working.

2. Now I am going to simulate a disk failure on sdb by removing the disk (I
use VMware so it is very easy). Of course, the mirror is now broken as show
below:

[root@shi-rhel63 home]# lvs -a -o +seg_pe_ranges|grep home
  Couldn't find device with uuid pnsMYs-Ce4t-9KYR-3Zfs-GItC-k5SZ-VidQ30.
  lv_home             vg_root rwi-aom-  1.50g
100.00         lv_home_rimage_0:0-47 lv_home_rimage_1:0-47
  [lv_home_rimage_0]  vg_root iwi-aor-  1.50g
             /dev/sda2:192-239
  [lv_home_rimage_1]  vg_root iwi-aor-  1.50g
             unknown device:34-81
  [lv_home_rmeta_0]   vg_root ewi-aor- 32.00m
             /dev/sda2:177-177
  [lv_home_rmeta_1]   vg_root ewi-aor- 32.00m
             unknown device:33-33
[root@shi-rhel63 home]# pvs
  Couldn't find device with uuid pnsMYs-Ce4t-9KYR-3Zfs-GItC-k5SZ-VidQ30.
  PV             VG      Fmt  Attr PSize  PFree
  /dev/sda2      vg_root lvm2 a--  17.84g 224.00m
  unknown device vg_root lvm2 a-m  18.84g   1.22g

I already have a slight problem here since the mirror status above still
shows 100% Copy% but I accept it as a minor presentation issue.

3. Now I put the moved disk back and I would like to have a way to
incrementally resync the difference from the point where the mirror is
broken. Note that the same disk now shows up as sdc

[root@shi-rhel63 home]# pvs
  PV         VG      Fmt  Attr PSize  PFree
  /dev/sda2  vg_root lvm2 a--  17.84g 224.00m
  /dev/sdc2  vg_root lvm2 a--  18.84g   1.22g
[root@shi-rhel63 home]# lvs -a -o +seg_pe_ranges|grep home
  lv_home             vg_root rwi-aom-  1.50g
100.00         lv_home_rimage_0:0-47 lv_home_rimage_1:0-47
  [lv_home_rimage_0]  vg_root iwi-aor-  1.50g
             /dev/sda2:192-239
  [lv_home_rimage_1]  vg_root iwi-aor-  1.50g
             /dev/sdc2:34-81
  [lv_home_rmeta_0]   vg_root ewi-aor- 32.00m
             /dev/sda2:177-177
  [lv_home_rmeta_1]   vg_root ewi-aor- 32.00m
             /dev/sdc2:33-33

So everything looks perfect but if I perform the same dd write test, here
is what I got:
[root@shi-rhel63 home]# iostat -x 1 sda sdc -m
Linux 2.6.32-279.el6.x86_64 (shi-rhel63) 06/11/13 _x86_64_ (1 CPU)

avg-cpu:  %user   %nice %system %iowait  %steal   %idle
           0.06    0.07    0.36    0.42    0.00   99.10

Device:         rrqm/s   wrqm/s     r/s     w/s    rMB/s    wMB/s avgrq-sz
avgqu-sz   await  svctm  %util
sda               0.05     7.70    0.39    0.21     0.00     0.03   109.24
    0.11  174.10   6.77   0.40
sdc               0.02     0.00    0.01    0.00     0.00     0.00     8.30
    0.00    3.07   2.85   0.00

avg-cpu:  %user   %nice %system %iowait  %steal   %idle
           0.00    0.00    5.15   94.85    0.00    0.00

Device:         rrqm/s   wrqm/s     r/s     w/s    rMB/s    wMB/s avgrq-sz
avgqu-sz   await  svctm  %util
sda               0.00  6281.44    0.00   49.48     0.00    22.14   916.38
  138.42 2932.19  20.83 103.09
sdc               0.00     0.00    0.00    0.00     0.00     0.00     0.00
    0.00    0.00   0.00   0.00

avg-cpu:  %user   %nice %system %iowait  %steal   %idle
           0.00    0.00    5.10   94.90    0.00    0.00

Device:         rrqm/s   wrqm/s     r/s     w/s    rMB/s    wMB/s avgrq-sz
avgqu-sz   await  svctm  %util
sda               0.00  6213.27    0.00   54.08     0.00    23.99   908.30
  136.34 2812.40  18.87 102.04
sdc               0.00     0.00    0.00    0.00     0.00     0.00     0.00
    0.00    0.00   0.00   0.00

avg-cpu:  %user   %nice %system %iowait  %steal   %idle
           0.00    0.00    6.06   93.94    0.00    0.00

Device:         rrqm/s   wrqm/s     r/s     w/s    rMB/s    wMB/s avgrq-sz
avgqu-sz   await  svctm  %util
sda               0.00  5141.41    0.00   50.51     0.00    22.23   901.36
  133.47 2612.74  20.00 101.01
sdc               0.00     0.00    0.00    0.00     0.00     0.00     0.00
    0.00    0.00   0.00   0.00

So it is clear that the newly added mirror is not being written at all.

What is really interesting is that if I reboot, it will work properly. But
is there a way not to reboot?

Thanks a lot,
Shi
PS. My OS info

[root@shi-rhel63 home]# uname -a
Linux shi-rhel63 2.6.32-279.el6.x86_64 #1 SMP Wed Jun 13 18:24:36 EDT 2012
x86_64 x86_64 x86_64 GNU/Linux
[root@shi-rhel63 home]# lvm version
  LVM version:     2.02.95(2)-RHEL6 (2012-05-16)
  Library version: 1.02.74-RHEL6 (2012-05-16)
  Driver version:  4.22.6

--089e0160c1c29a61bf04ea84984e
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: base64

PGRpdiBkaXI9Imx0ciI+SGkgdGhlcmUsPGRpdj48YnI+PC9kaXY+PGRpdj5JIGhhdmUgc2V0IHVw
IGEgUkFJRC0xIGJldHdlZW4gdHdvIFBWcyBvbiB0d28gZGlmZmVyZW50IGhhcmQgZGlza3MgaW4g
YSBSSEVMLTYgZW52aXJvbm1lbnQuPC9kaXY+PGRpdj5JIGFtIGhhdmluZyBhIHByb2JsZW0gcmVz
dG9yaW5nIHRoZSBicm9rZW4gbWlycm9yIHdpdGhvdXQgcmVib290aW5nIHRoZSBPUy48L2Rpdj4N
CjxkaXY+PGJyPjwvZGl2PjxkaXY+SGVyZSBpcyBob3cgdG8gcmVwcm9kdWNlIG15IHByb2JsZW0u
PC9kaXY+PGRpdj4xLiBGaXJzdCBvZiBhbGwsIHdlIGhhdmUgc2V0IHVwIGEgcmFpZC0xIExWIHRo
YXQgbG9va3MgbGlrZSB0aGlzOjwvZGl2PjxkaXY+PGRpdj5bcm9vdEBzaGktcmhlbDYzIGhvbWVd
IyBsdnMgLWEgLW8gK3NlZ19wZV9yYW5nZXN8Z3JlcCBob21lPC9kaXY+PGRpdj7CoCBsdl9ob21l
IMKgIMKgIMKgIMKgIMKgIMKgIHZnX3Jvb3QgcndpLWFvbS0gwqAxLjUwZyDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAxMDAuMDAgwqAgwqAgwqAgwqAgbHZfaG9tZV9y
aW1hZ2VfMDowLTQ3IGx2X2hvbWVfcmltYWdlXzE6MC00NyDCoDwvZGl2Pg0KPGRpdj7CoCBbbHZf
aG9tZV9yaW1hZ2VfMF0gwqB2Z19yb290IGl3aS1hb3ItIMKgMS41MGcgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAvZGV2L3Nk
YTI6MTkyLTIzOSDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoDwvZGl2
PjxkaXY+wqAgW2x2X2hvbWVfcmltYWdlXzFdIMKgdmdfcm9vdCBpd2ktYW9yLSDCoDEuNTBnIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgL2Rldi9zZGIyOjM0LTgxIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgPC9kaXY+DQo8ZGl2PsKgIFtsdl9ob21lX3JtZXRhXzBdIMKgIHZnX3Jvb3QgZXdp
LWFvci0gMzIuMDBtIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgL2Rldi9zZGEyOjE3Ny0xNzcgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqA8L2Rpdj48ZGl2PsKgIFtsdl9ob21lX3JtZXRhXzFdIMKg
IHZnX3Jvb3QgZXdpLWFvci0gMzIuMDBtIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgL2Rldi9zZGIyOjMzLTMzIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgPC9kaXY+DQo8ZGl2Pltyb290QHNo
aS1yaGVsNjMgaG9tZV0jIHB2czwvZGl2PjxkaXY+wqAgUFYgwqAgwqAgwqAgwqAgVkcgwqAgwqAg
wqBGbXQgwqBBdHRyIFBTaXplIMKgUEZyZWUgwqA8L2Rpdj48ZGl2PsKgIC9kZXYvc2RhMiDCoHZn
X3Jvb3QgbHZtMiBhLS0gwqAxNy44NGcgMjI0LjAwbTwvZGl2PjxkaXY+wqAgL2Rldi9zZGIyIMKg
dmdfcm9vdCBsdm0yIGEtLSDCoDE4Ljg0ZyDCoCAxLjIyZzwvZGl2PjxkaXY+PGJyPjwvZGl2Pg0K
PGRpdiBzdHlsZT5JIGNhbiB0ZXN0IHRoZSBtaXJyb3IgYnkgcGVyZm9ybWluZyBhIGRkIHdyaXRl
IGFuZCB3YXRjaCB0aGUgaW9zdGF0IG9uIGJvdGggcGh5c2ljYWwgZGlza3M6PC9kaXY+PGRpdiBz
dHlsZT48ZGl2Pltyb290QHNoaS1yaGVsNjMgaG9tZV0jIGRkIGlmPS9kZXYvemVybyBvZj10ZXN0
IGJzPTFNIGNvdW50PTEwMDAwICZhbXA7PC9kaXY+PGRpdj5bMV0gMjMzODg8L2Rpdj4NCjxkaXY+
W3Jvb3RAc2hpLXJoZWw2MyBob21lXSMgaW9zdGF0IC14IDEgc2RhIHNkYiAtbTwvZGl2PjxkaXY+
TGludXggMi42LjMyLTI3OS5lbDYueDg2XzY0IChzaGktcmhlbDYzKSA8c3BhbiBjbGFzcz0iIiBz
dHlsZT0id2hpdGUtc3BhY2U6cHJlIj4JPC9zcGFuPjA2LzExLzEzIDxzcGFuIGNsYXNzPSIiIHN0
eWxlPSJ3aGl0ZS1zcGFjZTpwcmUiPgk8L3NwYW4+X3g4Nl82NF88c3BhbiBjbGFzcz0iIiBzdHls
ZT0id2hpdGUtc3BhY2U6cHJlIj4JPC9zcGFuPigxIENQVSk8L2Rpdj4NCjxkaXY+PGJyPjwvZGl2
PjxkaXY+YXZnLWNwdTogwqAldXNlciDCoCAlbmljZSAlc3lzdGVtICVpb3dhaXQgwqAlc3RlYWwg
wqAgJWlkbGU8L2Rpdj48ZGl2PsKgIMKgIMKgIMKgIMKgIMKgMC4wNiDCoCDCoDAuMDcgwqAgwqAw
LjM1IMKgIMKgMC4zMiDCoCDCoDAuMDAgwqAgOTkuMjA8L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2
PkRldmljZTogwqAgwqAgwqAgwqAgcnJxbS9zIMKgIHdycW0vcyDCoCDCoCByL3MgwqAgwqAgdy9z
IMKgIMKgck1CL3MgwqAgwqB3TUIvcyBhdmdycS1zeiBhdmdxdS1zeiDCoCBhd2FpdCDCoHN2Y3Rt
IMKgJXV0aWw8L2Rpdj4NCjxkaXY+c2RhIMKgIMKgIMKgIMKgIMKgIMKgIMKgIDAuMDUgwqAgwqAg
MC43OCDCoCDCoDAuMzggwqAgwqAwLjE0IMKgIMKgIDAuMDAgwqAgwqAgMC4wMCDCoCDCoDIyLjE0
IMKgIMKgIDAuMDEgwqAgMTEuMDcgwqAgNS42MyDCoCAwLjI5PC9kaXY+PGRpdj5zZGIgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgMC4xMSDCoCDCoCAwLjc5IMKgIMKgMC4xNCDCoCDCoDAuMjMgwqAgwqAg
MC4wMCDCoCDCoCAwLjAwIMKgIMKgMjcuOTQgwqAgwqAgMC4wMCDCoCDCoDUuNjAgwqAgMy43MSDC
oCAwLjE0PC9kaXY+DQo8ZGl2Pjxicj48L2Rpdj48ZGl2PmF2Zy1jcHU6IMKgJXVzZXIgwqAgJW5p
Y2UgJXN5c3RlbSAlaW93YWl0IMKgJXN0ZWFsIMKgICVpZGxlPC9kaXY+PGRpdj7CoCDCoCDCoCDC
oCDCoCDCoDAuMDAgwqAgwqAwLjAwIMKgIMKgNy4xNCDCoCA5Mi44NiDCoCDCoDAuMDAgwqAgwqAw
LjAwPC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj5EZXZpY2U6IMKgIMKgIMKgIMKgIHJycW0vcyDC
oCB3cnFtL3MgwqAgwqAgci9zIMKgIMKgIHcvcyDCoCDCoHJNQi9zIMKgIMKgd01CL3MgYXZncnEt
c3ogYXZncXUtc3ogwqAgYXdhaXQgwqBzdmN0bSDCoCV1dGlsPC9kaXY+DQo8ZGl2PnNkYSDCoCDC
oCDCoCDCoCDCoCDCoCDCoCAwLjAwIMKgNTcwMi4wNCDCoCDCoDEuMDIgwqAgNTYuMTIgwqAgwqAg
MC4wMSDCoCDCoDIyLjQ2IMKgIDgwNS4yNSDCoCDCoDUwLjc1IMKgOTExLjY2IMKgMTcuODYgMTAy
LjA0PC9kaXY+PGRpdj5zZGIgwqAgwqAgwqAgwqAgwqAgwqAgwqAgMC4wMCDCoDUxNzMuNDcgwqAg
wqAwLjAwIMKgIDcxLjQzIMKgIMKgIDAuMDAgwqAgwqAyMC40MiDCoCA1ODUuNDMgwqAgwqAgMS4y
MSDCoCAxNi45NyDCoCAzLjQ0IMKgMjQuNTk8L2Rpdj4NCjxkaXY+PGJyPjwvZGl2PjxkaXY+YXZn
LWNwdTogwqAldXNlciDCoCAlbmljZSAlc3lzdGVtICVpb3dhaXQgwqAlc3RlYWwgwqAgJWlkbGU8
L2Rpdj48ZGl2PsKgIMKgIMKgIMKgIMKgIMKgMC4wMCDCoCDCoDAuMDAgwqAgwqA4LjA4IMKgIDkx
LjkyIMKgIMKgMC4wMCDCoCDCoDAuMDA8L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PkRldmljZTog
wqAgwqAgwqAgwqAgcnJxbS9zIMKgIHdycW0vcyDCoCDCoCByL3MgwqAgwqAgdy9zIMKgIMKgck1C
L3MgwqAgwqB3TUIvcyBhdmdycS1zeiBhdmdxdS1zeiDCoCBhd2FpdCDCoHN2Y3RtIMKgJXV0aWw8
L2Rpdj4NCjxkaXY+c2RhIMKgIMKgIMKgIMKgIMKgIMKgIMKgIDAuMDAgwqA1MTMxLjMxIMKgIMKg
MC4wMCDCoCA1Mi41MyDCoCDCoCAwLjAwIMKgIMKgMTkuNzEgwqAgNzY4LjUwIMKgIMKgNTEuMzkg
wqA4OTQuODMgwqAxOS4yMyAxMDEuMDE8L2Rpdj48ZGl2PnNkYiDCoCDCoCDCoCDCoCDCoCDCoCDC
oCAwLjAwIMKgNTEyMS4yMSDCoCDCoDAuMDAgwqAgNjkuNzAgwqAgwqAgMC4wMCDCoCDCoDE4LjIw
IMKgIDUzNC43MCDCoCDCoCAxLjE1IMKgIDE1Ljk2IMKgIDMuNDEgwqAyMy43NDwvZGl2Pg0KPGRp
dj48YnI+PC9kaXY+PGRpdiBzdHlsZT5BcyB5b3UgbWF5IHNlZSwgYm90aCBzZGEgYW5kIHNkYiBn
ZXRzIHNpbWlsYXIgd3JpdGUgSU9zIHNvIHRoZSBtaXJvciBpcyBpbiBmYWN0IHdvcmtpbmcuPC9k
aXY+PGRpdiBzdHlsZT48YnI+PC9kaXY+PGRpdiBzdHlsZT4yLiBOb3cgSSBhbSBnb2luZyB0byBz
aW11bGF0ZSBhIGRpc2sgZmFpbHVyZSBvbiBzZGIgYnkgcmVtb3ZpbmcgdGhlIGRpc2sgKEkgdXNl
IFZNd2FyZSBzbyBpdCBpcyB2ZXJ5IGVhc3kpLiBPZiBjb3Vyc2UsIHRoZSBtaXJyb3IgaXMgbm93
IGJyb2tlbiBhcyBzaG93IGJlbG93OjwvZGl2Pg0KPGRpdiBzdHlsZT48YnI+PC9kaXY+PGRpdiBz
dHlsZT48ZGl2Pltyb290QHNoaS1yaGVsNjMgaG9tZV0jIGx2cyAtYSAtbyArc2VnX3BlX3Jhbmdl
c3xncmVwIGhvbWU8L2Rpdj48ZGl2PsKgIENvdWxkbiYjMzk7dCBmaW5kIGRldmljZSB3aXRoIHV1
aWQgcG5zTVlzLUNlNHQtOUtZUi0zWmZzLUdJdEMtazVTWi1WaWRRMzAuPC9kaXY+PGRpdj7CoCBs
dl9ob21lIMKgIMKgIMKgIMKgIMKgIMKgIHZnX3Jvb3QgcndpLWFvbS0gwqAxLjUwZyDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAxMDAuMDAgwqAgwqAgwqAgwqAgbHZf
aG9tZV9yaW1hZ2VfMDowLTQ3IGx2X2hvbWVfcmltYWdlXzE6MC00NyDCoDwvZGl2Pg0KPGRpdj7C
oCBbbHZfaG9tZV9yaW1hZ2VfMF0gwqB2Z19yb290IGl3aS1hb3ItIMKgMS41MGcgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAv
ZGV2L3NkYTI6MTkyLTIzOSDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oDwvZGl2PjxkaXY+wqAgW2x2X2hvbWVfcmltYWdlXzFdIMKgdmdfcm9vdCBpd2ktYW9yLSDCoDEu
NTBnIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgdW5rbm93biBkZXZpY2U6MzQtODEgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqDCoDwvZGl2Pg0KPGRpdj7CoCBbbHZfaG9tZV9ybWV0YV8wXSDCoCB2Z19yb290
IGV3aS1hb3ItIDMyLjAwbSDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoC9kZXYvc2RhMjoxNzctMTc3IMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgPC9kaXY+PGRpdj7CoCBbbHZfaG9tZV9ybWV0YV8x
XSDCoCB2Z19yb290IGV3aS1hb3ItIDMyLjAwbSDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHVua25vd24gZGV2aWNlOjMzLTMz
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgwqA8L2Rpdj4NCjxkaXY+W3Jvb3RA
c2hpLXJoZWw2MyBob21lXSMgcHZzPC9kaXY+PGRpdj7CoCBDb3VsZG4mIzM5O3QgZmluZCBkZXZp
Y2Ugd2l0aCB1dWlkIHBuc01Zcy1DZTR0LTlLWVItM1pmcy1HSXRDLWs1U1otVmlkUTMwLjwvZGl2
PjxkaXY+wqAgUFYgwqAgwqAgwqAgwqAgwqAgwqAgVkcgwqAgwqAgwqBGbXQgwqBBdHRyIFBTaXpl
IMKgUEZyZWUgwqA8L2Rpdj48ZGl2PsKgIC9kZXYvc2RhMiDCoCDCoCDCoHZnX3Jvb3QgbHZtMiBh
LS0gwqAxNy44NGcgMjI0LjAwbTwvZGl2Pg0KPGRpdj7CoCB1bmtub3duIGRldmljZSB2Z19yb290
IGx2bTIgYS1tIMKgMTguODRnIMKgIDEuMjJnPC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdiBzdHls
ZT5JIGFscmVhZHkgaGF2ZSBhIHNsaWdodCBwcm9ibGVtIGhlcmUgc2luY2UgdGhlIG1pcnJvciBz
dGF0dXMgYWJvdmUgc3RpbGwgc2hvd3MgMTAwJcKgQ29weSUgYnV0IEkgYWNjZXB0IGl0IGFzIGEg
bWlub3IgcHJlc2VudGF0aW9uIGlzc3VlLjwvZGl2Pg0KPGRpdiBzdHlsZT48YnI+PC9kaXY+PGRp
diBzdHlsZT4zLiBOb3cgSSBwdXQgdGhlIG1vdmVkIGRpc2sgYmFjayBhbmQgSSB3b3VsZCBsaWtl
IHRvIGhhdmUgYSB3YXkgdG8gaW5jcmVtZW50YWxseSByZXN5bmMgdGhlIGRpZmZlcmVuY2UgZnJv
bSB0aGUgcG9pbnQgd2hlcmUgdGhlIG1pcnJvciBpcyBicm9rZW4uIE5vdGUgdGhhdCB0aGUgc2Ft
ZSBkaXNrIG5vdyBzaG93cyB1cCBhcyBzZGM8L2Rpdj4NCjxkaXYgc3R5bGU+PGJyPjwvZGl2Pjxk
aXYgc3R5bGU+PGRpdj5bcm9vdEBzaGktcmhlbDYzIGhvbWVdIyBwdnM8L2Rpdj48ZGl2PsKgIFBW
IMKgIMKgIMKgIMKgIFZHIMKgIMKgIMKgRm10IMKgQXR0ciBQU2l6ZSDCoFBGcmVlIMKgPC9kaXY+
PGRpdj7CoCAvZGV2L3NkYTIgwqB2Z19yb290IGx2bTIgYS0tIMKgMTcuODRnIDIyNC4wMG08L2Rp
dj48ZGl2PsKgIC9kZXYvc2RjMiDCoHZnX3Jvb3QgbHZtMiBhLS0gwqAxOC44NGcgwqAgMS4yMmc8
L2Rpdj4NCjxkaXY+W3Jvb3RAc2hpLXJoZWw2MyBob21lXSMgbHZzIC1hIC1vICtzZWdfcGVfcmFu
Z2VzfGdyZXAgaG9tZTwvZGl2PjxkaXY+wqAgbHZfaG9tZSDCoCDCoCDCoCDCoCDCoCDCoCB2Z19y
b290IHJ3aS1hb20tIMKgMS41MGcgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgMTAwLjAwIMKgIMKgIMKgIMKgIGx2X2hvbWVfcmltYWdlXzA6MC00NyBsdl9ob21lX3Jp
bWFnZV8xOjAtNDcgwqA8L2Rpdj48ZGl2PsKgIFtsdl9ob21lX3JpbWFnZV8wXSDCoHZnX3Jvb3Qg
aXdpLWFvci0gwqAxLjUwZyDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoC9kZXYvc2RhMjoxOTItMjM5IMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgPC9kaXY+DQo8ZGl2PsKgIFtsdl9ob21lX3JpbWFn
ZV8xXSDCoHZnX3Jvb3QgaXdpLWFvci0gwqAxLjUwZyDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoC9kZXYvc2RjMjozNC04MSDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoDwvZGl2PjxkaXY+wqAg
W2x2X2hvbWVfcm1ldGFfMF0gwqAgdmdfcm9vdCBld2ktYW9yLSAzMi4wMG0gwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAvZGV2
L3NkYTI6MTc3LTE3NyDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoDwv
ZGl2Pg0KPGRpdj7CoCBbbHZfaG9tZV9ybWV0YV8xXSDCoCB2Z19yb290IGV3aS1hb3ItIDMyLjAw
bSDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoC9kZXYvc2RjMjozMy0zMyDCoDwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXYgc3R5
bGU+U28gZXZlcnl0aGluZyBsb29rcyBwZXJmZWN0IGJ1dCBpZiBJIHBlcmZvcm0gdGhlIHNhbWUg
ZGQgd3JpdGUgdGVzdCwgaGVyZSBpcyB3aGF0IEkgZ290OjwvZGl2Pg0KPGRpdiBzdHlsZT48ZGl2
Pltyb290QHNoaS1yaGVsNjMgaG9tZV0jIGlvc3RhdCAteCAxIHNkYSBzZGMgLW08L2Rpdj48ZGl2
PkxpbnV4IDIuNi4zMi0yNzkuZWw2Lng4Nl82NCAoc2hpLXJoZWw2MykgPHNwYW4gY2xhc3M9IiIg
c3R5bGU9IndoaXRlLXNwYWNlOnByZSI+CTwvc3Bhbj4wNi8xMS8xMyA8c3BhbiBjbGFzcz0iIiBz
dHlsZT0id2hpdGUtc3BhY2U6cHJlIj4JPC9zcGFuPl94ODZfNjRfPHNwYW4gY2xhc3M9IiIgc3R5
bGU9IndoaXRlLXNwYWNlOnByZSI+CTwvc3Bhbj4oMSBDUFUpPC9kaXY+DQo8ZGl2Pjxicj48L2Rp
dj48ZGl2PmF2Zy1jcHU6IMKgJXVzZXIgwqAgJW5pY2UgJXN5c3RlbSAlaW93YWl0IMKgJXN0ZWFs
IMKgICVpZGxlPC9kaXY+PGRpdj7CoCDCoCDCoCDCoCDCoCDCoDAuMDYgwqAgwqAwLjA3IMKgIMKg
MC4zNiDCoCDCoDAuNDIgwqAgwqAwLjAwIMKgIDk5LjEwPC9kaXY+PGRpdj48YnI+PC9kaXY+PGRp
dj5EZXZpY2U6IMKgIMKgIMKgIMKgIHJycW0vcyDCoCB3cnFtL3MgwqAgwqAgci9zIMKgIMKgIHcv
cyDCoCDCoHJNQi9zIMKgIMKgd01CL3MgYXZncnEtc3ogYXZncXUtc3ogwqAgYXdhaXQgwqBzdmN0
bSDCoCV1dGlsPC9kaXY+DQo8ZGl2PnNkYSDCoCDCoCDCoCDCoCDCoCDCoCDCoCAwLjA1IMKgIMKg
IDcuNzAgwqAgwqAwLjM5IMKgIMKgMC4yMSDCoCDCoCAwLjAwIMKgIMKgIDAuMDMgwqAgMTA5LjI0
IMKgIMKgIDAuMTEgwqAxNzQuMTAgwqAgNi43NyDCoCAwLjQwPC9kaXY+PGRpdj5zZGMgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgMC4wMiDCoCDCoCAwLjAwIMKgIMKgMC4wMSDCoCDCoDAuMDAgwqAgwqAg
MC4wMCDCoCDCoCAwLjAwIMKgIMKgIDguMzAgwqAgwqAgMC4wMCDCoCDCoDMuMDcgwqAgMi44NSDC
oCAwLjAwPC9kaXY+DQo8ZGl2Pjxicj48L2Rpdj48ZGl2PmF2Zy1jcHU6IMKgJXVzZXIgwqAgJW5p
Y2UgJXN5c3RlbSAlaW93YWl0IMKgJXN0ZWFsIMKgICVpZGxlPC9kaXY+PGRpdj7CoCDCoCDCoCDC
oCDCoCDCoDAuMDAgwqAgwqAwLjAwIMKgIMKgNS4xNSDCoCA5NC44NSDCoCDCoDAuMDAgwqAgwqAw
LjAwPC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj5EZXZpY2U6IMKgIMKgIMKgIMKgIHJycW0vcyDC
oCB3cnFtL3MgwqAgwqAgci9zIMKgIMKgIHcvcyDCoCDCoHJNQi9zIMKgIMKgd01CL3MgYXZncnEt
c3ogYXZncXUtc3ogwqAgYXdhaXQgwqBzdmN0bSDCoCV1dGlsPC9kaXY+DQo8ZGl2PnNkYSDCoCDC
oCDCoCDCoCDCoCDCoCDCoCAwLjAwIMKgNjI4MS40NCDCoCDCoDAuMDAgwqAgNDkuNDggwqAgwqAg
MC4wMCDCoCDCoDIyLjE0IMKgIDkxNi4zOCDCoCAxMzguNDIgMjkzMi4xOSDCoDIwLjgzIDEwMy4w
OTwvZGl2PjxkaXY+c2RjIMKgIMKgIMKgIMKgIMKgIMKgIMKgIDAuMDAgwqAgwqAgMC4wMCDCoCDC
oDAuMDAgwqAgwqAwLjAwIMKgIMKgIDAuMDAgwqAgwqAgMC4wMCDCoCDCoCAwLjAwIMKgIMKgIDAu
MDAgwqAgwqAwLjAwIMKgIDAuMDAgwqAgMC4wMDwvZGl2Pg0KPGRpdj48YnI+PC9kaXY+PGRpdj5h
dmctY3B1OiDCoCV1c2VyIMKgICVuaWNlICVzeXN0ZW0gJWlvd2FpdCDCoCVzdGVhbCDCoCAlaWRs
ZTwvZGl2PjxkaXY+wqAgwqAgwqAgwqAgwqAgwqAwLjAwIMKgIMKgMC4wMCDCoCDCoDUuMTAgwqAg
OTQuOTAgwqAgwqAwLjAwIMKgIMKgMC4wMDwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+RGV2aWNl
OiDCoCDCoCDCoCDCoCBycnFtL3MgwqAgd3JxbS9zIMKgIMKgIHIvcyDCoCDCoCB3L3MgwqAgwqBy
TUIvcyDCoCDCoHdNQi9zIGF2Z3JxLXN6IGF2Z3F1LXN6IMKgIGF3YWl0IMKgc3ZjdG0gwqAldXRp
bDwvZGl2Pg0KPGRpdj5zZGEgwqAgwqAgwqAgwqAgwqAgwqAgwqAgMC4wMCDCoDYyMTMuMjcgwqAg
wqAwLjAwIMKgIDU0LjA4IMKgIMKgIDAuMDAgwqAgwqAyMy45OSDCoCA5MDguMzAgwqAgMTM2LjM0
IDI4MTIuNDAgwqAxOC44NyAxMDIuMDQ8L2Rpdj48ZGl2PnNkYyDCoCDCoCDCoCDCoCDCoCDCoCDC
oCAwLjAwIMKgIMKgIDAuMDAgwqAgwqAwLjAwIMKgIMKgMC4wMCDCoCDCoCAwLjAwIMKgIMKgIDAu
MDAgwqAgwqAgMC4wMCDCoCDCoCAwLjAwIMKgIMKgMC4wMCDCoCAwLjAwIMKgIDAuMDA8L2Rpdj4N
CjxkaXY+PGJyPjwvZGl2PjxkaXY+YXZnLWNwdTogwqAldXNlciDCoCAlbmljZSAlc3lzdGVtICVp
b3dhaXQgwqAlc3RlYWwgwqAgJWlkbGU8L2Rpdj48ZGl2PsKgIMKgIMKgIMKgIMKgIMKgMC4wMCDC
oCDCoDAuMDAgwqAgwqA2LjA2IMKgIDkzLjk0IMKgIMKgMC4wMCDCoCDCoDAuMDA8L2Rpdj48ZGl2
Pjxicj48L2Rpdj48ZGl2PkRldmljZTogwqAgwqAgwqAgwqAgcnJxbS9zIMKgIHdycW0vcyDCoCDC
oCByL3MgwqAgwqAgdy9zIMKgIMKgck1CL3MgwqAgwqB3TUIvcyBhdmdycS1zeiBhdmdxdS1zeiDC
oCBhd2FpdCDCoHN2Y3RtIMKgJXV0aWw8L2Rpdj4NCjxkaXY+c2RhIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIDAuMDAgwqA1MTQxLjQxIMKgIMKgMC4wMCDCoCA1MC41MSDCoCDCoCAwLjAwIMKgIMKgMjIu
MjMgwqAgOTAxLjM2IMKgIDEzMy40NyAyNjEyLjc0IMKgMjAuMDAgMTAxLjAxPC9kaXY+PGRpdj5z
ZGMgwqAgwqAgwqAgwqAgwqAgwqAgwqAgMC4wMCDCoCDCoCAwLjAwIMKgIMKgMC4wMCDCoCDCoDAu
MDAgwqAgwqAgMC4wMCDCoCDCoCAwLjAwIMKgIMKgIDAuMDAgwqAgwqAgMC4wMCDCoCDCoDAuMDAg
wqAgMC4wMCDCoCAwLjAwPC9kaXY+DQo8ZGl2Pjxicj48L2Rpdj48ZGl2IHN0eWxlPlNvIGl0IGlz
IGNsZWFyIHRoYXQgdGhlIG5ld2x5IGFkZGVkIG1pcnJvciBpcyBub3QgYmVpbmcgd3JpdHRlbiBh
dCBhbGwuPC9kaXY+PGRpdiBzdHlsZT48YnI+PC9kaXY+PGRpdiBzdHlsZT5XaGF0IGlzIHJlYWxs
eSBpbnRlcmVzdGluZyBpcyB0aGF0IGlmIEkgcmVib290LCBpdCB3aWxsIHdvcmsgcHJvcGVybHku
IEJ1dCBpcyB0aGVyZSBhIHdheSBub3QgdG8gcmVib290PzwvZGl2Pg0KPGRpdiBzdHlsZT48YnI+
PC9kaXY+PGRpdiBzdHlsZT5UaGFua3MgYSBsb3QsPC9kaXY+PGRpdiBzdHlsZT5TaGk8L2Rpdj48
ZGl2IHN0eWxlPlBTLiBNeSBPUyBpbmZvPC9kaXY+PGRpdiBzdHlsZT48YnI+PC9kaXY+PGRpdiBz
dHlsZT48ZGl2Pltyb290QHNoaS1yaGVsNjMgaG9tZV0jIHVuYW1lIC1hPC9kaXY+PGRpdj5MaW51
eCBzaGktcmhlbDYzIDIuNi4zMi0yNzkuZWw2Lng4Nl82NCAjMSBTTVAgV2VkIEp1biAxMyAxODoy
NDozNiBFRFQgMjAxMiB4ODZfNjQgeDg2XzY0IHg4Nl82NCBHTlUvTGludXg8L2Rpdj4NCjxkaXY+
W3Jvb3RAc2hpLXJoZWw2MyBob21lXSMgbHZtIHZlcnNpb248L2Rpdj48ZGl2PsKgIExWTSB2ZXJz
aW9uOiDCoCDCoCAyLjAyLjk1KDIpLVJIRUw2ICgyMDEyLTA1LTE2KTwvZGl2PjxkaXY+wqAgTGli
cmFyeSB2ZXJzaW9uOiAxLjAyLjc0LVJIRUw2ICgyMDEyLTA1LTE2KTwvZGl2PjxkaXY+wqAgRHJp
dmVyIHZlcnNpb246IMKgNC4yMi42PC9kaXY+PGRpdj48YnI+PC9kaXY+PC9kaXY+PC9kaXY+DQo8
L2Rpdj48L2Rpdj48L2Rpdj48L2Rpdj48L2Rpdj4NCg==
--089e0160c1c29a61bf04ea84984e--
