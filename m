References: <61de26b1-0849-e71f-133c-a8357b773ee9@mglug.de>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <29e90a7a-e3ca-0dc0-93d2-7490bcef37c6@redhat.com>
Date: Mon, 15 May 2017 15:38:19 +0200
MIME-Version: 1.0
In-Reply-To: <61de26b1-0849-e71f-133c-a8357b773ee9@mglug.de>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Howto change cachepolicy on cached thinpool devices?
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
To: LVM general discussion and development <linux-lvm@redhat.com>, Oliver Rath <rath@mglug.de>

Dne 15.5.2017 v 15:25 Oliver Rath napsal(a):
> Hi list,
> 
> caching the _tdata part of a thinpool works fine now. Unfortunatly with
> lvchange it is not possible to change the policy (vg:dmivg,
> cachepool:dmipool,thinpool:winthinpool):
> 
> # lvchange --cachepolicy cleaner dmivg/dmicache
>    Operation not permitted on hidden LV dmivg/dmicache.
> 
> # lvchange --cachepolicy cleaner /dev/mapper/dmivg-winthinpool_tdata
>    Operation not permitted on hidden LV dmivg/winthinpool_tdata.
> 
> # lvchange --cachepolicy cleaner dmivg/winthinpool
>    Command on LV dmivg/winthinpool does not accept LV type thinpool.
> Required LV types are cache cachepool .
>    Command not permitted on LV dmivg/winthinpool.
> 
> The only possibility at the moment seems to change it via lowlewel
> dmsetup command.
> 
> # dmsetup status dmivg-winthinpool_tdata
> 0 7730954240 cache 8 1458/9216 128 720896/720896 4608761 7143953 1177059
> 5866353 40700 761596 2993 2 metadata2 writeback 2 migration_threshold
> 2048 smq 0 rw -
> 
> ...
> 
> How can this be done with lv*?

Hi

By opening BZ  at http://bugzilla.redhat.com/  for lvm2 ;)
Seem this has got lost in various code changes.

Should be easy to add this to supported variant.

Regards

Zdenek
