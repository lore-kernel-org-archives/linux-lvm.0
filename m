From: Sarwer Zafiruddin <sarwer.zafiruddin@rune.org>
Subject: RE: [linux-lvm] Mandrake 8.1 and LVM 
In-Reply-To: <Pine.LNX.4.21.0111291810070.435-100000@sol.rune.org>
Message-ID: <Pine.LNX.4.21.0111291810520.435-100000@sol.rune.org>
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
Date: Thu Nov 29 17:12:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

I've never had to boot HP-UX in a "rescue" mode, but with AIX, it's mainly
there to mount the root volume group.  I would imagine that HP would be
similar.  I don't think I've ever to to modify the LVM config in rescue
mode.

Sarwer

On Thu, 29 Nov 2001, Steve Wray wrote:

> Sounds to me like Linux is a sort of in-betweeny here!
> 
> I assume that its possible to boot HP-UX and AIX machines
> from their 'rescue' media and have full and easy access
> Sounds to me like Linux is a sort of in-betweeny here!
> 
> I assume that its possible to boot HP-UX and AIX machines
> from their 'rescue' media and have full and easy access
> to the LVM structure?
> 
> 
> 
> > From: linux-lvm-admin@sistina.com [mailto:linux-lvm-admin@sistina.com]On
> > Behalf Of Sarwer Zafiruddin
> >
> > IMHO (which shouldn't mean much to anyone), a few Unix platforms out
> there
> > do use LVM for their root/OS filesystems, like HP HP-UX and IBM AIX.  My
> > experience with both are that they are very useful for OS filesystem
> > issues (especially for failing disks).  The reason LVM works so well in
> > these platforms is that the kernel, bootup sequences, and installation
> > media all have tight LVM intergration.  On the other hand I have also
> seen
> > piss poor implimentation of LVM with the OS filesystems, like
> > Solaris/Veritas root encapsulation (when it works...it's good, when it's
> > broke...prepare for a major headache). I am hopefull as Linux LVM
> matures,
> > major distributions will intergrate it as a critical feature of
> > the OS.  That
> > will also be a major step in making the Linux a more viable OS solution
> in
> > the Enterprise.
> >
> > Sarwer
> >
> > On Thu, 29 Nov 2001, Steve Wray wrote:
> >
> > > > From: linux-lvm-admin@sistina.com
> > [mailto:linux-lvm-admin@sistina.com]On
> > > > Behalf Of mitch@mdmiller.com
> > > > > (b) dynamically expand the amount of space available to the
> > > > root partition.
> > > >
> > > > Pardon me for being a neophyte here, but what else goes on the root
> > > > partition which takes any significant or dynamic amount of
> > space?  Isn't
> > > > the root just a place to put all the top level directories,
> > the contents
> > > > of which are typically all on another partition anyway?
> > >
> > > Exactly; virtually all the content of the root partition should
> > > be describable as "static/unshareable" which means that it doesn't
> > > need snapshotting in case you accidentally delete something,
> > > or dynamically resizable.
> > >
> > > Another of the purposes of the root filesystem is to provide
> > > an island of sanity in a sea of madness when things go wrong;
> > > typically the ideal is to have a system that can easily be
> > > booted into a rescue mode from the root partition only.
> > > In this setup one has "ghost" /usr/*bin et al directories
> > > that are on the root filesystem but get mounted over
> > > when you boot the system for real. These can provide the
> > > tools you need to rescue the system.
> > >
> > > Having root LVM just means that if anything goes wrong
> > > with the LVM subsystem then you *need* the system to
> > > be bootable from floppy or CDROM, and that is sometimes
> > > less practical than having root *not* be LVM in the
> > > first place!
> > > :)
> > > anyhow this is getting away from the topic (which I'm really
> > > interested in); LVM on mandrake 8.1 with devfs...
> > >
> > > >
> > > > -- Mitch
> > > >
> > > >
> > > >
> > > > _______________________________________________
> > > > linux-lvm mailing list
> > > > linux-lvm@sistina.com
> > > > http://lists.sistina.com/mailman/listinfo/linux-lvm
> > > > read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
> > > >
> > > >
> > >
> > > _______________________________________________
> > > linux-lvm mailing list
> > > linux-lvm@sistina.com
> > > http://lists.sistina.com/mailman/listinfo/linux-lvm
> > > read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
> > >
> > >
> >
> > --
> > --------------------------
> > System Administrator
> > Rune Information Services
> > http://www.rune.org
> > e-mail:  sarwer@rune.org
> > --------------------------
> >
> >
> > _______________________________________________
> > linux-lvm mailing list
> > linux-lvm@sistina.com
> > http://lists.sistina.com/mailman/listinfo/linux-lvm
> > read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
> >
> >
> 
> 

-- 
--------------------------
System Administrator
Rune Information Services
http://www.rune.org
e-mail:  sarwer@rune.org
--------------------------
