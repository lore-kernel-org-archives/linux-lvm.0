Return-Path: <adilger@turbolinux.com>
From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200012171800.eBHI0J129132@webber.adilger.net>
Subject: Re: [linux-lvm] Debian packaging
In-Reply-To: <00121417221738.00826@lyta> "from Russell Coker at Dec 14, 2000
 05:22:17 pm"
Date: Sun, 17 Dec 2000 11:00:18 -0700 (MST)
MIME-Version: 1.0
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com
Cc: Tamas Gergely <dice@mfa.kfki.hu>, Linux-LVM@sistina.com

Russel Coker writes:
> >I mean, it would be better to place the utilities into /sbin instead of
> >/usr/sbin.
> 
> Depends.  One thing I would like to do is go through the utilities and put 
> things that are needed to kickstart a system or to recover a hosed system 
> into /sbin .  Then things that aren't so critical to the boot process (lvmsar 
> springs to mind) belong in /usr/sbin .

As with other people, I think it would be best to place the LVM user utils
into /sbin/lvm-<IOP version>.  However, I think it is NOT a good idea to
put wrapper scripts in /sbin.  Instead, simply set the path at boot time
(/etc/rc.d/rc.sysinit, and for root) to include the correct directory if
it exists.

Basically, I'm going to write a 5 line program that only gets the LVM IO
protocol version and spits it to stdout, ala:

IOP=`lvmiopversion`	# only this command will be directly in /sbin

[ "$IOP" ] && PATH=/sbin/lvm-$IOP:$PATH

so if the version-specific LVM user tools directory doesn't exist, we will
still look for old tools in /sbin.  Never reference LVM tools by absolute path.
It would be nice if the stock LVM configuration also started doing this,
but it will be a minor change to the Makefile.

> Yes.  My package will differ quite a bit from the existing Debian package.  
> Also I plan to make everything use shared libraries.  ls, cp, and mv are not 
> statically linked so I don't think that there is any need for statically 
> linked lvm utilities.  My lvm package will be considerably smaller than the 
> current one (which is necessary for boot support).

Probably not a bad idea.

> One other thing, it seems that the protocol is changing often.  How should 
> this be managed in Debian packages?  I had thought of doing lvm22 and lvm24 
> as package names for the 2.2.x and 2.4.x kernels, but now I get the 
> impression that the interfaces will change between those series.  Also 0.8.1, 
> 0.9, and 0.8i all seem to have different protocol versions.

You should name packages by the IOP version.  It will be a bit of a challenge
as LVM 0.8i was IOP 5, LVM 0.8final was IOP 6, and LVM 0.9 is IOP 10.  Maybe
Heinz can number future LVM releases by their IOP version?

> I was thinking that perhaps what I should do is have /sbin/lvm-ver and 
> /lib/lvm-ver directories where "ver" is the version of LVM in question.
> Then at boot time there is a script that determines the version of LVM in the 
> kernel and creates sym-links from /sbin and /lib to the correct directories.  

Think PATH - this is really easy, and shells already support it.  No more
work to be done, and it's not ugly.  The IOP version will probably never
change within a boot (unless LVM is a module and it gets upgraded without
upgrading the kernel - unlikely).

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
