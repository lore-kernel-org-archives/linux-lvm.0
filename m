Date: Wed, 5 Jan 2000 17:33:07 +0000 (GMT)
From: James Pattinson <jamesp@aethos.co.uk>
Subject: [linux-lvm] devfs...
Message-ID: <Pine.LNX.4.10.10001051729490.1995-100000@fuse.aethos.co.uk>
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@msede.com

Hi

I'm sure this is a FAQ but I can't find the answer anywhere.

I've am using LVM 0.8i on 2.2.14 with the latest devfs patch. My root
filesystem in on an LV and I have an initrd that does a vgscan and a
vgchange. However now I'm using devfs, vgscan dooesn't find any of my
volume groups - maybe because vgscan doesn't know to look in /dev/scsi or
whatever. Is there a patch to fix this?

Cheers!

James
