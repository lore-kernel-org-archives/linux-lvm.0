From: Goetz Bock <bock@blacknet.de>
Subject: Re: [linux-lvm] disk naming
Message-ID: <20030103174618.Z9539@zealot.blacknet.de>
References: <1041610095.19844.45.camel@mosix>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1041610095.19844.45.camel@mosix>; from mschilli@vss.fsi.com on Fri, Jan 03, 2003 at 10:08:13AM -0600
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
Date: Fri Jan  3 10:45:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Fri, Jan 03 '03 at 10:08, Matt Schillinger wrote:
> this should be a simple question, but I can't find a direct discussion
> in the lvm documentation. I believe that i have found that LVM will find
> appropriate PV's regardless of their name (sda,sdb).. Is this true?
Kind of. When you created (maybe even just used) a PV/VG with DEVFS it
will only work with devfs. 
IIRC when you compile DEVFS into the kernel, but do not mount it, you
can create PVs, but createvg will not find them unless you mount devfs.

> Do i need devfs to ensure that i always have the same disk naming, or
> will LVM handle this for me?
devfs does not ensure you have the same names.

> I am currently using scsidev for naming purposes, but have found that
> vgcreate will not work with scsidev device names
> (/dev/scsi/sdh0-0c0i4l2p1)
> /dev/scsi/sd(host=0,scsiid=4,LUN=2,partition #=1)
Most likely the userspace tools do not search the /dev/scsi/sdxxx
devices for PV signatrue. IIRC there is one file where you can add them. 
It's in tools/lib/lvm_check_partitioned_dev.c but I've no idea how to
add your devices.
-- 
Goetz Bock       (c) 2002 as     blacknet.de - Munich - Germany   /"\
IT Consultant    GNU FDL 1.1    secure mobile Linux everNETting   \ /
                                                                   X
 ASCII Ribbon Campaign against HTML email & microsoft attachments / \
