From: Anders Widman <andewid@tnonline.net>
Message-Id: <04QKIFOKE0E9XSJIWRCAD0V3Y3UQ3Y.3c2ce3cf@kadzuki>
MIME-Version: 1.0
Subject: [linux-lvm] Removing a physical volume.
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
Date: Fri Dec 28 15:28:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hello everyone!

I tried to look in various help-files and FAQ's but did not find a suitable guide. I have a LVM system with a few disks, and everything works fine. Now I need to remove a physical disk (to put somewhere else, in another 
machine).


This is my current setup:

14 physical disks in one logical volume (share) formated with reiserfs, in one volumegroup (server). There are no free physical extents, though there are about 150GB free space in the filesystem.

I want to remove one physical disk and have all data moved over to the remaining disks.

//Anders
