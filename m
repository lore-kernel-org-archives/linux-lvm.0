Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id r4KHSdio000799
	for <linux-lvm@redhat.com>; Mon, 20 May 2013 13:28:39 -0400
Received: from mail-ia0-f180.google.com (mail-ia0-f180.google.com
	[209.85.210.180])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r4KHScfv004882
	for <linux-lvm@redhat.com>; Mon, 20 May 2013 13:28:38 -0400
Received: by mail-ia0-f180.google.com with SMTP id l27so7756369iae.39
	for <linux-lvm@redhat.com>; Mon, 20 May 2013 10:28:38 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CABT_HjprCj1yby3NabrMjrebL-fuhVJQUWKFaJvoLV9Pb5aRag@mail.gmail.com>
References: <CABT_HjprCj1yby3NabrMjrebL-fuhVJQUWKFaJvoLV9Pb5aRag@mail.gmail.com>
Date: Mon, 20 May 2013 12:28:37 -0500
Message-ID: <CABT_Hjr001wV9K3cw1+4F8A3mEfkBrQtrnW4HOZ8qSxdALw1Vw@mail.gmail.com>
From: meLon <earthmelon@gmail.com>
Content-Type: multipart/alternative; boundary=047d7b10cea1bd2dca04dd29a94c
Subject: Re: [linux-lvm] LVM2 Recovery after Filesystem Code Change
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

--047d7b10cea1bd2dca04dd29a94c
Content-Type: text/plain; charset=ISO-8859-1

I have been asked to include disktype information for the drive:

$ sudo disktype /dev/sda

--- /dev/sda
Block device, size 1.365 TiB (1500301910016 bytes)
DOS/MBR partition map
Partition 1: 3.725 GiB (3999268864 bytes, 7811072 sectors from 2048,
bootable)
  Type 0x83 (Linux)
  Ext2 file system
    UUID 728591A9-DDBF-XXXX-XXXX-XXXXXXXXXXXX (DCE, v4)
    Volume size 3.725 GiB (3999268864 bytes, 976384 blocks of 4 KiB)
  Linux LVM2 volume, version 001
    LABELONE label at sector 1
    PV UUID ajtoix-aTPi-6RoJ-XXXX-XXXX-XXXX-XXXXXX
    Volume size 1.365 TiB (1500300443648 bytes)
Partition 2: 1.361 TiB (1496300127232 bytes, 2922461186 sectors from
7815166)
  Type 0x8E (Linux LVM)
  Linux LVM2 volume, version 001
    LABELONE label at sector 3
    LABELONE data inconsistent, aborting analysis


Praying that this threads with my original e-mail.

Thanks again.



On Mon, May 20, 2013 at 12:09 PM, meLon <earthmelon@gmail.com> wrote:

>
> After noticing warnings saying "Incorrect metadata area header checksum"
> when using pv/lv commands I looked into what could be causing the issue and
> attempted to fix the issue.  I had a HDD with an ext2 /boot partition and
> an LVM containing an encrypted volume.  I ran sfdisk to change the second
> partition's filesystem code to 8e and rebooted.
>
> After rebooting, I was shown an error when I would normally type in my
> encrypted volume's passphrase.  I cannot remember the exact error, but I
> was unable to recover.  I pulled the HDD and installed Linux onto another
> HDD.
>
> I put the old HDD containing data I would like to recover in another
> machine and tried to see what I could do.  pvscan and lvscan would show a
> pv, but would report the Incorrect metadata area header checksum warning.
>  I tried to mount my /boot partition, but it said something along the lines
> of "Unknown filesystem type LVM.....".  However, if I used *-t ext2*, the
> /boot partition would mount without a problem.  I ran fsck.ext4 (big
> mistake) on the /boot partition which destroyed all of the data on that
> partition.  The destruction of /boot is not important to me, but the steps
> I took to do it may give some insight on my LVM issue.
>
> At this point, I believe that I accidentally told sfdisk that my /boot was
> an LVM partition which was why I was unable to boot into my os.
>
>
> Now I have the HDD  set up and when running pvdisplay I see the HDD, but
> it does not show a VG name and reports it as a "new physical volume".
>  Because it's not assigned to a VG, it does not get placed in /dev/mapper,
> which means I cannot run cryptsetup to unlock the drive.
>
> Any recovery/backup information that I see being used by other people to
> rectify similar situations resided on the drive I am having problems with,
> which makes it impossible for me to use such data for recovery.
>
> I am hoping there is a way to assign this PV to a VG without destroying
> any data on the disk so that I can decrypt it and export the data from the
> drive.
>
> I am currently dd'ing the drive to another drive so that any suggestions I
> get from this mailing list can be executed without taking me further from
> retrieving my data.
>
> I appreciate you taking the time to read this email and thank you for any
> input or suggestions you may have.
>
>
>   "/dev/sda1" is a new physical volume of "1.36 TiB"
>   --- NEW Physical volume ---
>   PV Name               /dev/sda1
>   VG Name
>   PV Size               1.36 TiB
>   Allocatable           NO
>   PE Size               0
>   Total PE              0
>   Free PE               0
>   Allocated PE          0
>   PV UUID               ajtoix-aTPi-XXXX-XXXX-XXXX-XXXX-XXXXXX
>
>
>
>
> --
> - meLon
>



-- 
- meLon

--047d7b10cea1bd2dca04dd29a94c
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I have been asked to include disktype information for the =
drive:<div><br></div><div><div>$ sudo disktype /dev/sda</div><div><br></div=
><div>--- /dev/sda</div><div>Block device, size 1.365 TiB (1500301910016 by=
tes)</div>

