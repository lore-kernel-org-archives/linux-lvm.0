From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] *** ANNOUNCEMENT *** LVM 1.0.3 available at
    www.sistina.com
Message-Id: <20020220010739.A4923@sistina.com>
References: <20020219205054.A3751@sistina.com>
    <20020219121453.B3786@connectlive.com>
MIME-Version: 1.0
In-Reply-To: <20020219121453.B3786@connectlive.com>; from
    tim@connectlive.com on Tue, Feb 19, 2002 at 12:14:53PM -0800
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
Date: Tue Feb 19 18:11:03 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Tue, Feb 19, 2002 at 12:14:53PM -0800, tim@connectlive.com wrote:
> 
> Awesome!  The new vgchange behavior is precisely what I needed to save
> my ass from the apocalyptic corruption problems between bad-VM and
> snapshots.. very happy to see this in release.

Happy to hear that it helps someone in these hard VM days ;-)

Kind reagrds,
Heinz    -- The LVM Guy --

> 
> 
> Quoth Heinz J . Mauelshagen:
> > 
> > *** ANNOUNCEMENT *** LVM 1.0.3 available at www.sistina.com
> > 
> > Hi all,
> > 
> > LVM 1.0.3 supports both version 1 and 2 of the metadata.
> > 
> > There's *no* need to run any metadata update tools.
> > 
> > A tarball is available now at
> > 
> >    <http://www.sistina.com/>
> > 
> > for download (Follow the "LVM 1.0" link).
> > 
> > 
> > Changes to LVM 1.0.2 include:
> > 
> > o vgcfgrestore supports restores to different sized physical volumes;
> >   useful in cases where a replacement disk is a little bit to large or
> >   for test purposes; option enhancements; physical volume UUID restore fix
> > 
> > o vgchange removes failed snapshots and activates the volume group rather
> >   than failing on it. Optionally forces device number changes in cases
> >   where it finds clashes so that the volume group can be activated
> > 
> > o vgexport exports volume groups not showing up in /etc/lvmtab*
> > 
> > o vgscan can drop all snapshots or those in a particular volume group now
> > 
> > o "pvmove -i" ignores read errors while moving and supports moves in
> >   inactive volume groups
> > 
> > o > 1 TB fixes for physical and logical volumes (2 TB limitation
> >   on 2.4 persists)
> > 
> > o more...
> > 
> > 
> > See the CHANGELOG file contained in the tarball for further information.
> > 
> > Feed back LVM related information to <linux-lvm@sistina.com>.
> > 
> > Thanks a lot for your support of LVM.
> > 
> > 
> > _______________________________________________
> > linux-lvm mailing list
> > linux-lvm@sistina.com
> > http://lists.sistina.com/mailman/listinfo/linux-lvm
> > read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
> 
> -- 
>      Don't hate me because I'm beautiful.
>      Hate me because I run your IT department.
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html

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
