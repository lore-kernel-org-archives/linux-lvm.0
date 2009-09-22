Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.11])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id n8MFtT4H019327
	for <linux-lvm@redhat.com>; Tue, 22 Sep 2009 11:55:29 -0400
Received: from smtp.bredband2.com (smtp.bredband2.com [83.219.192.166])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n8MFtB59027644
	for <linux-lvm@redhat.com>; Tue, 22 Sep 2009 11:55:11 -0400
Received: from caramon (c-83-219-217-17.cust.bredband2.com [83.219.217.17])
	by smtp.bredband2.com (Postfix) with ESMTPA id 084C4CD792
	for <linux-lvm@redhat.com>; Tue, 22 Sep 2009 17:54:58 +0200 (CEST)
Message-ID: <591E7537BD9C4AF4A670A0B7EB688472@caramon>
From: "Fredrik Skog" <fredrik.skog@rodang.se>
References: <127450ED38024F8FA2FD360E99F363ED@caramon><1253308756.16684.7@raydesk1.bettercgi.com><20090919161120.6ef5215d@fixlaptop.gillibert.homelinux.net><265193D025D942D48C90FB7AA795DFC4@caramon><alpine.LNX.2.00.0909211220540.26724@bernoulli.globalphasing.com><9A8B0F42DE4042E3904AF43CBFEE4510@caramon>
	<45A063C7CD9F458C8D62DCB729CE9782@caramon>
Subject: Re: [linux-lvm] Disk crash on LVM
Date: Tue, 22 Sep 2009 17:54:59 +0200
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; format="flowed"; charset="utf-8"; reply-type="response"
To: LVM general discussion and development <linux-lvm@redhat.com>

Hi

I'm a bit confused about how pvmove works now...
I have done alot och pvmove on the same PV now and the total percentage of 
all the pvmoves is alot bigger than 100%
17%+21%+7%+5%+67%+5%+.....

Why is that?

thanks
/Fredrik



----- Original Message ----- 
From: "Fredrik Skog" <fredrik.skog@rodang.se>
To: "LVM general discussion and development" <linux-lvm@redhat.com>
Sent: Tuesday, September 22, 2009 3:43 PM
Subject: Re: [linux-lvm] Disk crash on LVM


