From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Painless upgrade to lvm2?
Message-ID: <20021125151635.A25023@sistina.com>
References: <1038231397.21369.23.camel@defiant.sonsofthunder.yi.org>
Mime-Version: 1.0
In-Reply-To: <1038231397.21369.23.camel@defiant.sonsofthunder.yi.org>; from storm@tux.org on Mon, Nov 25, 2002 at 08:36:37AM -0500
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
Date: Mon Nov 25 08:23:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Bradley,

get the LVM2 tools from

	ftp://ftp.sistina.com/pub/LVM2/tools/

the device-mapper software from

	ftp://ftp.sistina.com/pub/LVM2/device-mapper.

You want to get recent device-mapper kernel patches from 

	http://people.sistina.com/~thornber/patches/2.4-stable/

as well.


Unpack the tarballs giving you LVM2*/, device-mapper*/ and 2.4.19*/
subdirectories.

Patch a vanilla kernel with the device-mapper patches in the 2-4-19* subdir
(works for 2.4.20-rc as well), activate it in the kernel configuration and
generate the kernel.

Generate and install the device-mapper software (library is needed to run
the LVM2 tools).

Generate and install the LVM2 tools.

You can install those in a different path in order to be able to backup
to LVM1 (just in case ;)

LVM2 is format compatible to the LVM1 ondisk metadata format.
It only misses pvmove which we want to add ASAP before we go for
the final release.

If you want to give this a try, feel free to contact the LVM team on IRC on
channel #lvm at irc.openprojects.org for interactive aid.

Regards,
Heinz    -- The LVM Guy --



On Mon, Nov 25, 2002 at 08:36:37AM -0500, Bradley Alexander wrote:
> I'm running lvm-1.0.6 on a Debian/sid system, and was wondering what
> would be the best upgrade path? Install from debs? From source? Is there
> some kind of howto for making this transition?
> 
> Thanks,
> -- 
> --Brad
> ============================================================================
> Bradley M. Alexander                |
> Debian Developer, Security Engineer |   storm [at] tux.org
> Debian/GNU Linux Developer          |   storm [at] debian.org
> ============================================================================
> Key fingerprints:
> DSA 0x54434E65: 37F6 BCA6 621D 920C E02E  E3C8 73B2 C019 5443 4E65
> RSA 0xC3BCBA91: 3F 0E 26 C1 90 14 AD 0A  C8 9C F0 93 75 A0 01 34
> ============================================================================
> Stay out of clouds. The silver lining everyone keeps talking
> about might be another airplane going in the opposite direction.
> Reliable sources also report that mountains have been known to hide
> out in clouds.
> 					--Rules of the Air, #13
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
