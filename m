From: "Stephen C. Tweedie" <sct@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-ID: <14104.59686.582801.380743@dukat.scot.redhat.com>
Date: Sat, 17 Apr 1999 21:03:50 +0100 (BST)
Subject: Re: [linux-lvm] Swap/DB devices
In-Reply-To: <199904171124.AA07700@mailgate1b.telekom.de>
References: <199904171124.AA07700@mailgate1b.telekom.de>
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Heinz Mauelshagen <mauelsha@ez-darmstadt.telekom.de>
Cc: linux-lvm@msede.com, Stephen Tweedie <sct@redhat.com>

Hi,

On Sat, 17 Apr 1999 13:22:29 METDST, Heinz Mauelshagen
<mauelsha@ez-darmstadt.telekom.de> said:

> The LVM lib creates the device special nodes dynamically if a logical volume
> is created by lvcreate(8) or found by vgscan(8)/vgimport(8).

> LVM function lv_create_node() has to be extended to create the raw
> device too.  The LVM driver can then be accessed by that raw device
> node _without_ modification.

No, it doesn't work that way.  The major/minor numbers for the raw
devices are 100% meaningless.  Creating a raw device inode is all very
well, but it won't do anything AT ALL until you have done a raw ioctl to
bind it to a block device.

As long as you can create the LVM block devices either in some known
location or with some known block device number, you can then bind a raw
device on top without any changes to the driver underneath.

--Stephen
