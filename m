Date: Mon, 28 Oct 2019 15:43:13 +0000
From: Joe Thornber <thornber@redhat.com>
Message-ID: <20191028154313.ibspu6qwqqsq54cc@reti>
References: <ae72bf0f-2776-0bdc-7e4a-dc229cac481a@suse.com>
	<20191023213101.gpkorwubuobm5w5y@reti>
	<a3738d0e-cfba-af45-afd2-a08ca1819c83@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a3738d0e-cfba-af45-afd2-a08ca1819c83@suse.com>
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

On Thu, Oct 24, 2019 at 03:06:18AM +0000, Heming Zhao wrote:
> First fail is in bcache_flush, then bcache_invalidate_fd does nothing because the data
> in cache->errored, which not belongs to dirty & clean list. Then the data mistakenly
> move from cache->errored into cache->dirty by "bcache_get => _lookup_or_read_block"
> (because the data holds BF_DIRTY flag).

I just pushed a couple of patches that will hopefully fix this issue for you:

commit 6b0d969b2a85ba69046afa26af4d7bcddddbccd5 (HEAD -> master, origin/master, origin/HEAD, 2019-10-11-bcache-purge)
Author: Joe Thornber <ejt@redhat.com>
Date:   Mon Oct 28 15:01:47 2019 +0000

    [label] Use bcache_abort_fd() to ensure blocks are no longer in the cache.
    
    The return value from bcache_invalidate_fd() was not being checked.
    
    So I've introduced a little function, _invalidate_fd() that always
    calls bcache_abort_fd() if the write fails.

commit 2938b4dcca0a1df661758abfab7f402ea7aab018
Author: Joe Thornber <ejt@redhat.com>
Date:   Mon Oct 28 14:29:47 2019 +0000

    [bcache] add bcache_abort()
    
    This gives us a way to cope with write failures.




Also there are big changes to bcache coming, that remove file descriptors from
the interface completely.  See the branch 2019-09-05-add-io-manager for more info
(bcache has been renamed io_manager).

- Joe
