Message-Id: <37FE57E3.642A5766@mainland.ab.ca>
Date: Fri, 08 Oct 1999 14:45:23 -0600
From: Drew Smith <drew@winterland.mainland.ab.ca>
Mime-Version: 1.0
Subject: [linux-lvm] Warm Fuzzies.
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@msede.com


	Hey all,

	Quick scary story:

	Had a power spike the other night - the power supply tripped on the
cube of SCSI disks, and they all spun down.  My server room at home has
FAR too many machines to notice that eight 9G scsi drives were no longer
spinning by noise alone, so this went unnoticed for about an hour, when
I suddenly discovered that the machine was unresponsive.

	Regardless, after rebooting, reloading the module and running vgscan,
nothing came up.  Scared the piss out of me.

	But - powering the drives up and reloading all involved, everything
came up happily, no errors whatsoever.

	Just a happy note to say that LVM survived this without a hitch,
showing that it truly is worthy of being in the stock kernel - anyone
still taking notice? :)

	Cheers,
	- Drew.
