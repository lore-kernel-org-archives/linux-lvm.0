From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] 2.4.20-pre4 and lvm-1.0.5
Message-ID: <20020827091844.B20836@sistina.com>
References: <20020826121451.B18054@sistina.com> <Pine.LNX.4.44.0208261201390.20910-100000@junior.lunanet.biz>
Mime-Version: 1.0
In-Reply-To: <Pine.LNX.4.44.0208261201390.20910-100000@junior.lunanet.biz>; from dlt@lunanet.biz on Mon, Aug 26, 2002 at 12:21:52PM -0600
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
Date: Tue Aug 27 02:34:22 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Mon, Aug 26, 2002 at 12:21:52PM -0600, Donald Thompson wrote:
> 
> On Mon, 26 Aug 2002, Heinz J . Mauelshagen wrote:
> 
> > Did the "cd LVM/PATCHES;make;cd $KERNEL_DIR;patch -p1 TheLVMPatch" run
> > show any problems?
> 
> None, it patched clean. I did however (hopefully completely unrelated) get
> rejects on two places with the crypto patch, which I went back and
> manually added.
> 
> > Do you say that pvscan etc. even fail when /lib/modules/2.4.20-pre4
> > is in the module path and *no* modules get loaded at all?
> 
> That is correct. I boot, vgscan fails (I'm assuming it segfaults but I
> really can't tell during the normal boot process what actually happened)
> to detect my VGs, my system goes into a maintenance mode situation since
> my /usr is on an LV, I login and run lsmod and absolutely no modules
> appear in the list. I try vgscan and/or pvscan and they fail with a
> segmentation fault. So yeah, if no module tree exists system boots fine,
> if module tree exists vgscan fails regardless of whether modules are
> loaded. Yes it defies logic, but I swear thats how it worked:)

I wonder if there might be a single user case disabling lsmod to list?

> 
> > Did you ever retry with a clean build
> > "make clean&&make dep&&make bzlilo&&make modules&&make modules_install"
> > and an error free depmod run?
> 
> I did get a depmod error with sis.o I think it was, which is a video
> driver module. I removed that module and depmod ran without errors.

Can't see a problem related.

> 
> What I did do the next day is with a straight 2.4.19 kernel, patched in
> LVM along with the same pptp patch and crypto patch, and the system came
> up fine. Two big differences here are obviously I didn't patch in the pre4
> patch, but also I didn't use the linux-2.4.19-VFS-lock.patch with the pre4
> kernel, whereis with the straight 2.4.19 kernel I did. Just spaced
> patching the VFS-lock patch, but I don't really need it anyways.
> 
> Either pre4 and LVM don't like one another, or I screwed something up and
> I missed it when I was working with the 2.4.20-pre4 kernel. Since I
> haven't done a very 'scientific' analysis of where stuff is going wrong,
> I'd put my money on operator error at this point.

Well, will stress the 2.4.20-pre4/LVM 1.0.5 combo ea little more here...

Regards,
Heinz    -- The LVM Guy --


> 
> -Don
> 
> > Regards,
> > Heinz    -- The LVM Guy --
> >
> >
> > On Sun, Aug 25, 2002 at 02:42:31AM -0600, Donald Thompson wrote:
> > > I built 2.4.20-pre4 tonight and patched in lvm-1.0.5. My volume groups
> > > fail to showup after and only after I built the modules. In other words
> > > some module i've built is screwing up LVM. vgscan gives me a segmentation
> > > fault.
> > >
> > > If I move /lib/modules/2.4.20-pre4 out of the way so that no modules are
> > > ever loaded at bootup, everything works fine with my volume groups. As
> > > soon as I boot into the kernel with modules available I get segfaults
> > > on both vgscan and pvscan. I haven't taken the time to track down exactly
> > > which module it might be since i've got around 180 modules built, and
> > > honestly I have no clue how to make even educated guess on it. I first
> > > thought it was rtc.o since this was the only thing that was getting loaded
> > > when the volume groups failed to show. However, I moved rtc.o out of the
> > > modules directory, rebooted, vgscan still fails to run, and lsmod lists no
> > > modules loaded.
> > >
> > > Prior to this I was running 2.4.19-pre10 with lvm 1.0.4 patch. I
> > > discovered I was still using lvm 1.0.1 utilities though up until the time
> > > I built 2.4.20-pre4. I also swapped out the motherboard and CPU on the
> > > system prior to rebuilding it, so the configuration changed somewhat.
> > >
> > > I can boot back into 2.4.19-pre10 while still using lvm-1.0.5 utilities
> > > and everything is fine.
> > >
> > > Anyone have any clues where I might have gone wrong?:)
> > >
> > > This is a debian sid system. Kernel was compiled with gcc-3.0.4. Binutils
> > > 2.11.2. Hardware is: athlon K7 950mhz CPU, Via KX133 type motherboard.
> > > Along with the lvm patch that I created for this kernel in the lvm PATCHES
> > > directory, I've also patched in a pptp patch (believe it only effects pppd
> > > stuff) and the crypto patch 2.4.3.1.
> > >
> > > TIA for any help.
> > >
> > > -Don
> > >
> > >
> > > _______________________________________________
> > > linux-lvm mailing list
> > > linux-lvm@sistina.com
> > > http://lists.sistina.com/mailman/listinfo/linux-lvm
> > > read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
> >
> > *** Software bugs are stupid.
> >     Nevertheless it needs not so stupid people to solve them ***
> >
> > =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
> >
> > Heinz Mauelshagen                                 Sistina Software Inc.
> > Senior Consultant/Developer                       Am Sonnenhang 11
> >                                                   56242 Marienrachdorf
> >                                                   Germany
> > Mauelshagen@Sistina.com                           +49 2626 141200
> >                                                        FAX 924446
> > =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
> >
> > _______________________________________________
> > linux-lvm mailing list
> > linux-lvm@sistina.com
> > http://lists.sistina.com/mailman/listinfo/linux-lvm
> > read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
> >
> 
> 
> 
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