> Hello again,
>
> Is there any way to see how much the total progress of pvmove is? I now 
> have issued the command 7-8 times with different amount of progress. And I 
> have no idea how much is remaining of the total.
>
> Thanks
> /Fredrik
>
>
> ----- Original Message ----- 
> From: "Fredrik Skog" <fredrik.skog@rodang.se>
> To: "LVM general discussion and development" <linux-lvm@redhat.com>
> Sent: Tuesday, September 22, 2009 3:27 PM
> Subject: Re: [linux-lvm] Disk crash on LVM
>
>
>> Hi
>>
>> I'll update you on the progress with my crashed hd.
>> I'm not yet finished with the pvmove from the device because it won't 
>> work for very long at a time.
>> If I have the drive in room temperature and then put it in the freezer 
>> for 25-30mins it works for maybe 15-20min (the drive still in the 
>> freezer)and i get a pvmove progress of about 15-20%.
>> If I then shut it down and just let it cool again I get maybe 5-7% more 
>> out of it before it dies.Prolonging the time in the freezer doesn't seem 
>> to help at all, in fact sometimes it's worse and the drive doesn't start 
>> at all. The drive seems to need a few hours warm-up time after it's been 
>> frozen and then stopped working before I can refreeze it again.
>> It takes ridiculous amounts of time fiddling with this, but I hope to get 
>> to the finish soon.
>> I have not yet tried to increase the readahead.
>>
>> /Fredrik
>>
>>
>> ----- Original Message ----- 
>> From: "Peter Keller" <pkeller@globalphasing.com>
>> To: "LVM general discussion and development" <linux-lvm@redhat.com>
>> Sent: Monday, September 21, 2009 1:27 PM
>> Subject: Re: [linux-lvm] Disk crash on LVM
>>
>>
>>> Coming a bit late to this thread...
>>>
>>> On Sat, 19 Sep 2009, Fredrik Skog wrote:
>>>
>>>> Thanks guys for your input on the matter.
>>>> I lenghtened the power cables and bought a full lenght SATA cable. Now 
>>>> the
>>>> disk is in the freezer and in progress with pvmove. 10% now. so far so 
>>>> good.
>>>> The reason i decided for the pvmove instead of dd or dd_rescue was the 
>>>> fact
>>>> that i tried a pvmove before, so the process was already started but it
>>>> stopped working on 1%. Now with a frozen and working disk it continued 
>>>> from
>>>> where it left off.
>>>
>>> I have found that with sequential reads like this, adjusting the 
>>> readahead
>>> of the device with something like 'blockdev --setra nnn' can 
>>> dramatically
>>> shorten the time needed to read the whole device.
>>>
>>> The default usually seems to be too low when reading sequentially. If 
>>> you
>>> haven't already adjusted it, try adjusting it upwards. Values like 8192 
>>> or
>>> 16384 may help.
>>>
>>> Good luck,
>>> Peter.
>>>
>>>> I can tell you how it turned out later.
>>>>
>>>> Thanks
>>>>
>>>> /Fredrik
>>>>
>>>>
>>>>
>>>> ----- Original Message ----- From: "André Gillibert" <rcvxdg@gmail.com>
>>>> To: <linux-lvm@redhat.com>
>>>> Sent: Saturday, September 19, 2009 4:11 PM
>>>> Subject: Re: [linux-lvm] Disk crash on LVM
>>>>
>>>>
>>>>> Ray Morris <support@bettercgi.com> wrote:
>>>>>> [...]
>>>>>>    Then dd from the old copy of the LV to the new:
>>>>>>
>>>>>> dd if=/dev/org/$1 bs=64M iflag=direct |
>>>>>> dd of=/dev/copy/$1 bs=64M oflag=direct
>>>>>>
>>>>>>    That piped dd is 2-3 times faster than the "obvious"
>>>>>> way to run dd.
>>>>>> [...]
>>>>>
>>>>> The issue with dd is that if any read() fails, it skips the entry 
>>>>> (64M) and
>>>>> doesn't write to the output, making the output file smaller than the 
>>>>> input
>>>>> file.
>>>>>
>>>>> with conv=sync,noerror, it's better, but, still loosing a whole 64M 
>>>>> block
>>>>> at once is a bad thing.
>>>>>
>>>>> That's why I think dd_rescue would be better.
>>>>> <http://www.garloff.de/kurt/linux/ddrescue/>
>>>>>
>>>>> If it still gets warm too fast, I've heard that storing the hard drive 
>>>>> in a
>>>>> freezer 24 hours may make it work again.
>>>>> <http://geeksaresexy.blogspot.com/2006/01/freeze-your-hard-drive-to-recover-data.html>
>>>>>
>>>>> If it crashes when dd or dd_rescue fails, it's possible to continue 
>>>>> copying
>>>>> later, from the point it failed.
>>>>>
>>>>> -- 
>>>>> André Gillibert
>>>>>
>>>>>
>>>>>
>>>>> _______________________________________________
>>>>> linux-lvm mailing list
>>>>> linux-lvm@redhat.com
>>>>> https://www.redhat.com/mailman/listinfo/linux-lvm
>>>>> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>>>>
>>>> _______________________________________________
>>>> linux-lvm mailing list
>>>> linux-lvm@redhat.com
>>>> https://www.redhat.com/mailman/listinfo/linux-lvm
>>>> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>>>>
>>>
>>> -- 
>>> Peter Keller                                     Tel.: +44 (0)1223 
>>> 353033
>>> Global Phasing Ltd.,                             Fax.: +44 (0)1223 
>>> 366889
>>> Sheraton House,
>>> Castle Park,
>>> Cambridge CB3 0AX
>>> United Kingdom
>>
>>
>> --------------------------------------------------------------------------------
>>
>>
>>> _______________________________________________
>>> linux-lvm mailing list
>>> linux-lvm@redhat.com
>>> https://www.redhat.com/mailman/listinfo/linux-lvm
>>> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>>
>> _______________________________________________
>> linux-lvm mailing list
>> linux-lvm@redhat.com
>> https://www.redhat.com/mailman/listinfo/linux-lvm
>> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/ 
