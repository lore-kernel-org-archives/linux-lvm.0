From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] LVM 1.0.1 to LVM2 upgrade path
Message-ID: <20030207152340.A27442@sistina.com>
References: <20030207042425.GF22795@panoptic.com>
Mime-Version: 1.0
In-Reply-To: <20030207042425.GF22795@panoptic.com>; from dossy@panoptic.com on Thu, Feb 06, 2003 at 11:24:25PM -0500
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
Date: Fri Feb  7 08:27:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Thu, Feb 06, 2003 at 11:24:25PM -0500, Dossy wrote:
> Everyone,
> 
> I'm currently running on Linux 2.4.20 with LVM 1.0.1 26/11/2001 ... yes,
> it's outdated, but this is a production system and LVM has been
> (seemingly) stable without any issues.
> 
> I'm figuring I should consider upgrading to LVM2, but I don't want to
> just go "trying it" -- is there a specific upgrade path I have to take?
> Is LVM2 backward compatible with LVM1?  Are there any "gotchas" and are
> they documented somewhere?

If this is production, you want to upgrade to LVM 1.0.6 because LVM2
is in beta still.

You should give LVM2 a try on some test system please.

It supports the LVM1 metadata (IOW: you can install it and use your
volume groups created with LVM1). The only major feature missing in LVM2 is
'pvmove' which we are working on right now.

> 
> Any pointers to documentation would be appreciated.  Meanwhile, I'm busy
> Googling ...

LVM2 is command line compatible with LVM1. The new features are (mostly)
in the man pages comming with the LVN2 source distro. You need to get
device-mapper from our website as well (see the usual README/INSTALL files).

> 
> -- Dossy
> 
> -- 
> Dossy Shiobara                       mail: dossy@panoptic.com 
> Panoptic Computer Network             web: http://www.panoptic.com/ 
>   "He realized the fastest way to change is to laugh at your own
>     folly -- then you can let go and quickly move on." (p. 70)
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
