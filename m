Return-Path: <treed@ultraviolet.org>
Date: Thu, 7 Dec 2000 03:39:11 -0800
From: Tracy R Reed <treed@ultraviolet.org>
Message-ID: <20001207033911.E7573@ultraviolet.org>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] How do you mount a snapshot?
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
To: linux-lvm@sistina.com

From what I've read it looks like the oopses on mounting snapshots have
been fixed since I last tried playing with them so I am at it again. I
have a freshly installed RH7.0 system with the 2.4.0-test10 kernel patched
for LVM 0.9 and reiserfs 3.6.22. I can successfully create a snapshot
with:

lvcreate -s -L16 -nsnapshot /dev/vg-sdb1/lv-sdb1

but when I try to mount it:

[root@computer /usr2]# mount -t reiserfs /dev/vg-sdb1/snapshot /snap/
mount: block device /dev/vg-sdb1/snapshot is write-protected, mounting read-only
mount: wrong fs type, bad option, bad superblock on /dev/vg-sdb1/snapshot,
       or too many mounted file systems

Without specifying the filesystem type I get:

[root@computer /usr2]# mount /dev/vg-sdb1/snapshot /snap/
mount: /dev/vg-sdb1/snapshot has wrong major or minor number

I was using mount mount-2.10m but I downloaded the fileutils and compiled
and tried mount-2.10r and I get the same results.

What else do I need to do in order to get a snapshot mounted?

-- 
Tracy Reed      http://www.ultraviolet.org
