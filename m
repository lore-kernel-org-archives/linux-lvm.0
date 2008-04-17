Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m3HCk1EI009908
	for <linux-lvm@redhat.com>; Thu, 17 Apr 2008 08:46:01 -0400
Received: from septimus.inrp.fr (septimus.inrp.fr [193.51.247.28])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m3HCjGn3004243
	for <linux-lvm@redhat.com>; Thu, 17 Apr 2008 08:45:16 -0400
Received: from septimus.inrp.fr (septimus.inrp.fr [127.0.0.1])
	by localhost.septimus.inrp.fr (Postfix) with ESMTP id E97B7E3274
	for <linux-lvm@redhat.com>; Thu, 17 Apr 2008 14:45:13 +0200 (CEST)
Received: from valerian.inrp.fr (valerian.inrp.fr [195.83.134.122])
	by septimus.inrp.fr (Postfix) with ESMTP id DC3AFE3273
	for <linux-lvm@redhat.com>; Thu, 17 Apr 2008 14:45:13 +0200 (CEST)
Received: from localhost (localhost.localdomain [127.0.0.1])
	by valerian.inrp.fr (Postfix) with ESMTP id CA1062C0E5
	for <linux-lvm@redhat.com>; Thu, 17 Apr 2008 14:45:13 +0200 (CEST)
Received: from valerian.inrp.fr ([127.0.0.1])
	by localhost (valerian [127.0.0.1]) (amavisd-new, port 10024) with ESMTP
	id 12816-07 for <linux-lvm@redhat.com>;
	Thu, 17 Apr 2008 14:45:09 +0200 (CEST)
Received: from [195.83.134.19] (SCI004.inrp.fr [195.83.134.19])
	by valerian.inrp.fr (Postfix) with ESMTP id DE8F32BEAD
	for <linux-lvm@redhat.com>; Thu, 17 Apr 2008 14:45:09 +0200 (CEST)
Message-ID: <4807463B.2070508@gmail.com>
Date: Thu, 17 Apr 2008 14:44:43 +0200
From: Thomas Bellembois <thomas.bellembois@gmail.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] LVM snapshot - "dd" file size
References: <48061439.6040001@gmail.com>	<20080416210439.GA31820@pretender.frop.net>
	<003e01c8a009$fa453ad0$0132a8c0@denie>
In-Reply-To: <003e01c8a009$fa453ad0$0132a8c0@denie>
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

Nice tip ! It works fine !
Thanks a lot.

Ragards,

Thomas

Denie Andriessen wrote:
> A compressed dd can still be quite large, as there still might contain
> non zero values..
>
> if you compress the image, a possible way to make the resulting files
> smaller is to:
>
> - do a: 'dd if=/dev/zero of=/dummyfile' on the filesystem first (you
> might want to use 'bs' and 'count' parameters)
> - if you topped off the disk, delete the all zero dummyfile.
>
> The zipped result might be smaller. (both with dd and with tar..)
>
> Regards,
> Denie
>
> ----- Original Message ----- From: <dave@frop.net>
> To: "LVM general discussion and development" <linux-lvm@redhat.com>
> Sent: Wednesday, April 16, 2008 11:04 PM
> Subject: Re: [linux-lvm] LVM snapshot - "dd" file size
>
>
>> this has nothing to do with LVM.
>>
>> dd knows nothing about files, it just copies the entire device (or
>> file or whatever).
>>
>> tar will work, if you use the right command line switches. Search
>> around on the web for pointers on how to use it.
>>
>> Another intermediate way would be to compress the image you get with dd.
>>
>> On Wed, Apr 16, 2008 at 04:59:05PM +0200, Thomas Bellembois wrote:
>>> Hi!
>>>
>>> I am using LVM partitions on a Debian Xen system.
>>> I use LVM snapshots to clone and backup my virtual machines.
>>>
>>> I have noticed that the ISO file created with the "dd" command it much
>>> bigger that the partition used space (actually 4.7GB for the ISO -
>>> 500MB
>>> used space). No problem if I mount the LVM snapshot and "tar" all of
>>> the
>>> data.
>>>
>>> I have googled the question and read that "dd" also copy "not used
>>> space".
>>> Why is the ISO file so big ? Is the "tar" method less safe ?
>>> Is there a better solution ?
>>>
>>> Thanks for your answers.
>>>
>>> Regards,
>>>
>>> Thomas
>>>
>>>
>>>
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
>>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
