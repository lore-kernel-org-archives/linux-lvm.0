Message-ID: <00aa01c12fc9$5f3cda00$3300a8c0@local>
From: "Hostmaster \(www\)" <hostmaster@webworldworkshop.com>
Date: Tue, 28 Aug 2001 07:57:20 -0600
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_00A7_01C12F97.10B689D0"
Subject: [linux-lvm] Bug in the min and max macros in lvm-snap.c
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

------=_NextPart_000_00A7_01C12F97.10B689D0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,

I'm installing the lvm_1.0.1-rc1 patch to a RedHat install (kernel =
2.4.3-12).

After installing the kernel patch, the kernel build was failing on the =
min and max macros in lvm-snap.c.
It appears the new version changed the min and max macros in the =
lvm-internal.h header file to include type. However, it appears that the =
lvm-snap.c min and max are still using the old definition.

Since I'm not intending to use the snap functionality in the near =
future. I used this for quick workaround, I just added a snapmin and and =
snapmax macro definition in lvm-internal.h and changed the instances of =
min and max in the lvm-snap.c to use the new snapmin and snapmax macros. =
This allows the kernel to build.

Thanks,
David Lightsey


------=_NextPart_000_00A7_01C12F97.10B689D0
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1">
<META content=3D"MSHTML 5.50.4616.200" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2>Hi,</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>I'm installing the lvm_1.0.1-rc1 patch =
to a RedHat=20
install (kernel 2.4.3-12).</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>After installing the kernel patch, the =
kernel build=20
was failing on the min and max macros in lvm-snap.c.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>It appears the new version changed the =
min and max=20
macros in the lvm-internal.h header file to include type. However, it =
appears=20
that the lvm-snap.c min and max&nbsp;are still using the old=20
definition.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Since I'm not intending to use the snap =

functionality in the near future. I used this for&nbsp;quick workaround, =
I just=20
added a snapmin and and snapmax macro definition in lvm-internal.h and =
changed=20
the instances of min and max in the lvm-snap.c to use the new snapmin =
and=20
snapmax macros. This allows the kernel to build.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Thanks,</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>David Lightsey</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV></BODY></HTML>

------=_NextPart_000_00A7_01C12F97.10B689D0--
