From: Goetz Bock <bock@blacknet.de>
Subject: Re: [linux-lvm] LVM and ext3
Message-ID: <20021219175311.B9539@zealot.blacknet.de>
References: <!~!UENERkVCMDkAAQACAAAAAAAAAAAAAAAAABgAAAAAAAAAd/KEPwmKaEO7gaS5NXV+c+KAAAAQAAAAlydtpuHoQkO4QgscMTdYbgEAAAAA@freestylenetworks.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <!~!UENERkVCMDkAAQACAAAAAAAAAAAAAAAAABgAAAAAAAAAd/KEPwmKaEO7gaS5NXV+c+KAAAAQAAAAlydtpuHoQkO4QgscMTdYbgEAAAAA@freestylenetworks.com>; from paul@freestylenetworks.com on Thu, Dec 19, 2002 at 09:30:08AM -0700
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
Date: Thu Dec 19 10:53:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Thu, Dec 19 '02 at 09:30, Paul Seniuk wrote:
>  Is there support for ext3 partion resizing? 
do it all the time (growing). there is even a special tool to support
that with just one call to enlagre the LV and then the ext2/3
filesystem: e2fsadm

> (RH 7.3)?
no idea about that. but no problems with TSL1.5 (own patches) and TSL20
should work out of the box (I'll work on it, except for the installer)
-- 
Goetz Bock       (c) 2002 as     blacknet.de - Munich - Germany   /"\
IT Consultant    GNU FDL 1.1    secure mobile Linux everNETting   \ /
                                                                   X
 ASCII Ribbon Campaign against HTML email & microsoft attachments / \
