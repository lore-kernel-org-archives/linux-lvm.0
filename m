Return-Path: <nathans@wobbly.melbourne.sgi.com>
Date: Tue, 14 Aug 2001 10:31:12 +1000
From: Nathan Scott <nathans@sgi.com>
Subject: Re: [linux-lvm] Writing forward compatible applications using /proc
Message-ID: <20010814103112.K295821@wobbly.melbourne.sgi.com>
References: <20010811235718.A20414@linux.com> <20010812200701.A657@btconnect.com> <20010812221650.A6589@vestdata.no> <20010813100858.C362@btconnect.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20010813100858.C362@btconnect.com>; from thornber@btconnect.com on Mon, Aug 13, 2001 at 10:08:58AM +0100
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
Cc: "Martin K. Petersen" <mkp@mkp.net>

hi,

On Mon, Aug 13, 2001 at 10:08:58AM +0100, Joe Thornber wrote:
> On Sun, Aug 12, 2001 at 10:16:50PM +0200, Ragnar Kj?rstad wrote:
> > On Sun, Aug 12, 2001 at 08:07:02PM +0100, Joe Thornber wrote:
> > > I would much rather see people wrapping the tools than using liblvm, in fact
> > > liblvm will probably disappear in the future.
> > 
> > Why will liblvm disappear? To me using a library interface seems much
> > nicer than wrapping applications.
> 
> Because it's means there's yet another interface (along with the
> command line tools, and ioctl's) to constrain any implementation
> changes.  Command line tool interface will not change.  liblvm (if it
> still existed as a shared library) will change drastically between 1.0
> and 2.0 - not least because it in turn reflects the driver ioctl
> interface.
> 
> The experimental branch has a single lvm tool, with liblvm statically
> linked into it.  There's no need for the outside world to know about
> liblvm.
> 

Just as another data point - the XFS mkfs program uses liblvm to
figure out the stripe width and stripe size of the underlying
volume, and then uses that knowledge to improve the layout of the
various ondisk data structures for the filesystem, if its sitting
on top of a striped LVM volume.

As a reference, the code in the XFS cvs tree on oss.sgi.com in
cmd/xfsprogs/libdisk/lvm.c contains this logic.

The equivalent md code (in that same directory) uses an ioctl for
this function and is much cleaner - I wouldn't mind liblvm going
away provided this information can be extracted just as easily as
the md case.

If you do decide to make liblvm go away, please make sure you let
us know the correct way to extract this information without using
liblvm.  My personal preference would be an ioctl interface like
the md code provides.

cheers.

-- 
Nathan
