From: Barry Roomberg <broom@voicenet.com>
Reply-To: broom@voicenet.com
Subject: [linux-lvm] Alternate Pathing?
Date: Sun, 23 Jul 2000 11:35:52 -0400
MIME-Version: 1.0
Message-Id: <00072311385205.27541@cg965888-a.adubn1.nj.home.com>
Content-Transfer-Encoding: 8bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@msede.com

Ohh LVM Gurus, I beseech thee:

Does the Linux kernel, filesystem, device tree,
or LVM have the concept of Alternate Pathing?

My situation is that one of the key features
I have in Solaris (which I want in Linux) is the 
ability to have multiple fibre channel devices 
(disks, RAID luns, etc) seen
via multiple cards in the system.  All are
shown simultaneously through the different paths.
If one of the paths should fail (slot, card, cable,
controller) than the device can be picked up
via the alternative path.

Does this concept exist anywhere in Linux?
It seems the right place for it to exist
would be at the disk side of the LVM.

I searched GOOGLE and the LVM list archive
for mentions but did not come up with anything.

Any pointers?

Thanks
Barry
broom@nospam-voicenet.com
