Message-ID: <51F8CFDD.5060605@redhat.com>
Date: Wed, 31 Jul 2013 10:50:37 +0200
From: Peter Rajnoha <prajnoha@redhat.com>
MIME-Version: 1.0
References: <1375197482-4824-1-git-send-email-christian@iwakd.de>
In-Reply-To: <1375197482-4824-1-git-send-email-christian@iwakd.de>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] [PATCH] lvremove: perform retry logic also on -real
 subvolume for snapshots
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
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: Christian Seiler <christian@iwakd.de>

On 07/30/2013 05:18 PM, Christian Seiler wrote:
> This commit is a follow-up on the first change. If the last snapshot of
> a volume is removed, the -real subvolume is not removed via the
> codepath that has the retry logic, but by just doing a cleanup of
> unused volumes. This means that spurious failures may still occur,
> although not as often.

These subvolumes should already be properly marked with flags
we attach to them during their creation - these are then sent
encoded in uevent and udev rules are skipped based on it,
including skipping the WATCH udev rule.

> 
> This patch adds the same retry logic to the cleanup codepath in order
> to make it even more unlikely that such a spurious error may occur.
> 

..but yes, we could probably add this patch to make sure something
like that does not happen at all.

But still it would be better to look why those spurious events
are triggered for non-top-level volumes (it's possible the
OPTIONS:="nowatch" in some case, I'll check...).

Peter
