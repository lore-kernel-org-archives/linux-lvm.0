From: Sven Falk <lvm@bailong.de>
Message-ID: <20030128122147.GA10180@zeus.bailong.de>
References: <20030127182006.GA6523@zeus.bailong.de> <20030128115025.B17531@sistina.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20030128115025.B17531@sistina.com>
Subject: Re: [linux-lvm] recover LVM system
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
Date: Tue Jan 28 06:22:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hi Heinz!

thanks for your reply.

On Tue, 28 Jan 2003, Heinz J . Mauelshagen wrote:

> you've got no LVM prblem but rather a filesystem one unless
> direct access to the LV fails
> (i.e. "dd if=/dev/system/data of=/dev/null bs=1k count=1024").

zeus:/home/bailong # dd if=/dev/system/data of=/dev/null bs=1k
count=1024
1024+0 records in
1024+0 records out
zeus:/home/bailong #

This doesn't sound good :-(. I tried to add a volume with yast2,
rebooted the computer and he couldn't mount it anymore. I was panicing
and tried to create a new LVM, but didn't create any new FS (is yast2 doing
it automatically?)

> What do mount and fsck display ?

zeus:/home/bailong # mount /dev/system/data /data
mount: you must specify the filesystem type

zeus:/home/bailong # mount -t ext3 /dev/system/data /data
mount: wrong fs type, bad option, bad superblock on /dev/system/data,
       or too many mounted file systems

zeus:/home/bailong # fsck /dev/hda5
fsck 1.26 (3-Feb-2002)
e2fsck 1.26 (3-Feb-2002)
Couldn't find ext2 superblock, trying backup blocks...
fsck.ext2: Bad magic number in super-block while trying to open
/dev/hda5

The superblock could not be read or does not describe a correct ext2
filesystem.  If the device is valid and it really contains an ext2
filesystem (and not swap or ufs or something else), then the
superblock
is corrupt, and you might try running e2fsck with an alternate
superblock:
    e2fsck -b 8193 <device>

fsck.ext2 /dev/hda5 failed (status 0x8). Run manually!

zeus:/home/bailong # fsck /dev/hdb5
fsck 1.26 (3-Feb-2002)
e2fsck 1.26 (3-Feb-2002)
Couldn't find ext2 superblock, trying backup blocks...
fsck.ext2: Bad magic number in super-block while trying to open
/dev/hdb5

The superblock could not be read or does not describe a correct ext2
filesystem.  If the device is valid and it really contains an ext2
filesystem (and not swap or ufs or something else), then the
superblock
is corrupt, and you might try running e2fsck with an alternate
superblock:
    e2fsck -b 8193 <device>

fsck.ext2 /dev/hdb5 failed (status 0x8). Run manually!

Seems no recovery possible....

Cheers
Sven
