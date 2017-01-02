Received: from [10.40.200.108] (ovpn-200-108.brq.redhat.com [10.40.200.108])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id v02FFZuM006630
	for <linux-lvm@redhat.com>; Mon, 2 Jan 2017 10:15:35 -0500
References: <fa65ab01-440c-99a2-a13b-807d302c14e6@gmail.com>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <6d81aa92-0b9a-56c9-9577-3c6bf13f6a76@redhat.com>
Date: Mon, 2 Jan 2017 16:15:33 +0100
MIME-Version: 1.0
In-Reply-To: <fa65ab01-440c-99a2-a13b-807d302c14e6@gmail.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Two questions about lvm-cache
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Dne 29.12.2016 v 14:52 Raman Gupta napsal(a):
> I am trying out the lvmcache functionality. So far, everything looks
> great. I have two questions:
>
> 1) The man page of lvmcache states "With the --cachemode option, the
> cache mode can be set when creating a cache LV, or changed on an
> existing cache LV." However, I can't figure out the right command to
> change the cache mode on an existing LV.


Hi


'change' of cachemode  is  'lvchange' operation


>
> # lvs -a -o +devices
> (see https://paste.fedoraproject.org/514698/83019352/raw/)
>
> # lvs -o cache_mode vg_raid10/lv_var
> CacheMode
> writethrough
>
> # lvconvert --verbose --cachemode writeback vg_raid10/lv_var
> (no output)
>
> # lvs -o cache_mode vg_raid10/lv_var
> CacheMode
> writethrough
>
> # lvconvert --verbose --type cache \
>  --cachepool vg_raid10/lv_cache_pool_var \
>  --cachemode writeback vg_raid10/lv_var
> Executing: /usr/sbin/modprobe dm-cache-mq
> Executing: /usr/sbin/modprobe dm-cache-smq
> Cache is not supported with cache segment type of the original
> logical volume vg_raid10/lv_var.


Lvconvert  is typically for conversion of  one LV type to another LV type.
I.e. uncached LV into cache LV linear LV into   cache data LV and so on...

However we may eventually one day add support for driving some
'change' operations via 'lvconvert'  in case the syntax is clear and
can't cause internal tool confusion...


> 2) Does lvm manage TRIM on the cache device? Normally I set up SSD
> volumes with a weekly fstrim, but that only works for mounted filesystems.

I think there is currently no support for TRIM passthrough on cached LVs - 
these limitation might be relaxed in future versions of dm drivers.

(i.e. SSD typically needs  512K blocks for 'meaningful' TRIM while cache
blocks is usually smaller)

Regards

Zdenek
