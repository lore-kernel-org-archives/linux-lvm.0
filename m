From: Andreas Dilger <adilger@turbolabs.com>
Subject: Re: [linux-lvm] Re: lvm 1.0.3, kernel 2.4.17 and the libs...
Message-Id: <20020226155618.C12832@lynx.adilger.int>
References: <1014762518.12325.76.camel@dirac.cids.ca>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1014762518.12325.76.camel@dirac.cids.ca>; from
    dsavard@cids.ca on Tue, Feb 26, 2002 at 05:28:38PM -0500
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
Date: Tue Feb 26 16:56:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Daniel Savard <dsavard@cids.ca>
Cc: linux-lvm@sistina.com

On Feb 26, 2002  17:28 -0500, Daniel Savard wrote:
> I did mkfs.ext2 on /dev/sda8 !!! However, this was still pointing to my
> LVM partition even if fdisk was not showing this.
> 
> The big question: Is it still possible to recover some data from the LVM
> partition which was the only partition in my VG?

Well, mke2fs writes a LOT of data into the partition, being especially
careful to overwrite everything at the start of the disk.  It might be
possible to recover this with "vgcfgrestore", but even then you have the
problem of overwriting the rest of the data on the disk.  If the primary
ext2 superblock is overwritten on an LV inside this disk, you can use
"e2fsck -b 32768" or so to try and recover.

Cheers, Andreas
--
Andreas Dilger
http://sourceforge.net/projects/ext2resize/
http://www-mddsp.enel.ucalgary.ca/People/adilger/
