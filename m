From: Michael Schmitz <schmitz@zirkon.biophys.uni-duesseldorf.de>
In-Reply-To: <1074177806.3983.87.camel@telecentro2>
Message-ID: <Pine.LNX.4.44.0401151550450.21542-100000@zirkon.biophys.uni-duesseldorf.de>
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
Date: Thu Jan 15 17:05:02 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Leandro =?ISO-8859-1?Q?Guimar=E3es?= Faria Corcete Dutra <ldutra@prefeitura.sp.gov.br>
Cc: PowerPC <debian-powerpc@lists.debian.org>, Victor Tramp <linux-lvm@sistina.com>

> > parted should indeed use names on Apple partitioned disks; LVM (from what
> > I gather) doesn't cope with names here.
>
> 	Too bad... I guess not even LVM2?

Honestly, I don't know. I've never tried LVM on PowerPC.

> > You didn't answer my implied question: do you need to keep the Apple
> > partition format, (f.e. because you need to keep MacOS on the machine)?
>
> 	Yes, it is a beige Apple Power Macintosh G3 which does need BootX.

So you do indeed need to keep the original partition format. Without Apple
partition support in LVM, you could always try a sick hack: Add a PC style
partition table to the disk (they can, in fact, coexist, that's how dual
PC/Mac zip media are done). Make sure the partition maps match exactly,
and use the 0x8e partition type in the PC style table. AFAIR the kernel
does first probe for PC style partition tables, so it should work both
ways.

This hack is not for the faint of heart, and I cannot stress enough that
you need to have a backup of your partition maps (the first few sectors of
the disk), as well as a method to restore the maps (booting from floppy,
or some such, with another floppy holding the backup) before even
considering such a hack. If the above doesn't make sense to you, please do
not attempt to force it.

	Michael
