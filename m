From: Eike Kowallik <E.Kowallik@tu-bs.de>
Subject: [E.Kowallik@tu-bs.de: [linux-lvm] lvm and raw devices (with Oracle 9 RAC)]
Message-ID: <20020703195115.E999@portatile.milano.dt>
Mime-Version: 1.0
Content-Disposition: inline
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
Date: Wed Jul  3 12:08:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linux LVM Mailinglist <linux-lvm@sistina.com>
Cc: Eike Kowallik <E.Kowallik@tu-bs.de>

Hello!

Hmm...  nobody can give me a hint? Are my problems and my questions
so strange??

As I wrote everything works fine with real hard disk partitions
for the binding of the raw devices - but with logical volumes it
doesn't work anymore... :-(

Bye, Eike


----- Forwarded message from Eike Kowallik <E.Kowallik@tu-bs.de> -----

From: Eike Kowallik <E.Kowallik@tu-bs.de>
To: Linux LVM Mailinglist <linux-lvm@sistina.com>

Date: Mon, 24 Jun 2002 04:29:08 +0200


Hello!

During the installation of a 2-node Oracle 9.0.1 cluster using both
lvm and raw devices I meet a problem that is independent of Oracle -
at least it seems to me like that...

When I'm binding my raw devices used for Oracle to real hard disk
partitions everythings works fine. But with the binding to my created
logical volumes I'm receiving errors from Oracle. And I need more raw
partitions on the shared disk than Linux can support (due to the one
byte minor device number limit). In general I would like to have the
great flexibility of the lvm. ;-)

So I tried to find out what the reason for the problem is and found
amongst other things the following threads:

   [linux-lvm] Using Oracle with lvm AND rawio: read(512) from /dev/raw/... 
   http://lists.sistina.com/pipermail/linux-lvm/2000-December/003730.html

   confused about raw-io blocksizes
   Date: Fri Nov 09 2001 - 19:13:11 EST
   http://www.uwsg.iu.edu/hypermail/linux/kernel/0111.1/0472.html

   [suse-oracle] ORA-27044 to create tablespace (Re: [suse-oracle] Raw device)
   http://lists.suse.com/archive/suse-oracle/2002-Feb/0054.html


I tested to read 1k, 2k, 4k and 8k blocks from my raw devices, bound
to logical volumes - everything ok, here for the first raw device:

$ dd if=/dev/raw/raw1 of=/dev/null bs=1k count=1000
1000+0 records in
1000+0 records out
$ dd if=/dev/raw/raw1 of=/dev/null bs=2k count=1000
1000+0 records in
1000+0 records out
$ dd if=/dev/raw/raw1 of=/dev/null bs=4k count=1000
1000+0 records in
1000+0 records out
$ dd if=/dev/raw/raw1 of=/dev/null bs=8k count=1000
1000+0 records in
1000+0 records out

BUT with a block size of 512:

$ dd if=/dev/raw/raw1 of=/dev/null bs=512 count=1000
dd: reading `/dev/raw/raw1': Invalid argument
0+0 records in
0+0 records out
$

You will find the same error message in the threads above. And _all_
the tests, even the one with a block size of 512 bytes, are running
instead _without_ any errors when the used raw devices are bound to
real disk partitions!

I'm using stock Red Hat 7.1 with some changes made for the Oracle RAC.
My concrete problem is that I'm not able to find any concrete hint
about what to do. Do I need a newer lvm version? If so, which one?
Red Hat 7.1 comes with

   # grep -i lvm /var/log/messages.1 | tail -2
   Jun 14 22:26:08 linmi04 kernel: LVM version 0.9.1_beta2  by Heinz Mauelshagen  (18/01/2001)
   Jun 14 22:26:08 linmi04 kernel: lvm -- Module successfully initialized

but without the lvm userland tools, so I installed the appropriate
version of them.

Or is it (also) a kernel problem? I have to use a recent 2.4 kernel?
I needed (for the Oracle RAC) to compile the Red Hat kernel:

   $ rpm -q kernel-source
   kernel-source-2.4.2-2

What's about lvm patches? According to PATCHES/README it shouldn't be
necessary for 2.4 kernels ("little more than update the lvm source files").
And BLOCK_SIZE in lvm.h? In the thread of this mailing list from
December of 2000 (please have a look above) I couldn't find an answer.

It's perhaps a little bit off topic here, but due to the certification
of Oracle 9.0.1 RAC for Red Hat 7.1 I'm interested in statements about
using lvm and raw devices (for Oracle RAC) with Red Hat kernels, too.
Perhaps I need just to upgrade to the Red Hat 2.4.9-34 kernel rpm's
(there is no newer one for Red Hat 7.1)...  but I don't want to try
just something out, instead I would like to understand the problem -
and to apply a good solution then. ;-)

Thanks in advance && bye, Eike


_______________________________________________
linux-lvm mailing list
linux-lvm@sistina.com
http://lists.sistina.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html

----- End forwarded message -----
