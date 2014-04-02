Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s32CFbuf011204
	for <linux-lvm@redhat.com>; Wed, 2 Apr 2014 08:15:37 -0400
Received: from spaceboyz.net (spaceboyz.net [87.106.131.203])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s32CFStH001783
	for <linux-lvm@redhat.com>; Wed, 2 Apr 2014 08:15:29 -0400
Date: Wed, 2 Apr 2014 14:15:14 +0200
From: David Lamparter <equinox@diac24.net>
Message-ID: <20140402121514.GK113782@jupiter.n2.diac24.net>
References: <20140402120320.GJ113782@jupiter.n2.diac24.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20140402120320.GJ113782@jupiter.n2.diac24.net>
Subject: Re: [linux-lvm] [LVM/RAID BUG DATA DESTRUCTION] 3.12.14 raid1
 initialisation + --write-mostly destroys LV
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: linux-raid@vger.kernel.org

On Wed, Apr 02, 2014 at 02:03:21PM +0200, David Lamparter wrote:
> lvconvert --type raid1 -m 1 eidolon/root
> lvchange --writemostly /dev/sda4:y --writebehind 32768 eidolon/root
[...]
> The raid1 was still initialising (around 20%) when I executed the second
> command, output from /sys/block/*/stat leads me to believe the sync direction
> was inverted from the newly-added device to the existing one.
[...]
> [950580.682165] mdX: bitmap initialized from disk: read 4 pages, set 98948 of 122880 bits

A quick disk inspection with dd/hexdump indicates that garbage starts
around 19.5%, which lines up with "98948 of 122880" above.


-David
