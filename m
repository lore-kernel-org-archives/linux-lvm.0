Content-Class: urn:content-classes:message
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Message-ID: <CEADF0D83077F7458B763904E47AA709BD64@exchange.neokimia.com>
From: "Yanick Quirion" <yanick.quirion@neokimia.com>
Subject: [linux-lvm] Is there a maximum for LV?
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
Date: Tue Dec  9 08:31:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@sistina.com

Hi,

On the past I was using lvm 1.1rc2. For an unknown reason, the version =
is not anymore available.
But with this version, when I do a "vgdisplay" I was able to saw the LV =
Max Size:

[moonlight]:/# vgdisplay   =20
--- Volume group ---
VG Name               vg1=20
VG Access             read/write
VG Status             available/resizable
VG #                  1
MAX LV                255
Cur LV                1
Open LV               1
MAX LV Size           1023.97 GB  <----------
Max PV                255
Cur PV                2
Act PV                2
VG Size               254.31 GB
PE Size               16 MB
Total PE              16276
Alloc PE / Size       16276 / 254.31 GB
Free  PE / Size       0 / 0
VG UUID               31iNWK-Ario-C4tq-yQNi-sGVk-gGs0-CjVV7T

How I'm testing LVM2. The field "MAX LV Size" is not there anymore. Is =
this means that LV doesn't have a maximum?

Output from LVM2:
[neptune]:/u# lvm vgdisplay vg02
  /dev/cdrom: open failed: Read-only file system
  --- Volume group ---
  VG Name               vg02
  System ID             localhost.localdomain1070620502
  Format                lvm2
  Metadata Areas        2
  Metadata Sequence No  18
  VG Access             read/write
  VG Status             resizable
  MAX LV                256
  Cur LV                1
  Open LV               1
  Max PV                256
  Cur PV                2
  Act PV                2
  VG Size               50.86 GB
  PE Size               4.00 MB
  Total PE              13019
  Alloc PE / Size       13019 / 50.86 GB
  Free  PE / Size       0 / 0  =20
  VG UUID               Rw0ckX-GCd2-vlyF-KSWf-Q5tg-Qp2u-0Qjc7E


I just want to make sure that my configuration is all set to support =
very large LV.

Thanks again for your precious help!

Regards!

-----------
Yanick Quirion
Administrateur R=E9seau/Network Manager
NEOKIMIA INC.
Institut de Pharmacologie de Sherbrooke
3e =E9tage (=C9difice Z5)
3001 12e avenue Nord
Sherbrooke, Qu=E9bec
CANADA
J1H 5N4
=A0
T=E9l.:=A0=A0=A0 +1 819 820-6040
Direct:=A0 +1 819 820-6855
Fax.:=A0=A0=A0 +1 819 820-6841
=A0
email: Yanick.Quirion@neokimia.com
