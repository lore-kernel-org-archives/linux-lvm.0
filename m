From: Andreas Dilger <adilger@turbolabs.com>
Subject: Re: [linux-lvm] mapping blocks to PVs?
Message-Id: <20020224000143.D12832@lynx.adilger.int>
References: <20020223214540.GA12317@mp3revolution.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20020223214540.GA12317@mp3revolution.net>; from
    dilinger@mp3revolution.net on Sat, Feb 23, 2002 at 04:45:40PM -0500
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
Date: Sun Feb 24 01:02:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Feb 23, 2002  16:45 -0500, Andres Salomon wrote:
> I've got a LV that keeps corrupting, made up of several IDE disks.  I've
> already discovered one of the drives to be flaking out, after various
> read tests on the device gave BadCRC/IRQ timeout errors.  Read tests on
> the other drives succeeded; however, I'm still getting stuff like:
> 
> journal_bmap: journal block not found at offset 7180 on lvm(58,0)
> 
> and
> 
> /dev/site/lvol1: recovering journal
> JFS: bad block at offset 7182
> 
> How can I figure out which PV is holding block 7180 and 7182?  

I think "lvdisplay -v" or "pvdisplay -v" or similar will show the _sector_
numbers for each PE.  Note that for ext3, the block numbers reported are
4kB blocks (usually, check with dumpe2fs -h), so you are probably looking
for sectors 7180*8 and 7182*8.

Cheers, Andreas
--
Andreas Dilger
http://sourceforge.net/projects/ext2resize/
http://www-mddsp.enel.ucalgary.ca/People/adilger/
