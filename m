Return-Path: <bcorsello@usa.net>
Message-ID: <20001216075237.21034.qmail@nwcst282.netaddress.usa.net>
Date: 16 Dec 00 02:52:37 EST
From: Brad Corsello <bcorsello@usa.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: [linux-lvm] vgextend segfaults (lvm 0.9, kernel test10)
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

The vgextend command segfaults (without core dump) every time, in lvm 0.9=
 on
kernel 2.4.0-test10.  Is there an official patch to fix this?

Typical output is as follows:

[root@nimrod /root]# vgextend vg1 /dev/hda2
vgextend -- INFO: maximum logical volume size is 255.99 Gigabyte
Segmentation fault

and that's it.

____________________________________________________________________
Get free email and a permanent address at http://www.netaddress.com/?N=3D=
1
