Return-Path: <allanwind@mediaone.net>
Date: Thu, 19 Jul 2001 09:10:14 -0400
Subject: Re: [linux-lvm] I/O error: dev 08:11, sector 0
Message-ID: <20010719091014.A18381@digit-safe.dyndns.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="82I3+IH0IqGh5yIs"
Content-Disposition: inline
In-Reply-To: <20010719111351.A28183@sistina.com>
From: Allan M. Wind <allanwind@mediaone.net>
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
To: linux-lvm@sistina.com

--82I3+IH0IqGh5yIs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2001-07-19 11:13:51, Heinz J. Mauelshagen wrote:

> 08:11 (/dev/sda11) shows that I/O error, you use /dev/sdb, which is 08:16
> for your VG -> no problem for LVM.
> If there's a file system on /dev/sda11 *and* just the first sector is not
> accessable, you can still happily access the filesystem, because it doesn=
't use
> that sector at all.
> But you should check and probably replace your sda drive to avoid
> trouble in the future.

Hmm... I do not have a /dev/sda11, only sda1 & sda2 (root and swap
respectively).  However, I was aware that my sdc drive was dying
(the drive was scsi id 8 / sdb when this was logged):

Jul 14 09:33:58 digit-safe kernel: scsi0: ERROR on channel 0, id 8, lun 0, =
CDB: Read (10) 00 00 09 c9 48 00 00 18 00=20
Jul 14 09:33:58 digit-safe kernel: Info fld=3D0x9c952, Current sd08:12: sen=
se key Medium Error
Jul 14 09:33:58 digit-safe kernel: Additional sense indicates Data synchron=
ization mark error
Jul 14 09:33:58 digit-safe kernel:  I/O error: dev 08:12, sector 577872


/Allan
--=20
Allan M. Wind			email: allanwind@mediaone.net
P.O. Box 2022			finger: awind@digit-safe.dyndns.org (GPG/PGP)
Woburn, MA 01888-0022
USA

--82I3+IH0IqGh5yIs
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE7Vtw0erJrYp1ydncRAgJKAJ97m96s0XQ93jgX6jFyekWik0QKjgCfe6cW
yDky3M0yDCttgUjYD7UYtws=
=DPwu
-----END PGP SIGNATURE-----

--82I3+IH0IqGh5yIs--
