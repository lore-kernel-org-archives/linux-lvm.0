From: Stefan Feeser <stefan.feeser@felino.de>
Subject: Re: [linux-lvm] Debian and LVM at the begin of the installation prozess
References: <Pine.LNX.4.53.0303121824410.2531@light.webcon.net> <20030315223816.GB16976@gw.silicide.dk> <200303152354.10449.stefan.feeser@felino.de>
In-Reply-To: <200303152354.10449.stefan.feeser@felino.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Message-Id: <200303301209.09794.stefan.feeser@felino.de>
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
Date: Sun Mar 30 05:06:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@sistina.com

Am Samstag, 15. M=EF=BF=BDrz 2003 23:54 schrieb Stefan Feeser:
> Hi all,
Hi all,
>
> I am a beginner with LVM and Debian. I would like to install debian and
> "put" the hole disks in the LVM. At my system I would like to stripe-mirr=
or
> (RAID 10) my two disks (IDE). Because the hardware is not the newest one I
> have to do the installation with bootdisks.
>
> My question is how I can create a volume group and so on during the
> installation prozess.
>
After reading some HoTows, I know how you can create LVM's during the=20
installation process with disks with a debian system.

To work with lvm and debian on boot disks there are the following steps:

- Create a rescue.bin and a root.bin disk from 2.4 kernel. There you should=
=20
have possibilities to work with LVM
- Download a file, which is called lar1440.bin from the internet and write =
it=20
with cat lar1440.bin > /dev/fd0 to a seperate disk
- Boot your computer with the two boot disks and follow the installation me=
nue=20
til the step "partitionition the disks" (with the program cfdisk)
- Create a swap and a root partition on the normal way, the rest of space o=
f=20
the disk use type 8E, Linux LVM
- then switch to a second console (for example with ALT + F2)
- put the lar disk in your disk drive and type the command extdisk
- now you can work with LVM tools

Regards

Stefan
