Return-Path: <russell@coker.com.au>
From: Russell Coker <bofh@coker.com.au>
Subject: Re: [linux-lvm] Apparent performance degradation for each PV with striping
Date: Thu, 22 Mar 2001 09:55:44 +0100
References: <3AB59501.FF6ED9F3@dataventures.com> <20010318232012.A1169@omnifarious.mn.org>
In-Reply-To: <20010318232012.A1169@omnifarious.mn.org>
MIME-Version: 1.0
Message-Id: <0103220955440M.00851@lyta>
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
To: linux-lvm@sistina.com, "Eric M. Hopper" <hopper@omnifarious.mn.org>

On Monday 19 March 2001 06:20, Eric M. Hopper wrote:
> =09Have you played with hdparm to try to tune the way the kernel
> talks to your IDE drives?
>
> =09That may be the reason for being CPU bound.  The kernel tends to
> default to the slowest possible method because there are a lot of bad
> IDE controllers and drives out there that will trash your data if you
> try to talk to them in a way they aren't expecting.
>
> Have fun (if at all possible),

The 2.4.x kernels will turn on DMA and multi-mode at boot time if you cho=
ose=20
the appropriate options in the kernel config.  I generally compile my ker=
nels=20
that way so they use the available features in the hardware without the n=
eed=20
to bother with hdparm.

--=20
http://www.coker.com.au/bonnie++/     Bonnie++ hard drive benchmark
http://www.coker.com.au/postal/       Postal SMTP/POP benchmark
http://www.coker.com.au/projects.html Projects I am working on
http://www.coker.com.au/~russell/     My home page
