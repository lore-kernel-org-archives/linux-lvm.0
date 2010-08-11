Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.11])
	by int-mx04.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o7B8gjnG027353
	for <linux-lvm@redhat.com>; Wed, 11 Aug 2010 04:42:45 -0400
Received: from mail-ey0-f174.google.com (mail-ey0-f174.google.com
	[209.85.215.174])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o7B8gV1h031992
	for <linux-lvm@redhat.com>; Wed, 11 Aug 2010 04:42:32 -0400
Received: by eya25 with SMTP id 25so5622398eya.33
	for <linux-lvm@redhat.com>; Wed, 11 Aug 2010 01:42:31 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <AANLkTinkg_uy8YdHtKGHrZZW4qCzERQGNXMA4fn4y=_S@mail.gmail.com>
References: <AANLkTinkg_uy8YdHtKGHrZZW4qCzERQGNXMA4fn4y=_S@mail.gmail.com>
Date: Wed, 11 Aug 2010 10:42:31 +0200
Message-ID: <AANLkTimHG4oMx3aK0K6iCPSuP_6utoccSyeR_si-JOMs@mail.gmail.com>
From: Giorgio Bersano <giorgio.bersano@gmail.com>
Content-Type: multipart/alternative; boundary=0015174be92cf69312048d883a62
Subject: Re: [linux-lvm] calculating free capacity from pvdisplay and
	lvdisplay
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

--0015174be92cf69312048d883a62
Content-Type: text/plain; charset=ISO-8859-1

2010/8/11 Rahul Nabar <rpnabar@gmail.com>

> Some of the physical volumes show "Allocatable           yes (but
> full)" while others don't. How does one relate this to the actual
> capacity? THe reason I am confused is that 3 of my PV's show up as
> full and each is 1.63 TB. Thus the total full space would come to 4.89
> TB. But the sum of full space of all my LV's is only around 3 TB
> (based on the output of df)
>
> I've reproduced the outputs of pvdisplay, lvdisplay and df below.
>
> I'm confused! Any pointers?
>
> --
> Rahul
>
>
Hi Rahul,
you really appear to have 6 PV (not three) of 1.63TB each and all that
storage space is assigned to the VG euclid_highperf_storage .
The VG has three LV defined from it and indeed has free space; using these
LV you  created three filesystems which have free space too, as Ray just
explained.

You have not shown the output of a vgs command but if If you issue it you
should see something like this:

#vgs
  VG         #PV #LV #SN Attr   VSize VFree
  euclid_highperf_storage  6   3   0 wz--n- 9.8T   1.22T

and so you still have 1.22 TB of free space to use

some math...

Details from pvdisplay:
PE Size (KByte)  4096  = 4MB
VG Name          euclid_highperf_storage
Total PE= 428351*6 = 2570106*4MB = 10280424 MB = 9.8TB
total Free PE: 38140+140607+140607 = 319354*4MB = 1277416M = 1.22 TB
total Allocated PE: 428351*3+390211+287744+287744 = 2250752*4MB = 9003008 MB
= 8.58 TB

Details from lvdisplay:
Current LE     1572864+153600+524288 = 2250752
exactly like the Allocated PE in pvdisplay

Best regards,
Giorgio.



