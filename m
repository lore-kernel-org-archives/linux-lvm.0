From: "Erick Calder" <e@arix.com>
Subject: RE: [linux-lvm] Successful Upgrade to 1.0 with RH 7.1
Date: Sat, 25 Aug 2001 20:56:17 -0700
Message-ID: <002501c12de3$0ebcb9c0$0300000a@pacbell.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <Pine.LNX.4.33.0108191729210.1071-100000@leopard.dorfam.ca>
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
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

> started with a clean Redhat 2.4.3-12 kernel

I'm running a stock 7.0 version and downloaded the above-named kernel...
patch and compilation went ok but I can't seem to make modules... I get a
ton of errors... I realised that I needed to install the kernel-headers for
this version but even after that I can't make the modules... I've seen a lot
of other guys out there suffering with this but no solutions... I even tried
changing the HOSTCC to "kgcc" in the Makefile but no dice.... so I'm
wondering what you did right... can you share?

(sorry everyone else that isn't running RH)

-----Original Message-----
From:	linux-lvm-admin@sistina.com [mailto:linux-lvm-admin@sistina.com] On
Behalf Of gerry@dorfam.ca
Sent:	Sunday, August 19, 2001 2:39 PM
To:	linux-lvm@sistina.com
Subject:	[linux-lvm] Successful Upgrade to 1.0 with RH 7.1

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

_______________________________________________
linux-lvm mailing list
linux-lvm@sistina.com
http://lists.sistina.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
