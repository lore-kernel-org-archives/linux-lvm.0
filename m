From: Andreas Dilger <adilger@clusterfs.com>
Subject: Re: [linux-lvm] ext2resize error
Message-ID: <20020807175046.GM23923@clusterfs.com>
References: <OF05C6CA97.9049849B-ON86256C0D.0071EC23@TEXASMUTUAL.COM> <BDEMIPDEGABMNEFIHCPDIEGDDNAA.bill+f.9sfuw6uo@tao-group.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <BDEMIPDEGABMNEFIHCPDIEGDDNAA.bill+f.9sfuw6uo@tao-group.com>
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
Date: Wed Aug  7 12:51:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: William Blunn <bill+f.9sfuw6uo@tao-group.com>
Cc: linux-lvm@sistina.com

On Aug 07, 2002  11:12 +0100, William Blunn wrote:
> However resize2fs is the better tool.
> 
> I have personally found that ext2resize fails for filesystems over 64GiB
> in size.

OK, thanks for filing a bug report.

> Since an official tool has been available for over two years, I can't see
> how ext2resize would have received much attention in that time.

OK, thanks for letting me know.

> My advice would be to cut your losses and switch to the official,
> maintained, tool, resize2fs.

Too bad it doesn't do online resizing.  Yes, granted I still haven't
officially released the ext3 online resizing code, but it's been there
for over two years on ext2, so clearly e2fsprogs isn't being maintained
if it doesn't have it yet.  ;-)

Cheers, Andreas
--
Andreas Dilger
http://www-mddsp.enel.ucalgary.ca/People/adilger/
http://sourceforge.net/projects/ext2resize/
