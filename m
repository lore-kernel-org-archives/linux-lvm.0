Message-Id: <200108282153.f7SLr3b05929@foo-bar-baz.cc.vt.edu>
From: Valdis.Kletnieks@vt.edu
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="==_Exmh_245552422P";
	 micalg=pgp-sha1; protocol="application/pgp-signature"
Content-Transfer-Encoding: 7bit
Date: Tue, 28 Aug 2001 17:53:02 -0400
Subject: [linux-lvm] Very small but important whoops in lvmcreate_initrd in 1.0.1-rc1
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
To: LVM-Devel@sistina.com, Linux-LVM@sistina.com

--==_Exmh_245552422P
Content-Type: multipart/mixed ;
	boundary="==_Exmh_2418536170"

This is a multipart MIME message.

--==_Exmh_2418536170
Content-Type: text/plain; charset=us-ascii

There was a gratuitous 'shift' in the script, causing it to swallow the
next parameter.  This wasn't very nice when I tried to call it with
'--nodep 2.4.9' and watched it over-write my initrd-lvm-2.4.5.gz ;)

Patch attached.

-- 
				Valdis Kletnieks
				Operating Systems Analyst
				Virginia Tech


--==_Exmh_2418536170
Content-Type: application/x-patch ; name="mkinitrd.patch"
Content-Description: mkinitrd.patch
Content-Disposition: attachment; filename="mkinitrd.patch"

*** tools/lvmcreate_initrd	Fri Aug 17 14:58:24 2001
--- tools/lvmcreate_initrd.fixed	Tue Aug 28 17:44:41 2001
***************
*** 116,122 ****
     case $1 in
     -h|--help) usage; exit 0;;
     -i|--iop) IOP=$2; shift;;
!    -M|--nomod) USEMOD=""; shift;;
     -V|--version) exit 0;;
     -d|-v|--debug|--verbose) VERBOSE="y";;
     [2-9].[0-9]*.[0-9]*) VERSION=$1;;
--- 116,122 ----
     case $1 in
     -h|--help) usage; exit 0;;
     -i|--iop) IOP=$2; shift;;
!    -M|--nomod) USEMOD="";;
     -V|--version) exit 0;;
     -d|-v|--debug|--verbose) VERBOSE="y";;
     [2-9].[0-9]*.[0-9]*) VERSION=$1;;

--==_Exmh_2418536170--


--==_Exmh_245552422P
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: PGP 6.5.8
Comment: Exmh version 2.5 07/09/2001

iQA/AwUBO4wSvnAt5Vm009ewEQKqsACgnE88qR8enk6SLIZqQVZeF7tIDd8AoJZz
/KRR89JZpPHra6Na9n/pTySW
=IhUl
-----END PGP SIGNATURE-----

--==_Exmh_245552422P--
