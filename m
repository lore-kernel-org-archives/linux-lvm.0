Message-ID: <3D52C578.5030807@jumpline.com>
From: Ben Snyder <ben@jumpline.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] help with quota and LVM
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
Date: Thu Aug  8 14:24:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

I'm running RedHat6.2 with kernel 2.2.19 and LVM 1.0.4 on ext2 file systems

I'm having problems with quota and LVM.

I can mount 2 different filesystems:
    one is a plane-jane ext2 run-o-da-mill old-fashioned /dev/sda5 mount 
to /data FS
    the other is a logical volume /dev/vg/lv /data2

The data on them is identical, thanks to my friend rsync.

The problem is that I cannot get quotas to work on the logical volume 
(it *is* mounted with usrquota - I'm not that dumb).  I run 'edquota 
ben', make my changes and save it and all is happy.  Then I run 'edquota 
ben' again and the data is still there.  However, whenever I run 'quota 
ben' I only get info for the non-lvm filesystem.  If the non-lvm FS is 
not mounted, then I get 'none'.

I know quotas work on my system, they work on all of the other 
filesystems.  Is there something I'm missing about quota and LVM?  I 
*NEED* this to work, and help you can provide will be greatly appreciated.

Thanks in advance for feedback/replies/remarks/insults.
