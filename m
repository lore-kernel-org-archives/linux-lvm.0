References: <20170101141514.jnazw5dd4kfpcip4@cebalrai>
	<db547e6d-c328-561c-b4d0-de848dc2e1fa@free-minds.net>
	<476a92b3-a993-dfed-0c8b-8ba557e1f980@free-minds.net>
From: Heinz Mauelshagen <heinzm@redhat.com>
Message-ID: <8dca94ab-29bc-c38d-fd56-a3a6b49f7af1@redhat.com>
Date: Mon, 16 Jan 2017 14:05:24 +0100
MIME-Version: 1.0
In-Reply-To: <476a92b3-a993-dfed-0c8b-8ba557e1f980@free-minds.net>
Content-Type: multipart/alternative;
	boundary="------------FE5C9F8ACD3BFA5C7173B693"
Subject: Re: [linux-lvm] Change stripe cache for lvm raid5
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
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: me@free-minds.net

This is a multi-part message in MIME format.
--------------FE5C9F8ACD3BFA5C7173B693
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit



On 01/15/2017 05:57 PM, Sebastian Bachmann wrote:
> Hi again!
>
> Actually setting the stripe cache using dmsetup reload works. You just
> have to resume the device after it was reloaded. I did not read the
> documentation well enough to recognize that:

Yes, reload populates the inactive table (see "dmsetup info" after the 
reload),
resume switches active and inactive table and removes the latter.

>
> $ dmsetup table
> [...]
> myvg-lv: 0 11525947392 raid raid5_ls 3 128 region_size 8192 3 254:5
> 254:6 254:7 254:8 254:9 254:10
> [...]
> $ dmsetup reload myvg-lv --table '0 11525947392 raid raid5_ls 5 128
> stripe_cache 16384 region_size 8192 3 254:5 254:6 254:7 254:8 254:9 254:10'
> $ dmsetup resume myvg-lv
> $ dmsetup table
> [...]
> myvg-lv: 0 11525947392 raid raid5_ls 5 128 region_size 8192 stripe_cache
> 16534 3 254:5 254:6 254:7 254:8 254:9 254:10
> [...]
>
> If you do this, there is actually a speedup, as suggested in various
> threads about mdraid.
>
> Is there now any way to make this persistent? I saw there are udev hooks
> for lvm, but I think you can not simply put the new dmsetup table
> argument there...

Never dmsetup any table lines in a static way, because they'd not refelect
changes to your raid5 set done lateron via lvm commands (size change).

Ultimately persistent changes to the stripe cache have to be coped
with in lvm2.

As a workaround until that's added, you might create a script
retrieving any current raid5 set table, editing the parameter count
and insertting "stripe_cache #".

Heinz

