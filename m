Message-Id: <10947ADEA6491B4DB463E21E7C358CC203C74DE5@CAIRVEXMB01.irvn.ca.vzwcorp.com>
From: "Donaldson, Leslie" <Leslie.Donaldson@VerizonWireless.com>
MIME-Version: 1.0
Subject: [linux-lvm] pvvolume extension on the same part.
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
Date: Tue Apr 23 09:26:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "'linux-lvm@sistina.com'" <linux-lvm@sistina.com>
Cc: "'donaldlf@cs.rose-hulman.edu'" <donaldlf@cs.rose-hulman.edu>

Hello,
  I am trying to set my personal computer using Raid-5 with LVM.
My problem is the following... I created a device /dev/md4 with a 32 GB
drive and then after bouncing data and drives around I grew  the drive
to 48 GB drive.

what happened:
32 GB raid 5 created (/dev/md3)
created lvm on 32 /dev/md3
extended /dev/md3 to 48 GB (raidresize)

Question:
  How to I get lvm to use the new 16GB of drive space
without reinstalling LVM on the part. (I have data I would like to keep, 
and it's the boot disk.)

Leslie D.
