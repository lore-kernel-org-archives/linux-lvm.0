From: Michael Schmitz <schmitz@zirkon.biophys.uni-duesseldorf.de>
In-Reply-To: <1074174498.4065.81.camel@telecentro2>
Message-ID: <Pine.LNX.4.44.0401151450320.21279-100000@zirkon.biophys.uni-duesseldorf.de>
MIME-Version: 1.0
Subject: [linux-lvm] Re: mac-fdisk and 0x8e partitions for LVM
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
Date: Thu Jan 15 17:05:09 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Leandro =?ISO-8859-1?Q?Guimar=E3es?= Faria Corcete Dutra <ldutra@prefeitura.sp.gov.br>
Cc: PowerPC <debian-powerpc@lists.debian.org>, Victor Tramp <linux-lvm@sistina.com>

> > To reiterate: I don't see any solution without making LVM accept Apple
> > partition maps in the first place. Which part of LVM checks the partition
> > type? Can you show me some sample code?
>
> 	Unfortunately I'm no hacker, I am just trying to use LVM on the
> PowerMac (OldWorld, beige G3).  So I can't show you source code.  This
> evening when I get back home I can take note of the error messages and
> send them, but to sum it up I tried everything under the Sun, and none
> could mark a partition as LVM type, not even parted which does uses
> names instead of hexadecimals.

parted should indeed use names on Apple partitioned disks; LVM (from what
I gather) doesn't cope with names here.

Sending the error messages (with comments on which tool produces them)
would help.

> 	I tried even to mark a partition as undefined with mac-fdisk, but then
> vgcreate fails, even if pvcreate works.

You didn't answer my implied question: do you need to keep the Apple
partition format, (f.e. because you need to keep MacOS on the machine)?

And, out of interest: how do you boot the oldworld G3? quik, or floppy
boot?? Can quik do dual booting on such a box?

	Michael
