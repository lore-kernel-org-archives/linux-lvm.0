From: Dieter Franzke <lists@franzke-online.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Message-Id: <200301191715.33238.lists@franzke-online.de>
Subject: [linux-lvm] vgimport
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
Date: Sun Jan 19 10:12:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Hi,

I've got a problem importing an vg.
I have done a vgexport of a VG with 4 PVs.
The vgimport on another machine results in an errormessage:
"wrong number of physical volumes to import volume group data".

But when I do a pvscan, just the 4 pv were recognized as exportet.

who can help?

lvm 1.0.5

ciao

dieter

--=20
registered linuxuser 199810
it's time to close windows....
