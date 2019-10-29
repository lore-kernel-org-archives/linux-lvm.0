From: Heming Zhao <heming.zhao@suse.com>
Date: Tue, 29 Oct 2019 11:47:19 +0000
Message-ID: <1d119762-597f-bd3e-645b-2ca2234b20e9@suse.com>
References: <ae72bf0f-2776-0bdc-7e4a-dc229cac481a@suse.com>
	<20191023213101.gpkorwubuobm5w5y@reti>
	<a3738d0e-cfba-af45-afd2-a08ca1819c83@suse.com>
	<20191028154313.ibspu6qwqqsq54cc@reti>
	<324885c4-a211-fb11-8315-979935391820@suse.com>
	<95f338d2-5855-5ce5-f0ce-c0f6b648e794@suse.com>
	<20191029110508.rlgepokvu2vgmbvm@reti>
In-Reply-To: <20191029110508.rlgepokvu2vgmbvm@reti>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <9254551FB1B51045A1311ECD5C320614@namprd18.prod.outlook.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
To: LVM general discussion and development <linux-lvm@redhat.com>, Joe
	Thornber <thornber@redhat.com>
Cc: David Teigland <teigland@redhat.com>

You are right. I forgot the radix_tree_remove_prefix().
The radix_tree_remove_prefix() is called both bcache_invalidate_fd & bcache_abort_fd.
So the job will not work as expected in bcache_abort_fd, because the node is already removed.
Please correct me if my thinking is wrong.

On 10/29/19 7:05 PM, Joe Thornber wrote:
> On Tue, Oct 29, 2019 at 09:46:56AM +0000, Heming Zhao wrote:
>> Add another comment.
>>
>> The key of commit 2938b4dcc & 6b0d969b is function _invalidate_fd().
>> But from my analysis, it looks your codes do not fix this issue.
>>
>> _invalidate_fd calls bcache_invalidate_fd & bcache_abort_fd.
>> bcache_invalidate_fd work as before, only return true or false to indicate there is or isn't fd in cache->errored.
>> Then bcache_abort_fd calls _abort_v, _abort_v calls _unlink_block & _free_block.
>> These two functions only delist block from currently cache->errored & cache->free list.
>> The data still in radix tree with flags BF_DIRTY.
> 
> In _abort_v():
> 
> 1402│        // We can't remove the block from the radix tree yet because
>     1│        // we're in the middle of an iteration.
> 
> and then after the iteration:
> 
> 1416│        radix_tree_remove_prefix(cache->rtree, k.bytes, k.bytes + sizeof(k.parts.fd));
> 
> I've added a unit test to demonstrate it does indeed work:
> 
>   840│static void test_abort_forces_reread(void *context)
>     1│{
>     2│        struct fixture *f = context;
>     3│        struct mock_engine *me = f->me;
>     4│        struct bcache *cache = f->cache;
>     5│        struct block *b;
>     6│        int fd = 17;
>     7│
>     8│        _expect_read(me, fd, 0);
>     9│        _expect(me, E_WAIT);
>    10│        T_ASSERT(bcache_get(cache, fd, 0, GF_DIRTY, &b));
>    11│        bcache_put(b);
>    12│
>    13│        bcache_abort_fd(cache, fd);
>    14│        T_ASSERT(bcache_flush(cache));
>    15│
>    16│        // Check the block is re-read
>    17│        _expect_read(me, fd, 0);
>    18│        _expect(me, E_WAIT);
>    19│        T_ASSERT(bcache_get(cache, fd, 0, 0, &b));
>    20│        bcache_put(b);
>    21│}
> 
> - Joe
> 
