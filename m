Message-ID: <8D53D070AF1ED311B30B0090276DCEF59D882F@annabelle.twtelecom.com>
From: Shawn Ferris <Shawn.Ferris@twtelecom.com>
Subject: [linux-lvm] Error: 241 with udma patch..
Date: Mon, 21 Feb 2000 08:15:06 -0700
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Linux-Lvm@Msede. Com (E-mail)" <Linux-Lvm@msede.com>

My kernel is 2.2.14 (devfs+lvm+reiserfs+udma)

Everything seems to work fine.. I also just purchased a nice 20gb udma hd.
Seems logical to run LVM on it. (I run it on some scsi drives already, so I
know it works)

Anyway, I run vgcreate on a giant 20gb part on the disk and I got Error:
241.. (Fogive me, I forgot to write down the text of the message, but
something about not being able to determine the size of the partition)

Before I start to look further into this, is there any known limitations
with the udma patch? I tried creating smaller partitions to no avail.

I have an ABit mother board if it's of any concern..
ide.2.2.14.20000124.patch.gz

Any help will be greatly appreciated..

Shawn M Ferris
Oracle DBA - Time Warner Telecom 
