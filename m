Date: Wed, 23 Oct 2019 22:31:01 +0100
From: Joe Thornber <thornber@redhat.com>
Message-ID: <20191023213101.gpkorwubuobm5w5y@reti>
References: <ae72bf0f-2776-0bdc-7e4a-dc229cac481a@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ae72bf0f-2776-0bdc-7e4a-dc229cac481a@suse.com>
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
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: David Teigland <teigland@redhat.com>

On Tue, Oct 22, 2019 at 09:47:32AM +0000, Heming Zhao wrote:
> Hello List & David,
> 
> This patch is responsible for legacy mail:
> [linux-lvm] pvresize will cause a meta-data corruption with error message "Error writing device at 4096 length 512"
> 
> I had send it to our customer, the code ran as expected. I think this code is enough to fix this issue.
> 
> Thanks
> zhm
> 
> ------(patch for branch stable-2.02) ----------
>  From d0d77d0bdad6136c792c9664444d73dd47b809cb Mon Sep 17 00:00:00 2001
> From: Zhao Heming <heming.zhao@suse.com>
> Date: Tue, 22 Oct 2019 17:22:17 +0800
> Subject: [PATCH] bcache may mistakenly write data to another disk when writes
>   error
> 
> When bcache write data error, the errored fd and its data is saved in
> cache->errored, then this fd is closed. Later lvm will reuse this
> closed fd to new opened devs, but the fd related data still in
> cache->errored and flags with BF_DIRTY. It make the data may mistakenly
> write to another disk.

I think real issue here is that the flush fails, and the error path for that
calls invalidate dev, which also fails, but that return value is not checked.
The fd is subsequently closed, and reopened with data still in the cache.

So I think the correct fix is to have a variant of invalidate, that doesn't
bother retrying the IO, and just throws away the dirty data.  bcache_abort()?
This should be called when the flush() fails.

- Joe
