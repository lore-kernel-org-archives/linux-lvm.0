Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l67Dm1Du014103
	for <linux-lvm@redhat.com>; Sat, 7 Jul 2007 09:48:01 -0400
Received: from mail.gmx.net (mail.gmx.net [213.165.64.20])
	by mx1.redhat.com (8.13.1/8.13.1) with SMTP id l67DlxQY024190
	for <linux-lvm@redhat.com>; Sat, 7 Jul 2007 09:47:59 -0400
Content-Type: text/plain; charset="iso-8859-1"
Date: Sat, 07 Jul 2007 15:47:53 +0200
From: LoMp0101@gmx.net
Message-ID: <20070707134753.181690@gmx.net>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: [linux-lvm] Restore LVM after drive error
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

Hello,

I recived an smart warning for one of my scsi disk that it might faile
some day, so i added
another disk to move the lvm data from the failing disk another. But the
"new" disk faild and
the system crashed during the pvmove process. Now all lvm commands i
try say:
 "Couldn't find volume 'pvmove0' for segment 'start_extend' " and
"Couldn't read all logical volumes for volume group system".
Where 'system' is my vg. I tried pvmove --abort and vgreduce
--removemissing but nothing worked.
(now i know that vgreduce --removemissing dosn't solve the pvmove
problem). My /-Directory is whithin the system vg, so i could not access
the backup configuration of the lvm ! Is thre any way to undo the pvmove
changes and rescue my data ?!

I have searched the inet for solutions but found nothing that worked.

Please Help me !

--=20
Psssst! Schon vom neuen GMX MultiMessenger geh=EF=BF=BDrt?
Der kanns mit allen: http://www.gmx.net/de/go/multimessenger
