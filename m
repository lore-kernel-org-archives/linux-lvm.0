Date: Wed, 30 Jun 1999 16:42:41 +0100 (BST)
From: James Pattinson <jamesp@aethos.co.uk>
Subject: [linux-lvm] vgscan -- invalid i/o protocol version
Message-ID: <Pine.LNX.4.10.9906301639130.2611-100000@fuse.aethos.co.uk>
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@msede.com

Anyone seen this error msg before?

I'm running RH6 with kernel 2.2.10 and the LVM patches applied. I
originially tried to follow the HOWTO but on the first command i got:

pvcreate -- ERROR: "/etc/lvmtab" doesn't exist; please run vgscan

so i ran vgscan and got the message in the subject line. It's possible I'm
being really thick and I don't really know what I'm doing. Do I need the
devfs patches too?

I'm new to lvm-on-linux but I love it on HP-UX.

Cheers!

James
