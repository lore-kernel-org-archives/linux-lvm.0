Date: Wed, 12 Mar 2014 19:35:05 -0400
From: Mike Snitzer <snitzer@redhat.com>
Message-ID: <20140312233505.GA1660@redhat.com>
References: <0c0501cf3e39$0e82e0f0$2b88a2d0$@acm.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0c0501cf3e39$0e82e0f0$2b88a2d0$@acm.org>
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
Content-Transfer-Encoding: 7bit
To: "Paul B. Henson" <henson@acm.org>
Cc: 'LVM general discussion and development' <linux-lvm@redhat.com>

On Wed, Mar 12 2014 at  5:21pm -0400,
Paul B. Henson <henson@acm.org> wrote:

> While researching thinpool provisioning, it seems one of the issues is that
> the size of the metadata is fixed as of creation, and that if the metadata
> allocation fills up, your pool is corrupted? In many of the places that
> concern was mentioned, it was also said that extending the size of the
> metadata lv was a feature coming soon, but I didn't find anything confirming
> whether or not that functionality had been released. Is the size of the
> metadata lv still fixed?

No, metadata resize is now available.  But you definitely want to be
using the latest kernel (there have been various fixes for this
feature).

Completely exhausting all space in the metadata device will expose you
to a corner case that still needs work... so best to avoid that by
sizing your metadata device conservatively (larger).

We'll soon be assessing whether a fix is needed for metadata resize once
all metadata space is exhausted (but last I knew we have a bug lurking
in dm-persistent-data for this case).

> My intention is to have a 4TB PV (4 x 2TB RAID10), allocated completely to a
> thin pool, with the metadata stored separately on a 256G RAID1 of a couple
> SSD's (the rest of the SSD mirror will eventually be used for dm-cache when
> lvm support for that is released). This storage will be used for
> virtualization, with fairly heavy snapshots, where there will be half a
> dozen or so template volumes which will be snapshotted when a new vm is
> created, then each of those will have some number of snapshots for backup
> purposes (although those snapshots will never be written to). Given such a
> usage pattern, is there a best practice recommendation for sizing the
> metadata lv? It looks like going with the defaults would result in
> approximately 3.6G allocated for metadata.

The largest the metadata volume can be is just under 16GB.  The size of
the metadata device will depend on the blocksize and number of expected
snapshots.

The thin_metadata_size utility should be able to provide you with an
approximation for the total metadata size needed.
