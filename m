content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Message-ID: <82706A2FAC4D08468A1652B4B7DD0C44CB0A40@mx1.bouvet.no>
From: "Kjetil H. Paulsen" <kjetil.paulsen@bouvet.no>
Subject: [linux-lvm] Disk damaged
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
Date: Sun Nov 30 05:49:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Hi
=20
It seems like one of my disks as gone down, fortunately the last disk in =
the volume (/dev/hdg). Can I get about this by doing:
=20
vgreduce vol_grp /dev/hdg
umount /stuff
e2fsadm -L-60G /dev/vol_grp/big
