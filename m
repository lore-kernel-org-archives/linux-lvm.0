From: "Yves Alloyer" <Yves.ALLOYER@slpinfoware.com>
Subject: RE: [linux-lvm] Rescue cd for lvm 1.0.3 (fwd)
Message-Id: <NEBBLHFAEINCLDICDLOAMEOJCJAA.yves.alloyer@slpinfoware.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
In-Reply-To: <200202261252.NAA02080@mailgate.sara.nl>
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
Date: Wed Feb 27 03:29:01 2002
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

> -----Original Message-----
> From: linux-lvm-admin@sistina.com [mailto:linux-lvm-admin@sistina.com]On
> Behalf Of Remco Post
> Sent: Tuesday, February 26, 2002 1:53 PM
> To: linux-lvm@sistina.com
> Subject: Re: [linux-lvm] Rescue cd for lvm 1.0.3 (fwd)
>
>
>
> Because lilo doesn't have a clue about lvm, so it cannot properly
> store the
> location of your kernel in your boot record if /boot is also in
> lvm (like in
> your setup). That is why the lvm howto tells you you must have /boot on a
> separate (dos) partition (eg hda1).
IMHO this only applies to stock lilo as found in most current and all older
distros.
I have a recent and patched version of lilo that does recognize LVM.
My vgroot (with /, /var /tmp, /boot, etc.) is in LVM. It's all reiserfs.
It's
running over software raid (mirroring of course).
Works like a charm. As a special measure, though I don't know if I still
need that (anybody?),
I take care of having /boot and / in low numbered PEs.
Works like a charm so far... many thanks to you guys out there.
<OT>I also have autofs, nisplus (client). The result is a box with an easy
to
administer enterprise grade OS. Just love it.</OT>

(snip...)
> --
> Met vriendelijke groeten,
>
> Remco Post
>
> SARA - Stichting Academisch Rekencentrum Amsterdam
> High Performance Computing  Tel. +31 20 592 8008    Fax. +31 20 668 3167
>
> "I really didn't foresee the Internet. But then, neither did the computer
> industry. Not that that tells us very much of course - the
> computer industry
> didn't even foresee that the century was going to end." -- Douglas Adams
>
>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
>

Best regards,
Yves
