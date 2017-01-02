Received: from [10.40.200.108] (ovpn-200-108.brq.redhat.com [10.40.200.108])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id v02GKbjZ020219
	for <linux-lvm@redhat.com>; Mon, 2 Jan 2017 11:20:38 -0500
References: <fa65ab01-440c-99a2-a13b-807d302c14e6@gmail.com>
	<6d81aa92-0b9a-56c9-9577-3c6bf13f6a76@redhat.com>
	<610b64fb-b185-4480-2739-9d6ce600c287@gmail.com>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <dd4b1b45-daa4-06eb-7bf1-9dd3ac4f0276@redhat.com>
Date: Mon, 2 Jan 2017 17:20:36 +0100
MIME-Version: 1.0
In-Reply-To: <610b64fb-b185-4480-2739-9d6ce600c287@gmail.com>
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

Dne 2.1.2017 v 16:29 Raman Gupta napsal(a):
> On 02/01/17 10:15 AM, Zdenek Kabelac wrote:
>> Dne 29.12.2016 v 14:52 Raman Gupta napsal(a):
>>> I am trying out the lvmcache functionality. So far, everything looks
>>> great. I have two questions:
>>>
>>> 1) The man page of lvmcache states "With the --cachemode option, the
>>> cache mode can be set when creating a cache LV, or changed on an
>>> existing cache LV." However, I can't figure out the right command to
>>> change the cache mode on an existing LV.
>>
>>
>> Hi
>>
>>
>> 'change' of cachemode  is  'lvchange' operation
>
> Hmm, there is no mention of cachemode change in `lvchange` man page
> (nor a reference from `lvmcache` man page). Guessing at the syntax,
> still no luck:
>
> # lvchange --verbose --cachemode writeback vg_raid10/lv_var
> lvchange: unrecognized option '--cachemode'
>   Error during parsing of command line.
>


Please use some more recent version of lvm2  ( > 2.02.155)
The newer the better...

Regards

Zdenek
