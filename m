Return-Path: <russell@coker.com.au>
From: Russell Coker <bofh@coker.com.au>
Subject: Re: [linux-lvm] Apparent performance degradation for each PV with striping
Date: Thu, 22 Mar 2001 09:54:11 +0100
References: <01C0B04F.5EFB3400.smdenton@bellsouth.net> <3AB60D44.3036CD9C@wrkhors.com>
In-Reply-To: <3AB60D44.3036CD9C@wrkhors.com>
MIME-Version: 1.0
Message-Id: <0103220954110L.00851@lyta>
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
To: linux-lvm@sistina.com, Steven Lembark <lembark@wrkhors.com>

On Monday 19 March 2001 14:44, Steven Lembark wrote:
> Escalade is a nice idea, but still runs afoul of the interrupt
> & bus design of PC's.  for high-i/o applications "PC" hardware
> doesn't work all that well.  main problem here is delivering the
> raw datat to an Esc. controller through the existing PC.  the
> add'l cpu load in this case comes from the bottom-half of drivers
> on heavily loaded cards that spend too much time waiting for
> access to the shared card.
>
> these are a distinct improvement over stock IDE or software RAID
> but don't expect them to suddenly turn your PC into a SparcServer
> or K400.

What is a K400?

Every test that I run shows SPARC machines running slower than desktop=20
machines with IA32 CPUs.  My Athlon-800 machine has more memory bandwidth=
=20
than an E450 according to the industry standard "streams" benchmark and=20
according to a little memory benchmark I wrote.  Also a single IBM 46G AT=
A=20
drive in my Athlon outperforms A1000 arrays in E450 class hardware.

> note on the benchmark:  you can push the CPU to 100% w/ the dd
> of=3D/dev/null

What type of hard drive and what type of CPU?

In terms of using CPU power through IO my record was >80% of the power of=
 my=20
Athlon800 when doing "cat /dev/zero > file", then I fixed cat to use 4K=20
buffers instead of 1K and it used significantly less CPU power.

I suspect that a large part of this was due to inefficiencies in ReiserFS=
 in=20
this regard.  It's still on my to-do list to do some more comprehensive t=
ests=20
of this issue with other file systems and with raw devices.

--=20
http://www.coker.com.au/bonnie++/     Bonnie++ hard drive benchmark
http://www.coker.com.au/postal/       Postal SMTP/POP benchmark
http://www.coker.com.au/projects.html Projects I am working on
http://www.coker.com.au/~russell/     My home page
