Message-ID: <3D9315CF.B2BCFC13@cti-paysloire.cnamts.fr>
From: LEBRETON Philippe <philippe.lebreton@cti-paysloire.cnamts.fr>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Debian 3.0, kernel 2.4.18 booting with a LVM root fs LVM 
 doesn't work
References: <3D92DF4A.1625D3C4@cti-paysloire.cnamts.fr> <20020926125048.A2836@sistina.com> <3D92EFE8.CE5CEBE8@cti-paysloire.cnamts.fr> <20020926134718.A3083@sistina.com>
Content-Transfer-Encoding: 7bit
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
Date: Thu Sep 26 09:36:09 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

"Heinz J . Mauelshagen" wrote:

> On Thu, Sep 26, 2002 at 01:30:48PM +0200, LEBRETON Philippe wrote:
> > "Heinz J . Mauelshagen" wrote:
> >
> > > On Thu, Sep 26, 2002 at 12:19:54PM +0200, LEBRETON Philippe wrote:
> > > > hello,
> > > >
> > > > My configuration is :
> > > >
> <SNIP>
> >
> > yes my initrd is read-only but hox i can made initrd read-write?
>
> boot parameter "rw" or "read-write" in lilo.conf.
>
> >
> >
> > _______________________________________________
> > linux-lvm mailing list
> > linux-lvm@sistina.com
> > http://lists.sistina.com/mailman/listinfo/linux-lvm
> > read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
> --
>
> Regards,
> Heinz    -- The LVM Guy --
>
> *** Software bugs are stupid.
>     Nevertheless it needs not so stupid people to solve them ***
>
> =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
>
> Heinz Mauelshagen                                 Sistina Software Inc.
> Senior Consultant/Developer                       Am Sonnenhang 11
>                                                   56242 Marienrachdorf
>                                                   Germany
> Mauelshagen@Sistina.com                           +49 2626 141200
>                                                        FAX 924446
> =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

i change my lilo.conf :
image=/boot/vmlinuz-2.2.18-smp
        label=LinuxLVM
        initrd=/boot/initrd-lvm.img
        root=/dev/rootvg/root
        read-write
        ramdisk=8192

The problem is the same.
The read-write parameter is for /dev/rootvg/root not for the RAM Disk?
And mount, vgscan can't to the RAM Disk.
I can't mount my root filesystem because LVM is not initialize (vgscan,
vgchange
not working in RAM Disk)




_______________________________________________
linux-lvm mailing list
linux-lvm@sistina.com
http://lists.sistina.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
