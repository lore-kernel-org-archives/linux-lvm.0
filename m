Date: Tue, 11 Jan 2000 09:53:11 +0100
From: Peter Knott <knott@fgan.de>
Reply-To: Peter Knott <knott@fgan.de>
Message-ID: <6411.000111@fgan.de>
Subject: [linux-lvm] SuSE Linux 6.3 and LVM
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@msede.com

I tried installing LVM using the installation program YAST
provided by SuSE which offers facilities to create physical
volume groups and logical volumes.
I succesfully created a PV consisting of 2 partitions:
  sda1 ( 500MB)
  sdc1 (4300MB)

When I tried to create a LV of any size (I tried 1MB up to the
max. amount) YAST returned an error message:
error code: 95
"malloc ..."

Has anyone tried to use the LVM support in SuSE Linux 6.3? If
yes, have you encountered similar problems or is this a problem
with my hardware?

Best regards,
Peter Knott

--------------------------------------------------------------------
Ich bevorzuge sichere email! Bitte meinen PGP Schl=EF=BF=BDssel verwenden:
 http://wwwkeys.pgp.net:11371/pks/lookup?op=3Dget&search=3D0x4B6BBB72
 http://www.trustcenter.de:11371/pks/lookup?op=3Dget&search=3D0x4B6BBB72
