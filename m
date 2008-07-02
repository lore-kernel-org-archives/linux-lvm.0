Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m62HpDFD007173
	for <linux-lvm@redhat.com>; Wed, 2 Jul 2008 13:51:13 -0400
Received: from hs-out-0708.google.com (hs-out-0708.google.com [64.233.178.247])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m62Hp07c011194
	for <linux-lvm@redhat.com>; Wed, 2 Jul 2008 13:51:00 -0400
Received: by hs-out-0708.google.com with SMTP id x43so150823hsb.3
	for <linux-lvm@redhat.com>; Wed, 02 Jul 2008 10:51:00 -0700 (PDT)
Message-ID: <a9e5040807021050j6476d151tec76526bc06b1365@mail.gmail.com>
Date: Wed, 2 Jul 2008 13:50:59 -0400
From: "Rob West" <robertfwest@gmail.com>
Subject: Re: [linux-lvm] Is it possible to invalidate snapshots other than by
	overfilling?
In-Reply-To: <C09506C2-25A7-4A32-9582-C1A4D5D10F9B@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_3319_24081092.1215021059726"
References: <a9e5040807011410q485a3a4bkebe7c684301b865d@mail.gmail.com>
	<C09506C2-25A7-4A32-9582-C1A4D5D10F9B@redhat.com>
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

------=_Part_3319_24081092.1215021059726
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Jonathan,

Thanks for responding.

I think you're right about why we're getting the message on boot up. We
definitely don't have any dm modules in our initrd.

However, I have verified that just the act of rebooting with a snapshot in
place doesn't cause the snapshot to become invalid.

One thing that I failed to mention before is that so far the cases where
we've seen this problem are also resyncing md mirrors on boot up. I have
verified that the resyncing alone doesn't cause the invalidation. A fellow
engineer is working on replicating the scenario even closer.

Cheers,
Rob

On Wed, Jul 2, 2008 at 11:42 AM, Jonathan Brassow <jbrassow@redhat.com>
wrote:

> It sounds like the module needed by device-mapper to support snapshots is
> not loaded when it is needed.  (Perhaps the module - dm-snapshot - is not in
> your initrd image?)
>
> After step 3, but before step 4, try doing a 'dmsetup table' to see if
> things are properly mapped.  A 'dmsetup status' wouldn't hurt either...
>
> Certainly, there should never be a kernel oops...  It's tough for me to say
> whether this bug is already fixed - given the age of your kernel.
>
>  brassow
>
>
> On Jul 1, 2008, at 4:10 PM, Rob West wrote:
>
>  Does anyone know of ways that snapshots can become invalid other than by
>> writing more to the origin than the COW device can hold?
>>
>> The reason I ask is that we're having cases where a snapshot is becoming
>> invalid, but we are very skeptical that it is due to overfilling. The size
>> of the origin is 83G, and the size of the snapshot is 8G.
>>
>> Here's what little we can tell from the logs:
>> 1. Backup script creates a snapshot and starts copying data from it.
>> 2. Before backup is finished (and thus, snapshot removed), the user
>> reboots.
>> 3. On reboot, we get the following message which seems to be normal for
>> this kernel:
>>    kernel: device-mapper: table: 253:2: snapshot-origin: unknown target
>> type
>> 4. About 23 hours later, the backup script tries to create the snapshot
>> again but fails b/c it's still there.
>> 5. The backup script tries to clean up by removing the snapshot, but
>> lvremove causes a kernel oops because the snapshot is invalid. (We have
>> identified a potential patch for this, but are trying to figure out why the
>> snapshot was invalid in the first place.)
>>
>> The kernel we're using is based off of Fedora 6 (2.6.18-1.2849).
>>
>> Not sure whether it matters, but device-mapper is version 1.02.07 release
>> 4.0.RHEL4 and lvm2 is version 2.02.06 release 6.0.RHEL4.
>>
>>
>> Thanks for any help,
>> Rob
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
>

