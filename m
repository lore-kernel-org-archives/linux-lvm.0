Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q7CDfocx007511
	for <linux-lvm@redhat.com>; Sun, 12 Aug 2012 09:41:50 -0400
Received: from mail-wi0-f174.google.com (mail-wi0-f174.google.com
	[209.85.212.174])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q7CDfPf7021362
	for <linux-lvm@redhat.com>; Sun, 12 Aug 2012 09:41:48 -0400
Received: by mail-wi0-f174.google.com with SMTP id hr14so2274696wib.9
	for <linux-lvm@redhat.com>; Sun, 12 Aug 2012 06:41:48 -0700 (PDT)
Received: by lbbgj3 with SMTP id gj3so953528lbb.33
	for <linux-lvm@redhat.com>; Sun, 12 Aug 2012 06:41:44 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20120812153328.67fc22ec@internecto.net>
References: <20120807140034.51bcd7af@internecto.net>
	<20120812153328.67fc22ec@internecto.net>
From: Scott Merrilees <scott@merrilees.net>
Date: Sun, 12 Aug 2012 23:41:24 +1000
Message-ID: <CANN7Ug3=tBH+DAfs+iUFTAhjqn2M67fN_kf5=k5ffs+sVhay0Q@mail.gmail.com>
Subject: Re: [linux-lvm] Getting 'incorrect semaphore state' on self
 configured server kernel
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
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

A diff -u of a working kernel config vs a non-working config would
possibly help.
--
Scott Merrilees


On Sun, Aug 12, 2012 at 11:33 PM, Mark van Dijk
<lists+linux-lvm@internecto.net> wrote:
>> # lvcreate -L100M -n foobar -v array
>> /dev/array/foobar: not found: device not cleared
>> Aborting. Failed to wipe start of new LV.
>> semid 983040: semop failed for cookie 0xd4d19ee: incorrect semaphore
>> state Failed to set a proper state for notification semaphore
>> identified by cookie value 223156718 (0xd4d19ee) to initialize waiting
>> for incoming notifications.
>>
>> I appreciate all help I can get.
>>
>
> I still haven't solved this.. who is willing to lend me a hand please?
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
