Message-ID: <39DB7362.A28FBB77@fil.org>
Date: Wed, 04 Oct 2000 14:13:54 -0400
From: "Myers W. Carpenter" <myers@fil.org>
MIME-Version: 1.0
Subject: [linux-lvm] Intresting notes on LVM in 2.4.0-test9
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@msede.com

Hi,
	After playing around for a bit I have gotten lvm to work under
2.4.0-test9, using a Debian install that is mostly potato, but with a
few deb's (like libc6) from woody thrown in.

	The hard part was getting the userspace tools to work.    Heinz, 
*pretty please with sugar on top* put out a new version.  Crawling
through all those patches to figure out what would be the best
combination wasn't really all that fun.  To me it would be a lot easier
just to come out with a 0.8final2 and prevent this.

	I have a deb at http://maski.org/lvm/ if anyone else on debian needs a
newer set that the 0.8i version that is official.

	One weird thing:  /proc/lvm reports:

 Global: 61650 bytes malloced   IOP version: 6   2:24:42 active

	but in in the 0.8final source lvm.h has this:

#define LVM_DRIVER_IOP_VERSION          7

	Is that right?

		myers
-- 
You're just jealous because the voices only talk to me.
