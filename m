From: Andreas Dilger <adilger@clusterfs.com>
Subject: Re: [linux-lvm] pvvolume extension on the same part.
Message-Id: <20020423164649.GS3017@turbolinux.com>
References: <10947ADEA6491B4DB463E21E7C358CC203C74DE5@CAIRVEXMB01.irvn.ca.vzwcorp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <10947ADEA6491B4DB463E21E7C358CC203C74DE5@CAIRVEXMB01.irvn.ca.vzwcorp.com>
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
Date: Tue Apr 23 11:47:03 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Donaldson, Leslie" <Leslie.Donaldson@VerizonWireless.com>
Cc: "'linux-lvm@sistina.com'" <linux-lvm@sistina.com>, "'donaldlf@cs.rose-hulman.edu'" <donaldlf@cs.rose-hulman.edu>

On Apr 23, 2002  07:26 -0700, Donaldson, Leslie wrote:
>   I am trying to set my personal computer using Raid-5 with LVM.
> My problem is the following... I created a device /dev/md4 with a 32 GB
> drive and then after bouncing data and drives around I grew  the drive
> to 48 GB drive.
> 
> what happened:
> 32 GB raid 5 created (/dev/md3)
> created lvm on 32 /dev/md3
> extended /dev/md3 to 48 GB (raidresize)
> 
> Question:
>   How to I get lvm to use the new 16GB of drive space
> without reinstalling LVM on the part. (I have data I would like to keep, 
> and it's the boot disk.)

In the most recent versions of the LVM user tools there is a "pvresize"
command which does what you want.

Cheers, Andreas
--
Andreas Dilger
http://www-mddsp.enel.ucalgary.ca/People/adilger/
http://sourceforge.net/projects/ext2resize/
