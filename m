From: "Erick Calder" <e@arix.com>
Message-ID: <00a401c18504$33a10ac0$0300000a@pacbell.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <NBBBKLKHMJHIJLHOGAOJKELJJCAA.steve.wray@the.net.nz>
Subject: [linux-lvm] catch-22
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
Date: Fri Dec 14 19:03:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

a drive part of a volume crashed on me... I've looked through the man pages
and HOWTO but find no happiness... help!

the volume used to be called LVM (/dev/LVM) and had /dev/hda3 and
/dev/hdc... hdc crashed and I've replaced it with an identical drive.  I did
a "pvcreate /dev/hdc" after installation but cannot seem to add it to the
volume:

# vgextend LVM /dev/hdc
vgextend -- volume group "LVM" doesn't exist

and if I try to create it:

# vgcreate LVM /dev/hdc
vgcreate -- volume group directory or file already exists
vgcreate -- please choose a different name

I look in:

# ls /dev/LVM
total 104
dr-xr-xr-x    2 root     root         4096 Oct 26 12:54 ./
drwxr-xr-x   14 root     root        98304 Dec 13 17:46 ../
crw-r-----    1 root     disk     109,   0 Oct 26 12:54 group
brw-rw----    1 root     disk      58,   0 Oct 26 12:54 mp3z

# ls /proc/lvm/VGs
total 0
dr-xr-xr-x    2 root     root            0 Dec 14 17:52 ./
dr-xr-xr-x    3 root     root            0 Dec 14 17:52 ../

what is the correct procedure to follow? shall I just blow away the /dev/LVM
directory and do a "pvcreate -ff /dev/hda3"?

1k thx - e
