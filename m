From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] how to start running LVM under fedora test and 2.6 kernel?
Message-ID: <20031027160240.L848@sistina.com>
References: <Pine.LNX.4.44.0310270803020.9909-100000@localhost.localdomain>
Mime-Version: 1.0
In-Reply-To: <Pine.LNX.4.44.0310270803020.9909-100000@localhost.localdomain>; from rpjday@mindspring.com on Mon, Oct 27, 2003 at 08:06:47AM -0500
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
Date: Mon Oct 27 09:02:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Mon, Oct 27, 2003 at 08:06:47AM -0500, Robert P. J. Day wrote:
> 
>   as an admitted novice here, what is the proper recipe for 
> starting to use LVM (under RH's new fedora core test) with the
> 2.6.0 kernel?

Get the LVM2 tools from www.sistina.com and compile/install them
in a different directory (see configure options) if you want to co-install
them with the LVM1 tools.

> 
>   if i do a stock install, that would first of all be using a
> 2.4 kernel and (IIRC) the previous version 1 of LVM, no?

Yes.

> so
> it's easy enough to install and get *that* configuration working.
> but how do i move up?

Boot 2.6 and use the LVM2 tools in the directory you selected
when you configured them.

> 
>   it's easy enough to build and boot under a 2.6 kernel, but
> now i have some LVM volume groups that i'd like to convert to
> LVM 2.  can i do that?

See LVM2's vgconvert manual.
LVM2 is able to handle LVM1 formated voplume groups in case you want
to be able to swictch back to 2.4+LVM1. Of course you can get device-mapper
patches for 2.4 from our site and use device-mapper+LVM2 on 2.4 as well.

> 
>   am i making any sense?  it seems pretty clear that i can't
> do all this in one step.  or can i, and i just haven't noticed?

At least one additional step is necessary (get the LVM2 tools running on 2.6).

> 
> rday
> 
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
