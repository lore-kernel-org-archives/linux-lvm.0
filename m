Return-Path: <leowong@i-stt.com.hk>
Message-ID: <000601c0f4bd$f1bbb1e0$3533a8c0@leo2000>
From: "Leo Wong" <leowong@i-stt.com.hk>
Date: Thu, 14 Jun 2001 18:36:54 +0800
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0003_01C0F500.FBF311B0"
Subject: [linux-lvm] LVM kernel patch request
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

------=_NextPart_000_0003_01C0F500.FBF311B0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset="big5"

Dear Sir/Madam,

I am using RedHat7.1 with Kernel version 2.4.2-2. I downloaded the =
binaries patch-generator0.91beta7 rpm. i follow the instructions(i.e. =
./configure and then make in PATCHES, then a patch -p1 < =
/xx/xxx/PATCHES/xxxxx.patch)  to patch the kernel and everything wents =
well when i do a make config in the /usr/src/linux, configuring the LVM =
as a modules.=20

But i cannot do a make modules, after i make dep;make clean;make bzlilo, =
lots of compilation errors jump out.
I then try compile the LVM in the kernel by running make config again. =
after i build everything, when i run the vgscan, it says "lvmiopversion =
-- LVM driver/module not loaded?"

Seemingly the LVM module/compilation doesn't work for this kernel.

Could u please help me on it?

Thanks very much in advance.

Best regards
Leo Wong

------=_NextPart_000_0003_01C0F500.FBF311B0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset="big5"

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META content=3D"text/html; charset=3Dbig5" http-equiv=3DContent-Type>
<META content=3D"MSHTML 5.00.3211.1700" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2>Dear Sir/Madam,</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>I am using RedHat7.1 with Kernel =
version 2.4.2-2. I=20
downloaded the binaries patch-generator0.91beta7 rpm. i follow the=20
instructions(i.e. ./configure and then make in&nbsp;PATCHES, then a =
patch -p1=20
&lt; /xx/xxx/PATCHES/xxxxx.patch)  to patch the kernel </FONT><FONT =
face=3DArial=20
size=3D2>and everything wents well when i do a make config in the =
/usr/src/linux,=20
configuring the LVM as a modules. </FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>But i cannot do a make modules, after i =
make=20
dep;make clean;make bzlilo, lots of compilation errors jump =
out.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>I then try compile the LVM in the =
kernel by running=20
make config again. after i build everything, when i run the vgscan, it =
says=20
"lvmiopversion -- LVM driver/module not loaded?"</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Seemingly the LVM module/compilation =
doesn't work=20
for this kernel.</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Could u please help me on =
it?</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Thanks very much in =
advance.</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Best regards</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>Leo Wong</FONT></DIV></BODY></HTML>

------=_NextPart_000_0003_01C0F500.FBF311B0--
