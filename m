From: Micah Anderson <micah@riseup.net>
Subject: Re: [linux-lvm] Re: Device-mapper submission for 2.4
Message-ID: <20040103173351.GD25373@riseup.net>
References: <CEADF0D83077F7458B763904E47AA709287BD2@exchange.neokimia.com> <3FD9F93E.6070205@indygecko.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3FD9F93E.6070205@indygecko.com>
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
Date: Sat Jan  3 11:35:02 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Does this mean that EVMS and LVM are merging, as they are both using
device mapper?

clueless newbie,
micah

On Fri, 12 Dec 2003, Jord Tanner wrote:

> 
> Device Mapper 1.00.07 patches against 2.4.23 with no problems. Follow 
> the directections for device mapper at 
> http://evms.sourceforge.net/install/kernel.html
> 
> Jord Tanner
> 
> Yanick Quirion wrote:
> 
> >Hi,
> >
> >Is there a patch for device-mapper for kernel 2.4.23?
> >
> >Thanks
> >
> >Yanick
> >
> > 
> >
> >>-----Original Message-----
> >>From: Alasdair G Kergon [mailto:agk@uk.sistina.com]
> >>Sent: 11 December, 2003 14:48
> >>To: linux-kernel@vger.kernel.org; linux-lvm@sistina.com
> >>Cc: Paul Jakma; Mike Fedyk; Joe Thornber; Marcelo Tosatti; Linus
> >>   
> >>
> >Torvalds
> > 
> >
> >>Subject: [linux-lvm] Re: Device-mapper submission for 2.4
> >>
> >>On Wed, Dec 10, 2003 at 03:40:07PM -0800, Mike Fedyk wrote:
> >>   
> >>
> >>>On Wed, Dec 10, 2003 at 05:00:43PM +0000, Paul Jakma wrote:
> >>>     
> >>>
> >>>>On Wed, 10 Dec 2003 venom@sns.it wrote:
> >>>>       
> >>>>
> >>>>>DM is back compatible with LVM1, tested and runs well.
> >>>>>         
> >>>>>
> >>>>What about the patches posted by Joe last (?) week which remove
> >>>>       
> >>>>
> >LVM1
> > 
> >
> >>>>support from 2.6 DM?
> >>>>       
> >>>>
> >>They remove support for the broken version 1 of the device-mapper
> >>ioctl interface.  This is nothing to do with LVM1.
> >>
> >>   
> >>
> >>>If this is what I was reading being discussed a few weeks ago, then
> >>>     
> >>>
> >the
> > 
> >
> >>>support for the LVM1 sysctls/ioctls has/will be removed, so you will
> >>>     
> >>>
> >>have to
> >>   
> >>
> >>>use the DM utilities instead of the old LVM1 utilities.  LVM1
> >>>     
> >>>
> >on-disk
> > 
> >
> >>format
> >>   
> >>
> >>>should still be supported.
> >>>     
> >>>
> >>2.6 does not support LVM1 ioctls.
> >>LVM2 userspace tools and EVMS both support LVM1 on-disk format using
> >>device-mapper.
> >>
> >>
> >>Here's a reference sheet to help clarify the terminology and explain
> >>what's happening.
> >>
> >>LVM1 = Userspace tools + kernel ioctls included in marcelo's 2.4 tree
> >> - LVM1 kernel ioctls are *not* included in or available for 2.6
> >> - LVM1 userspace tools do *not* work with 2.6 kernels
> >>
> >>dm = Kernel driver (GPL) for new volume managers to use.
> >> - Included in Linus's 2.6 kernels.
> >> - Available as a patch for 2.4 kernels from the Sistina website.
> >> - Knows *nothing* about volume manager's on-disk metadata layouts.
> >> - Userspace volume managers (e.g. EVMS and LVM2) communicate via a
> >>   
> >>
> >new
> > 
> >
> >>   ioctl interface.
> >> - This ioctl interface is currently "version 4" and we regard it as
> >>   stable.  [Some enhancements are on the horizon, but nothing that
> >>   breaks existing code/binaries.]
> >> - An old development version of this device-mapper ioctl interface
> >>   
> >>
> >known
> > 
> >
> >>   as "version 1" has problems with it, is deprecated and should be
> >>   removed from kernel trees ASAP.
> >>   Always use "version 4" when building new kernels today.
> >>
> >>libdevmapper = Userspace shared library (LGPL) which wraps a volume
> >>manager
> >>              application interface around the device-mapper ioctls
> >> - Can determine transparently whether the kernel device-mapper is
> >>   
> >>
> >using
> > 
> >
> >>   "version 4" dm ioctl interface or the deprecated "version 1"
> >>   
> >>
> >interface
> > 
> >
> >>   and adapt itself accordingly.  [configure --enable-compat]
> >> - Can only communicate with device-mapper: it cannot use LVM1
> >>   
> >>
> >ioctls.
> > 
> >
> >> - Designed primarily for use by LVM2 tools.  [EVMS does not use it]
> >> - Some parts of the libdevmapper API are not yet stable and are
> >>   
> >>
> >likely
> > 
> >
> >>   to get changed.
> >>
> >>dmsetup = Userspace utility (GPL) which provides full command-line
> >>   
> >>
> >access
> > 
> >
> >>to
> >>         the libdevmapper API.
> >> - Designed for use by shell scripts and for testing and debugging.
> >> - Command line interface may be considered stable.  New features may
> >>   
> >>
> >get
> > 
> >
> >>   added, but we'll try not to break existing commands.
> >>
> >>LVM2 = New Logical Volume Manager command line tools (GPL) designed to
> >>      be backward-compatible with LVM1 and offering new features and
> >>      more flexibility, configurability and stability.
> >> - Supports existing LVM1 on-disk metadata.
> >>   This means you do *not* have to make changes to your existing
> >>   
> >>
> >on-disk
> > 
> >
> >>   LVM1 volumes to switch between using LVM1 and LVM2.
> >> - Uses command lines similar to LVM1.
> >> - By default uses a new on-disk metadata format supporting more
> >>   features than the original LVM1 version.
> >> - Communicates with the device-mapper kernel driver via
> >>   
> >>
> >libdevmapper's
> > 
> >
> >>   API.
> >>
> >>
> >>Miscellaneous points:
> >> - LVM1 uses block major number 58: dm selects one or more major
> >>   
> >>
> >numbers
> > 
> >
> >>   dynamically as required instead.
> >> - LVM1 uses character major number 109: dm selects a misc minor
> >>   
> >>
> >number
> > 
> >
> >>   dynamically instead.
> >> - There's a (non-devfs) script for creating /dev/mapper/control at
> >>   startup (or after dm module load).
> >> - You can use LVM1 tools with unpatched 2.4 kernels.
> >> - You can use LVM2 tools with patched 2.4 and unpatched 2.6 kernels.
> >> - Device-mapper support for snapshots and pvmove is so far released
> >>   only for 2.4.  Patches for 2.6 are being tested.
> >> - Multipath and mirror support are under development for 2.6.
> >>   (Then get back-ported to 2.4.)
> >>
> >>Web download page: http://www.sistina.com/products_lvm_download.htm
> >>
> >>The device-mapper tarball contains:
> >> device-mapper kernel patches - needed only for 2.4;
> >> userspace libdevmapper and dmsetup - needed with all dm kernels.
> >>The LVM2 tarball contains the LVM2 command line tools.
> >>
> >>Development code can be found via:
> >> http://people.sistina.com/~thornber/  (for kernel patches)
> >> http://www.sistina.com/products_CVS.htm  (for userspace code)
> >>
> >>Device-mapper mailing list:
> >> http://lists.sistina.com/mailman/listinfo/dm-devel
> >>
> >>Alasdair
> >>--
> >>agk@uk.sistina.com
> >>
> >>_______________________________________________
> >>linux-lvm mailing list
> >>linux-lvm@sistina.com
> >>http://lists.sistina.com/mailman/listinfo/linux-lvm
> >>read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> >>   
> >>
> >
> >_______________________________________________
> >linux-lvm mailing list
> >linux-lvm@sistina.com
> >http://lists.sistina.com/mailman/listinfo/linux-lvm
> >read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> > 
> >
> 
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
