Message-Id: <sf15739a.041@gwia201.syr.edu>
From: "Stephen Fralich" <sjfralic@syr.edu>
Subject: Re: [linux-lvm] pvmove error
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
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
Date: Wed Jul 16 14:48:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@sistina.com

Right you are.  I reset LD_LIBRARY_PATH with the 1.0.7 lib directory first =
and it's happy now.  Rasa frassin' shared libraries! ;-)  Thanks a lot.

Stephen

---------------------------------------------------------------------
Computer & Information Technology Group            help@ecs.syr.edu
College of Engineering & Computer Science          Link 204, 443-4308
Syracuse University

>>> jpg@rcom.com.ar 07/16/03 11:29AM >>>
El mi=E9, 16-07-2003 a las 11:52, Stephen Fralich escribi=F3:

> I'm not using the redhat pvmove (v1.0.3).  I'm using pvmove 1.0.7 which =
I downloaded from the Sistina site.  I updated the rc scripts to use =
1.0.7.  The volume was created totally under 1.0.7.  I'm using a plain =
kernel (from kernel.org) 2.4.21 patched with LVM 1.0.7 (from Sistina).

But may be you are using the redhat liblvm

>=20
> [root@sauron root]# /sbin/pvmove --version
> pvmove: Logical Volume Manager 1.0.3
> Heinz Mauelshagen, Sistina Software  19/02/2002 (IOP 10)
> [root@sauron root]# pvmove --version
> pvmove: Logical Volume Manager 1.0.7


Where is the second pvmove? Please try,

        ldd /sbin/pvmove
        ldd pvmove
        LD_PRELOAD=3D<unpatchedlvmliblocation> pvmove ...
       =20





Juan Pablo Gim=E9nez=20

http://www.rcom.com.ar/=20
http://www.rcom.com.ar/comunidad/=20
Llave GnuPG:
MIT keyserver=20
Web Rcom=20

GnuPG fingerprint: ED97 6FB8 A9BE
26A6 789B 6657 0A15 EC2B D3D8 FD2B=20

http://www.greenpeace.org.ar/secciones/cyberactivismo/nuclear.php3
