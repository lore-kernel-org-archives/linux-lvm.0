From: Andreas Dilger <adilger@turbolabs.com>
Subject: Re: [linux-lvm] invalidate: busy buffer
Message-ID: <20011217003242.K855@lynx.no>
References: <20011214191634.GB24486@auctionwatch.com> <20011216205044.F26924@tiger.bigcats.invalid>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20011216205044.F26924@tiger.bigcats.invalid>; from weissel@netcologne.de on Sun, Dec 16, 2001 at 08:50:44PM +0100
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
Date: Mon Dec 17 01:30:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Dec 16, 2001  20:50 +0100, Wolfgang Weisselberg wrote:
> BTW, is there a good reason to run vgscan on boot time every
> time?  I have had more sorrow than joy with that.  If my
> vg's really changed, I can always run it from the (non-LVM)
> / which will come up, even if only as an emergency system.

It is only really useful if your drive mappings are likely to change
(i.e. adding SCSI drives, or re-arranging your IDE drives).  Otherwise,
it is not necessary to run vgscan at boot.

IMHO, the concept of running "vgscan" at boot is flawed, because it
re-builds the entire _VG_ setup each time it is run.  I would much
rather only rebuild the _PV_ setup on each boot (which is the only
likely thing to change between reboots), and leave the VG setup alone.
It should be up to the sysadmin to change the VG config.

Cheers, Andreas
--
Andreas Dilger
http://sourceforge.net/projects/ext2resize/
http://www-mddsp.enel.ucalgary.ca/People/adilger/
