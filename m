From: "Robert P. J. Day" <rpjday@mindspring.com>
Message-ID: <Pine.LNX.4.44.0312011923470.2017-100000@localhost.localdomain>
MIME-Version: 1.0
Subject: [linux-lvm] fedora core 1 and LVM2
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
Date: Tue Dec  2 07:51:09 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM mailing list <linux-lvm@sistina.com>

  this week sometime, i'm interested in configuring a system with the
following properties:

  1) fresh install of fedora core 1 (FC1), with LVM1
  2) upgrade to 2.6 (test) kernel
  3) upgrade to LVM2

based on what little i know about all this, here's the sequence i
was going to go through -- feel free to comment sagely or giggle
hysterically.

  first, i'd reserve a single physical partition for /boot (i still
need to keep the boot partition outside of the LVM, right?), and
give the entire rest of the 40G drive to LVM1.

  once the system is installed, upgrade to the 2.6 kernel, which
i'm fairly familiar with by now.

  once the 2.6 kernel is in, install LVM2, and use "vgconvert"
to move up to LVM2 for all the installed logical volumes.

  in a nutshell, is that about right?  feel free to fill in any
blank spots, or warn me that LVM2 is not stable enough to be
thinking about this right now.

  thanks for any guidance.

rday
