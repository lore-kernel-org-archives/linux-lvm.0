From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] LV recovery
Message-ID: <20021209185433.A20282@sistina.com>
References: <1039437938.1422.27.camel@lawrence> <20021209143005.A19400@sistina.com> <1039448039.1422.42.camel@lawrence>
Mime-Version: 1.0
In-Reply-To: <1039448039.1422.42.camel@lawrence>; from laurie@midafrica.com on Mon, Dec 09, 2002 at 05:33:58PM +0200
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
Date: Mon Dec  9 12:15:14 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Mon, Dec 09, 2002 at 05:33:58PM +0200, Lawrence Strydom wrote:
> Hi Heinz,
> I get the following output:
> insmod: /lib/modules/2.4.7-4GB/kernel/drivers/md/lvm-mod.o: insmod
> char-major-109 failed.
> 
> vgscan --  LVM driver module not loaded
> 
> That freaks me out a bit because the module is present. When I try to
> load it manually with insmod I get the same error. Does this mean the
> metadata has been overwritten?

No, it does only mean that insmod fails loading the lvm modules which is
likely caused by the depmod problem not being able to write the module
dependency file. Is your root filesystem full ? In that case you need to
free some space there in order to run "depmod -a" fine.
If you didn't boot the Linux version you want to create the module dependency
file(s) for, you may need "depmod -F System.map -a Linuxversion".

If the modules can't be loaded or the LVM driver is not statically
bound into your kernel, you can't activate any volume groups and therefore
can't access any logical volumes :(

BTW: You are using a rather old version of the 2.4 kernel and likely of LVM too.
     Is there a chance that you can upgrade ?

Regards,
Heinz    -- The LVM Guy --

> 
> Thanks
> Lawrence
> 
> On Mon, 2002-12-09 at 15:30, Heinz J . Mauelshagen wrote:
> > 
> > Lawrence,
> > 
> > vgscan should recognize your VG fine if nothing overwrote the LVM metadata
> > on /dev/hdc.
> > What does vgscan dispay ?
> > 
> > On Mon, Dec 09, 2002 at 02:45:36PM +0200, Lawrence Strydom wrote:
> > > Hi,
> > > My company uses a SuSE email server III solution. The box has 2 IDE
> > > drives, hda with /boot, /, and swap partintions on. The second, hdc, was
> > > placed in a LVG with a LV for /var occupying all availlable space.
> > > While I was away (quick absolution of self) one of the junior guys did
> > > an online update of the software after which the system wouldn't start
> > > again. To make a long story short, I managed to get the system going
> > > again BUT..... /var cannot be mounted. 
> > > /etc/fstab points to /dev/system/VAR. Upon inspection, this binary file
> > > turns out to contain nothing but an error message about being unable to
> > > write to /lib/modules/2.4.18-nnnnn/modules.dep. Ooops...
> > > Now my question is this: Is it possible to recover the data from the
> > > /var LV if the /dev/system/VAR file has gone AWOL? 
> > > Any pointers to documentation/tools will be very much appreciated.
> > > 
> > > Thanks,
> > > Lawrence
> > > 
> > > 
> > > 
> > > 
> > > _______________________________________________
> > > linux-lvm mailing list
> > > linux-lvm@sistina.com
> > > http://lists.sistina.com/mailman/listinfo/linux-lvm
> > > read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> > 
> > -- 
> > 
> > Regards,
> > Heinz    -- The LVM Guy --
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
> > read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

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
