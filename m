From: Andreas Dilger <adilger@turbolabs.com>
Date: Thu, 13 Sep 2001 14:38:15 -0600
Subject: Re: [linux-lvm] 33% of my space is missing?
Message-ID: <20010913143815.L1541@turbolinux.com>
References: <B51F0C636E578A4E832D3958690CD73E0130C024@es04snlnt>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <B51F0C636E578A4E832D3958690CD73E0130C024@es04snlnt>
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

On Sep 13, 2001  14:11 -0600, Diehl, Jeffrey wrote:
> I seem to be missing 100Gb out of a possible 300Gb!  Check it out:
> 
> [root@filmore jdiehl]# fdisk -l | grep LVM
> /dev/sdb5           226      4402  33551721   8e  Linux LVM
> /dev/sdb6          4403      8579  33551721   8e  Linux LVM
> /dev/sdb7          8580     12756  33551721   8e  Linux LVM
> /dev/sdb8         12757     15030  18265873+  8e  Linux LVM
> /dev/sdc6          7015     14028  56339923+  8e  Linux LVM
> /dev/sdc7         14029     21042  56339923+  8e  Linux LVM
> /dev/sdc8         21043     28056  56339923+  8e  Linux LVM
> /dev/sdc9         28057     30945  23205861   8e  Linux LVM
> [root@filmore jdiehl]#
> 
> Adding this space up, I get 311Gb.

But it is only 296 GiB, which is what LVM measures.

> [root@filmore jdiehl]# lvdisplay /dev/Database2/data
> --- Logical volume ---
> LV Name                /dev/Database2/data
> VG Name                Database2
> LV Write Access        read/write
> LV Status              available
> LV #                   1
> # open                 1
> LV Size                215.3 GB
> Current LE             27558
> Allocated LE           27558
> Allocation             next free
> Read ahead sectors     120
> Block device           58:0
> 
> Here we see that I only have access to 215Gb. 

What PE size are you using?  If (default) 4MiB, you would lose about 3MiB
per PV, so 3MiB * 8 = 24MiB.  If you are using LVM 1.0+ user tools you will
lose 1.5x PE size (on average) per PV, so if you have 32MiB PEs, you lose
48MiB * 8 = 384MiB.  So this is still not enough to explain your losses.

Are you sure you have added all PVs into this VG, and used all of the PEs
in this LV?  Something like pvscan would show better information.

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
