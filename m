Return-Path: <russell@coker.com.au>
From: Russell Coker <russell@coker.com.au>
Subject: Re: [linux-lvm] LILO configuration for LVM "boot" filesystem
Date: Fri, 8 Jun 2001 04:27:54 +0200
References: <20010605210727.C1870@pc.ilinx> <20010607104301.A29848@stocks.pillory.com> <20010607182636.H3232@jensbenecke.de>
In-Reply-To: <20010607182636.H3232@jensbenecke.de>
MIME-Version: 1.0
Message-Id: <01060804275405.26916@lyta>
Content-Transfer-Encoding: quoted-printable
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
To: linux-lvm@sistina.com

On Thursday 07 June 2001 18:26, Jens Benecke wrote:
> >     After installation, do:
> > cd / ; mv tmp tmp.old ; ln -s /var/tmp .  reboot rm -rf /tmp.old
> >     Now you don't have to worry about root filling up at all...
>
> er... I wouldn't do that (at least not on a Debian system).
>
> Usually /var/tmp is _assumed_ to be only root-writeable, so all sorts
> of daemons and programs running as root put their stuff there. This
> could open a number of security holes, when /var/tmp doesn't get
> treated as carefully as /tmp.

I suggest using /var/tmp/tmp on a Debian system if you want to do this. =20
That allows scripts that clean up /tmp to not clean /var/tmp (which may=20
have things you want to last longer).

On Thursday 07 June 2001 23:08, Michael Tokarev wrote:
> Another thing to consider if you run 2.4 kernel -- mount tmpfs
> on /tmp (and give some reasonable size restrictions).   This way,
> /tmp works much faster, does not need to be cleaned on boot, and
> will not eat root's space.  You should have reasonable swap space
> it you plan to use it heavily.  Works very well here.

I tried that on 2.4.4 and I couldn't run the KDE.  It seems that tmpfs=20
doesn't do all the things that a real FS does (yet).

On Thursday 07 June 2001 23:18, Steven Lembark wrote:
> > cd / ; mv tmp tmp.old ; ln -s /var/tmp .
> > reboot
> > rm -rf /tmp.old
> >
> >     Now you don't have to worry about root filling up at all...
>
> until you have to boot in single user w/o /var mounted and
> the whole sysystem fries for lack of /tmp :-)

Hasn't caused any great problems for me.  Although on systems with=20
separate file systems for /var and /var/tmp it means that I need to run=20
mount three times before I can edit a file in the root FS.


Another thing that no-one seems to be considering is the "--bind" option=20
to recent versions of mount (only works on 2.4 kernels).


--=20
http://www.coker.com.au/bonnie++/     Bonnie++ hard drive benchmark
http://www.coker.com.au/postal/       Postal SMTP/POP benchmark
http://www.coker.com.au/projects.html Projects I am working on
http://www.coker.com.au/~russell/     My home page
