From: Arkadiusz Miskiewicz <arekm@pld-linux.org>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Message-Id: <200401240137.35706.arekm@pld-linux.org>
Subject: [linux-lvm] lvm on initrd
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
Date: Fri Jan 23 19:40:02 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@sistina.com

Hi,

Are there any plans to add makefile target which would produce very small +=
=20
features stripped down lvm binary with only two commands:
vgscan vgchange
for usage on initrd images?

Such thing is for example done with mdadm tool for raid arrays: make=20
mdassemble produces very small binary which can only assemble arrays (so ve=
ry=20
nice to use on initrd) while there is also mdadm binary with full support f=
or=20
everything.
=2D-=20
Arkadiusz Mi=B6kiewicz     CS at FoE, Wroclaw University of Technology
arekm.pld-linux.org, 1024/3DB19BBD, JID: arekm.jabber.org, PLD/Linux