> [root@eustorage ~]# pvdisplay
>  --- Physical volume ---
>  PV Name               /dev/sdb
>  VG Name               euclid_highperf_storage
>  PV Size               1.63 TB / not usable 4.00 MB
>  Allocatable           yes (but full)
>  PE Size (KByte)       4096
>  Total PE              428351
>  Free PE               0
>  Allocated PE          428351
>  PV UUID               wDdbmP-2n5m-98HD-Ewqk-Q3y0-lnMf-rsaVXt
>
>  --- Physical volume ---
>  PV Name               /dev/sdc
>  VG Name               euclid_highperf_storage
>  PV Size               1.63 TB / not usable 4.00 MB
>  Allocatable           yes (but full)
>  PE Size (KByte)       4096
>  Total PE              428351
>  Free PE               0
>  Allocated PE          428351
>  PV UUID               75i75q-2rec-2FMf-eyPa-W0nF-zFHH-PIAvvc
>
>  --- Physical volume ---
>  PV Name               /dev/sdd
>  VG Name               euclid_highperf_storage
>  PV Size               1.63 TB / not usable 4.00 MB
>  Allocatable           yes (but full)
>  PE Size (KByte)       4096
>  Total PE              428351
>  Free PE               0
>  Allocated PE          428351
>  PV UUID               vo2Jh2-PfFC-eOj4-GYnP-Jx1I-Sisu-2nY4lC
>
>  --- Physical volume ---
>  PV Name               /dev/sde
>  VG Name               euclid_highperf_storage
>  PV Size               1.63 TB / not usable 4.00 MB
>  Allocatable           yes
>  PE Size (KByte)       4096
>  Total PE              428351
>  Free PE               38140
>  Allocated PE          390211
>  PV UUID               EK7cvF-IZjf-PJVw-d2RR-lCdt-kOSD-iqFtOf
>
>  --- Physical volume ---
>  PV Name               /dev/sdf
>  VG Name               euclid_highperf_storage
>  PV Size               1.63 TB / not usable 4.00 MB
>  Allocatable           yes
>  PE Size (KByte)       4096
>  Total PE              428351
>  Free PE               140607
>  Allocated PE          287744
>  PV UUID               fQXN8S-HhYu-weoq-kbuz-BrxZ-6WQk-6ydBDw
>
>  --- Physical volume ---
>  PV Name               /dev/sdg
>  VG Name               euclid_highperf_storage
>  PV Size               1.63 TB / not usable 4.00 MB
>  Allocatable           yes
>  PE Size (KByte)       4096
>  Total PE              428351
>  Free PE               140607
>  Allocated PE          287744
>  PV UUID               i7GD1d-rbd2-efKd-uK3u-D3S2-BxJv-UkrNve
>
> [root@eustorage ~]# df -h
> Filesystem            Size  Used Avail Use% Mounted on
> /dev/sda2              76G  8.6G   64G  12% /
> /dev/sda6              19G  365M   17G   3% /var
> /dev/sda5              15G  165M   14G   2% /tmp
> /dev/sda1             487M   17M  445M   4% /boot
> tmpfs                  24G     0   24G   0% /dev/shm
> /dev/mapper/euclid_highperf_storage-LV_home
>                      6.0T  1.4T  4.4T  24% /home
> /dev/mapper/euclid_highperf_storage-LV_export
>                      591G   17G  550G   3% /opt
> /dev/mapper/euclid_highperf_storage-LV_polhome
>                      2.0T  1.5T  386G  80% /polhome
> [root@eustorage ~]# lvdisplay
>  --- Logical volume ---
>  LV Name                /dev/euclid_highperf_storage/LV_home
>  VG Name                euclid_highperf_storage
>  LV UUID                gu7yo1-TYYr-ucHG-QSDk-y8HD-ETrs-Z5kCk9
>  LV Write Access        read/write
>  LV Status              available
>  # open                 1
>  LV Size                6.00 TB
>  Current LE             1572864
>  Segments               1
>  Allocation             inherit
>  Read ahead sectors     auto
>  - currently set to     1536
>  Block device           253:0
>
>  --- Logical volume ---
>  LV Name                /dev/euclid_highperf_storage/LV_export
>  VG Name                euclid_highperf_storage
>  LV UUID                1lktLy-Hgn3-qS1m-41VJ-5kNY-DMyb-1ri4Th
>  LV Write Access        read/write
>  LV Status              available
>  # open                 1
>  LV Size                600.00 GB
>  Current LE             153600
>  Segments               1
>  Allocation             inherit
>  Read ahead sectors     auto
>  - currently set to     1536
>  Block device           253:1
>
>  --- Logical volume ---
>  LV Name                /dev/euclid_highperf_storage/LV_polhome
>  VG Name                euclid_highperf_storage
>  LV UUID                xqpOX5-HFey-H0qi-NgjP-NVS7-FwDb-zbiK8m
>  LV Write Access        read/write
>  LV Status              available
>  # open                 1
>  LV Size                2.00 TB
>  Current LE             524288
>  Segments               4
>  Allocation             inherit
>  Read ahead sectors     auto
>  - currently set to     256
>  Block device           253:2
>
>

--0015174be92cf69312048d883a62
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/8/11 Rahul Nabar <span dir=3D"ltr">&lt;<a href=3D"mailto:rpnabar@gmail=
.com">rpnabar@gmail.com</a>&gt;</span><br><div class=3D"gmail_quote"><block=
quote class=3D"gmail_quote" style=3D"border-left: 1px solid rgb(204, 204, 2=
04); margin: 0pt 0pt 0pt 0.8ex; padding-left: 1ex;">
Some of the physical volumes show &quot;Allocatable =A0 =A0 =A0 =A0 =A0 yes=
 (but<br>
full)&quot; while others don&#39;t. How does one relate this to the actual<=
br>
capacity? THe reason I am confused is that 3 of my PV&#39;s show up as<br>
full and each is 1.63 TB. Thus the total full space would come to 4.89<br>
TB. But the sum of full space of all my LV&#39;s is only around 3 TB<br>
(based on the output of df)<br>
<br>
I&#39;ve reproduced the outputs of pvdisplay, lvdisplay and df below.<br>
<br>
I&#39;m confused! Any pointers?<br>
<br>
--<br>
Rahul<br>
<br></blockquote><div><br>Hi Rahul,<br>you really appear to have 6 PV (not =
three) of 1.63TB each and all that storage space is assigned to the VG eucl=
id_highperf_storage .<br>The VG has three LV defined from it and indeed has=
 free space; using these LV you=A0 created three filesystems which have fre=
