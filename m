Return-Path: <ardy@rdb.linux-help.org>
Date: Sun, 25 Feb 2001 13:33:05 -0500 (EST)
From: ardy@rdb.linux-help.org
Message-ID: <Pine.LNX.4.20.0102251304220.27667-100000@rdb.linux-help.org>
MIME-Version: 1.0
Subject: [linux-lvm] Slackware init
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

I've set up LVM on a slackware 7.0 box, its working for the most part, I
have some oddities I'd like to clear up as I may not be initializing LVM
correctly at boot. I'm trying to mount the volumes from fstab, when the
other partitions get mounted after /.

I have the following in fstab:

/dev/ws_scsi/ws_scsi_01 /home reiserfs        defaults   1   1
/dev/ws_scsi/ws_scsi_02 /mnt/scsi reiserfs    defaults   1   1

I have lvm as a module, and two modules.conf aliases for it:

alias block-major-58      lvm-mod
alias char-major-109      lvm-mod

I have placed the two lvm startup commands in rc.S right after / is
mounted read-write:

 # Remount the root filesystem in read-write mode
 echo "Remounting root device with read-write enabled."
 /sbin/mount -w -v -n -o remount /
 # Initialize Logical Volume Manager
 /sbin/vgscan
 /sbin/vgchange -ay

What happens is when vgscan starts, it takes about 1.5 minutes to scan,
and while its scanning, the kernel is reporting a whole lot of modprobe
errors for modules I don't have/need. What I ended up doing was aliasing
off the block-major devices that were being scanned that I don't have on
my system:

alias block-major-9     off
alias block-major-22    off
alias block-major-33    off
alias block-major-34    off
alias block-major-48    off
alias block-major-49    off
alias block-major-50    off
alias block-major-51    off
alias block-major-52    off
alias block-major-53    off
alias block-major-54    off
alias block-major-55    off

Consequently, the loop block module gets loaded because it too is scanned. 
After the 1.5 minute scan, everything is mounted from fstab, including the
LVM volumes. 

Also, I had written my own rc.lvm, and was calling it at the end of rc.S,
now this worked, but wasn't exactly what I wanted, since what I want is
for the volumes to load from fstab with the rest of the partitions.
But the scan only took a few moments when done this way.

So, am I doing something incorrectly here? 
Why is the scan taking so long?
Why are devices nonexistent on my machine being scanned for?
Is there a better way to implement this under Slackware?

Thanks,
R. Dicaire
