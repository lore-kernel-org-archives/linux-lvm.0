Message-Id: <200203050236.SAA07460@hpgssl.cup.hp.com>
From: John DeFranco <defranco@cup.hp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] Problems building on RedHat 7.2 with 2.4.9-21 kernel
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
Date: Mon Mar  4 20:36:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com
Cc: defranco@cup.hp.com

Hi,

I'm having some problems building lvm (1.0 or 1.0.3) on a redhat7.2 system 
with kernel 2.4.9-21. I'm getting the following errors:

drivers/md/mddev.o: In function `lvm_snapshot_alloc':
drivers/md/mddev.o(.text+0xa881): undefined reference to `alloc_kiovec'
drivers/md/mddev.o(.text+0xa8b4): undefined reference to `alloc_kiovec'
drivers/md/mddev.o(.text+0xa8f3): undefined reference to `free_kiovec'
drivers/md/mddev.o(.text+0xa91a): undefined reference to `free_kiovec'
drivers/md/mddev.o: In function `lvm_snapshot_release':
drivers/md/mddev.o(.text+0xa9b5): undefined reference to `free_kiovec'
drivers/md/mddev.o(.text+0xa9ea): undefined reference to `free_kiovec'
make[1]: *** [kallsyms] Error 1
make[1]: Leaving directory `/usr/src/linux-2.4.9-21'

After doing some research it looks to me like the problem is in file 
fs/iobuf.c which now uses alloc_kiovec_sz and free_kiovec_sz instead of the 
above:

/*
 * iobuf.c
 *
 * Keep track of the general-purpose IO-buffer structures used to track
 * abstract kernel-space io buffers.
 *
 * 07/20/01 Rohit Seth <rohit.seth@intel.com> Made the iobuf come from
 * kiobuf cache instead of vmalloc (that is a killer for most of archs.)  
These
 * changes are specifically targeted for increasing raw IO performance.
 * Introducing the new *_sz functions that take the number of bhs actually
 * required by kiovec.
 */
.
.
.
void free_kiovec_sz(int nr, struct kiobuf **bufp, int *szp)
{
.
.
.
int alloc_kiovec_sz(int nr, struct kiobuf **bufp, int *szp)
{


This file is different from what is in rh kernel 2.4.7-10 (which lvm builds 
find on) and apparently in the vanilla kernels from kernels.org which don't 
seem to have the problem either.

I've seen emails on this list saying that lvm only really works/qualified on 
vanilla kernel sources and not distro specific. I guess this is a good 
example as to why. However there has to be some easy solution to this I would 
think/hope. At this point I need to use the redhat 2.4.9-21 kernel and lvm 
1.0 since the version that is in this kernel is 0.9_beta1. So I don't have 
the option of going to 2.4.18 for example.

Any thoughts?

Thanks!
-- 
==========
John DeFranco			Hewlett-Packard Company
john_defranco@hp.com		Availability Clusters Solution Division
phone: 408-447-7543		19111 Pruneridge Ave, M/S 4101
fax: 408-447-0056		Cupertino, CA 95014 
