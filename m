From: "Mark H. Wood" <mwood@IUPUI.Edu>
Subject: Re: [linux-lvm] How to transit from Linux 2.4 to 2.6 with LVM in
 play?
In-Reply-To: <20030930151649.GL1593@tykepenguin.com>
Message-ID: <Pine.LNX.4.55.0310040444040.9304@mhw.ULib.IUPUI.Edu>
References: <Pine.LNX.4.55.0309300932270.593@mhw.ULib.IUPUI.Edu>
 <20030930151649.GL1593@tykepenguin.com>
MIME-Version: 1.0
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
Date: Sat Oct  4 05:13:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On Tue, 30 Sep 2003, Patrick Caulfield wrote:
[snip]
> If not then you'll need to patch device-mapper into your 2.4 kernel to
> allow you to run LVM2 on it. (LVM2 will read the LVM1 metadata)

OK, I hadn't understood that, while LVM2 will read LVM1 metadata, it must
read them through the device-mapper.  I patched up a 2.4.21 kernel and
tried again.  But I still get this:

# ~mhwood/build/LVM2.2.00.07/tools/lvm vgs
  /proc/lvm/VGs/vg1 exists: Is the original LVM driver using this volume group?
  Can't lock vg1: skipping

Well, of course the original LVM driver activated my one and only volume
group, otherwise /home wouldn't be mounted and the new 'lvm' wouldn't be
available for testing.  So it seems to mean that "switch between LVM1 and
LVM2" means "replace LVM1 tools with LVM2 tools and v.v.", not "you can
use one set to inspect storage objects activated by the other".  The only
point of compatibility between the two tool sets is that LVM2 tools
understand the LVM1 on-disk format; they won't run concurrently.

I had hoped to build some confidence in the LVM2 tools, and that I had
built them properly, by inspecting the output of read-only operations
using LVM2 on a system that currently uses LVM1 to access most of its
volumes.  Granted that my brain is a bit odd, it could be made more
explicit somewhere that this cannot be done.  I'll move the LVM1 tools
somewhere else on the root volume, then install LVM2 and see what happens.
That seems to be the intended meaning of "switch between LVM1 and LVM2".

I'm not complaining (much); this note is mainly to pass along information
about what some of the users are thinking and doing with the new tools.

- -- 
Mark H. Wood, Lead System Programmer   mwood@IUPUI.Edu
MS Windows *is* user-friendly, but only for certain values of "user".
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (GNU/Linux)
Comment: pgpenvelope 2.10.2 - http://pgpenvelope.sourceforge.net/

iD8DBQE/fp0Ds/NR4JuTKG8RAtMgAKCMEH8QT92bqSKlsGv9a+mktRn6DACgm4K7
m42GJQeh1QE7Fg+wdNcHGyo=
=2XFr
-----END PGP SIGNATURE-----