<div>DOS/MBR partition map</div><div>Partition 1: 3.725 GiB (3999268864 byt=
es, 7811072 sectors from 2048, bootable)</div><div>=A0 Type 0x83 (Linux)</d=
iv><div>=A0 Ext2 file system</div><div>=A0 =A0 UUID 728591A9-DDBF-XXXX-XXXX=
-XXXXXXXXXXXX (DCE, v4)</div>

<div>=A0 =A0 Volume size 3.725 GiB (3999268864 bytes, 976384 blocks of 4 Ki=
B)</div><div>=A0 Linux LVM2 volume, version 001</div><div>=A0 =A0 LABELONE =
label at sector 1</div><div>=A0 =A0 PV UUID ajtoix-aTPi-6RoJ-XXXX-XXXX-XXXX=
-XXXXXX</div>

<div>=A0 =A0 Volume size 1.365 TiB (1500300443648 bytes)</div><div>Partitio=
n 2: 1.361 TiB (1496300127232 bytes, 2922461186 sectors from 7815166)</div>=
<div>=A0 Type 0x8E (Linux LVM)</div><div>=A0 Linux LVM2 volume, version 001=
</div>

<div>=A0 =A0 LABELONE label at sector 3</div><div>=A0 =A0 LABELONE data inc=
onsistent, aborting analysis</div></div><div><br></div><div><br></div><div =
style>Praying that this threads with my original e-mail.</div><div style><b=
r></div>
<div style>Thanks again.</div><div><br></div></div><div class=3D"gmail_extr=
a"><br><br><div class=3D"gmail_quote">On Mon, May 20, 2013 at 12:09 PM, meL=
on <span dir=3D"ltr">&lt;<a href=3D"mailto:earthmelon@gmail.com" target=3D"=
_blank">earthmelon@gmail.com</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div><br></div><div>After n=
oticing warnings saying &quot;Incorrect metadata area header checksum&quot;=
 when using pv/lv commands I looked into what could be causing the issue an=
d attempted to fix the issue. =A0I had a HDD with an ext2 /boot partition a=
nd an LVM containing an encrypted volume. =A0I ran sfdisk to change the sec=
ond partition&#39;s filesystem code to 8e and rebooted.</div>

<div><br></div><div>After rebooting, I was shown an error when I would norm=
ally type in my encrypted volume&#39;s passphrase. =A0I cannot remember the=
 exact error, but I was unable to recover. =A0I pulled the HDD and installe=
d Linux onto another HDD.</div>

<div><br></div><div>I put the old HDD containing data I would like to recov=
er in another machine and tried to see what I could do. =A0pvscan and lvsca=
n would show a pv, but would report the Incorrect metadata area header chec=
ksum warning. =A0I tried to mount my /boot partition, but it said something=
 along the lines of &quot;Unknown filesystem type LVM.....&quot;. =A0Howeve=
r, if I used *-t ext2*, the /boot partition would mount without a problem. =
=A0I ran fsck.ext4 (big mistake) on the /boot partition which destroyed all=
 of the data on that partition. =A0The destruction of /boot is not importan=
t to me, but the steps I took to do it may give some insight on my LVM issu=
e.</div>

<div><br></div><div>At this point, I believe that I accidentally told sfdis=
k that my /boot was an LVM partition which was why I was unable to boot int=
o my os.</div><div><br></div><div><br></div><div>
Now I have the HDD =A0set up and when running pvdisplay I see the HDD, but =
it does not show a VG name and reports it as a &quot;new physical volume&qu=
ot;. =A0Because it&#39;s not assigned to a VG, it does not get placed in /d=
ev/mapper, which means I cannot run cryptsetup to unlock the drive.</div>

<div><br></div><div>Any recovery/backup information that I see being used b=
y other people to rectify similar situations resided on the drive I am havi=
ng problems with, which makes it impossible for me to use such data for rec=
overy.</div>

<div><br></div><div>I am hoping there is a way to assign this PV to a VG wi=
thout destroying any data on the disk so that I can decrypt it and export t=
he data from the drive.</div><div><br></div><div>
I am currently dd&#39;ing the drive to another drive so that any suggestion=
s I get from this mailing list can be executed without taking me further fr=
om retrieving my data.</div><div><br></div><div>I appreciate you taking the=
 time to read this email and thank you for any input or suggestions you may=
 have.</div>

<div><br></div><div><br></div><div><div>=A0 &quot;/dev/sda1&quot; is a new =
physical volume of &quot;1.36 TiB&quot;</div><div>=A0 --- NEW Physical volu=
me ---</div><div>=A0 PV Name =A0 =A0 =A0 =A0 =A0 =A0 =A0 /dev/sda1</div><di=
v>
=A0 VG Name =A0 =A0 =A0 =A0 =A0 =A0 =A0=A0</div><div>=A0 PV Size =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 1.36 TiB</div><div>=A0 Allocatable =A0 =A0 =A0 =A0 =A0 =
NO</div><div>=A0 PE Size =A0 =A0 =A0 =A0 =A0 =A0 =A0 0 =A0=A0</div><div>=A0=
 Total PE =A0 =A0 =A0 =A0 =A0 =A0 =A00</div><div>=A0 Free PE =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 0</div>

<div>=A0 Allocated PE =A0 =A0 =A0 =A0 =A00</div><div>=A0 PV UUID =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 ajtoix-aTPi-XXXX-XXXX-XXXX-XXXX-XXXXXX</div></div><span=
 class=3D"HOEnZb"><font color=3D"#888888"><div><br></div><div><br></div><br=
 clear=3D"all"><div><br></div>-- <br>
- meLon
</font></span></div>
</blockquote></div><br><br clear=3D"all"><div><br></div>-- <br>- meLon
</div>

--047d7b10cea1bd2dca04dd29a94c--
