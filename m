Message-ID: <3BFF37FB.2050203@birddog.com>
From: "Kirby C. Bohling" <kbohling@birddog.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] [Fwd: ext2 label support for LVM in mount and e2fsck]
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
Date: Sat Nov 24 00:03:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

Helps when the idiot remembers to include the link huh?

http://arioch.unomaha.edu/~kbohling/lvm_label_patches/

	Kirby

-------- Original Message --------
Subject: ext2 label support for LVM in mount and e2fsck
Date: Fri, 23 Nov 2001 23:59:06 -0600
From: "Kirby C. Bohling" <kbohling@birddog.com>
To: linux-lvm@sistina.com

LVM list,

	I just got RH 7.2.  I downloaded all the stuff to make LVM work correctly
on it.  I was unpleasently surprised to find that ext2 filesystem labels
don't work correctly.  That is, you can say this in the fstab:

LABEL=/usr
/usr
ext2
defaults
1
1

	If the label is on any partition listed in /proc/partitions, however it
doesn't work if the label is on a logical volume.

	Well I had the source, and I had a problem.  Here is a link to the
patches to mount and e2fsck to make them go.  I have sent them into the
respective maintainers, the mount maintainer happily took one, I haven't
heard from the e2fsck maintainer yet.  So hopefully they should be in a
future version.  Thought possibly somebody else out there might
appreciate them.

	Disclaimer:  these were only tested on one machine with one LVM setup.
If you screw up your mount or fsck utilities you will need a boot/rescue
disk handy.  Patched againsted RH 7.2 source, but should work fine
against stock source.

		Kirby
-- 
Real Programmers view electronic multimedia files with a hex editor.


-- 
Real Programmers view electronic multimedia files with a hex editor.
