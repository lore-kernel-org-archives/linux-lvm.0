Return-Path: <ka@filanet.dk>
From: "Klaus Agnoletti" <ka@filanet.dk>
Date: Wed, 11 Jul 2001 22:03:47 +0200
Message-ID: <MPEELPOMDADEHPNEDEPBCELPCAAA.ka@filanet.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: [linux-lvm] Just installed LVM on deb - got module errors - retry
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
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@sistina.com

Hi there

I tried reading both the How-to and the README.debian file - and everything
else I could find, and found nothing that could help me.
I must be missing some block device - how do I get that ?
Can I do it the easy way at all ? - without compiling a new kernel ? (I am
just being lazy on this - I know that :-)
Later on when I tried LVM out and know how great it is, I will make it all
the hard way =3D)

Thanks in advance

/Klaus
-----Oprindelig meddelelse-----
Fra: linux-lvm-admin@sistina.com [mailto:linux-lvm-admin@sistina.com]P=EF=
=BF=BD
vegne af Klaus Agnoletti
Sendt: 10. juli 2001 22:08
Til: linux-lvm@sistina.com
Emne: [linux-lvm] Just installed LVM on deb - got module errors


Hi,

I just installed lvm 0.9.1 beta 7 from .deb archives via apt-get
For some reason I get the following error when trying to prepare a LVM
partition :

vault:/etc/modutils# pvcreate /dev/hdb1
pvcreate -- LVM driver/module not loaded?

Clearly it is missing a kernel module.

trying to modprobe lvm-mod gives the following error :

vault:/etc/modutils# modprobe lvm-mod
modprobe: Can't locate module lvm-mod

I assume the following messages in /var/log/syslog is related :

Jul 10 22:00:02 vault modprobe: modprobe: Can't locate module char-major-109
Jul 10 22:00:02 vault modprobe: modprobe: Can't locate module char-major-109

So I guess that this really is what it needs. Am I right ? - how do I get
this then ?

If I am totally off the track, please help me back =3D)


Thanks in advance


Klaus Agnoletti

_______________________________________________
linux-lvm mailing list
linux-lvm@sistina.com
http://lists.sistina.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
