Date: Mon, 27 Aug 2001 14:34:21 +0200
Message-ID: <B45465FD9C23D21193E90000F8D0F3DF404FEA@mailsrv.linkvest.com>
MIME-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----_=_NextPart_001_01C12EF4.991E8512"
content-class: urn:content-classes:message
From: "Jean-Eric Cuendet" <Jean-Eric.Cuendet@linkvest.com>
Subject: [linux-lvm] Strange message with 2.4.8+1.0.1rc1
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

This is a multi-part message in MIME format.

------_=_NextPart_001_01C12EF4.991E8512
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable


Hi,
I have 3 80Gb disks in LVM. I create a LVM volume group + Logical
volume. All is fine.
Then, I reboot. After that, it's no more visible.=20
If I run vgscan, nothing is found. vgchange -ay doesn't help either.
More, I can't recreate a VG with the same name, but it doesn't appear
anywhere (in /dev, /etc nor /proc/lvm/global). If I run a pvcreate on
the device that made the VG, it say that these are used by an unknown
VG. I must use -ff to recreate them and be able to recreate my VG. But
next reboot, it will be lost...

FYI, I set 8e on all the LVM partitions (4 partitions on each disk)
I have 1.0.1rc1 (tools + kernel) and 2.4.8.=20

Any idea?
Thanks
-jec

---------------------------------------------------
Jean-Eric Cuendet
Linkvest SA
Av des Baumettes 19, 1020 Renens Switzerland
Tel +41 21 632 9043  Fax +41 21 632 9090
http://www.linkvest.com  E-mail: jean-eric.cuendet@linkvest.com
---------------------------------------------------

------_=_NextPart_001_01C12EF4.991E8512
Content-Type: text/x-vcard;
	name="Jean-Eric Cuendet.vcf"
Content-Transfer-Encoding: base64
Content-Description: Jean-Eric Cuendet.vcf
Content-Disposition: attachment;
	filename="Jean-Eric Cuendet.vcf"

QkVHSU46VkNBUkQNClZFUlNJT046Mi4xDQpOOkN1ZW5kZXQ7SmVhbi1FcmljDQpGTjpKZWFuLUVy
aWMgQ3VlbmRldA0KT1JHOkxpbmt2ZXN0IFMuQS47Q0NTUg0KRU1BSUw7UFJFRjtJTlRFUk5FVDpK
ZWFuLUVyaWMuQ3VlbmRldEBsaW5rdmVzdC5jb20NClJFVjoyMDAxMDcyNFQxNDI0MTFaDQpFTkQ6
VkNBUkQNCg==

------_=_NextPart_001_01C12EF4.991E8512--
