Date: Mon, 13 Nov 2000 13:12:23 -0500 (EST)
From: Rob Foehl <rob@loonybin.net>
Subject: [linux-lvm] Removing a PV
Message-ID: <Pine.BSO.4.21.0011131308530.14526-100000@loonybin.loonybin.net>
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@msede.com

If I want to completely pull a drive that belongs to a VG with an ext2
formatted LV in it, what's the correct procedure to avoid mangling the
filesystem? I currently have a 130 gig partition spread over six
drives.. about 74 gigs is in use, and I wanted to remove a single 20 gig
drive from the volume.. I'm assuming I should shrink the filesystem by
around 30 gigs or so (to be safe), then somehow also shrink the LV and
move any used PEs on the 20 gig drive in question onto freed space on
other drives.. Any suggestions would be greatly appreciated.

-Rob
