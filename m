Return-Path: <russell@coker.com.au>
From: Russell Coker <bofh@coker.com.au>
Subject: Re: [linux-lvm] Upgrade path from 0.8i to 0.9?
Date: Sun, 17 Dec 2000 09:40:56 +0100
References: <20001216184849.A12569@pclab.ifg.uni-kiel.de>
In-Reply-To: <20001216184849.A12569@pclab.ifg.uni-kiel.de>
MIME-Version: 1.0
Message-Id: <0012170940560K.00774@lyta>
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com, Torsten Landschoff <torsten@pclab.ifg.uni-kiel.de>

On Saturday 16 December 2000 18:48, Torsten Landschoff wrote:
> We are planning to upgrade a production server tomorrow. As we have to
> build a new kernel anyway I would like to upgrade the LVM code from 0.8=
i
> to 0.9.
>
> I just tried the same thing on a test system and I was unable to get it
> working. After installing the new kernel I installed the lvm Debian
> package from sistina.com (which removed /etc/lvmtab and /etc/lvmtab.d)
> and tried to reactivate the volumes. This is what I get:

I should have this sort of thing working cleanly from the Debian packagin=
g=20
part within 2 weeks.  This includes having /etc/lvmtab and /etc/lvmtab.d=20
owned by the lvm-common package which won't need to be upgraded (except f=
or=20
when man pages change).  Also upgrading lvm-common won't trash things bec=
ause=20
they will be registered as conffiles.

Please try out my test packages of 0.8.1 on http://www.coker.com.au/lvm/ =
on a=20
test machine (NOT A PRODUCTION SERVER) and let me know how they go.

--=20
http://www.coker.com.au/bonnie++/     Bonnie++ hard drive benchmark
http://www.coker.com.au/postal/       Postal SMTP/POP benchmark
http://www.coker.com.au/projects.html Projects I am working on
http://www.coker.com.au/~russell/     My home page
