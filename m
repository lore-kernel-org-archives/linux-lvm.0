Message-ID: <52F91742.6020205@redhat.com>
Date: Mon, 10 Feb 2014 19:15:30 +0100
From: Peter Rajnoha <prajnoha@redhat.com>
MIME-Version: 1.0
References: <20140123142700.315e2d3f@leda.localdomain>	<20140204095544.65cad0f2@leda.localdomain>	<52F1198B.8000706@redhat.com>	<20140207141420.54239977@leda.localdomain>	<20140208003607.503a44c9@leda.localdomain>	<20140208005550.6b7e134d@leda.localdomain>	<52F88ED0.8030201@redhat.com>	<20140210103056.2f2a950f@leda.localdomain>	<52F8C3FC.6000302@redhat.com>	<20140210144821.65cf1a19@leda.localdomain>	<52F8DE52.1080805@redhat.com>	<20140210153707.261afa77@leda.localdomain>
	<52F8F6BD.6000101@redhat.com>
In-Reply-To: <52F8F6BD.6000101@redhat.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] blkid_wiping breaks snapshots
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
To: zkabelac@redhat.com
Cc: Christian Hesse <list@eworm.de>, LVM general discussion and development <linux-lvm@redhat.com>

On 02/10/2014 04:56 PM, Zdenek Kabelac wrote:
> Dne 10.2.2014 15:37, Christian Hesse napsal(a):
>> Peter Rajnoha <prajnoha@redhat.com> on Mon, 2014/02/10 15:12:
>>> On 02/10/2014 02:48 PM, Christian Hesse wrote:
>>>> Zdenek Kabelac <zkabelac@redhat.com> on Mon, 2014/02/10 13:20:
>>>>> Dne 10.2.2014 10:30, Christian Hesse napsal(a):
>>>>>> Zdenek Kabelac <zkabelac@redhat.com> on Mon, 2014/02/10 09:33:
>>>>>>> Dne 8.2.2014 00:55, Christian Hesse napsal(a):
>>>>>>>> Christian Hesse <list@eworm.de> on Sat, 2014/02/08 00:36:
>>>>>>>>> Hello everybody,
>>>>>>>>>
>>>>>>>>> I think I nailed it down with git bisect. My first bad commit is:
>>>>>>>>>
>>>>>>>>> 75628f341ad38b68aae33eae0b5700be2a6e5769
>>>>>>>>> configure: enable blkid_wiping by default if the blkid library is
>>>>>>>>> present
>>>>>>>>>
>>>>>>>>> Looks like this wipes data that is still needed... Building a
>>>>>>>>> package
>>>>>>>>> with '--disable-blkid_wipe' now to verify on another system.
>>>>>>>>
>>>>>>>> Uh, this only helps part of...
>>>>>>>>
>>>>>>>> I changed my test setup and used writable snapshots. After that
>>>>>>>> I got:
>>>>>>>>
>>>>>>>> WARNING: DM_snapshot_cow signature detected on
>>>>>>>> /dev/cvg/snap-home at
>>>>>>>> offset 0. Wipe it? [y/n]
>>>>>>>>
>>>>>>>> (see https://bbs.archlinux.org/viewtopic.php?id=176504 for another
>>>>>>>> report)
>>>>>>>>
>>>>>>>> Looks like disabling blkid_wiping fixes this. My snapshot
>>>>>>>> corruption
>>>>>>>> still occurs though. :-/
>>>>>>>> Bad thing about it is that the corruption does not occur
>>>>>>>> reliable when
>>>>>>>> doing simple tests in 'git bisect'... Out of ideas for now -
>>>>>>>> Will go
>>>>>>>> to bed now.
>>>>>>>
>>>>>>> Now this was helpful, I guess I think what is going on.
>>>>>>
>>>>>> Great! Waiting for patches then. :D
>>>>>>
>>>>>> I could provide some more information when needed:
>>>>>>
>>>>>> * This happens with read only snapshots only.
>>>>>> * I could reproduce with commit
>>>>>> eaa23d32732c9bc3dd4f948781b5764cf21d84ba
>>>>>>     (wiping: add support for blkid wiping), so it was introduced
>>>>>> there or
>>>>>>     before.
>>>>>>
>>>>>> Should I investigate further or wait for something to test from you?
>>>>>
>>>>> Is the patch bellow fixing your problem ?
>>>>> (It's still not final - but should help)
>>>>>
>>>>> Zdenek
>>>>>
>>>>>
>>>>> diff --git a/tools/lvcreate.c b/tools/lvcreate.c
>>>>> index 638a868..e8b1a7f 100644
>>>>> --- a/tools/lvcreate.c
>>>>> +++ b/tools/lvcreate.c
>>>>> @@ -772,7 +772,7 @@ static int _read_activation_params(struct
>>>>> lvcreate_params *lp, LVM_READ | LVM_WRITE);
>>>>>
>>>>>           /* Must not zero/wipe read only volume */
>>>>> -       if (!(lp->permission & LVM_WRITE)) {
>>>>> +       if (!lp->snapshot && !(lp->permission & LVM_WRITE)) {
>>>>>                   lp->zero = 0;
>>>>>                   lp->wipe_signatures = 0;
>>>>>           }
>>>>
>>>> This looks good to me. I've made some backups now without any
>>>> corruption.
>>>>
>>>> But with blkid_wiping enabled I do have this warning/question now
>>>> for read
>>>> only snapshots as well:
>>>>
>>>> WARNING: DM_snapshot_cow signature detected on /dev/cvg/snap-home
>>>> at offset 0. Wipe it? [y/n]
>>>>
>>>> lvm works perfectly only with your patch applied and compiled with
>>>> --disable-blkid_wiping.
>>>
>>> Also, try this patch in addition:
>>>
>>> https://git.fedorahosted.org/cgit/lvm2.git/commit/?id=ed166a3b1d3290ad887d8f83c24a8d8877713d3c
>>>
>>
>> That did the trick. Thanks a lot!
>>
>> If anybody is interested... These are the patches updated to apply
>> against
>> version 2.02.105:
>>
>> http://www.eworm.de/download/linux/lvm2-snapshot.patch
>> http://www.eworm.de/download/linux/lvm2-snapshot-wiping.patch
>>
> 
> 
> We need to resolve the logic behind the query for wiping. We will most
> probably go with this logic:
> 
> We query for wipe of 'known' signatures, before passing newly allocated
> 'normal' LV (visible).
> Any other so called 'private/hidden' LV will do either wipe or
> unconditional zeroing of 1st. 4kb - which is usually the only thing
> needed here.
> 

MD can write its signature beyond 4K. Just an example...

> Current logic is somewhat overcomplicated.

Current logic is simple - we do the wiping first (not asking about
any special LV signatures that we directly produce - for now its only
the DM_snapshot_cow that libblkid recognizes).

And after wiping, zeroing happens.

Simple as that, nothing overcomplicated actually...

-- 
Peter
