Message-ID: <1195.192.168.1.26.1057151067.squirrel@www.asociacionser.org>
Subject: Re: [linux-lvm] LVM 1.0.7, kernel 2.4.21 and snapshots over ext3 filesystem
From: "Alberto Picon Couselo" <albertopicon@asociacion-ser.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Date: Wed Jul  2 08:05:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Wolfgang, thank you very, very much for your advice.

As you told me, I've downloaded "fresh" copies of Linux 2.4.21 kernel, LV=
M
1.0.7 and linux-2.4.21-VFS-lock.patch (at
http://evms.sourceforge.net/patches/1.2.1/2.4.21/).

Following your instructions, I generated and patched the kernel using
lvm-1.0.7-2.4.21.patch. After that, I tried to patch the kernel using
linux-2.4.21-VFS-lock.patch and I received an error message from patch
program requiring me a file path to patch evms.c source file. I do not
have installed evms package, so I decided to skip that patch, and continu=
e
patching lvm module and I recompiled the whole kernel using my custom
configuration (make menuconfig; Load configuration option...).

Now, I'm able to create a snapshot and mount it, but I receive a strange
warning message (even if I mount it readonly):

$~# mount -t ext3 -r /dev/storage/snap /mnt/temporal/
Can't write to read-only device 3a:04
kjournald starting.  Commit interval 5 seconds
Can't write to read-only device 3a:04
EXT3-fs: mounted filesystem with ordered data mode.

Anyway, the snapshot is mounted and it's visible... So, it seems to
work... What's your opinion about this?

Thanks a lot for you help and advice,
Alberto Picon

--=20
Alberto Picon Couselo
Depto. Telecomunicaciones e Informatica
Asociacion SER
