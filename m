From: Goetz Bock <bock@blacknet.de>
Subject: Re: [linux-lvm] RAID5 + LVM stillborn
Message-ID: <20030225161446.A7257@zealot.blacknet.de>
References: <200302251751.19856.jhs@openenterprise.biz>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <200302251751.19856.jhs@openenterprise.biz>; from jhs@openenterprise.biz on Tue, Feb 25, 2003 at 05:51:19PM +0700
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
Date: Tue Feb 25 09:15:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Tue, Feb 25 '03 at 17:51, Jason Smith wrote:
> May I assume that LVM does not support RAID 5 due to the serialization 
> problems? 
I'm running LVM on top of RAID5 (MD) since years, without any trouble.
The only problem was that a disk failure brought the machin to a halt,
as the whole IDE subsystem locked up ... costs of going cheap I think.
But after I removed the broken disk everything was fine again. No data
lost.
-- 
Goetz Bock       (c) 2003 as     blacknet.de - Munich - Germany   /"\
IT Consultant    GNU FDL 1.1    secure mobile Linux everNETting   \ /
                                                                   X
 ASCII Ribbon Campaign against HTML email & microsoft attachments / \
