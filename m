From: Kai Weber <lists@glorybox.de>
Message-ID: <20040114113509.GA745@glorybox.de>
Mime-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: [linux-lvm] Strange file system errors
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
Date: Wed Jan 14 06:36:01 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@sistina.com

Hi,

if I have to reboot my system without a clean shutdown the recovered
filesystems are corrupt. Files which I edited recently and maybe not yet
written to the buffer are recovered with no or corrupt contents.=20

For example:

$ ls -l config
-rw-------    1 bond     bond        19622 Jan 14 12:04 .config
$ stat config
  File: `config'
  Size: 19622           Blocks: 0          IO Block: 4096   regular file
Device: fe01h/65025d    Inode: 20967432    Links: 1
Access: (0600/-rw-------)  Uid: ( 1000/    bond)   Gid: ( 1000/    bond)
Access: 2004-01-14 12:27:01.000000000 +0100
Modify: 2004-01-14 12:04:16.000000000 +0100
Change: 2004-01-14 12:04:16.000000000 +0100
$ cat config
$ less config
"config" may be a binary file.  See it anyway?
^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@
[...]
$ strace -e write cat config
write(1, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096)=
 =3D 4096
write(1, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096)=
 =3D 4096
write(1, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096)=
 =3D 4096
write(1, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096)=
 =3D 4096
write(1, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 3238)=
 =3D 3238

I can force this error by pressing the reset button with an open file in my
text editor. It seems to have nothing to do with the underlying file
system. I have XFS and ext3 partitions. I would like to know, if it is a
LVM problem.=20

Kernel 2.6.1
LVM version:     2.00.08 (2003-11-14)
Library version: 1.00.07-ioctl (2003-11-21)
Driver version:  4.0.0

--=20
  Kai Weber
=BB kai.weber@glorybox.de
  http://www.glorybox.de
