Received: from [10.34.131.9] (dhcp131-9.brq.redhat.com [10.34.131.9])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u4OEHUFB017024
	for <linux-lvm@redhat.com>; Tue, 24 May 2016 10:17:31 -0400
References: <4bcd585d099ecec086b99cfa5c23cc38@assyoma.it>
	<5739B848.3060505@redhat.com> <573B1812.3080802@assyoma.it>
	<573B213E.7060807@redhat.com> <573C726B.6020209@assyoma.it>
	<4d91c4c59b86f043d6a83772d8a8a2aa@assyoma.it>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <323a1fe9-b750-51f3-2967-a2bdf53e259c@redhat.com>
Date: Tue, 24 May 2016 16:17:30 +0200
MIME-Version: 1.0
In-Reply-To: <4d91c4c59b86f043d6a83772d8a8a2aa@assyoma.it>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Unexptected filesytem unmount with thin provision
 and autoextend disabled - lvmetad crashed?
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
To: linux-lvm@redhat.com

On 24.5.2016 15:45, Gionatan Danti wrote:
> Il 18-05-2016 15:47 Gionatan Danti ha scritto:
>>
>> One question: I did some test (on another machine), deliberately
>> killing/stopping the lvmetad service/socket. When the pool was almost
>> full, the following entry was logged in /var/log/messages
>>
>> WARNING: Failed to connect to lvmetad. Falling back to internal scanning.
>>
>> So it appears than when lvmetad is gracefully stopped/not running,
>> dmeventd correctly resort to device scanning. On the other hand, in
>> the previous case, lvmetad was running but returned "Connection
>> refused". Should/could dmeventd resort to device scanning in this case
>> also?
>>
>> ...
>>
>> Very probable. So, after a LVM update, is best practice to restart the
>> machine or at least the dmeventd/lvmetad services?
>>
>> One more, somewhat related thing: when thin pool goes full, is a good
>> thing to remount an ext3/4 in readonly mode (error=remount-ro). But
>> what to do with XFS which, AFAIK, does not support a similar
>> readonly-on-error policy?
>>
>> It is my understanding that upstream XFS has some improvements to
>> auto-shutdown in case of write errors. Did these improvements already
>> tickle to production kernels (eg: RHEL6 and 7)?
>>
>> Thanks.
>
> Sorry for the bump, I would really like to know your opinions on the above


Dmeventd should not talk to lvmetad at all - I'm saying this for years....

There are some very very hard to fix (IMHO) design issues - and locking 
lvmetad in memory would be just one of wrong (IMHO) ways forward....

Anyway - let's see how it evolves here as there are further troubles
with lvmetad & dmeventd - see i.e. here:

https://bugzilla.redhat.com/show_bug.cgi?id=1339210

Regards

Zdenek
