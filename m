From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] is devfs required?
Message-Id: <20020222102259.A16552@sistina.com>
References: <20020221143602.F328@majestic.ukshells.co.uk>
MIME-Version: 1.0
In-Reply-To: <20020221143602.F328@majestic.ukshells.co.uk>; from
    linux.lvm@codex.net on Thu, Feb 21, 2002 at 02:36:02PM +0000
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
Date: Fri Feb 22 03:25:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Thu, Feb 21, 2002 at 02:36:02PM +0000, Vincent AE Scott wrote:
> Hi there,
> i've been tinkering with LVM, but i'm having some issues with it, and i
> was wondering if anyone here could help shed some light for me?
> 
> i'm using LVM on a 2.4.17-19mdk kernel patched up to 1.0.3
> it *appears* that when i boot up without devfs support, i frequently
> cant create/extened/mount filesystems.  but when i boot up with devfs
> support it seems to work.
> 
> is devfs required to use LVM?

No, but in case you use devfs, you need to go with the long devfs
device pathes.

> 
> without it, ive seen lvcreate SEGV when attempting to create a new
> volume.  

Hm.
Seems to be more of a tool bug.
Which tool version are you using?
In case of 0.9.1 Beta something, you should update to 1.0.3, which we
released last Monday.

> 
> or are there any known problems with using LVM on an SMP host?  i cant
> think of anything else that might be causing these strange problems.
> 
> oh, and FYI, it was setup up using 1.0.1-rc4ish

That should be fine but as said, you could still run older tools
which might be causing the SEGV.

> 
> TIA,
> -vince
> 
> -- 
> PGP key:  http://codex.net/pgp/pgp.asc
> 
>  Smash forehead on keyboard to continue... 
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html

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
