From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] vgcreate on md: vgcreate -- ERROR "pv_read(): read" reading physical volumes
Message-ID: <20021216165342.B19655@sistina.com>
References: <200212120801.48777.defranco@cup.hp.com> <20021212162759.36500.qmail@web40710.mail.yahoo.com>
Mime-Version: 1.0
In-Reply-To: <20021212162759.36500.qmail@web40710.mail.yahoo.com>; from udovdh@yahoo.com on Thu, Dec 12, 2002 at 08:27:59AM -0800
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
Date: Mon Dec 16 10:03:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Thu, Dec 12, 2002 at 08:27:59AM -0800, udo wrote:
> Hello,
> 
> --- John DeFranco <defranco@cup.hp.com> wrote:
> > Did you pvcreate the /dev/md2 first? Didn't indicate
> > that below.
> 
> I didn't write that but I did, following the howto
> from http://tldp.org/HOWTO/LVM-HOWTO.
> I couldn't solve the problem so I started a wipe of
> /dev/md2 to be sure the disk was clear. (this took
> quite some time on this slow machine)
> I had to wait for that to finish so I could reboot to
> single user (init=/bin/sh) again.
> Then things worked!
> Pfew...... ;-)

A "dd if=/dev/zero of=/dev/md2 bs=1k count=1" could have done it as well :)

> 
> Thanks,
> Udo
> 
> __________________________________________________
> Do you Yahoo!?
> Yahoo! Mail Plus - Powerful. Affordable. Sign up now.
> http://mailplus.yahoo.com
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

-- 

Regards,
Heinz    -- The LVM Guy --

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
