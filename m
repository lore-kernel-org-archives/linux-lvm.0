Return-Path: <claudio@conectiva.com>
Date: Sun, 17 Dec 2000 08:49:35 -0200 (BRST)
From: Claudio Matsuoka <claudio@conectiva.com>
Subject: Re: [linux-lvm] Debian packaging
In-Reply-To: <20001217030021.A29319@vestdata.no>
Message-ID: <Pine.LNX.4.21.0012170847040.16662-100000@scuzzlebutt.helllabs>
MIME-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
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
Content-Type: TEXT/PLAIN; charset="iso-8859-1"
To: linux-lvm@sistina.com
Cc: Tamas Gergely <dice@mfa.kfki.hu>

On Sun, 17 Dec 2000, Ragnar Kj=F8rstad wrote:

> > I was thinking that perhaps what I should do is have /sbin/lvm-ver and=
=20
> > /lib/lvm-ver directories where "ver" is the version of LVM in question.=
  Then=20
> > at boot time there is a script that determines the version of LVM in th=
e=20
> > kernel and creates sym-links from /sbin and /lib to the correct directo=
ries. =20
> > This is REALLY ugly, but it enables a user to cleanly have a machine th=
at can=20
> > be booted on 2.2 or 2.4 kernel and just work each time you boot it.
>
> What about putting shell-scripts in /sbin, and have theese scripts
> execute the real programs?


Placing a single script (symlinked from several names) that detects the
protocol version and executes $0 in /lib/lvm-ver could make maintenance
easier.
