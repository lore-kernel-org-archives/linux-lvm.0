From: Daniel Gardner <daniel@danielgardner.org>
Subject: Re: [linux-lvm] vgcreate -- no valid physical volumes in command line
References: <002a01c25748$4bfdeef0$3200a8c0@warl0k>
In-Reply-To: <002a01c25748$4bfdeef0$3200a8c0@warl0k>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Message-Id: <200209081615.14001.daniel@danielgardner.org>
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
Date: Sun Sep  8 10:21:03 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

On Sunday 08 September 2002 3:59 pm, Glenn Shannon wrote:
> It's not bad, I use it. It just takes a couple of tweaks.
>
> For one, the actual devices are in subdirs now. Like what was /dev/hda2
> is now /dev/ide/host0/bus0/target0/lun0/part2.
>
> So one needs to pass the devfs'ed name for the device to the lvmtools.

ahh, symlinks, i see... yes... I'd read about devfs back when there was=20
argument about wether it should be in the kernel or not, but gentoo final=
ly=20
dragged me into the modern age. I presume it's the symlinks that vgcreate=
=20
doesn't like... could that be construed as a bug?

Right, onwards for fun and games with grub and lvmcreate_initrd :)

Thanks for the help,
Daniel
