From: "William Blunn" <bill+f.20020227@tao-group.com>
Subject: Re: [linux-lvm] Rescue cd for lvm 1.0.3 (fwd)
Message-Id: <002801c1bf74$23053560$216410ac@tao.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <NEBBLHFAEINCLDICDLOAMEOJCJAA.yves.alloyer@slpinfoware.com>
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
Date: Wed Feb 27 03:50:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

> > Because lilo doesn't have a clue about lvm, so it cannot properly
> > store the location of your kernel in your boot record if /boot is
> > also in lvm (like in your setup). That is why the lvm howto tells
> > you you must have /boot on a separate (dos) partition (eg hda1).

> IMHO this only applies to stock lilo as found in most current and=20
> all older distros.
> I have a recent and patched version of lilo that does recognize LVM.

For the sake of 8MB of disk, I'd be inclined to go with the /boot on an
ext2 filesystem directly on a disk partition.

That way you will be compatible with the stock lilo, which will:

(a) Save you building your own lilo. Yes I know it is easy, but it's not
    just the the direct time involved in doing it (which probably
    outweighs 8MB of disk by itself anyway). You also have the ongoing
    system management effort in having to manage (another) one of your
    components no longer being the out-of-the-box distro version.

(b) Save you grief in the event that the boot setup on your system
    fails, as you can potentially the stock lilo.

Over time, as new versions of distros appear containing new versions of
lilo, and systems are upgraded to newer distro versions, then the
prevalent population of lilo instances will eventually become LVM-aware.

Regards,

Bill
--=20
William H. Blunn - <bill+s.20020227@tao-group.com> - Developer Support
Tao
62/63 Suttons Business Park, Earley, READING, RG6 1AZ, United Kingdom
Tel: +44 118 901 2999 - Fax: +44 118 901 2963 - http://tao-group.com/
