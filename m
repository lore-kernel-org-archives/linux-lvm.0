Return-Path: <joe@66bassett.freeserve.co.uk>
Date: Fri, 2 Feb 2001 16:56:42 +0000
From: Joe Thornber <joe@66bassett.freeserve.co.uk>
Subject: Re: [linux-lvm] with 2.4.1, should I use beta2 or beta3 lvm-tools?
Message-ID: <20010202165642.A1955@66bassett.freeserve.co.uk>
References: <20010202103049.B872@66bassett.freeserve.co.uk> <Pine.LNX.4.30.0102021124370.2352-100000@tweetie.comstar.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <Pine.LNX.4.30.0102021124370.2352-100000@tweetie.comstar.net>; from gregm@comstar.net on Fri, Feb 02, 2001 at 11:25:33AM -0500
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
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@sistina.com

On Fri, Feb 02, 2001 at 11:25:33AM -0500, Gregory McLean wrote:
> On Fri, 2 Feb 2001, Joe Thornber wrote:
>=20
> > On Fri, Feb 02, 2001 at 11:15:25AM +0100, H=EF=BF=BDkan Jettingstad wro=
te:
> > > Hello!
> > >
> > > Just a quick question, kernel 2.4.1 contains lvm 0.9.1beta2, so I'm
> > > wondering do I have to use the beta2 lvm-tools or can I use the beta3
> > > lvm-tools with that kernel, or do I have to wait for a beta3 patch fo=
r the
> > > 2.4.1 kernel?
> >
> > Please use the latest code if you can.  The LVM tar balls will build a
> > patch for your kernel.  If you don't want to patch your kernel
>=20
> That won't apply cleanly.. I got lots of conflicts that I didn't have the
> time to sort properly.

2.4.1 hadn't been released when we made the beta3 tarball.  If you
want to make a beta3 patch for the kernel create an empty file call
PATCHES/fragments-2.4.1 (2.4.1 needs no extra fragments) then run
PATCHES/make.  That should remove all the conflicts.

Or checkout the LVM_0-9-patches branch of CVS.

- Joe