e space too, as Ray just explained.<br>
<br>You have not shown the output of a vgs command but if If you issue it y=
ou should see something like this:<br><br>#vgs<br>=A0 VG=A0=A0=A0=A0=A0=A0=
=A0=A0 #PV #LV #SN Attr=A0=A0 VSize VFree<br>=A0 euclid_highperf_storage=A0=
 6=A0=A0 3=A0=A0 0 wz--n- 9.8T=A0=A0 1.22T<br>
<br>and so you still have 1.22 TB of free space to use<br><br>some math...<=
br><br>Details from pvdisplay:<br>PE Size (KByte)=A0 4096=A0 =3D 4MB<br>VG =
Name=A0=A0=A0=A0=A0=A0=A0=A0=A0 euclid_highperf_storage<br>Total PE=3D 4283=
51*6 =3D 2570106*4MB =3D 10280424 MB =3D 9.8TB<br>
total Free PE: 38140+140607+140607 =3D 319354*4MB =3D 1277416M =3D 1.22 TB<=
br>total Allocated PE: 428351*3+390211+287744+287744 =3D 2250752*4MB =3D 90=
03008 MB =3D 8.58 TB<br><br>Details from lvdisplay:<br>Current LE=A0=A0=A0=
=A0 1572864+153600+524288 =3D 2250752 <br>
exactly like the Allocated PE in pvdisplay<br><br>Best regards,<br>Giorgio.=
 <br><br><br></div><blockquote class=3D"gmail_quote" style=3D"border-left: =
1px solid rgb(204, 204, 204); margin: 0pt 0pt 0pt 0.8ex; padding-left: 1ex;=
">

<br>
[root@eustorage ~]# pvdisplay<br>
 =A0--- Physical volume ---<br>
 =A0PV Name =A0 =A0 =A0 =A0 =A0 =A0 =A0 /dev/sdb<br>
 =A0VG Name =A0 =A0 =A0 =A0 =A0 =A0 =A0 euclid_highperf_storage<br>
 =A0PV Size =A0 =A0 =A0 =A0 =A0 =A0 =A0 1.63 TB / not usable 4.00 MB<br>
 =A0Allocatable =A0 =A0 =A0 =A0 =A0 yes (but full)<br>
 =A0PE Size (KByte) =A0 =A0 =A0 4096<br>
 =A0Total PE =A0 =A0 =A0 =A0 =A0 =A0 =A0428351<br>
 =A0Free PE =A0 =A0 =A0 =A0 =A0 =A0 =A0 0<br>
 =A0Allocated PE =A0 =A0 =A0 =A0 =A0428351<br>
 =A0PV UUID =A0 =A0 =A0 =A0 =A0 =A0 =A0 wDdbmP-2n5m-98HD-Ewqk-Q3y0-lnMf-rsa=
VXt<br>
<br>
 =A0--- Physical volume ---<br>
 =A0PV Name =A0 =A0 =A0 =A0 =A0 =A0 =A0 /dev/sdc<br>
 =A0VG Name =A0 =A0 =A0 =A0 =A0 =A0 =A0 euclid_highperf_storage<br>
 =A0PV Size =A0 =A0 =A0 =A0 =A0 =A0 =A0 1.63 TB / not usable 4.00 MB<br>
 =A0Allocatable =A0 =A0 =A0 =A0 =A0 yes (but full)<br>
 =A0PE Size (KByte) =A0 =A0 =A0 4096<br>
 =A0Total PE =A0 =A0 =A0 =A0 =A0 =A0 =A0428351<br>
 =A0Free PE =A0 =A0 =A0 =A0 =A0 =A0 =A0 0<br>
 =A0Allocated PE =A0 =A0 =A0 =A0 =A0428351<br>
 =A0PV UUID =A0 =A0 =A0 =A0 =A0 =A0 =A0 75i75q-2rec-2FMf-eyPa-W0nF-zFHH-PIA=