------=_Part_3319_24081092.1215021059726
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Jonathan,<br><br>Thanks for responding.<br><br>I think you&#39;re right about why we&#39;re getting the message on boot up. We definitely don&#39;t have any dm modules in our initrd. <br><br>However, I have verified that just the act of rebooting with a snapshot in place doesn&#39;t cause the snapshot to become invalid.<br>
<br>One thing that I failed to mention before is that so far the cases where we&#39;ve seen this problem are also resyncing md mirrors on boot up. I have verified that the resyncing alone doesn&#39;t cause the invalidation. A fellow engineer is working on replicating the scenario even closer.<br>
<br>Cheers,<br>Rob<br><br><div class="gmail_quote">On Wed, Jul 2, 2008 at 11:42 AM, Jonathan Brassow &lt;<a href="mailto:jbrassow@redhat.com">jbrassow@redhat.com</a>&gt; wrote:<br><blockquote class="gmail_quote" style="border-left: 1px solid rgb(204, 204, 204); margin: 0pt 0pt 0pt 0.8ex; padding-left: 1ex;">
It sounds like the module needed by device-mapper to support snapshots is not loaded when it is needed. &nbsp;(Perhaps the module - dm-snapshot - is not in your initrd image?)<br>
<br>
After step 3, but before step 4, try doing a &#39;dmsetup table&#39; to see if things are properly mapped. &nbsp;A &#39;dmsetup status&#39; wouldn&#39;t hurt either...<br>
<br>
Certainly, there should never be a kernel oops... &nbsp;It&#39;s tough for me to say whether this bug is already fixed - given the age of your kernel.<br>
<br>
&nbsp;brassow<div><div></div><div class="Wj3C7c"><br>
<br>
On Jul 1, 2008, at 4:10 PM, Rob West wrote:<br>
<br>
</div></div><blockquote class="gmail_quote" style="border-left: 1px solid rgb(204, 204, 204); margin: 0pt 0pt 0pt 0.8ex; padding-left: 1ex;"><div><div></div><div class="Wj3C7c">
Does anyone know of ways that snapshots can become invalid other than by writing more to the origin than the COW device can hold?<br>
<br>
The reason I ask is that we&#39;re having cases where a snapshot is becoming invalid, but we are very skeptical that it is due to overfilling. The size of the origin is 83G, and the size of the snapshot is 8G.<br>
<br>
Here&#39;s what little we can tell from the logs:<br>
1. Backup script creates a snapshot and starts copying data from it.<br>
2. Before backup is finished (and thus, snapshot removed), the user reboots.<br>
3. On reboot, we get the following message which seems to be normal for this kernel:<br>
 &nbsp; &nbsp;kernel: device-mapper: table: 253:2: snapshot-origin: unknown target type<br>
4. About 23 hours later, the backup script tries to create the snapshot again but fails b/c it&#39;s still there.<br>
5. The backup script tries to clean up by removing the snapshot, but lvremove causes a kernel oops because the snapshot is invalid. (We have identified a potential patch for this, but are trying to figure out why the snapshot was invalid in the first place.)<br>

<br>
The kernel we&#39;re using is based off of Fedora 6 (2.6.18-1.2849).<br>
<br>
Not sure whether it matters, but device-mapper is version 1.02.07 release 4.0.RHEL4 and lvm2 is version 2.02.06 release 6.0.RHEL4.<br>
<br>
<br>
Thanks for any help,<br>
Rob<br></div></div>
_______________________________________________<br>
linux-lvm mailing list<br>
<a href="mailto:linux-lvm@redhat.com" target="_blank">linux-lvm@redhat.com</a><br>
<a href="https://www.redhat.com/mailman/listinfo/linux-lvm" target="_blank">https://www.redhat.com/mailman/listinfo/linux-lvm</a><br>
read the LVM HOW-TO at <a href="http://tldp.org/HOWTO/LVM-HOWTO/" target="_blank">http://tldp.org/HOWTO/LVM-HOWTO/</a><br>
</blockquote>
<br>
_______________________________________________<br>
linux-lvm mailing list<br>
<a href="mailto:linux-lvm@redhat.com" target="_blank">linux-lvm@redhat.com</a><br>
<a href="https://www.redhat.com/mailman/listinfo/linux-lvm" target="_blank">https://www.redhat.com/mailman/listinfo/linux-lvm</a><br>
read the LVM HOW-TO at <a href="http://tldp.org/HOWTO/LVM-HOWTO/" target="_blank">http://tldp.org/HOWTO/LVM-HOWTO/</a><br>
</blockquote></div><br>

------=_Part_3319_24081092.1215021059726--
