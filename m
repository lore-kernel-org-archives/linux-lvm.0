Return-Path: <ph.l@libertysurf.fr>
Message-ID: <3A5E0A71.2C56628B@libertysurf.fr>
Date: Thu, 11 Jan 2001 18:33:05 -0100
From: Philippe Lefevre <ph.l@libertysurf.fr>
MIME-Version: 1.0
Subject: Re: [linux-lvm] PB: undefined reference to memset
References: <3A5775ED.32380632@libertysurf.fr> <20010106223732.A1686@66bassett.freeserve.co.uk>
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
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@sistina.com, joe@66bassett.freeserve.co.uk

Joe Thornber a =E9crit :
> =

> Hi,
> =

> I just tried it and it worked fine.
> =

> Make sure you start with a vanilla kernel 2.2.17
> patch with rawio
> patch with lvm
> config, build etc.
> =

> In my haste I forgot to switch on the lvm procfs output option in make
> config.  This did failed to compile (another bug for the list), but
> it wasn't your error.
> =

> - Joe
> =

> > Changing my system release, I patched my kernel 2.2.17 with
> > lvm-0.9-2.2.17-stock.patch and linux-2.2.17-rawio.patch
> > Apparently, there was no errors.
> >
> > Then compiling my new kernel, I get this message:
> >
> > drivers/block/block.a(lvm.o): In function `lvm_do_vg_rename':
> > lvm.o(.text+0x295a): undefined reference to `memset'
> > lvm.o(.text+0x2972): undefined reference to `memset'
> > make: *** [vmlinux] Erreur 1
> >

Many thanks for your answer,

I used a 2.2.17 kernel that can be found on the net, but I don't know if
its name is Vanilla
I've patched it with the two patches i've found on sistina site for LVM
0.9

I did some other tests:
-  I wrote a small test C programm that use memset. I was able to
compile and execute it
without any problem.
-  Compiling the 2.2.17 kernel without LVM option and the patches works
fine.
-  I declared the memset function in lvm.c as  static (*memset)(void *,
int, size_t);
   and I was able to compile it, without any message saying that
reference to memset is not found !!

Unfortunately, I'm not familiar with C and I don't see what can be the
problem.

regards,
PhiL
-- =

----------------------------------------------------------------------
Linux 2.2.17 | Philippe Lefevre   E-mail: ph.l@libertysurf.fr |  =3D=B0)
             |                                                |  /\\
----------------------------------------------------------------_\_V--
