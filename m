From: Arkadiusz Miskiewicz <arekm@pld-linux.org>
Subject: Re: [linux-lvm] lvm on initrd
References: <200401240137.35706.arekm@pld-linux.org> <20040124095810.GA6204@percy.comedia.it>
In-Reply-To: <20040124095810.GA6204@percy.comedia.it>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Message-Id: <200401252110.07895.arekm@pld-linux.org>
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
Date: Sun Jan 25 15:12:01 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@sistina.com
Cc: Luca Berra <bluca@comedia.it>

Dnia sob 24. stycznia 2004 10:58, Luca Berra napisa=B3:
> On Sat, Jan 24, 2004 at 01:37:35AM +0100, Arkadiusz Miskiewicz wrote:
> >Are there any plans to add makefile target which would produce very small
> > + features stripped down lvm binary with only two commands:
> >vgscan vgchange
> >for usage on initrd images?
>
> patches for lvm2 are:
> http://www.comedia.it/~bluca/cooker/lvm2/lvm2-2.00.08-7mdk/LVM2.2.00.08-d=
ie
>t.patch.bz2
Thanks, I've modified these for my needs.
http://cvs.pld-linux.org/cgi-bin/cvsweb/SOURCES/lvm2-initrd.patch?rev=3D1.1

Unfortunately this doesn't give any significant size drop:
lvm staticly linked with uClibc and device-mapper lib with all features
=2Drwxr-xr-x    1 misiek   users      555815 2004-01-25 21:05 initrd-lvm
lvm staticly linked with uClibc and device-mapper lib using my patch above =
(so=20
only vgscan and vgchange functions available)
=2Drwxr-xr-x    1 root     root       482428 2004-01-25 20:51 initrd-lvm

How these sizes look with dietlibc?

Also some problems with lvm way of checking what command user wants based o=
n=20
argv[0] came out:
[root@arm misiek]# /sbin/initrd-lvm
  No such command.  Try 'help'.
[root@arm misiek]# ln -s /sbin/initrd-lvm lvm
[root@arm misiek]# ./lvm
  Please supply an LVM command.
  Available lvm commands:
  Use 'lvm help <command>' for more information

  help            Display help for commands
  vgchange        Change volume group attributes
  vgscan          Search for all volume groups
  version         Display software and driver version information

It would be much better if when argv[0] is not known internally for lvm the=
n=20
work as argv[0] =3D lvm.

> L.

=2D-=20
Arkadiusz Mi=B6kiewicz     CS at FoE, Wroclaw University of Technology
arekm.pld-linux.org, 1024/3DB19BBD, JID: arekm.jabber.org, PLD/Linux
