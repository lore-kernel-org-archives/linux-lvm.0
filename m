Date: Tue, 12 Nov 2019 09:21:12 -0600
From: David Teigland <teigland@redhat.com>
Message-ID: <20191112152112.GA4422@redhat.com>
References: <fc8ca0d7-23d9-8145-05e5-27a7ea2a7682@suse.com>
	<872328cd-3d51-97bb-1c50-b54cc194c6f2@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <872328cd-3d51-97bb-1c50-b54cc194c6f2@suse.com>
Subject: Re: [linux-lvm] resend patch - bcache may mistakenly write data to
 another disk when writes error
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
To: Heming Zhao <heming.zhao@suse.com>
Cc: "thornber@redhat.com" <thornber@redhat.com>, "linux-lvm@redhat.com" <linux-lvm@redhat.com>

On Tue, Nov 12, 2019 at 08:38:00AM +0000, Heming Zhao wrote:
> There still have bug codes wait for fixing.
> Please see below item <2>. the _last_byte_xx (in bcache.c) should be restored to ZERO when fail/error.
> Do you have any plan/schedule to this issue?
> Do you have any plan/schedule to backport these fixes to stable-2.02 branch?

I don't think it should actually be a problem since bcache_unset_last_byte
checks for _last_byte_fd == fd.  But, I think it's better to not rely on that
check, so how about a change like this?

void dev_unset_last_byte(struct device *dev)
{
        if (dev->bcache_fd > 0)
                bcache_unset_last_byte(scan_bcache, dev->bcache_fd);
}
