Date: Thu, 23 Aug 2001 22:43:48 +0200
From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] resizing a filesystem failed, but volume was resized... can I restore the previous lv?
Message-ID: <20010823224348.D17378@sistina.com>
References: <2382.998385904@www19.gmx.net>
Mime-Version: 1.0
In-Reply-To: <2382.998385904@www19.gmx.net>; from grobe@gmx.net on Tue, Aug 21, 2001 at 11:25:04AM +0200
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

Lars,

vgcfgrestore(8) the last backup of your metadata, which contains the old
status of the LV in question.
VG needs to be offline to run vgcfgrestorew though :-(


On Tue, Aug 21, 2001 at 11:25:04AM +0200, Lars Grobe wrote:
> Hi!
> 
> I have had problems with resizing (shrinking) a reiser fs on a lv. The fs
> resizing wasn't completed, but the lv was resized than. So I wonder if I can
> "undo" the resizing of the lv? In fact, the lv would have to take the same
> space as before, so I could do fsck and rebuild my fs.
> 
> Thank You, CU, Lars.
> 
> www.rechnerpool.com
> 
> 
> 
> The messgae from the reiserfs-list follows:
> ___
> 
> LOG> Hi!
>  LOG> This is part two of my report of a failed resize:
> 
>  LOG> Yesterday I tried to resize a reiser fs. It is build on a LVM
> partition.
>  LOG> As I know that there is some calculation to make the resize of LVM an
>  LOG> Reiserfs fit, I used the script resize_rfs from the German magazine
>  LOG> Linuxmagazin (6/2000). This script is doing some checks and
> calculations
>  LOG> on parameters. So I tried to shrink my fs from 320 to 290 GB.
> 
> can you send that script to me ?
> 
>  LOG> But the process was interrupted, so the fs wasn't resized completely,
>  LOG> while the script did go on to the next step and resized the logical
>  LOG> volume to 290 GB.
> 
>  LOG> So there are two errors in the fs: there is a started, but not
> completed
>  LOG> resize of the fs AND the fs is on a lvm-volume that is smaller than
> the
>  LOG> filesystem.
> 
>  LOG> What should I do? I would usually try to set the size of the lv back
> to
>  LOG> 320 GB. 
> 
> Yes. But I do not know how to force LVM system to allocate same disk space
> in
> same order for your logical volume again :(
> 
>  LOG> Should I do a fsck than? 
> 
> Yes. run reiserfsck --check /dev/... , then follow the instructions.
> 
>  LOG> Is there a way to keep the data (else I
>  LOG> will have to replay from the backup, so I should start soon)?
> 
> I think you should try to restore LV and then run reiserfsck on it.
> 
>  LOG> Thank You, CU, Lars.
> 
> -- 
> Thanks,
> Alex.
> 
> 
> 
> 
> -- 
> GMX - Die Kommunikationsplattform im Internet.
> http://www.gmx.net
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html

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
