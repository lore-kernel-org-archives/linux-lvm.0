From: "Mark H. Wood" <mwood@IUPUI.Edu>
Subject: Re: [linux-lvm] Drive gone bad, now what?
In-Reply-To: <3F9989C9.1070909@xs4all.nl>
Message-ID: <Pine.LNX.4.55.0310280920570.14569@mhw.ULib.IUPUI.Edu>
References: <20031021171817.GA28462@mail.parplies.de> <3F985B2D.5060008@xs4all.nl>
 <16280.27367.874758.610758@gargle.gargle.HOWL> <3F98B691.7090902@webhackande.se>
 <3F9989C9.1070909@xs4all.nl>
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
Date: Tue Oct 28 08:40:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On Fri, 24 Oct 2003, Gert van der Knokke wrote:
> Rickard Olsson wrote:
> > John> If you had just a simple concatenation of all the disks, then
> > you are
> > John> toast.  How do you expect LVM to restore the missing 60gb if
> > there's
> > John> no parity information or mirrored blocks?  It's impossible!
>
> I didn't expect lvm to restore the missing data, I guessed it would just
> let me access the rest of the data.

To elaborate a bit, there are three cases to consider:

o  An LV with no extents stored on the failed drive.  This LV is intact
   and LVM should be able to provide it as if nothing had happened,
   because nothing *has* happened to this LV.

o  An LV all of whose extents were stored on the failed drive.  This LV's
   content is entirely lost and may only be recovered from other media.

o  An LV, some but not all of whose extents were stored on the failed
   drive.  Once the lost storage has been replaced, LVM *could* present
   this LV, which would contain a damaged filesystem.  'fsck' might be
   able to repair the filesystem enough to recover files which were stored
   in the undamaged extents, or a filesystem debugger might be available
   to facilitate manual recovery.  Some of the content is lost and may
   only be recovered from other media, but other content is undamaged.

   I don't yet know LVM well enough to say whether it *does* handle this
   case, but it can in theory and I would expect it to be written to do
   so.  Others' comments suggest that this is so.

BTW I've used various logical-volume schemes for years on top of hardware
RAID.  It's a combination that works well.  I don't understand why some
people want to put (soft) RAID on top of LVM rather than underneath it.

- -- 
Mark H. Wood, Lead System Programmer   mwood@IUPUI.Edu
MS Windows *is* user-friendly, but only for certain values of "user".
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (GNU/Linux)
Comment: pgpenvelope 2.10.2 - http://pgpenvelope.sourceforge.net/

iD8DBQE/nn9/s/NR4JuTKG8RArSyAJ93Bdog6U2fNrbpF/dAJ6BZOVlMyQCeKhmU
fEB18by5nkGWlKt/Ge35olE=
=8ETo
-----END PGP SIGNATURE-----
