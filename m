From: Gerwin Lienert <gerwin.lienert@gmx.de>
MIME-Version: 1.0
References: <20020923152349.GA22130@kluge.net>
Subject: Re: [linux-lvm] raid1+lvm
Message-ID: <30810.1032845190@www7.gmx.net>
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
Date: Tue Sep 24 00:28:51 2002
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

If you act generous you may be right with

> I've since taken to keeping /boot, /, and ..

 not need to resize.

> ..swap out of LVM since they
> normally don't need to be resized, and makes the system easier to recover
> in case of problems. :)

But what do you do, when your swap becomes to small. Shure, you can start,
having one swap device outside of your lvm, but in case of increased memory
leak, you will be happy, if you can easily define another swap device on yo=
ur
lvm. I did so, and for me it worked fine.


--=20
Bis dann

Gerwin

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

Werden Sie mit uns zum "OnlineStar 2002"! Jetzt GMX w=EF=BF=BDhlen -
und tolle Preise absahnen! http://www.onlinestar.de
