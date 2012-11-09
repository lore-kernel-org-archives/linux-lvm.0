Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id qA9F2GcE007158
	for <linux-lvm@redhat.com>; Fri, 9 Nov 2012 10:02:16 -0500
Received: from mail-vb0-f46.google.com (mail-vb0-f46.google.com
	[209.85.212.46])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id qA9EK4dB017307
	for <linux-lvm@redhat.com>; Fri, 9 Nov 2012 09:20:15 -0500
Received: by mail-vb0-f46.google.com with SMTP id ff1so4612485vbb.33
	for <linux-lvm@redhat.com>; Fri, 09 Nov 2012 06:20:03 -0800 (PST)
MIME-Version: 1.0
From: Vitaly Yakovenko <mr.yaky@gmail.com>
Date: Fri, 9 Nov 2012 16:19:43 +0200
Message-ID: <CAM9BRYT4hi_JsnXA4BGzA5=N1FjecM3ECxo9b_FQo=GPMLXBsw@mail.gmail.com>
Content-Type: multipart/alternative; boundary=f46d042fd726d491a504ce10a5f4
Subject: Re: [linux-lvm] strange usage stats for thin LV
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
To: linux-lvm@redhat.com

--f46d042fd726d491a504ce10a5f4
Content-Type: text/plain; charset=ISO-8859-1

Hi,

I have the problem with fstrim too.

some details:

uname -a
Linux test.local 2.6.32-279.14.1.el6.x86_64 #1 SMP Tue Nov 6 23:43:09 UTC
2012 x86_64 x86_64 x86_64 GNU/Linux


mount
/dev/mapper/VolGroup00-lv_root on / type ext4 (rw)
proc on /proc type proc (rw)
sysfs on /sys type sysfs (rw)
devpts on /dev/pts type devpts (rw,gid=5,mode=620)
tmpfs on /dev/shm type tmpfs (rw)
/dev/md0 on /boot type ext4 (rw)
none on /proc/sys/fs/binfmt_misc type binfmt_misc (rw)
/dev/mapper/VolGroup00-lv_test1 on /mnt/test1 type ext4 (rw)
/dev/mapper/VolGroup00-lv_test2 on /mnt/test2 type ext4 (rw)
/dev/mapper/VolGroup00-lv_test5 on /mnt/test5 type xfs (rw)


df -h
Filesystem            Size  Used Avail Use% Mounted on
/dev/mapper/VolGroup00-lv_root
                       20G  2.3G   17G  13% /
tmpfs                 1.6G     0  1.6G   0% /dev/shm
/dev/md0               99M   27M   67M  29% /boot
/dev/mapper/VolGroup00-lv_test1
                       40G  2.6G   35G   7% /mnt/test1
/dev/mapper/VolGroup00-lv_test2
                      4.0G  1.2G  2.6G  32% /mnt/test2
/dev/mapper/VolGroup00-lv_test5
                      3.0G  725M  2.3G  24% /mnt/test5


lvs -a -o+metadata_percent
  LV                VG         Attr     LSize   Pool      Origin Data%
 Move Log Copy%  Convert Meta%
  lv_native         VolGroup00 -wi-a---   5.00g

  lv_root           VolGroup00 -wi-ao--  20.00g

  lv_swap           VolGroup00 -wi-ao--   4.00g

  lv_test1          VolGroup00 Vwi-aotz  40.00g thin_pool         27.73

  lv_test2          VolGroup00 Vwi-aotz   4.00g thin_pool         98.61

  lv_test5          VolGroup00 Vwi-aotz   3.00g thin_pool         45.40

  thin_pool         VolGroup00 twi-a-tz 100.00g                   16.40
                      8.47
  [thin_pool_tdata] VolGroup00 Twi-aot- 100.00g

  [thin_pool_tmeta] VolGroup00 ewi-aot- 100.00m


This test server (CentOS 6.3 - not install from scratch). I was updated
this server from 6.2 version:

last | tail -3
reboot   system boot  2.6.32-220.el6.x Mon Jan 23 16:03 - 16:04  (00:01)
wtmp begins Mon Jan 23 16:03:26 2012


I test only ext4 fs partitions.
When I used fstrim I had next error:

fstrim /mnt/test1
fstrim: /mnt/test1: FITRIM ioctl failed: Operation not supported

I want retrieve free space from the ext4 fs to the total free space of
thin_pool after delete files on the ext4 fs  (lv_test1).I will have more
free space for another thin LV.
Is it possible to get it?

Thanks in advance.

-- 
Best regards,
Vitaly Yakovenko |

--f46d042fd726d491a504ce10a5f4
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div><div><font face=3D"arial, sans-serif">Hi,</font></div><div><font face=
=3D"arial, sans-serif"><br></font></div><div><font face=3D"arial, sans-seri=
f">I have the problem with fstrim too.</font></div><div><font face=3D"arial=
, sans-serif"><br>

</font></div><div><font face=3D"arial, sans-serif">some details:</font></di=
v><div><font face=3D"arial, sans-serif"><br></font></div><div><font face=3D=
"arial, sans-serif"><div>uname -a</div><div>Linux test.local 2.6.32-279.14.=
1.el6.x86_64 #1 SMP Tue Nov 6 23:43:09 UTC 2012 x86_64 x86_64 x86_64 GNU/Li=
nux</div>

<div><br></div><div><br></div><div><div>mount</div><div>/dev/mapper/VolGrou=
p00-lv_root on / type ext4 (rw)</div><div>proc on /proc type proc (rw)</div=
><div>sysfs on /sys type sysfs (rw)</div><div>devpts on /dev/pts type devpt=
s (rw,gid=3D5,mode=3D620)</div>

