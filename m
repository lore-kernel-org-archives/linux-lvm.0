Message-ID: <253458D17524064C996F67C97116BF88065927@Oscar-5.north.mcld.net>
From: "Weber, Geoffrey M." <Geoffrey.Weber@mcleodusa.com>
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C39E30.FD97AAE0"
Subject: [linux-lvm] Problems with initrd for LVM2 on 2.6.0-test8 and -test9 kernels..
 .
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
Date: Wed Oct 29 17:53:02 2003
List-Id: <linux-lvm.redhat.com>
To: "'linux-lvm@sistina.com'" <linux-lvm@sistina.com>

This message is in MIME format. Since your mail reader does not understand
this format, some or all of this message may not be legible.

------_=_NextPart_001_01C39E30.FD97AAE0
Content-Type: text/plain

Greetings all,

I have been having quite a few problems getting a server I am setting up to
use root on a LVM2 setup.  I used the "lvmcreate_initrd" script as suggested
on the 'net, and also tried to hand-edit some of the LVM2 requirements into
that initrd image (such as the /dev/mapper/control mknod command from the
initialization script and /lib/devmapper.so library).  As soon as I try to
use LILO or GRUB with the "root=/dev/vg00/root" or "root=3f00" (device major
and minor numbers), my machine hangs after "Uncompressing Linux... Ok,
booting the kernel.".

I have also tried (unsuccessfully) to use an initrd image I found on the
'net at http://www.comedia.it/~bluca/cooker/lvm2/

.. and also tried modifying this to work (along with the evms-supplied
initrd image).  All hang at the same point.  I got an idea to start a shell
inside the initrd image when booting on my setup root partition to see what
I could find out. When trying to use the Busybox "ash" command inside the
modified evms initrd image, however, the machine doesn't halt and give me a
shell at all but keeps booting.

Is there something that I can try out or that I am overlooking?

Thanks,
    Geoff



NOTICE: This electronic mail transmission may contain confidential
information and is intended only for the person(s) named.  Any use, copying
or disclosure by any other person is strictly prohibited. If you have
received this transmission in error, please notify the sender via e-mail.




------_=_NextPart_001_01C39E30.FD97AAE0
Content-Type: text/html
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2//EN">
<HTML>
<HEAD>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3DUS-ASCII">
<META NAME=3D"Generator" CONTENT=3D"MS Exchange Server version =
5.5.2654.45">
<TITLE>Problems with initrd for LVM2 on 2.6.0-test8 and -test9 =
kernels...</TITLE>
</HEAD>
<BODY>

<P><FONT SIZE=3D2>Greetings all,</FONT>
</P>

<P><FONT SIZE=3D2>I have been having quite a few problems getting a =
server I am setting up to use root on a LVM2 setup.&nbsp; I used the =
&quot;lvmcreate_initrd&quot; script as suggested on the 'net, and also =
tried to hand-edit some of the LVM2 requirements into that initrd image =
(such as the /dev/mapper/control mknod command from the initialization =
script and /lib/devmapper.so library).&nbsp; As soon as I try to use =
LILO or GRUB with the &quot;root=3D/dev/vg00/root&quot; or =
&quot;root=3D3f00&quot; (device major and minor numbers), my machine =
hangs after &quot;Uncompressing Linux... Ok, booting the =
kernel.&quot;.</FONT></P>

<P><FONT SIZE=3D2>I have also tried (unsuccessfully) to use an initrd =
image I found on the 'net at <A =
HREF=3D"http://www.comedia.it/~bluca/cooker/lvm2/" =
TARGET=3D"_blank">http://www.comedia.it/~bluca/cooker/lvm2/</A></FONT></=
P>

<P><FONT SIZE=3D2>.. and also tried modifying this to work (along with =
the evms-supplied initrd image).&nbsp; All hang at the same =
point.&nbsp; I got an idea to start a shell inside the initrd image =
when booting on my setup root partition to see what I could find out. =
When trying to use the Busybox &quot;ash&quot; command inside the =
modified evms initrd image, however, the machine doesn't halt and give =
me a shell at all but keeps booting.</FONT></P>

<P><FONT SIZE=3D2>Is there something that I can try out or that I am =
overlooking?</FONT>
</P>

<P><FONT SIZE=3D2>Thanks,</FONT>
<BR><FONT SIZE=3D2>&nbsp;&nbsp;&nbsp; Geoff</FONT>
</P>
<BR>
<BR>

<P><B><FONT SIZE=3D2>NOTICE: This electronic mail transmission may =
contain confidential information and is intended only for the person(s) =
named.&nbsp; Any use, copying or disclosure by any other person is =
strictly prohibited. If you have received this transmission in error, =
please notify the sender via e-mail.</FONT></B></P>
<BR>
<BR>

</BODY>
</HTML>
------_=_NextPart_001_01C39E30.FD97AAE0--
