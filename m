From: "Alberto Picon Couselo" <albertopicon@asociacionser.org>
Message-ID: <000101c33ff3$65beed00$1a01a8c0@carpetana07>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: [linux-lvm] LVM 1.0.7, kernel 2.4.21 and snapshots over ext3 filesystem
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
Date: Tue Jul  1 12:09:03 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@sistina.com

Hello everybody. I'm having a lot problems trying to enable snapshots on =
an
EXT3 Logical Volume. I was using LVM 1.0.4 and I decided to upgrade to =
LVM
1.0.7 and Linux kernel 2.4.21 on a Debian 3.0 to fix it. I have =
downloaded
the following sources:

Sistina WebPage LVM Sources: lvm 1.0.7
LinuxKernel Kernel 2.4.21 sources from http://www.kernel.org

After executing ./configure script of LVM, I built VFS patch for 2.4.21,
lvm-1.0.7-2.4.21.patch, and I patched the kernel (2.4.21 at =
/usr/src/linux)
using "patch -p1 < /usr/src/LVM/1.0.7/PATCHES/lvm-1.0.7-2.4.21.patch". I
compiled and installed LVM package using "make" and "make install". =
After
that, I enabled LVM as a module and FileSystems->Vistual Memory =
Filesystem
option in the kernel using "make menuconfig". I compiled the kernel and
after reboor LVM seems to work correctly.

However, when I create a snapshot volume:

$:/usr/src/linux# lvcreate -L500M -s -n spoolbackup /dev/storage/spool
lvcreate -- WARNING: the snapshot will be automatically disabled once it
gets full
lvcreate -- INFO: using default snapshot chunk size of 64 KB for
"/dev/storage/spoolbackup"
lvcreate -- doing automatic backup of "storage"
lvcreate -- logical volume "/dev/storage/spoolbackup" successfully =
created

And I try to mount it:

$:/usr/src/linux# mount -t ext3 -r /dev/storage/spoolbackup /mnt/temp/
mount: wrong fs type, bad option, bad superblock on
/dev/storage/spoolbackup,
       or too many mounted file systems

What's happenning?. I have upgraded LVM to 1.0.7, compiled VFS-lock =
kernel
patch for LVM using LVM native utility, compiled the kernel, and =
everything
seems to work fine. However, snapshots do not mount correctly.  =20

Please, please, help me,
Thanks in advance,
Alberto Picon

Alberto Pic=F3n Couselo
Departamento Inform=E1tica y Telecomunicaciones
Asociaci=F3n SER (Ser, Estar, Responder)
------------------------------------------------------------------
Tel=E9fono: (91)554.36.37 - M=F3vil: 615.22.77.55 - FAX: (91)534.27.59
Email: albertopicon@asociacionser.org
------------------------------------------------------------------=20
=20
