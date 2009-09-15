Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.7])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id n8FA8PGC008031
	for <linux-lvm@redhat.com>; Tue, 15 Sep 2009 06:08:25 -0400
Received: from mail-ew0-f211.google.com (mail-ew0-f211.google.com
	[209.85.219.211])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n8FA8Egk010613
	for <linux-lvm@redhat.com>; Tue, 15 Sep 2009 06:08:15 -0400
Received: by ewy7 with SMTP id 7so2203881ewy.7
	for <linux-lvm@redhat.com>; Tue, 15 Sep 2009 03:08:14 -0700 (PDT)
MIME-Version: 1.0
Date: Tue, 15 Sep 2009 12:08:14 +0200
Message-ID: <81c921f30909150308s63d15b43o8b1315d2b99d5e27@mail.gmail.com>
Subject: [linux-lvm] pvresize works, but not pv resize is done ?
From: Javier Barroso <javibarroso@gmail.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

hi,

I have a question about lvm, this is a question about pvresize and vg
reloading its size

I have a disk in SAN environment, with next partition scheme:
/dev/mapper/mpathX --> /dev/mapper/mpathXp{1,2} --> /dev/mapper/mpathXp2p1
/dev/mapper/mpathXp2p1 is my phisical volume

I resized disk on my SAN


and then I vgchange -an; kpartx -d /dev/mapper/mpathXp2; kpartx -d
/dev/mapper/mpathX
dmsetup remove /dev/mapper/mpathX

cfdisk /dev/mapper/mpathX --> enlarge /dev/mapper/mpathXp2 partition
and then cfdisk /dev/mapper/mpathXp2 --> enlarge cfdisk /dev/mapper/mpathXp2p1

then I executed pvresize /dev/mapper/mpathXp2p1
and it said me about it was resized, but it is not !! :( (pvdisplay
and vgdisplay displays the sames size as before the operation)

Do you know what can I do ?? What can be happen here?

Thank you!
