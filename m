Date: Thu, 2 Aug 2007 08:50:12 +0200
From: Luca Berra <bluca@comedia.it>
Message-ID: <20070802065012.GA28687@percy.comedia.it>
References: <46B0EAEF.6090305@cfl.rr.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <46B0EAEF.6090305@cfl.rr.com>
Subject: [linux-lvm] Re: LVM on dmraid breakage
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: device-mapper development <dm-devel@redhat.com>, "ATARAID (eg, Promise Fasttrak,
	Highpoint 370) related discussions" <ataraid-list@redhat.com>
Cc: linux-lvm@redhat.com

On Wed, Aug 01, 2007 at 04:19:59PM -0400, Phillip Susi wrote:
>I am investigating a bug report involving the combination of lvm and 
>dmraid, and it seems to me that the problem is that lvm is detecting the 
>underlying partition on the primary disk and accessing it directly 
>rather than going through the raid device made by dmraid.  I think that 
>the problem is there is no facility for dmraid to "claim" the physical 
>disk so that lvm does not look at it, and also to have lvm scan the raid 
>device for physical volumes.
>
>Does anyone have any thoughts on how this might be accomplished?

Two things come to mind
1) dmraid should use ioctl BLKPG_DEL_PARTITION, to clean up any eventual
partition table on component devices

2) lvm tool filter could be modified to check if a device has been
already claimed by device-mapper.

something along the lines of:
ioctl DM_LIST_DEVICES
while (...)
  ioctl DM_TABLE_DEPS

the above would probably require a cache.


i believe that manual use of partx or lvm filters is sub-optimal
L.



-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