vvc<br>
<br>
 =A0--- Physical volume ---<br>
 =A0PV Name =A0 =A0 =A0 =A0 =A0 =A0 =A0 /dev/sdd<br>
 =A0VG Name =A0 =A0 =A0 =A0 =A0 =A0 =A0 euclid_highperf_storage<br>
 =A0PV Size =A0 =A0 =A0 =A0 =A0 =A0 =A0 1.63 TB / not usable 4.00 MB<br>
 =A0Allocatable =A0 =A0 =A0 =A0 =A0 yes (but full)<br>
 =A0PE Size (KByte) =A0 =A0 =A0 4096<br>
 =A0Total PE =A0 =A0 =A0 =A0 =A0 =A0 =A0428351<br>
 =A0Free PE =A0 =A0 =A0 =A0 =A0 =A0 =A0 0<br>
 =A0Allocated PE =A0 =A0 =A0 =A0 =A0428351<br>
 =A0PV UUID =A0 =A0 =A0 =A0 =A0 =A0 =A0 vo2Jh2-PfFC-eOj4-GYnP-Jx1I-Sisu-2nY=
4lC<br>
<br>
 =A0--- Physical volume ---<br>
 =A0PV Name =A0 =A0 =A0 =A0 =A0 =A0 =A0 /dev/sde<br>
 =A0VG Name =A0 =A0 =A0 =A0 =A0 =A0 =A0 euclid_highperf_storage<br>
 =A0PV Size =A0 =A0 =A0 =A0 =A0 =A0 =A0 1.63 TB / not usable 4.00 MB<br>
 =A0Allocatable =A0 =A0 =A0 =A0 =A0 yes<br>
 =A0PE Size (KByte) =A0 =A0 =A0 4096<br>
 =A0Total PE =A0 =A0 =A0 =A0 =A0 =A0 =A0428351<br>
 =A0Free PE =A0 =A0 =A0 =A0 =A0 =A0 =A0 38140<br>
 =A0Allocated PE =A0 =A0 =A0 =A0 =A0390211<br>
 =A0PV UUID =A0 =A0 =A0 =A0 =A0 =A0 =A0 EK7cvF-IZjf-PJVw-d2RR-lCdt-kOSD-iqF=
tOf<br>
<br>
 =A0--- Physical volume ---<br>
 =A0PV Name =A0 =A0 =A0 =A0 =A0 =A0 =A0 /dev/sdf<br>
 =A0VG Name =A0 =A0 =A0 =A0 =A0 =A0 =A0 euclid_highperf_storage<br>
 =A0PV Size =A0 =A0 =A0 =A0 =A0 =A0 =A0 1.63 TB / not usable 4.00 MB<br>
 =A0Allocatable =A0 =A0 =A0 =A0 =A0 yes<br>
 =A0PE Size (KByte) =A0 =A0 =A0 4096<br>
 =A0Total PE =A0 =A0 =A0 =A0 =A0 =A0 =A0428351<br>
 =A0Free PE =A0 =A0 =A0 =A0 =A0 =A0 =A0 140607<br>
 =A0Allocated PE =A0 =A0 =A0 =A0 =A0287744<br>
 =A0PV UUID =A0 =A0 =A0 =A0 =A0 =A0 =A0 fQXN8S-HhYu-weoq-kbuz-BrxZ-6WQk-6yd=
BDw<br>
<br>
 =A0--- Physical volume ---<br>
 =A0PV Name =A0 =A0 =A0 =A0 =A0 =A0 =A0 /dev/sdg<br>
 =A0VG Name =A0 =A0 =A0 =A0 =A0 =A0 =A0 euclid_highperf_storage<br>
 =A0PV Size =A0 =A0 =A0 =A0 =A0 =A0 =A0 1.63 TB / not usable 4.00 MB<br>
 =A0Allocatable =A0 =A0 =A0 =A0 =A0 yes<br>
 =A0PE Size (KByte) =A0 =A0 =A0 4096<br>
 =A0Total PE =A0 =A0 =A0 =A0 =A0 =A0 =A0428351<br>
 =A0Free PE =A0 =A0 =A0 =A0 =A0 =A0 =A0 140607<br>
 =A0Allocated PE =A0 =A0 =A0 =A0 =A0287744<br>
 =A0PV UUID =A0 =A0 =A0 =A0 =A0 =A0 =A0 i7GD1d-rbd2-efKd-uK3u-D3S2-BxJv-Ukr=
