From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Painless upgrade to lvm2?
Message-ID: <20021204130227.B29881@sistina.com>
References: <1038231397.21369.23.camel@defiant.sonsofthunder.yi.org> <02bb01c29b04$31556650$6a01a8c0@bmoon>
Mime-Version: 1.0
In-Reply-To: <02bb01c29b04$31556650$6a01a8c0@bmoon>; from bo@anthologysolutions.com on Tue, Dec 03, 2002 at 11:43:02AM -0800
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
Date: Wed Dec  4 06:10:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Tue, Dec 03, 2002 at 11:43:02AM -0800, bmoon wrote:
> Hello,
> 
> I followed the instruction but I am facing the following cimpile error.
> Would you provide me any help on this error?
> 
> ---------------
> make[1]: Entering directory `/usr/src/device-mapper.0.96.07/lib'
> gcc -c -Iioctl -I. -I../include -I/usr/src/linux/include -Wall -fPIC -g -fno
> -omit-frame-pointer ioctl/libdevmapper.c -o ioctl/libdevmapper.o
> gcc -c -Iioctl -I. -I../include -I/usr/src/linux/include -Wall -fPIC -g -fno
> -omit-frame-pointer libdm-common.c -o libdm-common.o
> gcc -shared -Wl,-soname,libdevmapper.so.0.96 \
> -Wl,--version-script,.export.sym ioctl/libdevmapper.o libdm-common.o -o
> ioctl/libdevmapper.so
> /usr/bin/ld:.export.sym:1: parse error in VERSION script

Please see Alasdairs answer.

> collect2: ld returned 1 exit status
> make[1]: *** [ioctl/libdevmapper.so] Error 1
> make[1]: Leaving directory `/usr/src/device-mapper.0.96.07/lib'
> make: *** [lib] Error 2
> --------------------------
> 
> Additional question, If I use linux2.4.20 then Are there any patches for it
> or we do not need
> any patch for LVM2 or device mapper?

Use http://people.sistina.com/~thornber/patches/2.4-stable/2.4.20-dm-1.tar.bz2

Regards,
Heinz    -- The LVM Guy --


> 
> Thanks in advance,
> 
> Bo
> 
> ----- Original Message -----
> From: "Bradley Alexander" <storm@tux.org>
> To: <linux-lvm@sistina.com>
> Sent: Monday, November 25, 2002 5:36 AM
> Subject: [linux-lvm] Painless upgrade to lvm2?
> 
> 
> > I'm running lvm-1.0.6 on a Debian/sid system, and was wondering what
> > would be the best upgrade path? Install from debs? From source? Is there
> > some kind of howto for making this transition?
> >
> > Thanks,
> > --
> > --Brad
> >
> ============================================================================
> > Bradley M. Alexander                |
> > Debian Developer, Security Engineer |   storm [at] tux.org
> > Debian/GNU Linux Developer          |   storm [at] debian.org
> >
> ============================================================================
> > Key fingerprints:
> > DSA 0x54434E65: 37F6 BCA6 621D 920C E02E  E3C8 73B2 C019 5443 4E65
> > RSA 0xC3BCBA91: 3F 0E 26 C1 90 14 AD 0A  C8 9C F0 93 75 A0 01 34
> >
> ============================================================================
> > Stay out of clouds. The silver lining everyone keeps talking
> > about might be another airplane going in the opposite direction.
> > Reliable sources also report that mountains have been known to hide
> > out in clouds.
> > --Rules of the Air, #13
> >
> >
> > _______________________________________________
> > linux-lvm mailing list
> > linux-lvm@sistina.com
> > http://lists.sistina.com/mailman/listinfo/linux-lvm
> > read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> >
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
