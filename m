Received: from mx1.redhat.com (ext-mx10.extmail.prod.ext.phx2.redhat.com
	[10.5.110.14])
	by int-mx05.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id n8JHk29D003542
	for <linux-lvm@redhat.com>; Sat, 19 Sep 2009 13:46:03 -0400
Received: from smtp.bredband2.com (smtp.bredband2.com [83.219.192.166])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n8JHjq6f018747
	for <linux-lvm@redhat.com>; Sat, 19 Sep 2009 13:45:53 -0400
Received: from caramon (c-83-219-217-17.cust.bredband2.com [83.219.217.17])
	by smtp.bredband2.com (Postfix) with ESMTPA id 121CF86716
	for <linux-lvm@redhat.com>; Sat, 19 Sep 2009 19:45:37 +0200 (CEST)
Message-ID: <265193D025D942D48C90FB7AA795DFC4@caramon>
From: "Fredrik Skog" <fredrik.skog@rodang.se>
References: <127450ED38024F8FA2FD360E99F363ED@caramon><1253308756.16684.7@raydesk1.bettercgi.com>
	<20090919161120.6ef5215d@fixlaptop.gillibert.homelinux.net>
Subject: Re: [linux-lvm] Disk crash on LVM
Date: Sat, 19 Sep 2009 19:45:34 +0200
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
Content-Type: text/plain; format="flowed"; charset="utf-8"; reply-type="original"
To: LVM general discussion and development <linux-lvm@redhat.com>

Thanks guys for your input on the matter.
I lenghtened the power cables and bought a full lenght SATA cable. Now the 
disk is in the freezer and in progress with pvmove. 10% now. so far so good.
The reason i decided for the pvmove instead of dd or dd_rescue was the fact 
that i tried a pvmove before, so the process was already started but it 
stopped working on 1%. Now with a frozen and working disk it continued from 
where it left off.

I can tell you how it turned out later.

Thanks

/Fredrik



----- Original Message ----- 
From: "André Gillibert" <rcvxdg@gmail.com>
To: <linux-lvm@redhat.com>
Sent: Saturday, September 19, 2009 4:11 PM
Subject: Re: [linux-lvm] Disk crash on LVM


> Ray Morris <support@bettercgi.com> wrote:
>> [...]
>>    Then dd from the old copy of the LV to the new:
>>
>> dd if=/dev/org/$1 bs=64M iflag=direct |
>> dd of=/dev/copy/$1 bs=64M oflag=direct
>>
>>    That piped dd is 2-3 times faster than the "obvious"
>> way to run dd.
>> [...]
>
> The issue with dd is that if any read() fails, it skips the entry (64M) 
> and doesn't write to the output, making the output file smaller than the 
> input file.
>
> with conv=sync,noerror, it's better, but, still loosing a whole 64M block 
> at once is a bad thing.
>
> That's why I think dd_rescue would be better.
> <http://www.garloff.de/kurt/linux/ddrescue/>
>
> If it still gets warm too fast, I've heard that storing the hard drive in 
> a freezer 24 hours may make it work again.
> <http://geeksaresexy.blogspot.com/2006/01/freeze-your-hard-drive-to-recover-data.html>
>
> If it crashes when dd or dd_rescue fails, it's possible to continue 
> copying later, from the point it failed.
>
> -- 
> André Gillibert
>
>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/ 
