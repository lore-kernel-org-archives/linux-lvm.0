From: Lars Grobe <grobe@gmx.net>
MIME-Version: 1.0
References: <3F133985.C98897C@eti.net.gn>
Subject: Re: [linux-lvm] Very newbie question (LVM+NFS)
Message-ID: <3831.1058225901@www2.gmx.net>
Content-Type: text/plain; charset="iso-8859-1"
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
Date: Mon Jul 14 18:39:01 2003
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

Hi Kader!=20
=20
> I would like to know if it is possible, then, to use LVM in order to=20
> aggregate all these nfs partitions onto one single volume.=20
=20
No, it is impossible that way. NFS mounts are not partitions, but=20
exported filesystems. They don't have e.g. a device entry on the client.=20
=20
If you want to use lvm, you need a block DEVICE, e.g. a harddisk. Usually=20
this appears as /dev/sda, /dev/hda, /dev/rd/c0d0 etc. There are ways=20
to export block devices over a network, e.g. "iscsi" - you export a=20
device and get a new "scsi"-device on the client. This is a possible lvm=20
target (am I wrong here?).=20
=20
Good luck, CU Lars.=20

--=20
+++ GMX - Mail, Messaging & more  http://www.gmx.net +++

Jetzt ein- oder umsteigen und USB-Speicheruhr als Pr=EF=BF=BDmie sichern!
