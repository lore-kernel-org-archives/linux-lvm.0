From: Luca Lavorante <luca@dedalus.com.br>
Message-id: <3DA6B710.6060304@dedalus.com.br>
MIME-version: 1.0
Content-transfer-encoding: QUOTED-PRINTABLE
Subject: [linux-lvm] question about LVM kernel module - mirroring
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
Date: Fri Oct 11 06:33:13 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: linux-lvm@sistina.com

Hi everybody, I am new to the list and hope you will excuse my (perha=
ps)=20
silly questions.

1) I have seen in the LVM documentation that the program is divided i=
nto:

   - A kernel module
   - a set o binaries (commands etc.)

I=B4d like to know whether it is possible to use LVM WITHOUT a kernel=
=20
module. I mean a deamon process. I=B4m asking that because sometimes =
I am=20
not allowed to recompile the kernel on production machines.

2) How can I perform mirroring using LVM? I know the kernel can do th=
at=20
on local disks. Is it possible for the kernel of  two clustered machi=
nes=20
to mirror two disks on an external storage?
I am working on a HA cluster.

Thanks for your attention

        Luca Lavorante
