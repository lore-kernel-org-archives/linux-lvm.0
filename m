Sender: Paul Henson <paul.b.henson@gmail.com>
From: "Paul B. Henson" <henson@acm.org>
References: <0c0501cf3e39$0e82e0f0$2b88a2d0$@acm.org>
	<20140312233505.GA1660@redhat.com>
In-Reply-To: <20140312233505.GA1660@redhat.com>
Date: Wed, 12 Mar 2014 18:32:12 -0700
Message-ID: <0c1301cf3e5c$1218eb10$364ac130$@acm.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Language: en-us
Subject: Re: [linux-lvm] thinpool metadata size
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
To: 'Mike Snitzer' <snitzer@redhat.com>
Cc: 'LVM general discussion and development' <linux-lvm@redhat.com>

> From: Mike Snitzer
> Sent: Wednesday, March 12, 2014 4:35 PM
>
> No, metadata resize is now available.

Oh, cool; that makes the initial allocation decision a little less critical
:).

> But you definitely want to be
> using the latest kernel (there have been various fixes for this
> feature).

I thought I saw a thin pool metadata corruption issue fly by recently with a
fix destined for 3.14, I was tentatively thinking of waiting for the 3.14
release before migrating my box to thin provisioning. I'm currently running
3.12, it looks like that was designated a long-term support kernel? Are thin
provisioning (and dm-cache, as I'm going to add that to the mix as soon as
lvm supports it) patches going to be backported to that, or would it be
better to track mainline stable kernels as they are released?

> Completely exhausting all space in the metadata device will expose you
> to a corner case that still needs work... so best to avoid that by
> sizing your metadata device conservatively (larger).

On the grand scale of things it doesn't look like it wants that much space,
so over allocation sounds like a good idea.

> The largest the metadata volume can be is just under 16GB.  The size of
> the metadata device will depend on the blocksize and number of expected
> snapshots.

Interesting; for some reason I thought metadata usage was also dependent on
changes between origin and snapshots. So, if you had one origin lv and 100
snapshots of it that were all identical, it would use less metadata than if
you had 100 snapshots that had been written to and were all wildly divergent
from each other. Evidently not though?

In regards to blocksize, from what I read the recommendation was that if
you're only looking for thin provisioning, but not planning to have lots of
snapshots, it's better to have a larger blocksize, whereas if you're going
to have a lot of snapshots a smaller blocksize is better? I think I'm just
going to stick with the default 64k for now.

> The thin_metadata_size utility should be able to provide you with an
> approximation for the total metadata size needed.

A short tangent; typically when you distinguish between gigabytes and
gibibytes, the former are powers of 10 and the latter powers of 2, no? 1
gigabyte = 1000000000 bytes, 1 gibibyte = 1073741824 bytes? It looks like
the thin_metadata_size utility has those reversed?

# thin_metadata_size -b 64k -s 4t -m 100000 -u gigabytes
thin_metadata_size - 2.41 gigabytes estimated metadata area size

# thin_metadata_size -b 64k -s 4t -m 100000 -u gibibytes                  
thin_metadata_size - 2.59 gibibytes estimated metadata area size

# thin_metadata_size -b 64k -s 4t -m 100000 -u bytes
thin_metadata_size - 2591174656 bytes estimated metadata area size

Back on subject, I guess there's some fixed overhead, as the metadata size
difference between one 1 lv and 10000 lv's is pretty tiny:

# thin_metadata_size -b 64k -s 4t -m 1 -u g
thin_metadata_size - 2.03 gigabytes estimated metadata area size

# thin_metadata_size -b 64k -s 4t -m 10000 -u g
thin_metadata_size - 2.07 gigabytes estimated metadata area size

Another power of 10 increase in volumes still only adds a bit more:

# thin_metadata_size -b 64k -s 4t -m 100000 -u g
thin_metadata_size - 2.41 gigabytes estimated metadata area size

I think I'll be pretty safe allocating 2.5G, particularly given you can now
resize it later if you start getting short.

Thanks much for the info.
