From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] cant mount LV via partition/filesystem labels
Message-ID: <20021107181852.D8382@sistina.com>
References: <3DCA84BB.9050404@jumpline.com>
Mime-Version: 1.0
In-Reply-To: <3DCA84BB.9050404@jumpline.com>; from ben@jumpline.com on Thu, Nov 07, 2002 at 10:20:27AM -0500
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
Date: Thu Nov  7 11:24:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Thu, Nov 07, 2002 at 10:20:27AM -0500, Ben Snyder wrote:
> Here's what I've got:
> 
> RH7.2, kernel  2.4.9-34enterprise
> 
> 1 physical volume each on /dev/sda9 and /dev/sdb1
> one logical volume over these two PV's
> 
> I've labeled the filesystem via 'tune2fs' and want to use the label for 
> mounting purposes, as is the default with the other (non-LVM) filesystems
> 
> 'vgscan' and 'vgchange -a y' have been performed
> 'vgdisplay' and 'lvdisplay' tell me all is well - everthing is 
> read/write and available
> 'fsck' on the physical path reports clean...
> 
> If I attempt to mount via the physical path to the LV, providing the 
> mount point, everything works fine
> 
> However, mount refuses to mount via filesystem/partition label, 
> regardless if I use '-L' and provide the label or use the mountpoint and 
> let mount figure it out on its own from /etc/fstab.  I get 'mount: no 
> such partition found' (it is in /etc/fstab correctly, already checked that).
> 
> Am I missing something about labels?  Maybe some other remedial 
> filesystem characteristics/operations that I've missed because of 
> cranius-up-rectus (head up a$$).
> 
> Thanks in advance for feedback/suggestions.

Ben,
say your logical volume path is /dev/vg00/lv01 and that LV
holds your ext2 filesystem.

tune2fs -L Whatever /dev/vg00/lv01 # labels it with volume name "Whatever"

If you have an entry in /etc/fstab like:
/dev/vg00/lv01	/mnt	ext2	defaults	1 1

running "mount -L Whatever" should do the trick.
Presumably /mnt exists and the volume group is active.

> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

-- 

Regards,
Heinz    -- The LVM Guy --

*** Software bugs are stupid.
    Nevertheless it needs not so stupid people to solve them ***

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                 Sistina Software Inc.
Senior Consultant/Developer                       Am Sonnenhang 11
                                                  56242 Marienrachdorf
                                                  Germany
Mauelshagen@Sistina.com                           +49 2626 141200
                                                       FAX 924446
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
