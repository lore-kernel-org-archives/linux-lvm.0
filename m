Message-ID: <3DCA84BB.9050404@jumpline.com>
From: Ben Snyder <ben@jumpline.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] cant mount LV via partition/filesystem labels
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
Date: Thu Nov  7 09:21:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

Here's what I've got:

RH7.2, kernel  2.4.9-34enterprise

1 physical volume each on /dev/sda9 and /dev/sdb1
one logical volume over these two PV's

I've labeled the filesystem via 'tune2fs' and want to use the label for 
mounting purposes, as is the default with the other (non-LVM) filesystems

'vgscan' and 'vgchange -a y' have been performed
'vgdisplay' and 'lvdisplay' tell me all is well - everthing is 
read/write and available
'fsck' on the physical path reports clean...

If I attempt to mount via the physical path to the LV, providing the 
mount point, everything works fine

However, mount refuses to mount via filesystem/partition label, 
regardless if I use '-L' and provide the label or use the mountpoint and 
let mount figure it out on its own from /etc/fstab.  I get 'mount: no 
such partition found' (it is in /etc/fstab correctly, already checked that).

Am I missing something about labels?  Maybe some other remedial 
filesystem characteristics/operations that I've missed because of 
cranius-up-rectus (head up a$$).

Thanks in advance for feedback/suggestions.