>
> regards
> sebastian
>
> On 01/01/2017 05:45 PM, Sebastian Bachmann wrote:
>> Hi!
>>
>> Just a sidenote: I tried to set the stripe_cache option via dmsetup
>> reload in a debian jessie VM. With the 3.16 kernel, it crashed with a
>> null pointer dereference error in raid5_set_cache_size function.
>> I upgraded to a newer kernel version (4.8.11) and tried it again,
>> the cache size can be set there using reload:
>>
>> Jan  1 15:44:56 jessie kernel: [   33.913336] device-mapper: raid: 16384
>> stripe cache entries
>>
>>
>> I then upgraded the kernel on my machine with the RAID5 and found out,
>> that even without any cache settings, the RAID is now two to four times
>> faster in writing than before. I now get around 80-100MB/s.
>> It seems that there were a lot of changes between 3.16 and 4.8 regarding
>> speed, not only fixing this crash.
>>
>> I tried now setting the stripe cache size on the RAID5 but the speed
>> does not get higher though...
>> According to the numerous reports on the internet, the impact on write
>> performance should be great - so it would still be interesting if the
>> stripe_cache is actually set correctly when using dmsetup reload (if I
>> run dmsetup table again, i still see the old line) and if it somehow can
>> be set persistently with LVM.
>>
>> regards
>> sebastian
>>
>> On 01/01/2017 03:15 PM, Sebastian Bachmann wrote:
>>> Hi!
>>> I'm using a LVM RAID5 on a machine but the write performance is pretty poor
>>> (about 20-30MB/s),
>>> where the read performance is quite good (about 280MB/s).
>>> I read about the stripe_cache_size for md raid and as far as I understand LVM
>>> raid, it uses md as well.
>>> In the design document for lvm2-raid
>>> (https://git.fedorahosted.org/cgit/lvm2.git/tree/doc/lvm2-raid.txt) I can find
>>> that a option --stripecache is specified there, but as it seems those options
>>> were never implemented.
>>>
>>> Is it possible to set the stripe cache size somewhere else? It seems to me that
>>> lvm2 uses dmsetup to create the raid, where a stripe cache can be set while
>>> creation. But it seems to me there is no interface to change such values
>>> later on?
>>>
>>> Thanks in advance!
>>>
>>> regards
>>> Sebastian
>>>
>>>
>>>
>>> _______________________________________________
>>> linux-lvm mailing list
>>> linux-lvm@redhat.com
>>> https://www.redhat.com/mailman/listinfo/linux-lvm
>>> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>>>
>>
>>
>> _______________________________________________
>> linux-lvm mailing list
>> linux-lvm@redhat.com
>> https://www.redhat.com/mailman/listinfo/linux-lvm
>> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>>
>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/


--------------FE5C9F8ACD3BFA5C7173B693
Content-Type: text/html; charset=windows-1252
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=windows-1252"
      http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <p><br>
    </p>
    <br>
    <div class="moz-cite-prefix">On 01/15/2017 05:57 PM, Sebastian
      Bachmann wrote:<br>
    </div>
    <blockquote
      cite="mid:476a92b3-a993-dfed-0c8b-8ba557e1f980@free-minds.net"
      type="cite">
      <pre wrap="">Hi again!

Actually setting the stripe cache using dmsetup reload works. You just
have to resume the device after it was reloaded. I did not read the
documentation well enough to recognize that:</pre>
    </blockquote>
    <br>
    Yes, reload populates the inactive table (see "dmsetup info" after
    the reload),<br>
    resume switches active and inactive table and removes the latter.<br>
    <br>
    <blockquote
      cite="mid:476a92b3-a993-dfed-0c8b-8ba557e1f980@free-minds.net"
      type="cite">
      <pre wrap="">

$ dmsetup table
[...]
myvg-lv: 0 11525947392 raid raid5_ls 3 128 region_size 8192 3 254:5
254:6 254:7 254:8 254:9 254:10
[...]
$ dmsetup reload myvg-lv --table '0 11525947392 raid raid5_ls 5 128
stripe_cache 16384 region_size 8192 3 254:5 254:6 254:7 254:8 254:9 254:10'
$ dmsetup resume myvg-lv
$ dmsetup table
[...]
myvg-lv: 0 11525947392 raid raid5_ls 5 128 region_size 8192 stripe_cache
16534 3 254:5 254:6 254:7 254:8 254:9 254:10
[...]

If you do this, there is actually a speedup, as suggested in various
threads about mdraid.

Is there now any way to make this persistent? I saw there are udev hooks
for lvm, but I think you can not simply put the new dmsetup table
argument there...</pre>
    </blockquote>
    <br>
    Never dmsetup any table lines in a static way, because they'd not
    refelect<br>
    changes to your raid5 set done lateron via lvm commands (size
    change).<br>
    <br>
    Ultimately persistent changes to the stripe cache have to be coped<br>
    with in lvm2.<br>
    <br>
    As a workaround until that's added, you might create a script<br>
    retrieving any current raid5 set table, editing the parameter count<br>
    and insertting "stripe_cache #".<br>
    <br>
    Heinz<br>
    <br>
    <blockquote
      cite="mid:476a92b3-a993-dfed-0c8b-8ba557e1f980@free-minds.net"
      type="cite">
      <pre wrap="">

regards
sebastian

On 01/01/2017 05:45 PM, Sebastian Bachmann wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="">Hi!

Just a sidenote: I tried to set the stripe_cache option via dmsetup
reload in a debian jessie VM. With the 3.16 kernel, it crashed with a
null pointer dereference error in raid5_set_cache_size function.
I upgraded to a newer kernel version (4.8.11) and tried it again,
the cache size can be set there using reload:

Jan  1 15:44:56 jessie kernel: [   33.913336] device-mapper: raid: 16384
stripe cache entries


I then upgraded the kernel on my machine with the RAID5 and found out,
that even without any cache settings, the RAID is now two to four times
faster in writing than before. I now get around 80-100MB/s.
It seems that there were a lot of changes between 3.16 and 4.8 regarding
speed, not only fixing this crash.

I tried now setting the stripe cache size on the RAID5 but the speed
does not get higher though...
According to the numerous reports on the internet, the impact on write
performance should be great - so it would still be interesting if the
stripe_cache is actually set correctly when using dmsetup reload (if I
run dmsetup table again, i still see the old line) and if it somehow can
be set persistently with LVM.

regards
sebastian

On 01/01/2017 03:15 PM, Sebastian Bachmann wrote:
</pre>
        <blockquote type="cite">
          <pre wrap="">Hi!
I'm using a LVM RAID5 on a machine but the write performance is pretty poor
(about 20-30MB/s),
where the read performance is quite good (about 280MB/s).
I read about the stripe_cache_size for md raid and as far as I understand LVM
raid, it uses md as well.
In the design document for lvm2-raid
(<a class="moz-txt-link-freetext" href="https://git.fedorahosted.org/cgit/lvm2.git/tree/doc/lvm2-raid.txt">https://git.fedorahosted.org/cgit/lvm2.git/tree/doc/lvm2-raid.txt</a>) I can find
that a option --stripecache is specified there, but as it seems those options
were never implemented.

Is it possible to set the stripe cache size somewhere else? It seems to me that
lvm2 uses dmsetup to create the raid, where a stripe cache can be set while
creation. But it seems to me there is no interface to change such values
later on?

Thanks in advance!

regards
Sebastian



_______________________________________________
linux-lvm mailing list
<a class="moz-txt-link-abbreviated" href="mailto:linux-lvm@redhat.com">linux-lvm@redhat.com</a>
<a class="moz-txt-link-freetext" href="https://www.redhat.com/mailman/listinfo/linux-lvm">https://www.redhat.com/mailman/listinfo/linux-lvm</a>
read the LVM HOW-TO at <a class="moz-txt-link-freetext" href="http://tldp.org/HOWTO/LVM-HOWTO/">http://tldp.org/HOWTO/LVM-HOWTO/</a>

</pre>
        </blockquote>
        <pre wrap="">


_______________________________________________
linux-lvm mailing list
<a class="moz-txt-link-abbreviated" href="mailto:linux-lvm@redhat.com">linux-lvm@redhat.com</a>
<a class="moz-txt-link-freetext" href="https://www.redhat.com/mailman/listinfo/linux-lvm">https://www.redhat.com/mailman/listinfo/linux-lvm</a>
read the LVM HOW-TO at <a class="moz-txt-link-freetext" href="http://tldp.org/HOWTO/LVM-HOWTO/">http://tldp.org/HOWTO/LVM-HOWTO/</a>

</pre>
      </blockquote>
      <pre wrap="">
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <br>
      <pre wrap="">_______________________________________________
linux-lvm mailing list
<a class="moz-txt-link-abbreviated" href="mailto:linux-lvm@redhat.com">linux-lvm@redhat.com</a>
<a class="moz-txt-link-freetext" href="https://www.redhat.com/mailman/listinfo/linux-lvm">https://www.redhat.com/mailman/listinfo/linux-lvm</a>
read the LVM HOW-TO at <a class="moz-txt-link-freetext" href="http://tldp.org/HOWTO/LVM-HOWTO/">http://tldp.org/HOWTO/LVM-HOWTO/</a></pre>
    </blockquote>
    <br>
  </body>
</html>

--------------FE5C9F8ACD3BFA5C7173B693--
