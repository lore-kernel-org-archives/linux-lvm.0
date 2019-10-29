From: Heming Zhao <heming.zhao@suse.com>
Date: Tue, 29 Oct 2019 11:41:08 +0000
Message-ID: <118821f7-15ab-7adb-f523-e0889657b5a4@suse.com>
References: <ae72bf0f-2776-0bdc-7e4a-dc229cac481a@suse.com>
	<20191023213101.gpkorwubuobm5w5y@reti>
	<a3738d0e-cfba-af45-afd2-a08ca1819c83@suse.com>
	<20191028154313.ibspu6qwqqsq54cc@reti>
	<324885c4-a211-fb11-8315-979935391820@suse.com>
	<20191029110141.x6ct2n7ofhd34efw@reti>
In-Reply-To: <20191029110141.x6ct2n7ofhd34efw@reti>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <36E86FD317A80C4990F66FD906674D53@namprd18.prod.outlook.com>
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



On 10/29/19 7:01 PM, Joe Thornber wrote:
> On Tue, Oct 29, 2019 at 05:07:30AM +0000, Heming Zhao wrote:
>> Hello Joe,
>>
>> Please check my comments for your commit 2938b4dcc & 6b0d969b
>>
>> 1. b->ref_count is non-zero, and write error happens, the data never release?
>>      (no place to call _unlink_block & _free_block)
> 
> Correct, the data will not be released until the client calls bcache_abort_fd(), to
> indicate that it's giving up on the write.  That way the client is free to retry
> io, eg, see this unit test:
> 
>   689│static void test_write_bad_issue_stops_flush(void *context)
>     1│{
>     2│        struct fixture *f = context;
>     3│        struct mock_engine *me = f->me;
>     4│        struct bcache *cache = f->cache;
>     5│        struct block *b;
>     6│        int fd = 17;
>     7│
>     8│        T_ASSERT(bcache_get(cache, fd, 0, GF_ZERO, &b));
>     9│        _expect_write_bad_issue(me, fd, 0);
>    10│        bcache_put(b);
>    11│        T_ASSERT(!bcache_flush(cache));
>    12│
>    13│        // we'll let it succeed the second time
>    14│        _expect_write(me, fd, 0);
>    15│        _expect(me, E_WAIT);
>    16│        T_ASSERT(bcache_flush(cache));
>    17│}
> 
you are right.

> 
>> 2. when dev_write_bytes failed, call dev_unset_last_byte with "fd=-1" is wrong.
> 
> Quite possibly, this unset_last_byte stuff is a hack that Dave put in.  I'll look some more.
> 
> 
>> 3. I still think below error handling should be added.
>>      Below base on stable-2.02, but the core idea is same, should access the return value of io_submit & io_getevents.
>>      
>> ```
>> static bool _async_issue(struct io_engine *ioe, enum dir d, int fd,
>>      ... ...
>>       if (r < 0) {
>>           _cb_free(e->cbs, cb);
>> +       ((struct block *)context)->error = r; <== assign errno & print warning
>> +       log_warn("io_submit <%c> off %llu bytes %llu return %d:%s",
>> +           (d == DIR_READ) ? 'R' : 'W', (long long unsigned)offset,
>> +           (long long unsigned)nbytes, r, strerror(-r));
>>           return false;
>>       }
>>
>> static void _issue_low_level(struct block *b, enum dir d)
>>      ... ...
>>       dm_list_move(&cache->io_pending, &b->list);
>>    
>>       if (!cache->engine->issue(cache->engine, d, b->fd, sb, se, b->data, b)) {
>> -       /* FIXME: if io_submit() set an errno, return that instead of EIO? */
>> -       _complete_io(b, -EIO);
>> +       _complete_io(b, b->error); <=== this pass the right errno to caller.
>>           return;
>>       }
>>    }
> 
> Yep, this is good. Added.
> 
> 
>> -static void _wait_all(struct bcache *cache)
>> +static bool _wait_all(struct bcache *cache) <=== change to return error
>>    {
>> +   bool ret = true;
>>       while (!dm_list_empty(&cache->io_pending))
>> -       _wait_io(cache);
>> +       ret = _wait_io(cache);
>> +   return ret;
>>    }
>>    
>> -static void _wait_specific(struct block *b)
>> +static bool _wait_specific(struct block *b) <=== change to return error
>>    {
>> +   bool ret = true;
>>       while (_test_flags(b, BF_IO_PENDING))
>> -       _wait_io(b->cache);
>> +       ret = _wait_io(b->cache);
>> +   return ret;
>>    }
> 
> No, the wait functions just wait for io to complete, they're not interested
> in whether it succeeded.  That's what b->error is for.
> 
if io_getevents failed, how do you do? just ignore?
the data still in cache->io_pending not in cache->errored.

> 
>>
>>    bool bcache_flush(struct bcache *cache) <==== add more error handling
>>    {
>> +   bool write_ret = true, wait_ret = true;
>>    
>>       ... ...
>>           _issue_write(b);
>> +       if (b->error) write_ret = false;
>>       }
>>    
>> -   _wait_all(cache);
>> +   wait_ret = _wait_all(cache);
>>    
>> -   return dm_list_empty(&cache->errored);
>> +   if (write_ret == false || wait_ret == false ||
>> +           !dm_list_empty(&cache->errored))
>> +       return false;
>> +   else
>> +       return true;
>>    }
> 
> I don't understand how this changes the behaviour from just checking the
> size of cache->errored.
this is stable-2.02 code. master branch like below.
the core idea is to check the io_submit & io_getevents return value. (refer above codes changes)
```
bool bcache_flush(struct bcache *cache)
{
+   bool write_ret = true, wait_ret = true;
+
     // Only dirty data is on the errored list, since bad read blocks get
     // recycled straight away.  So we put these back on the dirty list, and
     // try and rewrite everything.
     dm_list_splice(&cache->dirty, &cache->errored);

     while (!dm_list_empty(&cache->dirty)) {
         struct block *b = dm_list_item(_list_pop(&cache->dirty), struct block);
         if (b->ref_count || _test_flags(b, BF_IO_PENDING)) {
             // The superblock may well be still locked.
             continue;
         }

-        _issue_write(b);
+       if (b->error) write_ret = false;
     }

-    _wait_all(cache);
+   wait_ret = _wait_all(cache);

-   return dm_list_empty(&cache->errored);
+   if (write_ret == false || wait_ret == false ||
+           !dm_list_empty(&cache->errored))
+       return false;
+   else
+       return true;
}
```

> 
> - Joe
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 
