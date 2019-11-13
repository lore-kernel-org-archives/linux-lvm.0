Date: Wed, 13 Nov 2019 09:41:26 -0600
From: David Teigland <teigland@redhat.com>
Message-ID: <20191113154126.GA27038@redhat.com>
References: <fc8ca0d7-23d9-8145-05e5-27a7ea2a7682@suse.com>
	<872328cd-3d51-97bb-1c50-b54cc194c6f2@suse.com>
	<20191112152112.GA4422@redhat.com>
	<667efc9f-1001-37cc-c0af-b352ff366c03@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <667efc9f-1001-37cc-c0af-b352ff366c03@suse.com>
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

On Wed, Nov 13, 2019 at 02:23:42AM +0000, Heming Zhao wrote:
> label_write // @ lib/label/label.c
>   +-> dev_write_bytes //
>   |    +-> if (!bcache_flush()) //when failed, call below invalidate
>   |          label_scan_invalidate // will set fd=-1 in _scan_dev_close()
>   +-> dev_unset_last_byte // with fd: -1
>       +-> bcache_unset_last_byte
>             +-> _last_byte_fd != fd(-1), the _last_byte_xx never clean.
> ```
> So all bcache_unset_last_byte which after dev_write_bytes should be modified.
> For detail code fix, please check my V2 patch which I sent on Oct 28th.

Got it, thanks for your work on that, please check I got all the necessary
lines from your patch.

https://sourceware.org/git/?p=lvm2.git;a=commitdiff;h=13c254fc05386d05ab6bbda2806f9ca4d3358a0c

> Would you have any plan/schedule to backport bcache bug fixes to stable-2.02 branch?

I'll try to apply them all today.
