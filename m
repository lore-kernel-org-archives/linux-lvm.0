From: Heinz J . Mauelshagen <Heinz.Mauelshagen@t-online.de>
Subject: Re: [linux-lvm] 2.4.20-pre4 and lvm-1.0.5
Message-ID: <20020826121451.B18054@sistina.com>
References: <E17ihI1-0001L4-00@hermes.sistina.com> <Pine.LNX.4.44.0208250228060.1046-100000@junior.lunanet.biz>
Mime-Version: 1.0
In-Reply-To: <Pine.LNX.4.44.0208250228060.1046-100000@junior.lunanet.biz>; from dlt@lunanet.biz on Sun, Aug 25, 2002 at 02:42:31AM -0600
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
Date: Mon Aug 26 05:30:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Donald,

your system seems to be running LVM fine without any other modules loaded
and LVM 1.0.5 driver linked into the 2.4.20-pre4 kernel.

Did the "cd LVM/PATCHES;make;cd $KERNEL_DIR;patch -p1 TheLVMPatch" run
show any problems?

Do you say that pvscan etc. even fail when /lib/modules/2.4.20-pre4
is in the module path and *no* modules get loaded at all?

Did you ever retry with a clean build
"make clean&&make dep&&make bzlilo&&make modules&&make modules_install"
and an error free depmod run?

Regards,
Heinz    -- The LVM Guy --


On Sun, Aug 25, 2002 at 02:42:31AM -0600, Donald Thompson wrote:
> I built 2.4.20-pre4 tonight and patched in lvm-1.0.5. My volume groups
> fail to showup after and only after I built the modules. In other words
> some module i've built is screwing up LVM. vgscan gives me a segmentation
> fault.
> 
> If I move /lib/modules/2.4.20-pre4 out of the way so that no modules are
> ever loaded at bootup, everything works fine with my volume groups. As
> soon as I boot into the kernel with modules available I get segfaults
> on both vgscan and pvscan. I haven't taken the time to track down exactly
> which module it might be since i've got around 180 modules built, and
> honestly I have no clue how to make even educated guess on it. I first
> thought it was rtc.o since this was the only thing that was getting loaded
> when the volume groups failed to show. However, I moved rtc.o out of the
> modules directory, rebooted, vgscan still fails to run, and lsmod lists no
> modules loaded.
> 
> Prior to this I was running 2.4.19-pre10 with lvm 1.0.4 patch. I
> discovered I was still using lvm 1.0.1 utilities though up until the time
> I built 2.4.20-pre4. I also swapped out the motherboard and CPU on the
> system prior to rebuilding it, so the configuration changed somewhat.
> 
> I can boot back into 2.4.19-pre10 while still using lvm-1.0.5 utilities
> and everything is fine.
> 
> Anyone have any clues where I might have gone wrong?:)
> 
> This is a debian sid system. Kernel was compiled with gcc-3.0.4. Binutils
> 2.11.2. Hardware is: athlon K7 950mhz CPU, Via KX133 type motherboard.
> Along with the lvm patch that I created for this kernel in the lvm PATCHES
> directory, I've also patched in a pptp patch (believe it only effects pppd
> stuff) and the crypto patch 2.4.3.1.
> 
> TIA for any help.
> 
> -Don
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
