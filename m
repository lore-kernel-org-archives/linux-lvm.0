From: Dieter Franzke <lists@franzke-online.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Message-Id: <200212160923.58295.lists@franzke-online.de>
Subject: [linux-lvm] lvm-problems. vgda inconsistency
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
Date: Mon Dec 16 02:23:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Hi,

I've created a pv, vg and lv
via pvcreate, vgcreate and lvcreate.
Everything went well.
But when I tried to  initialize a filesystem via mkfs.xfs I get following=
=20
error:

VGDA in Kernel and lvmtab are NOT consistent; please run vgscan

When I run vgscan nothing is changed.
How can I fix this without rebooting?

any hints?

ciao

dieter

--=20
registered linuxuser 199810
it's time to close windows....
