From: Andreas Dilger <adilger@turbolabs.com>
Date: Tue, 2 Oct 2001 15:08:20 -0600
Message-ID: <20011002150820.N8954@turbolinux.com>
References: <20011002202934.G14582@wiggy.net> <E15oUUf-0005Xw-00@the-village.bc.nu> <20011002220053.H14582@wiggy.net>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20011002220053.H14582@wiggy.net>
Subject: [linux-lvm] Re: partition table read incorrectly
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
To: Alan Cox <alan@lxorguk.ukuu.org.uk>, linux-kernel@vger.kernel.org, linux-lvm@sistina.com

On Oct 02, 2001  22:00 +0200, Wichert Akkerman wrote:
> Previously Alan Cox wrote:
> > Does it complain about wrong block sizes ?
> 
> No
>  
> > The partition code will look for tables. That bit is fine
> 
> If that bit is fine then how can it differ in opinion from fdisk?

What does the first 512 bytes of the disk show (od -Ax -tx1 /dev/)?
Maybe there is still "0xaa55" on the disk at 0x1fe and the kernel
thinks it is a DOS partition?

> > The exact error would be good too
> 
>  I/O error: dev 08:11, sector 0

Hmm, this is sda11, so you would need both a primary and extended
partition table to get that.  What does /proc/partitions show?

Cheers, Andreas
--
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
