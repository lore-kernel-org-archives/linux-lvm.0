Message-ID: <B45465FD9C23D21193E90000F8D0F3DF6834F1@mailsrv.linkvest.ch>
From: Jean-Eric Cuendet <Jean-Eric.Cuendet@linkvest.com>
Subject: RE: [linux-lvm] ReiserFS/XFS/JFS, LVM, Raid5
Date: Wed, 28 Jun 2000 11:21:30 +0200
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@msede.com


> > 	Currently you cannot put journaled filesystems on a software 
> > raid I believe, because they use the buffer cache in incompatible 
> > ways.  If I am wrong, someone correct me.  Ext2 (what I use) works
> > fine. 
> 
> I'm using etx3 on top of 20GB raid0 for over an year with no 
> problem...

In fact, if you have ext3 and a crash, in the worst case, journal will be
out of sync (In the case of writes were not like the filesystems thought due
to LVM)
Then you'll have a 15 minutes fsck (like if it was ext2).
In the best case, journal is OK, and you have a 3 seconds fsck which is
fine.

Agree?

Bye
-jec
