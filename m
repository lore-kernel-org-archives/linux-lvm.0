From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] more odd problems
Message-ID: <20011211115418.B27568@sistina.com>
References: <Pine.LNX.4.10.10112101106430.12116-100000@staff>
Mime-Version: 1.0
In-Reply-To: <Pine.LNX.4.10.10112101106430.12116-100000@staff>; from todd@osogrande.com on Mon, Dec 10, 2001 at 11:07:46AM -0700
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
Date: Tue Dec 11 04:53:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Todd,

kernel still can't handle partition table updates on active disks.
You need to reboot in thiese cases :-(

Regards,
Heinz    -- The LVM Guy --


On Mon, Dec 10, 2001 at 11:07:46AM -0700, Todd Underwood wrote:
> folx,
> 
> i've just discovered another problem (which was preventing me from
> pvcreating one of my partitions):  fdisk seems to be confused about the
> partition table:
> 
> Units = cylinders of 16065 * 512 bytes
> 
>    Device Boot    Start       End    Blocks   Id  System
> /dev/hda1   *         1      1020   8193118+  83  Linux
> /dev/hda2          1021      3675  21326287+  8e  Linux LVM
> /dev/hda3          3676      3722    377527+  82  Linux swap
> 
> Command (m for help): w
> The partition table has been altered!
> 
> Calling ioctl() to re-read partition table.
> Re-read table failed with error 16: Device or resource busy.
> Reboot your system to ensure the partition table is updated.
> 
> WARNING: If you have created or modified any DOS 6.x
> partitions, please see the fdisk manual page for additional
> information.
> Syncing disks.
> [root@villa root]# fdisk -s /dev/hda1
> 8193118
> [root@villa root]# fdisk -s /dev/hda2
> 265072
> [root@villa root]# fdisk -s /dev/hda3
> 0
> 
> 
> v. odd.  i believe that this is a separate problem from the one i reported
> earlier, but i thought that i would mention it.
> 
> 
> 
> todd underwood, vp & cto
> oso grande technologies, inc.
> todd@osogrande.com
> 
> "Those who give up essential liberties for temporary safety deserve
> neither liberty nor safety." - Benjamin Franklin
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html

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