Nve<br>
<br>
[root@eustorage ~]# df -h<br>
Filesystem =A0 =A0 =A0 =A0 =A0 =A0Size =A0Used Avail Use% Mounted on<br>
/dev/sda2 =A0 =A0 =A0 =A0 =A0 =A0 =A076G =A08.6G =A0 64G =A012% /<br>
/dev/sda6 =A0 =A0 =A0 =A0 =A0 =A0 =A019G =A0365M =A0 17G =A0 3% /var<br>
/dev/sda5 =A0 =A0 =A0 =A0 =A0 =A0 =A015G =A0165M =A0 14G =A0 2% /tmp<br>
/dev/sda1 =A0 =A0 =A0 =A0 =A0 =A0 487M =A0 17M =A0445M =A0 4% /boot<br>
tmpfs =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A024G =A0 =A0 0 =A0 24G =A0 0% /dev/=
shm<br>
/dev/mapper/euclid_highperf_storage-LV_home<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A06.0T =A01.4T =A04.4T =A024% /ho=
me<br>
/dev/mapper/euclid_highperf_storage-LV_export<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0591G =A0 17G =A0550G =A0 3% /op=
t<br>
/dev/mapper/euclid_highperf_storage-LV_polhome<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A02.0T =A01.5T =A0386G =A080% /po=
lhome<br>
[root@eustorage ~]# lvdisplay<br>
 =A0--- Logical volume ---<br>
 =A0LV Name =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0/dev/euclid_highperf_storage/LV_=
home<br>
 =A0VG Name =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0euclid_highperf_storage<br>
 =A0LV UUID =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0gu7yo1-TYYr-ucHG-QSDk-y8HD-ETrs-=
Z5kCk9<br>
 =A0LV Write Access =A0 =A0 =A0 =A0read/write<br>
 =A0LV Status =A0 =A0 =A0 =A0 =A0 =A0 =A0available<br>
 =A0# open =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 1<br>
 =A0LV Size =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A06.00 TB<br>
 =A0Current LE =A0 =A0 =A0 =A0 =A0 =A0 1572864<br>
 =A0Segments =A0 =A0 =A0 =A0 =A0 =A0 =A0 1<br>
 =A0Allocation =A0 =A0 =A0 =A0 =A0 =A0 inherit<br>
 =A0Read ahead sectors =A0 =A0 auto<br>
 =A0- currently set to =A0 =A0 1536<br>
 =A0Block device =A0 =A0 =A0 =A0 =A0 253:0<br>
<br>
 =A0--- Logical volume ---<br>
 =A0LV Name =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0/dev/euclid_highperf_storage/LV_=
export<br>
 =A0VG Name =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0euclid_highperf_storage<br>
 =A0LV UUID =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A01lktLy-Hgn3-qS1m-41VJ-5kNY-DMyb-=
1ri4Th<br>
 =A0LV Write Access =A0 =A0 =A0 =A0read/write<br>
 =A0LV Status =A0 =A0 =A0 =A0 =A0 =A0 =A0available<br>
 =A0# open =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 1<br>
 =A0LV Size =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0600.00 GB<br>
 =A0Current LE =A0 =A0 =A0 =A0 =A0 =A0 153600<br>
 =A0Segments =A0 =A0 =A0 =A0 =A0 =A0 =A0 1<br>
 =A0Allocation =A0 =A0 =A0 =A0 =A0 =A0 inherit<br>
 =A0Read ahead sectors =A0 =A0 auto<br>
 =A0- currently set to =A0 =A0 1536<br>
 =A0Block device =A0 =A0 =A0 =A0 =A0 253:1<br>
<br>
 =A0--- Logical volume ---<br>
 =A0LV Name =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0/dev/euclid_highperf_storage/LV_=
polhome<br>
 =A0VG Name =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0euclid_highperf_storage<br>
 =A0LV UUID =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0xqpOX5-HFey-H0qi-NgjP-NVS7-FwDb-=
zbiK8m<br>
 =A0LV Write Access =A0 =A0 =A0 =A0read/write<br>
 =A0LV Status =A0 =A0 =A0 =A0 =A0 =A0 =A0available<br>
 =A0# open =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 1<br>
 =A0LV Size =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A02.00 TB<br>
 =A0Current LE =A0 =A0 =A0 =A0 =A0 =A0 524288<br>
 =A0Segments =A0 =A0 =A0 =A0 =A0 =A0 =A0 4<br>
 =A0Allocation =A0 =A0 =A0 =A0 =A0 =A0 inherit<br>
 =A0Read ahead sectors =A0 =A0 auto<br>
 =A0- currently set to =A0 =A0 256<br>
 =A0Block device =A0 =A0 =A0 =A0 =A0 253:2<br>
<div><div></div><div class=3D"h5"><br>
</div></div></blockquote><div>=A0</div></div>

--0015174be92cf69312048d883a62--
