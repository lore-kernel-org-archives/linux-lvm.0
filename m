Return-Path: <boutilpj@ednet.ns.ca>
Message-ID: <3ACE5D8E.26CADB95@ednet.ns.ca>
Date: Fri, 06 Apr 2001 21:21:34 -0300
From: Patrick Boutilier <boutilpj@ednet.ns.ca>
MIME-Version: 1.0
Subject: Re: [linux-lvm] 2.2.19 Patches??
References: <Pine.LNX.4.30.0104061930120.1564-100000@leopard.dorfam.ca>
Content-Transfer-Encoding: 7bit
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

gerry@dorfam.ca wrote:

> I just spent the better part of a week finding out what patches to apply
> in what order to get the 2.2.17 stock kernel working with lvm.  Now that
> I've got that working it seems like I should go all the way and install
> 2.2.19.
>
> Would someone please tell me what patches need to be applied and their
> location.  BTW, I think this information would be really, really nice in
> the HowTo!

Below is some instructions direct from the README in the PATCHES directory.
If you want to get your own raw-io patch get
ftp://ftp.kernel.org/pub/linux/kernel/people/sct/raw-io/kiobuf-2.2.18.tar.bz2.
I used raw-2.2.18.FULL.diff to patch my 2.2.19 kernel.



Creating the patch
------------------

o untar your clean Linus kernel

o run 'make distclean' in the directory above this one to clean up any
  previous configure information.  If you get an error that says
  "make: *** No rule to make target `distclean'.  Stop." it generally
  means your source tree is clean and you can ignore it.

o run configure in the directory above this one to produce 'Makefile',
making
  sure to specify the '--with-kernel_dir=' flag if your kernel source is
not
  in '/usr/src/linux'.

o check the following variables at the top of 'Makefile' in the PATCHES
  directory

  KERNEL_DIR should point to the kernel source that you wish to patch
  eg, KERNEL_DIR=/usr/src/linux

  LVM_VERSION the LVM version
  eg, LVM_VERSION=0.9.1_beta5

  KERNEL_VERSION the version of your kernel that is to be patched
  eg, KERNEL_VERSION=2.2.18

o Apply raw_io patch if you're using a 2.2 kernel (see below).

o type 'make', a file of the form lvm-<LVM_VERSION>-<KERNEL_VERSION>.patch
  should be built


Applying the patch to a 2.2 kernel
----------------------------------

LVM requires Stephen Tweedie's raw_io patch to work under linux-2.2,
we have included versions of this patch for various kernel releases
(linux-2.2.*-rawio.patch).  However we do not guarantee that this is
the most up to date version.

See ftp://ftp.kernel.org/pub/linux/kernel/people/sct/raw-io/

This patch must be applied before you make the LVM patch.

eg,

cd /usr/src/linux
patch -p1 < /home/joe/develop/LVM/PATCHES/linux-2.2.18-rawio.patch
cd /home/joe/develop/LVM/PATCHES
make
cd /usr/src/linux
patch -p1 < /home/joe/develop/LVM/PATCHES/lvm-0.9.1_beta5-2.2.18.patch

>
>
> Gerry
>
> PS.  I'm running Redhat 7.0.  Are there patches available for the RH
> kernels??
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
