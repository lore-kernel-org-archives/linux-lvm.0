Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id s1ADEsV0011855
	for <linux-lvm@redhat.com>; Mon, 10 Feb 2014 08:14:54 -0500
Received: from mail-pa0-f52.google.com (mail-pa0-f52.google.com
	[209.85.220.52])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s1ADEpNT021434
	for <linux-lvm@redhat.com>; Mon, 10 Feb 2014 08:14:51 -0500
Received: by mail-pa0-f52.google.com with SMTP id bj1so6177164pad.39
	for <linux-lvm@redhat.com>; Mon, 10 Feb 2014 05:14:51 -0800 (PST)
MIME-Version: 1.0
From: Alexander Meshcheryakov <alexander.s.m@gmail.com>
Date: Mon, 10 Feb 2014 17:14:21 +0400
Message-ID: <CA+VDVVVtkYVDNJP4f=oUiDTzhht60t-nDM3u5g5wezzv=tvzYg@mail.gmail.com>
Content-Type: multipart/alternative; boundary=e89a8ff2569cef5a9704f20d1fc1
Subject: [linux-lvm] Cancelling snapshot merge
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

--e89a8ff2569cef5a9704f20d1fc1
Content-Type: text/plain; charset=UTF-8

Hello,

I had created snapshot of my /var logical volume a while ago and recently
It occured to me that I don't need saved state anymore and I would like to
reclaim disk space. But I have issued wrong lvconvert --merge command by
mistake instead of proper lvremove.

$ sudo lvconvert --merge VolGroup00/var_snap0
  Can't merge over open origin volume
  Merging of snapshot var_snap0 will start next activation.

I have figured out at this point that I made mistake. Luckily merge is
postponed as volume is used (mounted) now. But how do I prevent merge from
running upon next reboot? Here is what I have tried:

$ sudo lvremove VolGroup00/var_snap0
  Can't remove merging snapshot logical volume "var_snap0"

$ sudo lvchange -an VolGroup00/var_snap0
Change of snapshot var_snap0 will also change its origin LogVol01. Proceed?
[y/n]: n
  Logical volume var_snap0 not changed.


I even could not create snapshot of current state to roll back to it after
merge


$ sudo lvcreate --size 2G --snapshot -n var_snap1
/dev/mapper/VolGroup00-LogVol01

  Snapshots of an origin that has a merging snapshot is not supported


Is there a way to cancel postponed snapshot merge?

--e89a8ff2569cef5a9704f20d1fc1
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello,<br><br>I had created snapshot of my /var logic=
al volume a while ago and recently It occured to me that I don&#39;t need s=
aved state anymore and I would like to reclaim disk space. But I have issue=
d wrong lvconvert --merge command by mistake instead of proper lvremove.<br=
>

<br>$ sudo lvconvert --merge VolGroup00/var_snap0<br>=C2=A0 Can&#39;t merge=
 over open origin volume<br>=C2=A0 Merging of snapshot var_snap0 will start=
 next activation.<br><br>I have figured out at this point that I made mista=
ke. Luckily merge is postponed as volume is used (mounted) now. But how do =
I prevent merge from running upon next reboot? Here is what I have tried:<b=
r>

<br>$ sudo lvremove VolGroup00/var_snap0<br>=C2=A0 Can&#39;t remove merging=
 snapshot logical volume &quot;var_snap0&quot;<br><br>$ sudo lvchange -an V=
olGroup00/var_snap0<br>Change of snapshot var_snap0 will also change its or=
igin LogVol01. Proceed? [y/n]: n<br>

=C2=A0 Logical volume var_snap0 not changed.<br><br><br>I even could not cr=
eate snapshot of current state to roll back to it after merge<br><br><br>$ =
sudo lvcreate --size 2G --snapshot -n var_snap1 /dev/mapper/VolGroup00-LogV=
ol01<br>

<br>=C2=A0 Snapshots of an origin that has a merging snapshot is not suppor=
ted<br><br><br></div>Is there a way to cancel postponed snapshot merge?<br>=
</div>

--e89a8ff2569cef5a9704f20d1fc1--
