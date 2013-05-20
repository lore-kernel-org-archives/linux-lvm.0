Received: from mx1.redhat.com (ext-mx15.extmail.prod.ext.phx2.redhat.com
	[10.5.110.20])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id r4KH925g023032
	for <linux-lvm@redhat.com>; Mon, 20 May 2013 13:09:02 -0400
Received: from mail-ia0-f170.google.com (mail-ia0-f170.google.com
	[209.85.210.170])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r4KH90Gi029630
	for <linux-lvm@redhat.com>; Mon, 20 May 2013 13:09:01 -0400
Received: by mail-ia0-f170.google.com with SMTP id l29so8047035iag.29
	for <linux-lvm@redhat.com>; Mon, 20 May 2013 10:09:00 -0700 (PDT)
MIME-Version: 1.0
Date: Mon, 20 May 2013 12:09:00 -0500
Message-ID: <CABT_HjprCj1yby3NabrMjrebL-fuhVJQUWKFaJvoLV9Pb5aRag@mail.gmail.com>
From: meLon <earthmelon@gmail.com>
Content-Type: multipart/alternative; boundary=089e013cbaec91b00004dd296344
Subject: [linux-lvm] LVM2 Recovery after Filesystem Code Change
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

--089e013cbaec91b00004dd296344
Content-Type: text/plain; charset=ISO-8859-1

After noticing warnings saying "Incorrect metadata area header checksum"
when using pv/lv commands I looked into what could be causing the issue and
attempted to fix the issue.  I had a HDD with an ext2 /boot partition and
an LVM containing an encrypted volume.  I ran sfdisk to change the second
partition's filesystem code to 8e and rebooted.

After rebooting, I was shown an error when I would normally type in my
encrypted volume's passphrase.  I cannot remember the exact error, but I
was unable to recover.  I pulled the HDD and installed Linux onto another
HDD.

I put the old HDD containing data I would like to recover in another
machine and tried to see what I could do.  pvscan and lvscan would show a
pv, but would report the Incorrect metadata area header checksum warning.
 I tried to mount my /boot partition, but it said something along the lines
of "Unknown filesystem type LVM.....".  However, if I used *-t ext2*, the
/boot partition would mount without a problem.  I ran fsck.ext4 (big
mistake) on the /boot partition which destroyed all of the data on that
partition.  The destruction of /boot is not important to me, but the steps
I took to do it may give some insight on my LVM issue.

At this point, I believe that I accidentally told sfdisk that my /boot was
an LVM partition which was why I was unable to boot into my os.


Now I have the HDD  set up and when running pvdisplay I see the HDD, but it
does not show a VG name and reports it as a "new physical volume".  Because
it's not assigned to a VG, it does not get placed in /dev/mapper, which
means I cannot run cryptsetup to unlock the drive.

Any recovery/backup information that I see being used by other people to
rectify similar situations resided on the drive I am having problems with,
which makes it impossible for me to use such data for recovery.

I am hoping there is a way to assign this PV to a VG without destroying any
data on the disk so that I can decrypt it and export the data from the
drive.

I am currently dd'ing the drive to another drive so that any suggestions I
get from this mailing list can be executed without taking me further from
retrieving my data.

I appreciate you taking the time to read this email and thank you for any
input or suggestions you may have.


  "/dev/sda1" is a new physical volume of "1.36 TiB"
  --- NEW Physical volume ---
  PV Name               /dev/sda1
  VG Name
  PV Size               1.36 TiB
  Allocatable           NO
  PE Size               0
  Total PE              0
  Free PE               0
  Allocated PE          0
  PV UUID               ajtoix-aTPi-XXXX-XXXX-XXXX-XXXX-XXXXXX




-- 
- meLon

--089e013cbaec91b00004dd296344
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><br></div><div style>After noticing warnings saying &=
quot;Incorrect metadata area header checksum&quot; when using pv/lv command=
s I looked into what could be causing the issue and attempted to fix the is=
sue. =A0I had a HDD with an ext2 /boot partition and an LVM containing an e=
ncrypted volume. =A0I ran sfdisk to change the second partition&#39;s files=
ystem code to 8e and rebooted.</div>
<div style><br></div><div style>After rebooting, I was shown an error when =
I would normally type in my encrypted volume&#39;s passphrase. =A0I cannot =
remember the exact error, but I was unable to recover. =A0I pulled the HDD =
and installed Linux onto another HDD.</div>
<div style><br></div><div style>I put the old HDD containing data I would l=
ike to recover in another machine and tried to see what I could do. =A0pvsc=
an and lvscan would show a pv, but would report the Incorrect metadata area=
 header checksum warning. =A0I tried to mount my /boot partition, but it sa=
id something along the lines of &quot;Unknown filesystem type LVM.....&quot=
;. =A0However, if I used *-t ext2*, the /boot partition would mount without=
 a problem. =A0I ran fsck.ext4 (big mistake) on the /boot partition which d=
estroyed all of the data on that partition. =A0The destruction of /boot is =
not important to me, but the steps I took to do it may give some insight on=
 my LVM issue.</div>
<div style><br></div><div style>At this point, I believe that I accidentall=
y told sfdisk that my /boot was an LVM partition which was why I was unable=
 to boot into my os.</div><div style><br></div><div style><br></div><div st=
yle>
Now I have the HDD =A0set up and when running pvdisplay I see the HDD, but =
it does not show a VG name and reports it as a &quot;new physical volume&qu=
ot;. =A0Because it&#39;s not assigned to a VG, it does not get placed in /d=
ev/mapper, which means I cannot run cryptsetup to unlock the drive.</div>
<div style><br></div><div style>Any recovery/backup information that I see =
being used by other people to rectify similar situations resided on the dri=
ve I am having problems with, which makes it impossible for me to use such =
data for recovery.</div>
<div style><br></div><div style>I am hoping there is a way to assign this P=
V to a VG without destroying any data on the disk so that I can decrypt it =
and export the data from the drive.</div><div style><br></div><div style>
I am currently dd&#39;ing the drive to another drive so that any suggestion=
s I get from this mailing list can be executed without taking me further fr=
om retrieving my data.</div><div style><br></div><div style>I appreciate yo=
u taking the time to read this email and thank you for any input or suggest=
ions you may have.</div>
<div style><br></div><div style><br></div><div style><div>=A0 &quot;/dev/sd=
a1&quot; is a new physical volume of &quot;1.36 TiB&quot;</div><div>=A0 ---=
 NEW Physical volume ---</div><div>=A0 PV Name =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
/dev/sda1</div><div>
=A0 VG Name =A0 =A0 =A0 =A0 =A0 =A0 =A0=A0</div><div>=A0 PV Size =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 1.36 TiB</div><div>=A0 Allocatable =A0 =A0 =A0 =A0 =A0 =
NO</div><div>=A0 PE Size =A0 =A0 =A0 =A0 =A0 =A0 =A0 0 =A0=A0</div><div>=A0=
 Total PE =A0 =A0 =A0 =A0 =A0 =A0 =A00</div><div>=A0 Free PE =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 0</div>
<div>=A0 Allocated PE =A0 =A0 =A0 =A0 =A00</div><div>=A0 PV UUID =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 ajtoix-aTPi-XXXX-XXXX-XXXX-XXXX-XXXXXX</div></div><div =
style><br></div><div><br></div><br clear=3D"all"><div><br></div>-- <br>- me=
Lon
</div>

--089e013cbaec91b00004dd296344--
