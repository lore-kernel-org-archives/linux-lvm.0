MIME-Version: 1.0
From: Kjartan Reynir Hauksson <krh@os.is>
Message-ID: <OFC233D70E.1FE3DC79-ON00256E0D.001186FF-00256E0D.00118725@svunta.os.is>
Content-transfer-encoding: quoted-printable
Subject: [linux-lvm] booting a dm+lvm2 kernel
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
Date: Tue Dec 30 21:21:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@sistina.com





Hello all.

I've been scratching my head on this for a few days now.  I decided to =
to
migrate to kernel 2.6 but first I need to migrate from lvm1 to dm+lvm2
(from what I understand).  So I've allready patched a vanilla 2.4.22 ke=
rnel
with the device-mapper patch and with lvm2 support build into the kerne=
l
and it compiled just fine. However since I'm running my root filesystem=
 on
lvm I'm stuck on how to booth the sob.  I tried to add the a new kernel=
 to
my lilo.conf using root=3D/dev/root/1 but all I get is kernel panic.  F=
rom
what I've read I nead to create an initrd image but thats where the doc=
s
and previous posts get a little fuzzy.  So what are the next few steps =
for
me ?  Could someone shed some light on this because I've been googling =
for
a while now and I seem to be utterly stuck in the mud here :(

TIA
-Kjartan


-----------------------------------------------------------------------=
----------------------------

Kjartan Reynir Hauksson
Kerfisstj=F3ri
Orkustofnun
S=EDmi: 569-6027/863-5912
e-mail: krh@os.is
-----------------------------------------------------------------------=
---------------------------

http://www.os.is/disclaimer.html=
