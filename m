From: Andres Salomon <dilinger@mp3revolution.net>
Subject: Re: [linux-lvm] mapping blocks to PVs?
Message-Id: <20020224225832.GA4123@mp3revolution.net>
References: <20020223214540.GA12317@mp3revolution.net>
    <20020224000143.D12832@lynx.adilger.int>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20020224000143.D12832@lynx.adilger.int>
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
Date: Sun Feb 24 16:58:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Ok, assuming the block/sector stuff is correct:

   --- Physical extents ---
   PE    LV                        LE      Disk sector
   00000 /dev/site/lvol1           00000   33144
   00001 /dev/site/lvol1           00001   65912

badblocks(2) is not picking up those blocks as being bad; this means I
need to manually remove the first LE from this LV.  I assume I can
do something similar to `pvmove -n /dev/site/lvol1:0 /dev/hdf1 /dev/hdb1`
(hdf1 is the one causing problems, but I can't simply remove the PV from the
VG w/out deleting lots of stuff).  However, how do I lvreduce from the
beginning of the LV?  Is that possible?

On Sun, Feb 24, 2002 at 12:01:43AM -0700, Andreas Dilger wrote:
> 
> On Feb 23, 2002  16:45 -0500, Andres Salomon wrote:
> > I've got a LV that keeps corrupting, made up of several IDE disks.  I've
> > already discovered one of the drives to be flaking out, after various
> > read tests on the device gave BadCRC/IRQ timeout errors.  Read tests on
> > the other drives succeeded; however, I'm still getting stuff like:
> > 
> > journal_bmap: journal block not found at offset 7180 on lvm(58,0)
> > 
> > and
> > 
> > /dev/site/lvol1: recovering journal
> > JFS: bad block at offset 7182
> > 
> > How can I figure out which PV is holding block 7180 and 7182?  
> 
> I think "lvdisplay -v" or "pvdisplay -v" or similar will show the _sector_
> numbers for each PE.  Note that for ext3, the block numbers reported are
> 4kB blocks (usually, check with dumpe2fs -h), so you are probably looking
> for sectors 7180*8 and 7182*8.
> 
> Cheers, Andreas
> --
> Andreas Dilger
> http://sourceforge.net/projects/ext2resize/
> http://www-mddsp.enel.ucalgary.ca/People/adilger/
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html

-- 
"I think a lot of the basis of the open source movement comes from
  procrastinating students..."
	-- Andrew Tridgell <http://www.linux-mag.com/2001-07/tridgell_04.html>
