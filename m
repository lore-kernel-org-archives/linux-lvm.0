Received: from localhost (vpn1-7-39.ams2.redhat.com [10.36.7.39])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u189HPia031223
	for <linux-lvm@redhat.com>; Mon, 8 Feb 2016 04:17:25 -0500
Date: Mon, 8 Feb 2016 09:17:06 +0000
From: Joe Thornber <thornber@redhat.com>
Message-ID: <20160208091705.GA1612@rh-vpn>
References: <87a8nctl7x.fsf@vostro.rath.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87a8nctl7x.fsf@vostro.rath.org>
Subject: Re: [linux-lvm] lvmcache performance
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

On Sun, Feb 07, 2016 at 10:43:30AM -0800, Nikolaus Rath wrote:
> Is that the wrong expectation? But even then, shouldn't I at least see
> some improvement?

Firstly, if you have the latest software, I suggest you switch to the
smq cache policy which is generally out performing the old mq policy
substantially.

Secondly, I think you may need to reset your expectations a bit.
dm-cache is a slow moving cache.  It monitors IO, detectings hotspots
on the disk and then 'promotes' those regions to the SSD.  You may
find that the reads that occur during a boot, occur only infrequently
once the system is booted.

- Joe
