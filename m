Return-Path: <bs@infologic.fr>
Message-ID: <3A5EAF1F.EF020978@infologic.fr>
Date: Fri, 12 Jan 2001 08:15:43 +0100
From: Benoit SERRA <bs@infologic.fr>
MIME-Version: 1.0
Subject: Re: [linux-lvm] nagging about the LVM usage survey
References: <20010111083114.A381363@brule.borg> <3A5DC9B5.15B3C7DA@infologic.fr> <20010111172015.C15903@srv.t-online.de>
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
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@sistina.com


"Heinz J. Mauelshagen" a =EF=BF=BDcrit :
>=20
> As pointed out on the list everybody is invited to get the actual
> code from our CVS repository with:
>=20
> "cvs -d :pserver:cvs@cvs.globalfilesystem.org:/data/cvs checkout -r LVM_0=
-9-patches LVM"
>=20
> It contains the fix you are requesting.
>=20
> Our 0.9.1 beta release will take place on friday or monday for people
> who are able to wait.
>=20
> Thanks for your understanding.

Sorry for the messages, I corrected the bug by myself. I just add a
single line on the file lvm.c

I'm using the 2.4.0 kernel.
In file lvm.c
At line 2026, in function lvm_do_vg_extend
Just after the line :
if ( ret !=3D 0 ) return ret;=09

add :

pv_ptr =3D vg_ptr->pv[p];

Recompile the kernel and reboot.
Ok It work
