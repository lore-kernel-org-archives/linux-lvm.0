From: Andreas Dilger <adilger@turbolabs.com>
Subject: Re: [linux-lvm] Partition resizing and whatnot
Message-Id: <20020220163107.H1506@lynx.adilger.int>
References: <CBEHLLOPCKAOIAOINGKAMEHACAAA.jmoser@erc.wisc.edu>
    <CBEHLLOPCKAOIAOINGKAMEHOCAAA.jmoser@erc.wisc.edu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CBEHLLOPCKAOIAOINGKAMEHOCAAA.jmoser@erc.wisc.edu>;
    from jmoser@erc.wisc.edu on Wed, Feb 20, 2002 at 03:40:35PM -0600
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
Date: Wed Feb 20 17:31:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: John Moser <jmoser@erc.wisc.edu>
Cc: linux-lvm@sistina.com

On Feb 20, 2002  15:40 -0600, John Moser wrote:
> So, after installation the ATA update patches that people recommended, I now
> have a linux system that recognizes the full 160 gigabytes of disk space on
> my disks.  However, I'm not entirely sure as to how I should go about
> resizing my filesystem.  I'm already well aquanted with adding disks to
> existing filesystems and growing them.  However, what are the recommended
> steps for taking existing disk partitions, resizing them to fill the disks
> they reside on, and then resizing the LVM/e2fs filesystems that use those
> disks?

With the current LVM setup, you are probably just as well off to create a
new partition on the remaining space, make it a PV, and then use the PEs
as you see fit.  Anything else means binary editing of PV and VG structs
at this point, so you probably don't want to do it...

Cheers, Andreas
--
Andreas Dilger
http://sourceforge.net/projects/ext2resize/
http://www-mddsp.enel.ucalgary.ca/People/adilger/
