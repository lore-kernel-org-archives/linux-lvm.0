Return-Path: <riel@conectiva.com.br>
Date: Fri, 2 Feb 2001 11:53:13 -0200 (BRDT)
From: Rik van Riel <riel@conectiva.com.br>
Subject: Re: [linux-lvm] with 2.4.1, should I use beta2 or beta3 lvm-tools?
In-Reply-To: <20010202103049.B872@66bassett.freeserve.co.uk>
Message-ID: <Pine.LNX.4.21.0102021151370.1321-100000@duckman.distro.conectiva>
MIME-Version: 1.0
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
Content-Type: TEXT/PLAIN; charset="iso-8859-1"
To: linux-lvm@sistina.com

On Fri, 2 Feb 2001, Joe Thornber wrote:
> On Fri, Feb 02, 2001 at 11:15:25AM +0100, H=EF=BF=BDkan Jettingstad wrote:
> >=20
> > Just a quick question, kernel 2.4.1 contains lvm 0.9.1beta2, so I'm
> > wondering do I have to use the beta2 lvm-tools or can I use the beta3
> > lvm-tools with that kernel, or do I have to wait for a beta3 patch for =
the
> > 2.4.1 kernel?
>=20
> Please use the latest code if you can.  The LVM tar balls will
> build a patch for your kernel.  If you don't want to patch your
> kernel yourself then use the latest tools with 2.4.1, but you
> should probably refrain from using snapshots.  We hope to make
> another release at the beginning of next week (probably beta4).

Who cares ?

As far as the majority of the LVM users are concerned,
new releases are shipped by Alan and Linus.

I guess having a separate LVM tree for development is
good, but it might be better to just do maintenance on
the tree which is actually being used - ie. Linus'.

regards,

Rik
--
Linux MM bugzilla: http://linux-mm.org/bugzilla.shtml

Virtual memory is like a game you can't win;
However, without VM there's truly nothing to lose...

		http://www.surriel.com/
http://www.conectiva.com/	http://distro.conectiva.com/
