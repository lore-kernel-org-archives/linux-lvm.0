Message-ID: <3CFC24C4.EC91EE54@skyinet.net>
From: "jeany c. vanzuela" <jaws@skyinet.net>
MIME-Version: 1.0
Subject: Re: [linux-lvm] how to increase the size of allocated PE
References: <3CFBD09D.542EAE62@skyinet.net> <20020603115209.A14161@sistina.com>
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
Date: Mon Jun  3 05:14:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

"Heinz J . Mauelshagen" wrote:

> If you want to extende the size of a logical volume, see lvextend(8).
>
> Growing the size of physical/logical extents is not supported.
> Set this property when you create a volume group (see vgcreate(8), option -s).
>

Heinz,

how many times can I invoke the e2fsadm -L+<size>M /dev/vgname/lvname ?


>
> On Mon, Jun 03, 2002 at 12:25:02PM -0800, root wrote:
> > hi all,
> >
> > i'm new to this list and with linux LVM. I would like to know how to
> > increase the size of allocated PE for a given logical volume.
> >
> > thanks.
> >
> >
> > _______________________________________________
> > linux-lvm mailing list
> > linux-lvm@sistina.com
> > http://lists.sistina.com/mailman/listinfo/linux-lvm
> > read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
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
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
