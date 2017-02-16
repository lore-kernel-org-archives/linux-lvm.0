References: <CAPWV3huuXGcpuvOd8DYykHfDR+x+QuxLO7u5u5hLg1RZMov2TA@mail.gmail.com>
	<7252715d-7ef5-a105-becf-03c028b3e1cc@gmail.com>
	<CAPWV3hunUyuPY2UMPQS_2OSenEMt4Ygb2Kn1+q00_+e5BOyR4Q@mail.gmail.com>
	<a7ce046a-ec7f-f2fd-0ce4-8b76da0b2d95@gmail.com>
	<CAPWV3hs33y93mcExFJwXO5RBVnCo87k0UxZQ9vJKQmBOUoaQ3g@mail.gmail.com>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <05145adb-534e-f0bc-94ea-65443e3c5bdd@redhat.com>
Date: Thu, 16 Feb 2017 11:29:53 +0100
MIME-Version: 1.0
In-Reply-To: <CAPWV3hs33y93mcExFJwXO5RBVnCo87k0UxZQ9vJKQmBOUoaQ3g@mail.gmail.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Caching policy in machine learning context
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
To: Jonas.Degrave@ugent.be, LVM general discussion and development <linux-lvm@redhat.com>

Dne 15.2.2017 v 14:30 Jonas Degrave napsal(a):
> Thanks, I tried your suggestions, and tried going back to the mq policy and
> play with those parameters. In the end, I tried:
>
>     lvchange --cachesettings 'migration_threshold=20000000
>     sequential_threshold=10000000 read_promote_adjustment=1
>     write_promote_adjustment=4' VG
>
>
> With little success. This is probably due to the mq-policy looking only at the
> hit-count, rather than the hit-rate. Or at least, that is what I make up from
> line 595 in the code:
> http://lxr.free-electrons.com/source/drivers/md/dm-cache-policy-mq.c?v=3.19#L595
>
> I wrote a small script, so my users could empty the cache manually, if they
> want to:
>
>     #!/bin/bash
>     if [ "$(id -u)" != "0" ]; then
>        echo "This script must be run as root" 1>&2
>        exit 1
>     fi
>     lvremove -y VG/lv_cache
>     lvcreate -L 445G -n lv_cache VG /dev/sda
>     lvcreate -L 1G -n lv_cache_meta VG /dev/sda
>     lvconvert -y --type cache-pool --poolmetadata VG/lv_cache_meta VG/lv_cache
>     lvchange --cachepolicy smq VG
>     lvconvert --type cache --cachepool VG/lv_cache VG/lv
>
>
> So, the only remaining option for me, would to write my own policy. This
> should be quite simple, as you basically need to act as if the cache is not
> full yet.
>
> Can someone point me in the right direction as to how to do this? I have tried
> to find the last version of the code, but the best I could find was a redhat
> CVS-server which times out when connecting.
>
>     cvs -d :pserver:cvs@sources.redhat.com:/cvs/dm login cvs
>     CVS password:
>     cvs [login aborted]: connect to sources.redhat.com
>     <http://sources.redhat.com>(209.132.183.64):2401 failed: Connection timed out
>
>
>  Can someone direct me to the latest source of the smq-policy?
>

Hi

Yep - it does look like you have some special use-case where you know 'ahead 
of time' what's the usage pattern going to be.

'smq' policy is targeted to rather 'slowly' fill over the time with 'more time 
permanent data' which are known to be kept used over and over - so i.e. after 
reboot there is large chance you will need them again.

But in your case it seems you need a policy which fills very quickly with 
current set of date - i.e. some sore of  page-cache extension.

So to get to the source:

https://github.com/torvalds/linux/blob/master/drivers/md/dm-cache-policy-smq.c

relatively 'small' piece of code - by may take a while to get to it as you 
need to fit within policy rules - there is certain limited amount of data you 
may keep with cached data block and some others...

Once you get new dm caching policy loaded - lvm2 should be able to use it,
as  cache_policy & cache_settings  are 'free-from' strings.

For 4.12 kernel (likely) there is going to be new 'cache2-like' which should 
be match faster with startup...    but likely it may or may not solve your 
special 100GB workload.

Regards

Zdenek
