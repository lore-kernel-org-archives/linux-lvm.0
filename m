Return-Path: <gerry@dorfam.ca>
Date: Sun, 19 Aug 2001 17:39:26 -0400 (EDT)
From: <gerry@dorfam.ca>
Message-ID: <Pine.LNX.4.33.0108191729210.1071-100000@leopard.dorfam.ca>
MIME-Version: 1.0
Subject: [linux-lvm] Successful Upgrade to 1.0 with RH 7.1
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

I thought I'd share my experience with my upgrade from beta 7 to 1.0 on
Redhat's 2.4.3-12 kernel...

First, I had already patched the 2.4.3-12 kernel and successfully
installed lvm beta 7.  This went without problems following the
instructions in the PATCHES directory.

I downloaded the new lvm 1.0 tarball and tried to patch the existing
patched kernel source.  That didn't work very well so I immediately gave
up on that approach and started with a clean Redhat 2.4.3-12 kernel.  The
patch was created properly and installed without errors.

I then rebuilt the kernel using the saved .config file from the old
working kernel.  No problems with the kernel compile.  Being on a roll I
did the make file in the LVM/1.0 directory, then updated the existing pv's
using pvversion.  Finally, I did a make install and rebooted.

Everything came up without a single error.  I'm now running on lvm 1.0 and
all data is intact!

Great work and congratulations to the LVM team!

PS. Notice that I started with a clean Redhat 2.4.3-12 kernel NOT the
standard kernel.  Whatever changes have been made by Redhat do not affect
LVM.


Gerry
-- 
"The lyfe so short, the craft so long to learne"  Geoffrey Chaucer
