Message-ID: <3F0CAEDA.6050007@opendreams.net>
From: Jesse Molina <jesse@opendreams.net>
MIME-Version: 1.0
Subject: Re: [linux-lvm] trouble adding a disk to exisiting lvm
References: <3F0C9623.8070409@xs4all.nl>
In-Reply-To: <3F0C9623.8070409@xs4all.nl>
Content-Transfer-Encoding: 7bit
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
Date: Wed Jul  9 19:11:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

It would be very helpful if you were to include useful information such 
as the output that fsck spewed at you, some general data about your LVs 
and this troublesome drive, or even a log of the entire event that you 
tried if you have it.

Otherwise, you can scan your palm and we can try to read that for you.  =)

I like to run something like badblocks, Bonnie++, and smartmontools, 
before I trust a new drive.  Write a little script, let it run, and see 
if it fouls up over a 24-48 hour period.  Then you can blame it on 
software later if something goes wrong.



Gert van der Knokke wrote:

> Hi,
> 
> Probably this is a known problem but anyway as I'm new to the subject of 
> LVM I give it a go.
> 
> We set up on a server machine an initial LVM consisting of two 80 Gb 
> drives dangling on a Promise RAID controller (just using them as 
> /dev/hde and /dev/hdg, aka two separate IDE devices, no raid magic 
> involved)
> This worked as a charm and the resulting LVM was setup with ext3 
> filesystem without a hitch. The LVM was filled with data from other IDE 
> devices (source) and when these were copied (they were FAT32 volumes) 
> these source drives were emptied and with fdisk the partition table was 
> emptied too.
> 
> Pvcreate was done on the first drive to be added and after vgscan and 
> vgextend an fsck -f was done on the lvm volume before resize2fs was done.
> All this still went without problems, remounting the extended volume 
> gave no errors.
> 
> The volume was unmounted and the next drive was to be added, same 
> procedure (partition table clear with fdisk, pvcreate, vgscan, vgextend)
> but then as fsck was run a huge pile of numbers came up with at the end 
> the question fix<y>?  And I aborted this by Ctrl-C to keep the 
> filesystem as it were.
> 
> I guess the adding of the third drive issued this problem, did resize2fs 
>  foul up ? Is the whole volume at risk ?
> 
> Regards,
> Gert
> 
> 
> 
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

-- 
# Jesse Molina
# Mail = jesse@opendreams.net
# Page = page-jesse@opendreams.net
# Cell = 1.407.970.0280
# Web  = http://www.opendreams.net/jesse/
