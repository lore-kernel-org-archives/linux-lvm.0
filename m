Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id r8HIcCTG024893
	for <linux-lvm@redhat.com>; Tue, 17 Sep 2013 14:38:12 -0400
Received: from mail-yh0-f47.google.com (mail-yh0-f47.google.com
	[209.85.213.47])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r8HIcBZX028343
	for <linux-lvm@redhat.com>; Tue, 17 Sep 2013 14:38:11 -0400
Received: by mail-yh0-f47.google.com with SMTP id l109so2934145yhq.34
	for <linux-lvm@redhat.com>; Tue, 17 Sep 2013 11:38:11 -0700 (PDT)
Message-ID: <5238A190.2050000@gmail.com>
Date: Tue, 17 Sep 2013 14:38:08 -0400
From: =?ISO-8859-1?Q?Jorge_F=E1bregas?= <jorge.fabregas@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] LVM & fstrim behaviour (Fedora 19)
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
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com

Hi,

I'm testing fstrim on an LVM volume but it only seems to work the first
time I run it (just after mounting the volume).  When I run "fstrim -v
/mnt" for the first time it prints all the free blocks that is trimming
(almost all of the filesystem as it is empty) but subsequent runs just
output "0 bytes trimmed" no matter how many files I create/sync & delete
afterwards.  The "issue_discards" is set in lvm.conf.

If I do this over the raw device (/dev/sda3, same ext4 filesystem) I get
the output corresponding to the last deleted files every time I run fstrim.

## THIN ##

I also created a thin pool and a logical volume on that pool.  If I
mount this volume with "discard", I can see that TRIM is working by
doing an "lvs vgthin" (the Data Usage% grows as I create files & shrinks
as I delete files).  However, If I mount it without the "discard" option
(in order to use fstrim) I only see the data-usage reduction when I run
fstrim *just* for the first time.

Any help will be appreciated.

Thanks,
Jorge
