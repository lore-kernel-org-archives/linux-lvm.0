Message-Id: <199910051207.OAA16147@seger.axis.se>
Subject: [linux-lvm] Some trouble.
Mime-Version: 1.0
Date: Tue, 05 Oct 1999 14:07:32 +0200
From: Lars Segerlund <lars.segerlund@axis.com>
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@msede.com


 I'm getting some kernel panics running vgcreate, pvscan, vgscan on a 
 raid5 partition on a Compaq-DS10 , it sais free list corrupted ??

 Any idea's , im kind of giving up on running lvm on this machine soon,
 and it would really need it.

 I could do a pvcreate -v /dev/md0 ( after dd </dev/zero >/dev/md0 bs=512
 count= 1024 ), but a vgscan failed ( kernel panic, free list corrupted. )
 and so did a vgcreate.

 Any ideas ??

 ( at a point it complained that /etc/lvmtab and /etc/lvmtab.d was missing
 I did a touch on those and it seemed to work ).

 I find all this strange as I am running lvm on my laptop with no troubles,
 but this installation is starting to hurt, ( ckraid on 72 Gig ).

 / best regards, Lars Segerlund.
