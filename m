Return-Path: <mauelshagen@sistina.com>
Date: Tue, 14 Aug 2001 15:33:13 +0200
From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Writing forward compatible applications using /proc
Message-ID: <20010814153313.A24212@sistina.com>
References: <20010811235718.A20414@linux.com> <20010812200701.A657@btconnect.com> <20010812221650.A6589@vestdata.no> <20010813100858.C362@btconnect.com> <20010814103112.K295821@wobbly.melbourne.sgi.com>
Mime-Version: 1.0
In-Reply-To: <20010814103112.K295821@wobbly.melbourne.sgi.com>; from nathans@sgi.com on Tue, Aug 14, 2001 at 10:31:12AM +1000
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
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Tue, Aug 14, 2001 at 10:31:12AM +1000, Nathan Scott wrote:
> hi,
> 
> On Mon, Aug 13, 2001 at 10:08:58AM +0100, Joe Thornber wrote:
> > On Sun, Aug 12, 2001 at 10:16:50PM +0200, Ragnar Kj?rstad wrote:
> > > On Sun, Aug 12, 2001 at 08:07:02PM +0100, Joe Thornber wrote:
> > > > I would much rather see people wrapping the tools than using liblvm, in fact
> > > > liblvm will probably disappear in the future.
> > > 
> > > Why will liblvm disappear? To me using a library interface seems much
> > > nicer than wrapping applications.
> > 
> > Because it's means there's yet another interface (along with the
> > command line tools, and ioctl's) to constrain any implementation
> > changes.  Command line tool interface will not change.  liblvm (if it
> > still existed as a shared library) will change drastically between 1.0
> > and 2.0 - not least because it in turn reflects the driver ioctl
> > interface.
> > 
> > The experimental branch has a single lvm tool, with liblvm statically
> > linked into it.  There's no need for the outside world to know about
> > liblvm.
> > 
> 
> Just as another data point - the XFS mkfs program uses liblvm to
> figure out the stripe width and stripe size of the underlying
> volume, and then uses that knowledge to improve the layout of the
> various ondisk data structures for the filesystem, if its sitting
> on top of a striped LVM volume.

Nathan,

as Joe et al. stated the liblvm API is subject to major changes in the future.
The command line interface is *not*.

Could you therefore please change mkfs to wrap lvdisplay(8) in order to
retrieve the onformation?

> 
> As a reference, the code in the XFS cvs tree on oss.sgi.com in
> cmd/xfsprogs/libdisk/lvm.c contains this logic.
> 
> The equivalent md code (in that same directory) uses an ioctl for
> this function and is much cleaner - I wouldn't mind liblvm going
> away provided this information can be extracted just as easily as
> the md case.
> 
> If you do decide to make liblvm go away, please make sure you let
> us know the correct way to extract this information without using
> liblvm.  My personal preference would be an ioctl interface like
> the md code provides.

As stated before: please don't use the ioctl interface directly because
it is subject to change!

We'll make sure, that the CLI stays compatible.


WRT the way how to retrieve the information using the CLI you could
go with a tiny perl script, check the exit code to be zero and scanf(3)
stdout (#stripes stripesize) in mkfs:

#!/usr/bin/perl
scalar @ARGV != 1 && exit 1;
open ( PIPE, "lvdisplay $ARGV[0] |") || exit 2;
$stripes=0;
foreach (<PIPE>) {
   if (/^Stripes\s+(\d+)/i) {$stripes=$1;}
   if (/^Stripe\s+size\s+\(KByte\)\s+(\d+)/i) {$stripesize=$1; last;}
}
close PIPE;
$stripes == 0 && exit 3;
print "$stripes $stripesize\n";
exit 0;


Regards,
Heinz    -- The LVM Guy --


> 
> cheers.
> 
> -- 
> Nathan
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html

*** Software bugs are stupid.
    Nevertheless it needs not so stupid people to solve them ***

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                 Sistina Software Inc.
Senior Consultant/Developer                       Am Sonnenhang 11
                                                  56242 Marienrachdorf
                                                  Germany
Mauelshagen@Sistina.com                           +49 2626 141200
                                                       FAX 924446
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
