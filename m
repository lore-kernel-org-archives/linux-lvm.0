Content-Class: urn:content-classes:message
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Message-Id: <7183324281D1E345A1C949951DE70EE01F8D01@well.tynant.ftech.net>
From: "Jason Thomas" <Jason.Thomas@ftech.net>
Subject: [linux-lvm] unsubscribing
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
Date: Mon Jan  7 10:57:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

How do i unsubscribe from this list please

Jay.=20


-----Original Message-----
From: Adrian Head [mailto:ahead@bigpond.net.au]
Sent: 07 January 2002 16:50
To: Keith Owens
Cc: Linux XFS Mailing List; linux-lvm@sistina.com
Subject: [linux-lvm] Re: Unable to get XFS, ext3, reiserfs & LVM to
coexist happily


-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Keith - just a couple of questions...

On Tue, 8 Jan 2002 00:41, Keith Owens wrote:
> On Tue, 8 Jan 2002 00:08:11 +1000,
>
> Adrian Head <ahead@bigpond.net.au> wrote:
> >
> >Entering kdb (current=3D0xd600e000, pid 940) Oops: Oops
> >due to oops @ 0xb800
> >eax =3D 0xffffffff ebx =3D 0xd600e000 ecx =3D 0x0000b800 edx =3D =
0xc018fd25
> >esi =3D 0x00000008 edi =3D 0xd600e000 esp =3D 0xd600ff0c eip =3D =
0x0000b800
> >ebp =3D 0xd600ff30 xss =3D 0x00000018 xcs =3D 0x00000010 eflags =3D
0x00010086
> >xds =3D 0x00000018 xes =3D 0x00000018 origeax =3D 0xffffffff &regs =
=3D
0xd600fed8
> >kdb> bt
> >    EBP       EIP         Function(args)
> >0xd600ff30 0x0000b800 <unknown>+0xb800 (0x1)
> >                               kernel <unknown> 0x0 0x0 0x0
> >           0xc011ce83 dequeue_signal+0x43 (0xd600e560, 0xd600ff30,
> >0xd600e560, 0xd600ffc4, 0xc01392ff)
> >                               kernel .text 0xc0100000 0xc011ce40
> > 0xc011cef0 0xc01069b9 do_signal+0x59 (0x11, 0xbfffec40, 0xbfffebb0,
0x8,
> > 0x11) kernel .text 0xc0100000 0xc0106960 0xc0106c00 0xc0106d54
> > signal_return+0x14
> >                               kernel .text 0xc0100000 0xc0106d40
> > 0xc0106d58
>
> kdb is correctly reporting the current eip, but the kernel has taken a
> swan dive into nowhere.  It looks like the chunk of code below.  To
> confirm, run
>
>   objdump --start-addr=3D0xc011ce40 --stop-address=3D0xc011ce90 =
vmlinux

How did you get 0xc011ce40 and 0xc011ce90?  Do they come from above?
How are=20
they derived? Just interested.
vmlinux - where does that come from?  I assume it is not the compressed=20
kernel found in /boot.

>
> I expect to see a call instruction just before 0xc011ce83, probably an
> indirect call via ecx.

As soon as I can get a sucessful objdump I'll send it on.

>
> dequeue_signal(sigset_t *mask, siginfo_t *info)
> {
>         int sig =3D 0;
>
> #if DEBUG_SIG
> printk("SIG dequeue (%s:%d): %d ", current->comm, current->pid,
>         signal_pending(current));
> #endif
>
>         sig =3D next_signal(current, mask);
>         if (sig) {
>                 if (current->notifier) {
>                         if (sigismember(current->notifier_mask, sig))
{
>                                 if
> (!(current->notifier)(current->notifier_data)) {  <=3D=3D=3D probably
failing
> here current->sigpending =3D 0;
>                                         return 0;
>                                 }
>
> Without seeing the objdump output, I am assuming that it is failing on
> the call to current->notifier which means that notifier is corrupt.
> The only place that notifier is set is in block_all_signals() so we
> need to find who is calling that routine with bad data.  With any
luck,
> this (untested) debug patch will catch the offender.  Then we start
> finding out why it is passing a bad pointer.


While I wait for more info about objdump I'll do this and see what
happens.

> --- kernel/signal.c.orig	Wed Dec  5 13:15:50 2001
> +++ kernel/signal.c	Tue Jan  8 01:28:12 2002
> @@ -155,6 +155,8 @@ block_all_signals(int (*notifier)(void *
>  {
>  	unsigned long flags;
>
> +	if (notifier && (unsigned long)notifier < 0xc0000000)
> +		BUG();
>  	spin_lock_irqsave(&current->sigmask_lock, flags);
>  	current->notifier_mask =3D mask;
>  	current->notifier_data =3D priv;
>
> A quick scan through the kernel found only DRM code using
> block_all_signals.  If the bug is a bad notifier then the oops will be
> timing dependent, the notifier routine is only called if a signal
trips
> between block_all_signals() and unblock_all_signals() and that does
not
> always occur.

- --=20
Adrian Head

(Public Key available on request.)
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE8OdHW8ZJI8OvSkAcRAmpQAKCaoO4JuZO+teCW8cUEnDzrNvkjeACeOk9B
eZT4hJWVk3xh1BOZnC0o14A=3D
=3DYOrk
-----END PGP SIGNATURE-----

_______________________________________________
linux-lvm mailing list
linux-lvm@sistina.com
http://lists.sistina.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
