Message-ID: <3F901B15.70609@amazinginternet.com>
From: Ronny Adsetts <ronny.adsetts@amazinginternet.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Error on unmounting XFS LVM snapshot
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
Date: Fri Oct 17 15:02:04 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-xfs@oss.sgi.com, linux-lvm@sistina.com

Hi,

Please Cc me on any replies.

I am seeing an error logged when unmounting an LVM snapshot of an XFS 
partition. Google doesn't give me much.

I have reproduced this error on a different system using a totally 
different disk sub-system (Mylex eXtremeRAID 3000) - the system below 
has an Adaptec 2400A.

Details are:

System is XFS on top of LVM on top of hardware RAID.

Software used:
Debian: 3.0 (Mostly)
Kernel: 2.4.21
Kernel patches: Debian standard kernel patches; XFS 1.3.0
LVM utils: 1.0.4-4 (Debian)
XFS utils: 2.5.6-1 (Debian)

Sequence of actions:
1: xfs_freeze -f /home
2: lvcreate -L 1G -s -n home_lv_bak /dev/vg0/home_lv
3: xfs_freeze -u /home
4: mount -t xfs -onouuid,ro,usrquota /dev/vg0/home_lv_bak /mnt/home
5: umount /mnt/home
6: lvremove -f /dev/vg0/home_lv_bak

On step 5 of above, an error is logged:

Logs:
Oct 17 17:23:44 jettero kernel: lvm - lvm_map: ll_rw_blk write for 
readonly LV /dev/vg0/home_lv_bak
Oct 17 17:23:44 jettero kernel: xfs_force_shutdown(lvm(58,10),0x1) 
called from line 351 of file xfs_rw.c.  Return address = 0xc01fd6aa
Oct 17 17:23:44 jettero kernel: Filesystem "lvm(58,10)": I/O Error 
Detected.  Shutting down filesystem: lvm(58,10)
Oct 17 17:23:44 jettero kernel: Please umount the filesystem, and 
rectify the problem(s)

There is no oops and machine seems stable enough, though it's only been 
running a couple of days since I first did this.

Is this anything to worry about? Is this a known problem? Are there any 
patches to fix it?

Thanks and regards,
Ronny Adsetts
-- 
Technical Director
Amazing Internet Ltd, London
t: +44 20 8607 9535
f: +44 20 8607 9536
w: www.amazinginternet.com
