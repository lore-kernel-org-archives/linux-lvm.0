From: "Jonathan S. Polacheck" <JPolache@txfund.com>
Message-ID: <8525682A.0078290B.00@fund-dc2.txfund.com>
Date: Mon, 15 Nov 1999 16:53:07 -0600
Subject: [linux-lvm] lvcreate_initrd & redhat 6.1
Mime-Version: 1.0
Content-Disposition: inline
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@msede.com



Got lvm running on at RH 6.1 after patching a 2.2.10 kernal.  All looking
very good. However, when I ran lvcreate_initrd, it errored out;

[root@l61 tools]# ./lvmcreate_initrd

Logical Volume Manager 0.7 by Heinz Mauelshagen  01/07/1999

lvmcreate_initrd -- this script creates a LVM initial ram disk in
/boot/initrd.z

lvmcreate_initrd -- making ram filesystem
lvmcreate_initrd -- ERROR making ram disk filesystem

Also, any suggestions as to where to put the "vgscan" and "vgchange -a y"
on this system.  It uses the "Sys V" rc.d setup (no /sbin/init.d/boot
file).

Thanks,

Jon Polacheck
