From: Anders Widman <andewid@tnonline.net>
Message-Id: <224974437.20020227233630@tnonline.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] filesystem corruption...
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
Date: Wed Feb 27 16:36:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Hello everyone...

One of my disks in a LVM volume with ReiserFS has some bad blocks
(maybe a few MB). I noticed this as all programs (Samba, mc,
mount/umount etc) trying to access files on those bad blocks
hang/freeze, an can't be killed. So I had to reboot in order to force
a unmount of my volume so I could correct my bad blocks (replacing the
drive).

Unfortunatley, something went seriously wrong. I can't mount the disk
any more, or use reiserfsck. They (mount/reiserfsck) say there isn't
a valid filesystem on the device. Vgscan does however find all devices
and can activate the volume group, but reiserfsck doesn't work.

What should I do to be able to save a s much data as possible?


//Anders
