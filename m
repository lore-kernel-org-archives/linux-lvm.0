Message-ID: <3F9FE42D.6070306@amazinginternet.com>
From: Ronny Adsetts <ronny.adsetts@amazinginternet.com>
MIME-Version: 1.0
References: <2D92FEBFD3BE1346A6C397223A8DD3FC092442@THOR.goeci.com>
In-Reply-To: <2D92FEBFD3BE1346A6C397223A8DD3FC092442@THOR.goeci.com>
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Re: Error on unmounting XFS LVM snapshot
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
Date: Wed Oct 29 17:53:05 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Murthy Kambhampaty <murthy.kambhampaty@goeci.com>
Cc: linux-xfs@oss.sgi.com, linux-lvm@sistina.com

Murthy Kambhampaty said the following on 20/10/03 18:10:
 >>-----Original Message-----
 >>From: Ronny Adsetts [mailto:ronny.adsetts@amazinginternet.com]
 >>Sent: Friday, October 17, 2003 12:39
 >>
 >>Software used:
 >>Debian: 3.0 (Mostly)
 >>Kernel: 2.4.21
 >>Kernel patches: Debian standard kernel patches; XFS 1.3.0
 >>LVM utils: 1.0.4-4 (Debian)
 >>XFS utils: 2.5.6-1 (Debian)
 >>
 >>Sequence of actions:
 >>1: xfs_freeze -f /home
 >>2: lvcreate -L 1G -s -n home_lv_bak /dev/vg0/home_lv
 >>3: xfs_freeze -u /home
 >>4: mount -t xfs -onouuid,ro,usrquota /dev/vg0/home_lv_bak /mnt/home
 >>5: umount /mnt/home
 >>6: lvremove -f /dev/vg0/home_lv_bak
 >>
 >>On step 5 of above, an error is logged:
 >>
 >>Logs:
 >>Oct 17 17:23:44 jettero kernel: lvm - lvm_map: ll_rw_blk write for
 >>readonly LV /dev/vg0/home_lv_bak
 >>Oct 17 17:23:44 jettero kernel: xfs_force_shutdown(lvm(58,10),0x1)
 >>called from line 351 of file xfs_rw.c.  Return address = 0xc01fd6aa
 >>Oct 17 17:23:44 jettero kernel: Filesystem "lvm(58,10)": I/O Error
 >>Detected.  Shutting down filesystem: lvm(58,10)
 >>Oct 17 17:23:44 jettero kernel: Please umount the filesystem, and
 >>rectify the problem(s)
 >
> I got these error messages on the Wolk 4.9s kernel, but not on XFS CVS
> kernels (or vanilla linux with XFS patches applied). This is a somewhat
> random guess, but you might try to upgrade LVM to 1.0.7, following the LVM
> how-to, and see if the problem persists.
> 

I've built a later version of LVM 1 tools, but not had a chance to try 
them yet (probably won't bother now).

I did see this this today which appears to be the same issue:

http://www.kerneltraffic.org/kernel-traffic/kt20031027_238.html#4

 From Marcelo Tosatti[1]: "It seems its not safe to create snapshots of 
journalled fs'es without this patch[2]."

Looks like the patch will show up in mainline in the 2.4.24-pre series.

[1] http://marc.theaimsgroup.com/?l=linux-kernel&m=106642797513724&w=2
[2] http://marc.theaimsgroup.com/?l=linux-kernel&m=106623350522639&q=p3

Regards,
Ronny
-- 
Technical Director
Amazing Internet Ltd, London
t: +44 20 8607 9535
f: +44 20 8607 9536
w: www.amazinginternet.com
