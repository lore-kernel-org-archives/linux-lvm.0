Date: Tue, 7 Mar 2000 13:45:19 -0600 (CST)
From: Jay Weber <jay@lazy.accessus.net>
Subject: [linux-lvm] LVM and DAC960 Raid controller
Message-ID: <Pine.OSF.4.21.0003071340500.5260-100000@lazy.accessus.net>
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@msede.com

Hi, I'm curious as to if LVM works properly with the Mylex DAC960 raid
controller driver.  This is the driver done with Leonard Zubkoff which
bypasses the the scsi and ide layers, the driver is a block layer of it's
own as I understand.  Information on it can be found at:

	http://www.dandelion.com/Linux/DAC960.html

or in /usr/src/linux/Documentation/README.DAC960 most likely.

I haven't been able to get lvmdiskscan to show any of the
drives/partitions attached to this controller yet, myself.  I'll be
retrying todo, just in case I screwed something up along the way. :)

Thanks, good job with LVM so far, I'm really enjoying the snaphots, which
I've also got questions on, but I'll save em for later.
