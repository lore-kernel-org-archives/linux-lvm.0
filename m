Return-Path: <rajak@purdue.edu>
Return-Path: <rajak@purdue.edu>
Date: Thu, 22 Feb 2001 12:23:53 -0500 (EST)
From: Brian Poole <rajak@purdue.edu>
Message-Id: <Pine.SOL.4.31.0102221208260.25773-100000@herald.cc.purdue.edu>
MIME-Version: 1.0
Subject: [linux-lvm] Patch needed for kernel 2.4.2 ?
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
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hello all,

First of all, thanks for all the hard work ;) I've been running LVM on a
production server for over 6 months now and never have had it fail on me.

*knocks on wood*

Getting to the point, I'm upgrading hardware on my server & I intend to
upgrade the kernel from 2.4.0-test7 to 2.4.2 as well, as I have to add
some drivers anyways I might as well get the bug fixes in. My question is
do I have to patch anything in the kernel for LVM? I notice that the
README in beta 5, which I assume I should be upgrading to, has a bit of
info about patches, but looking in PATCHES/ there are only patches for
2.4.1, as 2.4.2 hadn't been released at the time. Have these patches
already been incorporated into 2.4.2, or if not, will they still apply
cleanly to 2.4.2 and are they needed?

Any other tips, hints and tricks would be appreciated for this upgrade.
Moving to 0.8 final -> 0.9 beta 5a, adding new drives to the VG,
expanding the LV and the FS and I must say, I'm a bit nervous ;) Restoring
100G from tapes is never fun. I have already read the relevant sections in
the HOWTO, but as always, I'm willing to take any other advice people wish
to throw at me, whether on the list or off.

Thanks for the time,

-b
