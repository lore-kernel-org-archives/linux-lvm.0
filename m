From: Fabian Herschel <fabian.herschel@suse.de>
Subject: Re: [linux-lvm] Two drives with the same UUID
References: <20030110213858.GI3393@pc.ilinx>
In-Reply-To: <20030110213858.GI3393@pc.ilinx>
MIME-Version: 1.0
Message-Id: <03011311575101.01471@grimsel>
Content-Transfer-Encoding: quoted-printable
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
Date: Mon Jan 13 05:05:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com, lvm@interlinx.bc.ca

On Friday 10 January 2003 22:38, lvm@interlinx.bc.ca wrote:
> If I had a system with a functional LVM configuration (1.0.6ish) and I
> were to "duplicate" the drive in it (i.e. dd if=3D/dev/sda of=3D/dev/sd=
b)
> and then try to boot that system (with both drives installed and
> functional), what would happen?
>
> Of course, because I am asking, I have tried it.  :-)  During boot LVM
> failed to find any logical volumes.  Is this expected?  It's not
> surprising mind you, but I wonder how it was designed to deal with
> this situation.

Sorry, but this is a normal reaction of the logical volume manager. Why?
Each "normal" volume manager uses a special part of the disk device (or a
special part of a partition) to identify the physical media. If you copy =
the
complete disk, you also copy this unique identifier. So LVM get confused
to find a media twice.

Best regards
Fabian Herschel
>
> b.

----------------------------------------
Content-Type: application/pgp-signature; charset=3D"us-ascii";=20
name=3D"Attachment: 1"
Content-Transfer-Encoding: 7bit
Content-Description:=20
----------------------------------------

--=20
<Fabian.Herschel@suse.de>
SuSE Linux AG * Mergenthalerallee 45-47 * D-65760 Eschborn
Tel: +49-6196-50951-23 * Fax: +49-6196-409-607
http://www.suse.de * Alice Homepage: http://www.suse.de/~fabian
