Message-ID: <38715858.5FBC6EB6@msede.com>
Date: Tue, 04 Jan 2000 03:18:00 +0100
From: Michael Marxmeier <mike@msede.com>
Reply-To: jamesp@emporia.u-net.com
MIME-Version: 1.0
Subject: [linux-lvm] Swap (fwd)
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@msede.com


-------- Original Message --------
Subject: Swap
Date: Tue, 4 Jan 2000 01:48:30 +0000 (GMT)
From: James Pattinson <jamesp@emporia.u-net.com>
To: linux-lvm@msede.com
Message-ID:
<Pine.LNX.4.10.10001040146350.1544-100000@fuse.aethos.co.uk>

Hi

I'm using /dev/vg00/swapvol1 as my swap device - it all seems OK but I
get
this when I try to turn swap off...

[root@fuse /root]# swapoff -a -v
swapoff on /dev/vg00/swapvol1
swapoff: /dev/vg00/swapvol1: Invalid argument

I've done mkswap and everything, and swap is working.

Any ideas?

Cheers

James
