Message-ID: <39D15A42.29D825DD@amis.com>
Date: Tue, 26 Sep 2000 20:24:02 -0600
From: Eric Whiting <ewhiting@amis.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] current lvm function questions
References: <39D14B6C.4C9F6C26@us.oracle.com>
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: David Brower <dbrower@us.oracle.com>
Cc: linux-lvm@msede.com

David Brower wrote:
> Specifically, if a pv/vg/lv is created on /dev/sda6, and
> a subsequent reconfig has that partition show up as
> /dev/sdb3, does it still show up as /dev/lvname?

This is exactly what LVM is great for. I put 4 ide disks in a box and
moved them all over from primary/secondary/master/slave and the box
boots fine every time. Very cool stuff. Try moving disks around without
lvm.  It is a pain.

eric
