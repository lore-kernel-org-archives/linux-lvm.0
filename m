Message-ID: <3D9D975D.DEDE70FE@silicide.dk>
From: Jon Bendtsen <jon+lvm@silicide.dk>
MIME-Version: 1.0
Subject: Re: [linux-lvm] mounting reiserfs snaphost fails
References: <Pine.LNX.4.44.0210041047310.21409-100000@gmmpc1.gmm.priv> <3D9D923B.5899DB6A@silicide.dk>
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
Date: Fri Oct  4 08:41:06 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Jon Bendtsen wrote:
> 
> Xavier Montagutelli wrote:
> >
> > On Fri, 4 Oct 2002, Jon Bendtsen wrote:
> >
> > > "Heinz J . Mauelshagen" wrote:

[cut]

> Doing a cvs, i only found these 2 files (and others)
> 
>         linux-2.4.18+quota32-VFS-lock.patch
>         linux-2.4.18-VFS-lock.patch
> 
> nothing for 2.4.19 :/   (whats the difference between those 2 files?)
> 
> I did a ./configure in the LVM dir, and a make in the PATCHES dir, and
> tried to
> apply that patch to a 2.4.19, and a 2.4.18, stock from Linus. They
> applied fine
> but they did not compile :/
> "drivers/md/mddev.o: In function `_proc_read_global':
> drivers/md/mddev.o(.text+0x6e1a): undefined reference to `vg'
> drivers/md/mddev.o(.text+0x702e): undefined reference to `lvm_memory'
> drivers/md/mddev.o(.text+0x71a1): undefined reference to `vg'
> make[1]: *** [vmlinux] Error 1
> make[1]: Leaving directory `/usr/src/linux-2.4.18'
> make: *** [stamp-build] Error 2"
> 
> So, right now i'm trying the same thing with only
>         linux-2.4.18-VFS-lock.patch
> applied.

Okay, that "worked". It compiled, but i dont know if it can take
online snapshots of journaled filesystems (ext3). I'll try that.



JonB
