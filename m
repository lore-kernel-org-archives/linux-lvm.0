From: "Joost van der Locht" <mailinglists@e-cube.nl>
Subject: RE: [linux-lvm] Initrd, usefull ?
Message-ID: <NEBBKOJLIGMCKNCJJACPEEOFGIAA.mailinglists@e-cube.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <1005754193.3bf29751422a4@imp.free.fr>
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
Date: Fri Nov 16 10:01:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Hello,

When you compile the kernel, the best thing is to compile scis drivers in
the kernel, After that use lvmcreate_initrd to create the initial ramdisk
file. BUT you probably have to change the ramdisk size. This can be done by
changing the lvmcreate_initrd script. There is an option INITRDSIZE. A value
of 8192 should be sufficient.

Greetings

Joost van der Locht
Technisch Directeur

E*Cube BV
Toernooiveld 214 - 6525 EC Nijmegen
T: 024-3500437 - F: 024-3500613
http://www.e-cube.nl
e-mail: joost@e-cube.nl             ICQ UIN: 494145

> -----Oorspronkelijk bericht-----
> Van: linux-lvm-admin@sistina.com
> [mailto:linux-lvm-admin@sistina.com]Namens Georges Giralt
> Verzonden: woensdag 14 november 2001 17:10
> Aan: linux-lvm@sistina.com
> Onderwerp: [linux-lvm] Initrd, usefull ?
>
>
> Hello !
> I plan to convert my Redhat 7.1 (ugraded from RH 4.2 through all versions
> in between....) to a root LVM.
> I've got the latest LVM code, patched my 2.4.5 kernel, compiled without
> optimization to make lvcreate run ;-)
> And wonder if I _really_ need an initrd, if I put the LVM code
> straight into the
> kernel.
> I'm of course aware that I need a modified Lilo able to
> understant the LVM meta
> data, in order to find the kernel. But once this is done, what
> will the initrd
> be used for ?
> Any information, hints, tips would be greatly appreciated !
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
>
