From: Heming Zhao <heming.zhao@suse.com>
Date: Mon, 14 Oct 2019 03:13:13 +0000
Message-ID: <bf4a79f3-3604-9981-b6f2-5ad702c8d09a@suse.com>
References: <CH2PR18MB32067A650CBE520D9A0DC547CFB10@CH2PR18MB3206.namprd18.prod.outlook.com>
	<6b055125-2e06-df7d-89fa-6c347404a9cd@suse.com>
	<20191011151405.GA31912@redhat.com>
	<4139435d-c8fc-71c3-6066-ebfc882e9511@suse.com>
	<d8f2f0af-0b54-76ca-6a44-adabc73f1a08@suse.com>
In-Reply-To: <d8f2f0af-0b54-76ca-6a44-adabc73f1a08@suse.com>
Content-Language: en-US
Content-ID: <60957FE9BDD8184EA7B3A86B6BFC576D@namprd18.prod.outlook.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] pvresize will cause a meta-data corruption with
 error message "Error writing device at 4096 length 512"
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
To: David Teigland <teigland@redhat.com>
Cc: Gang He <GHe@suse.com>, "linux-lvm@redhat.com" <linux-lvm@redhat.com>

For the issue in bcache_flush, it's related with cache->errored.

I give my fix. I believe there should have better solution than my.

Solution:
To keep cache->errored, but this list only use to save error data,
and the error data never resend.
So bcache_flush check the cache->errored, when the errored list is not empty,
bcache_flush return false, it will trigger caller/upper to do the clean jobs.

```
commit 17e959c0ba58edc67b6caa7669444ecffa40a16f (HEAD -> master)
Author: Zhao Heming <heming.zhao@suse.com>
Date:   Mon Oct 14 10:57:54 2019 +0800

     The fd in cache->errored may already be closed before calling bcache_flush,
     so bcache_flush shouldn't rewrite data in cache->errored. Currently
     solution is return error to caller when cache->errored is not empty, and
     caller should do all the clean jobs.
     
     Signed-off-by: Zhao Heming <heming.zhao@suse.com>

diff --git a/lib/device/bcache.c b/lib/device/bcache.c
index cfe01bac2f..2eb3f0ee34 100644
--- a/lib/device/bcache.c
+++ b/lib/device/bcache.c
@@ -897,16 +897,20 @@ static bool _wait_io(struct bcache *cache)
   * High level IO handling
   *--------------------------------------------------------------*/
  
-static void _wait_all(struct bcache *cache)
+static bool _wait_all(struct bcache *cache)
  {
+       bool ret = true;
         while (!dm_list_empty(&cache->io_pending))
-               _wait_io(cache);
+               ret = _wait_io(cache);
+       return ret;
  }
  
-static void _wait_specific(struct block *b)
+static bool _wait_specific(struct block *b)
  {
+       bool ret = true;
         while (_test_flags(b, BF_IO_PENDING))
-               _wait_io(b->cache);
+               ret = _wait_io(b->cache);
+       return ret;
  }
  
  static unsigned _writeback(struct bcache *cache, unsigned count)
@@ -1262,10 +1266,7 @@ void bcache_put(struct block *b)
  
  bool bcache_flush(struct bcache *cache)
  {
-       // Only dirty data is on the errored list, since bad read blocks get
-       // recycled straight away.  So we put these back on the dirty list, and
-       // try and rewrite everything.
-       dm_list_splice(&cache->dirty, &cache->errored);
+       bool ret = true;
  
         while (!dm_list_empty(&cache->dirty)) {
                 struct block *b = dm_list_item(_list_pop(&cache->dirty), struct block);
@@ -1275,11 +1276,18 @@ bool bcache_flush(struct bcache *cache)
                 }
  
                 _issue_write(b);
+               if (b->error) ret = false;
         }
  
-       _wait_all(cache);
+       ret = _wait_all(cache);
  
-       return dm_list_empty(&cache->errored);
+       // merge the errored list to dirty, return false to trigger caller to
+       // clean them.
+       if (!dm_list_empty(&cache->errored)) {
+               dm_list_splice(&cache->dirty, &cache->errored);
+               ret = false;
+       }
+       return ret;
  }
  
  //----------------------------------------------------------------
```
