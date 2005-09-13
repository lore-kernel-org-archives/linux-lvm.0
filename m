Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j8DElRV02356
	for <linux-lvm@redhat.com>; Tue, 13 Sep 2005 10:47:27 -0400
Received: from moutng.kundenserver.de (moutng.kundenserver.de
	[212.227.126.171])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id j8DElKW3018957
	for <linux-lvm@redhat.com>; Tue, 13 Sep 2005 10:47:21 -0400
Message-ID: <4326E677.3090006@gmx.net>
Date: Tue, 13 Sep 2005 16:47:19 +0200
From: Klaus Strebel <klaus.strebel@gmx.net>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Resizing the root LVM partition
References: <cd21de0e05091214103bfe89ac@mail.gmail.com>
In-Reply-To: <cd21de0e05091214103bfe89ac@mail.gmail.com>
Content-Transfer-Encoding: quoted-printable
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: jonathan@awaken.com, LVM general discussion and development <linux-lvm@redhat.com>

Jonathan Morace schrieb:
> I'm having a problem adding disks to my root partition, which is using
> LVM.  The quick summary is that I think I need to run resize2fs on the
> root partition, but I can't figure out how to unmount the root
> partition to do so.
>=20
> The longer version of the story...  I'm running Fedora Core 2, and
> when I installed I had the root partition configured to be on two
> disks using LVM.  I added two more disks to the computer and followed
> the howto to initialize the disks, add the physical volumes to the
> volume group, and extend the logical volume.  When I run "lvdisplay" I
> see my logical volume is the correct size, but "df" only shows the
> original size.  I'm assuming this is because I haven't done a
> "resize2fs".  The reason I haven't is because I can't figure out how
> to unmount the root filesystem in order to do this.  If I boot with
> linux rescue, I can choose not to mount the filesystems, but then the
> LVM devices don't exist.  I read somewhere that running "lvm vgscan -v
> --mknodes" should do the trick, but as far as I could tell, no devices
> were created.
>=20
> Any ideas on how I can get the root partition resized to include the new =
disks?
Hi Jonathan,

if you take a look to the list-archive, you'll find more detailed answer.

In short, boot from a recovery media / Live-CD ( you can't umount root=20
to resize the fs! ), resize your rootfs, reboot.

Ciao
Klaus
--=20
Mit freundlichen Gr=EF=BF=BDssen / best regards

Klaus Strebel, Dipl.-Inform. (FH), mailto:klaus.strebel@gmx.net

/"\
\ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
/ \
