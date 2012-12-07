Date: Fri, 7 Dec 2012 09:18:27 -0500
From: Mike Snitzer <snitzer@redhat.com>
Message-ID: <20121207141827.GA7469@redhat.com>
References: <20121206222535.GA2668@apocalyptech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20121206222535.GA2668@apocalyptech.com>
Subject: Re: [linux-lvm] Questions about issue_discards
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
To: CJ Kucera <pez@apocalyptech.com>
Cc: linux-lvm@redhat.com

On Thu, Dec 06 2012 at  5:25pm -0500,
CJ Kucera <pez@apocalyptech.com> wrote:

> Hello, list!
> 
> I've started to play around with SSD drives and was curious about a
> couple aspects of the issue_discards configuration option.
> 
> 1) The lvm.conf comments note that when enabled, it'll still only
> (obviously) issue discards to storage which happens to support it.  Is
> there a way of querying block devices to find out if they support the
> feature?

lvm will only issue discards if the underlying device has non-zero
discard_granularity and discard_max_bytes, to check:

cat /sys/block/<dev>/queue/discard_granularity
cat /sys/block/<dev>/queue/discard_max_bytes

(replace <dev> accordingly, e.g. sda)

> 2) Would a change to the issue_discards parameter be picked up
> automatically by the running kernel?  The lvm.conf manpage mentions that
> it remembers the timestamp of the file "between commands" and will apply
> changes then, but it almost sounds like that'd be mostly for things like
> the device scanning list, etc.

lvm.conf's issue_discards doesn't have any affect on the kernel (or
underlying device's) discard capabilities.  It only controls whether
discards are issued by lvm for certain lvm operations (like when an LV
is removed).
