From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Accessing LVM partitions from a rescue system
Message-ID: <20021126122431.B28853@sistina.com>
References: <200211251722.31489.pantaleimon@home.no>
Mime-Version: 1.0
In-Reply-To: <200211251722.31489.pantaleimon@home.no>; from pantaleimon@home.no on Mon, Nov 25, 2002 at 05:22:31PM +0100
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
Date: Tue Nov 26 05:32:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Mon, Nov 25, 2002 at 05:22:31PM +0100, Pantaleimon wrote:
> On Monday 25 November 2002 15:17, Heinz J . Mauelshagen wrote:
> > Yeah, pretty strange...
> >
> > Forgot to ask: you run the _very_ same (LVM) versions on the rescue media
> > too ?
> >
> > Regards,
> > Heinz    -- The LVM Guy --
> 
> Yes, I berlieve I run the same versions on both occasions. I have only one 
> file called lvm-mod.o on my system and that's the one I copied to use with 
> the rescue system. I couldn't figure out how to get the version no. from the 
> module file, though, just to make sure it's really the same. Tried "insmod 
> --verbose" but it didn't give any version no.

You can look the LVM version up in /proc/lvm/global.

> 
> On the other hand, your question made me check the kernelversion etc. for the 
> rescue system, and it turns out the rescue disk is based on SuSE 5.3 (while I 
> use 7.3)  and uses libc5 according to the documentation. That sounds like 
> something to do with libraries (even to those not yet initiated, like me, 
> into the inner secrets of Linux :-) ). When I have mounted my normal root 
> drive on /mnt in the rescue system I link /mnt/lib/* from /lib to be able to 
> run the lvm programs. But that only adds the libraries from /mnt/lib. It 
> doesn't replace those already there with identical names, if any. Do you 
> think the reason could be a mix up of libraries from different versions? Just 
> a theory.

Having a more recent one for the rescue media is a good idea.
But it could be a trivial thing like not having all device nodes
on the rescue media. In particular /dev/hda16.

Regards,
Heinz    -- The LVM Guy --

> 
> 
> > > > > - Anders
> > > > >
> > > > > > Hello
> > > > > >
> > > > > > I am trying to mount my LVM partitions manually after booting into
> > > > > > a rescue system from floppies. I am not able to do this. During a
> > > > > > normal boot from my harddisk LVM works just fine. Notice the output
> > > > > > from pvscan and lvmdiskscan below. I ran those commands first from
> > > > > > the rescue system and then from a normally booted system. In the
> > > > > > rescue system /dev/hda16 is not there. I don't know if that is
> > > > > > related to my problem, though.
> > > > > >
> > > > > > Here are the details of what I am doing:
> > > > > >
> > > > > > Setup:
> > > > > >
> > > > > > boot partition      /dev/hda2 type Linux with Ext2
> > > >
> > > > <SNIP>
> > > >
> > > > > > lvmdiskscan -- 28 partitions
> > > > > > lvmdiskscan -- 20 LVM physical volume partitions
> > > > > >
> > > > > >
> > > > > > _______________________________________________
> > > > > > linux-lvm mailing list
> > > > > > linux-lvm@sistina.com
> > > > > > http://lists.sistina.com/mailman/listinfo/linux-lvm
> > > > > > read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> > > > >
> > > > > _______________________________________________
> > > > > linux-lvm mailing list
> > > > > linux-lvm@sistina.com
> > > > > http://lists.sistina.com/mailman/listinfo/linux-lvm
> > > > > read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> >
> > *** Software bugs are stupid.
> >     Nevertheless it needs not so stupid people to solve them ***
> >
> > =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
> >-=-
> >
> > Heinz Mauelshagen                                 Sistina Software Inc.
> > Senior Consultant/Developer                       Am Sonnenhang 11
> >                                                   56242 Marienrachdorf
> >                                                   Germany
> > Mauelshagen@Sistina.com                           +49 2626 141200
> >                                                        FAX 924446
> > =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
> >-=-
> >
> > _______________________________________________
> > linux-lvm mailing list
> > linux-lvm@sistina.com
> > http://lists.sistina.com/mailman/listinfo/linux-lvm
> > read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
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
