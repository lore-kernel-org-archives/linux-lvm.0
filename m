Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.5])
	by int-mx05.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id n8LBRXPX007358
	for <linux-lvm@redhat.com>; Mon, 21 Sep 2009 07:27:33 -0400
Received: from smtp004.apm-internet.net (smtp004.apm-internet.net
	[85.119.248.54])
	by mx1.redhat.com (8.13.8/8.13.8) with SMTP id n8LBREII013860
	for <linux-lvm@redhat.com>; Mon, 21 Sep 2009 07:27:15 -0400
Received: from bernoulli.globalphasing.com (bernoulli.globalphasing.com
	[192.168.131.101])
	by mailserv1.globalphasing.com (Postfix) with ESMTP id C253A105C0
	for <linux-lvm@redhat.com>; Mon, 21 Sep 2009 12:27:13 +0100 (BST)
Date: Mon, 21 Sep 2009 12:27:14 +0100 (BST)
From: Peter Keller <pkeller@globalphasing.com>
Subject: Re: [linux-lvm] Disk crash on LVM
In-Reply-To: <265193D025D942D48C90FB7AA795DFC4@caramon>
Message-ID: <alpine.LNX.2.00.0909211220540.26724@bernoulli.globalphasing.com>
References: <127450ED38024F8FA2FD360E99F363ED@caramon><1253308756.16684.7@raydesk1.bettercgi.com>
	<20090919161120.6ef5215d@fixlaptop.gillibert.homelinux.net>
	<265193D025D942D48C90FB7AA795DFC4@caramon>
MIME-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="8323584-649032077-1253532434=:26724"
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
To: LVM general discussion and development <linux-lvm@redhat.com>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323584-649032077-1253532434=:26724
Content-Type: TEXT/PLAIN; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: 8bit

Coming a bit late to this thread...

On Sat, 19 Sep 2009, Fredrik Skog wrote:

> Thanks guys for your input on the matter.
> I lenghtened the power cables and bought a full lenght SATA cable. Now the 
> disk is in the freezer and in progress with pvmove. 10% now. so far so good.
> The reason i decided for the pvmove instead of dd or dd_rescue was the fact 
> that i tried a pvmove before, so the process was already started but it 
> stopped working on 1%. Now with a frozen and working disk it continued from 
> where it left off.

I have found that with sequential reads like this, adjusting the readahead 
of the device with something like 'blockdev --setra nnn' can dramatically 
shorten the time needed to read the whole device.

The default usually seems to be too low when reading sequentially. If you 
haven't already adjusted it, try adjusting it upwards. Values like 8192 or 
16384 may help.

Good luck,
Peter.

> I can tell you how it turned out later.
>
> Thanks
>
> /Fredrik
>
>
>
> ----- Original Message ----- From: "André Gillibert" <rcvxdg@gmail.com>
> To: <linux-lvm@redhat.com>
> Sent: Saturday, September 19, 2009 4:11 PM
> Subject: Re: [linux-lvm] Disk crash on LVM
>
>
>> Ray Morris <support@bettercgi.com> wrote:
>>> [...]
>>>    Then dd from the old copy of the LV to the new:
>>> 
>>> dd if=/dev/org/$1 bs=64M iflag=direct |
>>> dd of=/dev/copy/$1 bs=64M oflag=direct
>>>
>>>    That piped dd is 2-3 times faster than the "obvious"
>>> way to run dd.
>>> [...]
>> 
>> The issue with dd is that if any read() fails, it skips the entry (64M) and 
>> doesn't write to the output, making the output file smaller than the input 
>> file.
>> 
>> with conv=sync,noerror, it's better, but, still loosing a whole 64M block 
>> at once is a bad thing.
>> 
>> That's why I think dd_rescue would be better.
>> <http://www.garloff.de/kurt/linux/ddrescue/>
>> 
>> If it still gets warm too fast, I've heard that storing the hard drive in a 
>> freezer 24 hours may make it work again.
>> <http://geeksaresexy.blogspot.com/2006/01/freeze-your-hard-drive-to-recover-data.html>
>> 
>> If it crashes when dd or dd_rescue fails, it's possible to continue copying 
>> later, from the point it failed.
>> 
>> -- 
>> André Gillibert
>> 
>> 
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
>

-- 
Peter Keller                                     Tel.: +44 (0)1223 353033
Global Phasing Ltd.,                             Fax.: +44 (0)1223 366889
Sheraton House,
Castle Park,
Cambridge CB3 0AX
United Kingdom
--8323584-649032077-1253532434=:26724--
