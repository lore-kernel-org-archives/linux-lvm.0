Return-Path: <Jean-Eric.Cuendet@linkvest.com>
Message-ID: <B45465FD9C23D21193E90000F8D0F3DF683CBE@mailsrv.linkvest.com>
From: Jean-Eric Cuendet <Jean-Eric.Cuendet@linkvest.com>
Subject: RE: [linux-lvm] Lost filesystems on LVs (forgot the attachment)
Date: Tue, 15 May 2001 18:36:45 +0200
MIME-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "'linux-lvm@sistina.com'" <linux-lvm@sistina.com>

> If dumpe2fs shows the superblock, then e2fsck should also 
> work.  I assume
> that you ran dumpe2fs AFTER the resize?  Is it possible e2fsck is
> refusing to work on the backups LV because of the large_file flag set?
> What version of e2fsck are you using?  You should update to 1.19 at:
> http://sourceforge.net/projects/e2fsprogs/

I have 1.19 version. Here is the output of the fsck:

e2fsck /dev/NORAID_HDX/backups
e2fsck 1.19ea, 30-Aug-2000 for EXT2 FS 0.5b, 95/08/09
Group descriptors look bad... trying backup blocks...
e2fsck: Bad magic number in super-block while trying to open
/dev/NORAID_HDX/backups
 
The superblock could not be read or does not describe a correct ext2
filesystem.  If the device is valid and it really contains an ext2
filesystem (and not swap or ufs or something else), then the superblock
is corrupt, and you might try running e2fsck with an alternate superblock:
    e2fsck -b 8193 <device>
 
[root@fatboy filesrv]#

e2fsck -b 8193 doesn't help...
Any idea?
-jec
