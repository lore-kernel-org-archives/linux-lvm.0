Return-Path: <daleto@swipnet.se>
Message-ID: <3B16A8B9.761EFB83@swipnet.se>
Date: Thu, 31 May 2001 22:25:29 +0200
From: Tomas =?iso-8859-1?Q?Dalebj=F6rk?= <daleto@swipnet.se>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: [linux-lvm] LVM on / and SuSE 7.1
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
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@sistina.com

Hi,

I tryed to create:
Volume Group : rootvg
(Containing)
Logical Volume : rootvol1

But when I get to the point where I need to install my LiLO, I recieved
the following message:
Fatal : Not a number : "/dev/rootvg/rootvol1"

This disk was already pre-filled from SuSE installations, and I have
allready done all the needed installations.
If I read the man pages for lvmcreate_initrd, =

lvmcreate_initrd assumes that /dev/vg00/root contains  the  root
filesystem. But my volume group is rootvg, and my logical volume is
rootvol1.

Is this step important to make the image bootable.?

Please help me.

Thanks in advance.

Regards Tomas
                                ,,,,,
                                (o o)
---------------------------o000--(_)--000o-----------------------

Tomas Dalebj=F6rk                            Mail: Tomas@daleto.com
 =

=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D=
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D
Back up my hard drive? I can't find the reverse switch!
