From: Andreas Dilger <adilger@clusterfs.com>
Subject: Re: [linux-lvm] Volume Group Size
Message-ID: <20030625114634.Z18762@schatzie.adilger.int>
References: <200306251800.40336.stuart@fotango.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <200306251800.40336.stuart@fotango.com>; from stuart@fotango.com on Wed, Jun 25, 2003 at 06:00:40PM +0100
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
Date: Wed Jun 25 12:47:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Stuart Fox <stuart@fotango.com>
Cc: linux-lvm@sistina.com

On Jun 25, 2003  18:00 +0100, Stuart Fox wrote:
> I cant find information about the maximum volume group size in the current
> 2.4  series kernel.
> 
> Id like to be able to join 2 1.75Tb raid arrays into  1 3.5Tb array.
> Is this possible?

No, there is a limit of 2TB for all block devices in 2.4 kernels.  With
2.5, there is a "large block device" configure option that lets you have
larger block devices.  There is apparently also a patch to support this
on 2.4 kernels, but AFAIK it is not very widely used/tested.

Cheers, Andreas
--
Andreas Dilger
http://sourceforge.net/projects/ext2resize/
http://www-mddsp.enel.ucalgary.ca/People/adilger/
