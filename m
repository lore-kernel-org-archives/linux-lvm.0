From: "Steve Wray" <steve.wray@the.net.nz>
Subject: RE: [linux-lvm] Mandrake 8.1 and LVM
Message-ID: <NBBBKLKHMJHIJLHOGAOJIEDHJCAA.steve.wray@the.net.nz>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <Pine.LNX.4.33.0111291608480.4437-100000@lx1.daboard.com>
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
Date: Thu Nov 29 16:06:01 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

> From: linux-lvm-admin@sistina.com [mailto:linux-lvm-admin@sistina.com]On
> Behalf Of mitch@mdmiller.com
>
> Sure ... but doesn't /var typically live on a partition of it's own,
> anyway?  Say, is there a HOWTO or other document which describes
> partitioning considerations and/or the standard directory structure?
> Sorry for all the questions, but I've been brain numbed by a WinTel
> world!!

Absolutely, var lives by itself because var being filled up
can be part of a denial of service attack... As I recall,
its possible to wind up with an unbootable system if the root
filesystem becomes full. So var and tmp ought to live
on their own partitions or logical volumes.

>
> -- Mitch
>
>
> On Thu, 29 Nov 2001, Sarwer Zafiruddin wrote:
>
> > Expanding / is useful when you need to upgrade the system and
> the newer OS
> > needs more space to upgrade.  My primary concern is things
> under the /var
> > filesystem, where things grow constantly like logs (which I like to keep
> > atleast 6months of rotated logs), possibly more space for
> > /var/spool/mqueue (for mail server that have increase of mail traffic),
> > and /var/spool/mail (for those hog user who refuse to clean up
> their INBOX
> > ;-) ).
> >
> > Sarwer
> >
> > > > (b) dynamically expand the amount of space available to the root
> > partition.
> > >
> > > Pardon me for being a neophyte here, but what else goes on the root
> > > partition which takes any significant or dynamic amount of
> space?  Isn't
> > > the root just a place to put all the top level directories,
> the contents
> > > of which are typically all on another partition anyway?
> > >
> > > -- Mitch
> >
> >
>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
>
>
