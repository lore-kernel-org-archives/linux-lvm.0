From: Michael Schmitz <schmitz@zirkon.biophys.uni-duesseldorf.de>
In-Reply-To: <1074181946.4065.99.camel@telecentro2>
Message-ID: <Pine.LNX.4.44.0401151656060.21985-100000@zirkon.biophys.uni-duesseldorf.de>
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
Date: Thu Jan 15 17:05:13 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Leandro =?ISO-8859-1?Q?Guimar=E3es?= Faria Corcete Dutra <ldutra@prefeitura.sp.gov.br>
Cc: PowerPC <debian-powerpc@lists.debian.org>, Victor Tramp <linux-lvm@sistina.com>

> > This hack is not for the faint of heart, and I cannot stress enough that
> > you need to have a backup of your partition maps (the first few sectors of
> > the disk), as well as a method to restore the maps (booting from floppy,
> > or some such, with another floppy holding the backup) before even
> > considering such a hack. If the above doesn't make sense to you, please do
> > not attempt to force it.
>
> 	It does make sense, but not in the sense of actually knowing how to do
> it!  ;-)
>
> 	In other words, gimme references (URLs, HOWTOs etc) and I'll try.

That's what I meant by 'if it doesn't make sense, don't try'. I have no
references; Google may be your friend here, so might be the list
archives, but then, playing with this might be more trouble than you
bargained for.

Or, put another way: if you don't know how to do this, given my terse
hints, you don't really want to do it (because, if it goes wrong, you'll
be in big trouble, and I definitlely don't want to hear about it).

Having said this:
From what I recall, you can just use cfdisk or pmac-fdisk to create a new
partition table. You'll need to have the start/end positions of the
relevant partitions from mac-fdisk handy, and set up the 'new' partitions
using exactly the same data. You might be able to omit the MacOS specific
stuff, but be warned that the partition numbering will be different
between the two tables then.

	Michael
