From: timshel@pobox.com
MIME-Version: 1.0
Message-Id: <3C352FFF.1946.1910201@localhost>
Content-Transfer-Encoding: 7BIT
Content-Description: Mail message body
Subject: [linux-lvm] Fixing corrupted LVM PV headers?
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
Date: Thu Jan  3 11:30:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

[please CC me all replies, I'm not on this list]

Hi,

I've been using LVM on my home system for quite some time now, and I 
have just recently install Windows XP, which totally stuffed up my 
partitioning for some reason. Anyway, in the process of fixing the 
stuff up I've managed to corrupt the first 3 sectors or so (at least, I 
hope it's only 3 sectors) of one of the physical volumes that make up 
my main volume group. So I've effectively lost my entire Linux system.

I'd rather not have to reinstall from scratch, as there was quite a bit 
of stuff on some of the filesystems that would take me some time to 
replace, so I'm wondering if there is any way of resurrecting the PV. 
I've got the UUID of the PV (from running pvdisplay on the other PV's 
in the group and working out which one was missing) ... If it's not 
possible to recover the filesystem(s) that were on that particular PV, 
would it be at all possible to recover filesystems that are entirely on 
the other PV's?

My setup is the following:

hda6:	8Gb PV (This is the stuffed one)
hda7:   8Gb PV
hda8:   8Gb PV
hdb6:   8Gb PV
hdc:     3Gb PV

There were 5 different LV's on the VG, all with XFS filesystems except 
for a swap volume.

/usr		~4Gb LV
/home		~2Gb LV
/var:		~1.3Gb LV
/var/share	~7Gb LV
/var/chroot	~1Gb LV

If anyone has any suggestions on possibilites for fixing this, please 
let me know ...

Thanks,

Timshel

--
Timshel Knoll <timshel@pobox.com> / <timshel@debian.org>
Debian GNU/Linux developer, see www.debian.org
