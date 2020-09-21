References: <552451034.4238344.1600678309529.JavaMail.zimbra@karlsbakk.net>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <58ac5e5a-a3ce-6844-8a30-29f65dc857b7@redhat.com>
Date: Mon, 21 Sep 2020 11:47:05 +0200
MIME-Version: 1.0
In-Reply-To: <552451034.4238344.1600678309529.JavaMail.zimbra@karlsbakk.net>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Removing lvmcache fails
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
To: LVM general discussion and development <linux-lvm@redhat.com>, Roy Sigurd Karlsbakk <roy@karlsbakk.net>

Dne 21. 09. 20 v 10:51 Roy Sigurd Karlsbakk napsal(a):
> Hi all
> 
> I have an ssd hooked up to my system to do some caching of the raid-6 array. Now, that SSD isn't very new and has started developing some smart errors, so I thought I'd just remove it and find a nice recycle bin for it. However, this fails.

Hmm - cache isn't yet very easy to use once you start to have faulty devices 
in your device stack

> 
> This is Debian Buster (latest) with kernel 5.4 and lvm 2.03.02(2)
> 
> Any idea how to get rid of this?
> 
> # lvconvert --uncache data/data
>    Unknown feature in status: 8 2488/262144 128 819192/819200 57263288 35277148 19955332 9916661 0 1 1 3 metadata2 writethrough no_discard_passdown 2 migration_threshold 2048 smq 0 rw -


However since you have 'writethrough' cache mode - it should be possible to 
use  'lvconvert --uncache --force'

But I'm somehow confused how you can have any dirty blocks in this case ??

lvm2 2.03.02 version was somewhat experimental release - so I've recommend 
something newer  - which will also properly parse newer status output from
newer kernel dm-cache module.

Regards

Zdenek