<div>tmpfs on /dev/shm type tmpfs (rw)</div><div>/dev/md0 on /boot type ext=
4 (rw)</div><div>none on /proc/sys/fs/binfmt_misc type binfmt_misc (rw)</di=
v><div>/dev/mapper/VolGroup00-lv_test1 on /mnt/test1 type ext4 (rw)</div>

<div>/dev/mapper/VolGroup00-lv_test2 on /mnt/test2 type ext4 (rw)</div><div=
>/dev/mapper/VolGroup00-lv_test5 on /mnt/test5 type xfs (rw)</div></div><di=
v><br></div><div><br></div><div><div>df -h</div><div>Filesystem =A0 =A0 =A0=
 =A0 =A0 =A0Size =A0Used Avail Use% Mounted on</div>

<div>/dev/mapper/VolGroup00-lv_root</div><div>=A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A020G =A02.3G =A0 17G =A013% /</div><div>tmpfs =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 1.6G =A0 =A0 0 =A01.6G =A0 0% /dev/shm</div><div>/dev/=
md0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 99M =A0 27M =A0 67M =A029% /boot</div>
<div>
/dev/mapper/VolGroup00-lv_test1</div><div>=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A040G =A02.6G =A0 35G =A0 7% /mnt/test1</div><div>/dev/mapper/=
VolGroup00-lv_test2</div><div>=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 4=
.0G =A01.2G =A02.6G =A032% /mnt/test2</div><div>/dev/mapper/VolGroup00-lv_t=
est5</div>

<div>=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 3.0G =A0725M =A02.3G =A024=
% /mnt/test5</div></div><div><br></div><div><br></div><div><div>lvs -a -o+m=
etadata_percent</div><div>=A0 LV =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0VG =A0 =A0 =
=A0 =A0 Attr =A0 =A0 LSize =A0 Pool =A0 =A0 =A0Origin Data% =A0Move Log Cop=
y% =A0Convert Meta%=A0</div>

<div>=A0 lv_native =A0 =A0 =A0 =A0 VolGroup00 -wi-a--- =A0 5.00g =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0=A0</div><div>=A0 lv_root =A0 =A0 =A0 =A0 =A0 VolGr=
oup00 -wi-ao-- =A020.00g =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=A0</div>

<div>=A0 lv_swap =A0 =A0 =A0 =A0 =A0 VolGroup00 -wi-ao-- =A0 4.00g =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0=A0</div><div>=A0 lv_test1 =A0 =A0 =A0 =A0 =A0VolGr=
oup00 Vwi-aotz =A040.00g thin_pool =A0 =A0 =A0 =A0 27.73 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=A0</div>

<div>=A0 lv_test2 =A0 =A0 =A0 =A0 =A0VolGroup00 Vwi-aotz =A0 4.00g thin_poo=
l =A0 =A0 =A0 =A0 98.61 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0=A0</div><div>=A0 lv_test5 =A0 =A0 =A0 =A0 =A0VolGroup00 Vwi-aotz =
=A0 3.00g thin_pool =A0 =A0 =A0 =A0 45.40 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0=A0</div>

<div>=A0 thin_pool =A0 =A0 =A0 =A0 VolGroup00 twi-a-tz 100.00g =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 16.40 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 8.47</div><div>=A0 [thin_pool_tdata] VolGroup00 Twi-aot- 100.00g =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=A0</div>

<div>=A0 [thin_pool_tmeta] VolGroup00 ewi-aot- 100.00m</div></div><div><br>=
</div><div><br></div></font></div><div><font face=3D"arial, sans-serif">Thi=
s test server (CentOS 6.3 - not install from scratch). I was updated this s=
erver from 6.2 version:</font></div>

<div><span style=3D"font-family:arial,sans-serif;background-color:rgb(255,2=
55,255)"><br></span></div><div><span style=3D"font-family:arial,sans-serif;=
background-color:rgb(255,255,255)">last | tail -3</span></div><span style=
=3D"background-color:rgb(255,255,255)"><div>

<font face=3D"arial, sans-serif"><div>reboot =A0 system boot =A02.6.32-220.=
el6.x Mon Jan 23 16:03 - 16:04 =A0(00:01) =A0 =A0</div><div>wtmp begins Mon=
 Jan 23 16:03:26 2012</div><div><br></div><div><br></div><div>I test only e=
xt4 fs partitions.</div>

<div>When I used fstrim I had next error:</div><div><br></div><div><div>fst=
rim /mnt/test1</div><div>fstrim: /mnt/test1: FITRIM ioctl failed: Operation=
 not supported</div></div><div><br></div><div>I want retrieve free space fr=
om the ext4 fs to the total free space of thin_pool after delete files on t=
he ext4 fs=A0=A0(lv_test1).I will have more free space for another=A0thin L=
V.</div>

<div>Is it possible to get it?</div></font><font face=3D"arial, sans-serif"=
><div><br></div><div>Thanks in advance.</div><div><br></div></font></div><f=
ont color=3D"#888888" face=3D"arial, sans-serif">--=A0</font></span><br sty=
le=3D"font-size:13px;color:rgb(136,136,136);font-family:arial,sans-serif;ba=
ckground-color:rgb(255,255,255)">

<div style=3D"font-size:13px;color:rgb(136,136,136);font-family:arial,sans-=
serif;background-color:rgb(255,255,255)">Best regards,</div><div style=3D"f=
ont-size:13px;color:rgb(136,136,136);font-family:arial,sans-serif;backgroun=
d-color:rgb(255,255,255)">

<span style=3D"color:rgb(34,34,34)">Vitaly Yakovenko</span><font color=3D"#=
222222">=A0|</font></div></div>

--f46d042fd726d491a504ce10a5f4--
