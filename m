Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.7])
	by int-mx05.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id n9JEqJVr010485
	for <linux-lvm@redhat.com>; Mon, 19 Oct 2009 10:52:19 -0400
Received: from mail-yx0-f200.google.com (mail-yx0-f200.google.com
	[209.85.210.200])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n9JEq9HJ027805
	for <linux-lvm@redhat.com>; Mon, 19 Oct 2009 10:52:09 -0400
Received: by yxe38 with SMTP id 38so15773751yxe.6
	for <linux-lvm@redhat.com>; Mon, 19 Oct 2009 07:52:09 -0700 (PDT)
MIME-Version: 1.0
Date: Mon, 19 Oct 2009 10:52:08 -0400
Message-ID: <a5a956f70910190752m19843bc8x264a79c93c0cde41@mail.gmail.com>
From: Lou Arnold <larnolda1@gmail.com>
Content-Type: multipart/alternative; boundary=0016368e315ad56b8904764ae3b7
Subject: [linux-lvm] Total free space using added VGs and LVs
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

--0016368e315ad56b8904764ae3b7
Content-Type: text/plain; charset=ISO-8859-1

These questions stem from experiments using the LVM GUI on a CentOS V5.3
system. It seems that I need some expert help, and I would be grateful for a
definitive answer because this has been troubling to me.

1) I have been trying to add a 2nd drive (one partition) to my system, and
then to see the total free space via the file browser. But this doesn't work
if I create a new volume group and add the drive to that. Why is this so?

2) I also tried adding the drive to the existing volume group (VolGroup00)
and created a new logical volume group (LogVol02) for the drive. But again,
the file browser shows different amounts of free space at root (31GB) vs
after the mount point of the new drive (/mnt/X2nd40GB) (35 GB). Why does it
not show 66 GB free no matter what folder I look at?

3) Only when I add the drive to the the existing volume group and logical
volume (VolGroup00/LogVol00) does the file browser show the total free space
(66 GB) no matter where I look in the folders. I understand why this is. (No
need for a reply for this).

Regards,
Lou.

--0016368e315ad56b8904764ae3b7
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

These questions stem from experiments using the LVM GUI on a CentOS V5.3 sy=
stem. It seems that I need some expert help, and I would be grateful for a =
definitive answer because this has been troubling to me.<br><br>1) I have b=
een trying to add a 2nd drive (one partition) to my system, and then to see=
 the total free space via the file browser. But this doesn&#39;t work if I =
create a new volume group and add the drive to that. Why is this so?<br>
<br>2) I also tried adding the drive to the existing volume group (VolGroup=
00) and created a new logical volume group (LogVol02) for the drive. But ag=
ain, the file browser shows different amounts of free space at root (31GB) =
vs after the mount point of the new drive (/mnt/X2nd40GB) (35 GB). Why does=
 it not show 66 GB free no matter what folder I look at?<br>
<br>3) Only when I add the drive to the the existing volume group and logic=
al volume (VolGroup00/LogVol00) does the file browser show the total free s=
pace (66 GB) no matter where I look in the folders. I understand why this i=
s. (No need for a reply for this).<br>
<br>Regards,<br>Lou.<br>

--0016368e315ad56b8904764ae3b7--
