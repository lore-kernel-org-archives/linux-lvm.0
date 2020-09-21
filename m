References: <552451034.4238344.1600678309529.JavaMail.zimbra@karlsbakk.net>
	<58ac5e5a-a3ce-6844-8a30-29f65dc857b7@redhat.com>
	<2072153092.4261300.1600682482754.JavaMail.zimbra@karlsbakk.net>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <c6499a9a-1e69-9502-85b5-b62bb5a4771b@redhat.com>
Date: Mon, 21 Sep 2020 14:53:39 +0200
MIME-Version: 1.0
In-Reply-To: <2072153092.4261300.1600682482754.JavaMail.zimbra@karlsbakk.net>
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

Dne 21. 09. 20 v 12:01 Roy Sigurd Karlsbakk napsal(a):
>> Dne 21. 09. 20 v 10:51 Roy Sigurd Karlsbakk napsal(a):
>>> Hi all
>>>

>> However since you have 'writethrough' cache mode - it should be possible to
>> use  'lvconvert --uncache --force'
> 
> # lvconvert --uncache --force data/data
>    Unknown feature in status: 8 2484/262144 128 819198/819200 57470386 35323243 19987362 9940326 0 0 1 3 metadata2 writethrough no_discard_passdown 2 migration_threshold 2048 smq 0 rw -
>    Flushing 1 blocks for cache data/data.
>    Unknown feature in status: 8 2484/262144 128 819198/819200 57439248 35307947 19981793 9938992 0 0 1 3 metadata2 writethrough no_discard_passdown 2 migration_threshold 2048 cleaner 0 rw -
>    Flushing 1 blocks for cache data/data.
>    Unknown feature in status: 8 2484/262144 128 819198/819200 57439248 35307947 19981793 9938992 0 0 1 3 metadata2 writethrough no_discard_passdown 2 migration_threshold 2048 cleaner 0 rw -
> (et cetera et cetera ad infinitum)
> 
>> But I'm somehow confused how you can have any dirty blocks in this case ??
> 
> So am I
> 
>> lvm2 2.03.02 version was somewhat experimental release - so I've recommend
>> something newer  - which will also properly parse newer status output from
>> newer kernel dm-cache module.
> 
> Well, that's weird - debian is usually rather conservative on its packages in a stable release. Are you sure?
> 
> I also updated to a backported kernel 5.7 without any change.


Hi

Please can you open upstream BZ here:

https://bugzilla.redhat.com/enter_bug.cgi?product=LVM%20and%20device-mapper

List all the info - i.e. package versions (yep even .debs), kernel versions
lvmdump  archive.

I can probably easily 'hand-make' lvm2 metadata for you for 'vgcfgrestore' - 
but I'd like to track this case and create some reproducer for this issue so
we can handle case were the cache cannot be cleared.

Regards

Zdenek
