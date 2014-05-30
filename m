Message-ID: <53888DA9.6090003@redhat.com>
Date: Fri, 30 May 2014 15:54:49 +0200
From: Heinz Mauelshagen <heinzm@redhat.com>
MIME-Version: 1.0
References: <20140522180405.GA6361@redhat.com>
	<20140522181334.GE1302@redhat.com>
	<20140529135246.GA31293@redhat.com>
	<20140529203410.GG1954@redhat.com>
	<20140529204719.GD1302@redhat.com>
	<20140529210648.GA3955@redhat.com>
	<20140529211955.GE1302@redhat.com>
	<20140529215815.GA4183@redhat.com>
	<20140530090422.GB31293@redhat.com>
	<20140530133814.GB8830@redhat.com>
	<20140530134642.GL1302@redhat.com>
In-Reply-To: <20140530134642.GL1302@redhat.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Testing the new LVM cache feature
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "Richard W.M. Jones" <rjones@redhat.com>, Mike Snitzer <snitzer@redhat.com>
Cc: Zdenek Kabelac <zkabelac@redhat.com>, thornber@redhat.com, LVM general discussion and development <linux-lvm@redhat.com>

On 05/30/2014 03:46 PM, Richard W.M. Jones wrote:
> I have now set both read_promote_adjustment ==
> write_promote_adjustment == 0 and used drop_caches between runs.

Did you adjust "sequential_threshold 0" as well?

dm-cache tries to avoid promoting large sequential files to the cache,
because spindles have good bandwidth.

This is again because of the hot spot caching nature of dm-cache.


>
> I also read Documentation/device-mapper/cache-policies.txt at Heinz's
> suggestion.
>
> I'm afraid the performance of the fio test is still not the same as
> the SSD (4.8 times slower than the SSD-only test now).
>
> Would repeated runs of (md5sum virt.* ; echo 3 > /proc/sys/vm/drop_caches)
> not eventually cause the whole file to be placed on the SSD?
> It does seem very counter-intuitive if not.

Please retry with "sequential_threshold 0"

Heinz

>
> Rich.
