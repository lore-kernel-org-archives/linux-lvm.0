Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.25])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t9UDO9vo023525
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Fri, 30 Oct 2015 09:24:09 -0400
Received: from hathor.ankh.org (hathor.ankh.org [149.255.109.145])
	by mx1.redhat.com (Postfix) with ESMTPS id 4279DA1423
	for <linux-lvm@redhat.com>; Fri, 30 Oct 2015 13:24:07 +0000 (UTC)
Received: from 0542234d.skybroadband.com ([5.66.35.77]
	helo=android-d432195758e03cac)
	by hathor.ankh.org with esmtpsa (TLS1.2:DHE_RSA_AES_256_CBC_SHA1:256)
	(Exim 4.82) (envelope-from <oolon@ankh.org>) id 1Zs9f2-0008Va-On
	for linux-lvm@redhat.com; Fri, 30 Oct 2015 13:24:04 +0000
In-Reply-To: <563369C3.9020506@redhat.com>
References: <CAE8gLh=cgQLwZeXZGSVw06dt2U0F0XyzmYfY8EaFcksjv2uUsA@mail.gmail.com>
	<563369C3.9020506@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----RCFHGK6789078MBILQ9JUZDQYOTY7P"
Content-Transfer-Encoding: 8bit
From: James Hawtin <oolon@ankh.org>
Date: Fri, 30 Oct 2015 13:23:49 +0000
Message-ID: <2A631378-1EA3-4E2A-A788-EA85824A7A3A@ankh.org>
Subject: Re: [linux-lvm] md: personality for level 1 is not loaded
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

------RCFHGK6789078MBILQ9JUZDQYOTY7P
Content-Transfer-Encoding: 8bit
Content-Type: text/plain;
 charset=UTF-8

I find it is important with md to make sure your /boot or / if you do not have one uses metadata version 0.90 which sticks the metadata at the end of the disk, not the beginning. Grub does not really understand metadisk however a mirrored fs with metadata at the end can be read read only like a normal fs, and that is how it works.

James

On 30 October 2015 12:59:47 GMT+00:00, Heinz Mauelshagen <heinzm@redhat.com> wrote:
>
>Hi,
>
>this is likely caused by a missing raid1 module in the initramfs,
>as now commented on the referenced bz as well.
>
>Your Ubuntu kernel package needs fixing itr.
>
>- lvmguy
>
>On 10/25/2015 01:05 AM, MegaBrutal wrote:
>> Hi all,
>>
>> I have an inconvenient boot-time phenomenon which prevents me from
>> booting a RAID1 mirrored root volume.
>>
>> Reported it on Launchpad:
>>
>https://bugs.launchpad.net/ubuntu/+source/initramfs-tools/+bug/1509717
>>
>> It's most probably distro-specific, but I wonder if you have some
>comments.
>>
>> Thanks if you check it out!
>>
>>
>> Best regards,
>> MegaBrutal
>>
>> _______________________________________________
>> linux-lvm mailing list
>> linux-lvm@redhat.com
>> https://www.redhat.com/mailman/listinfo/linux-lvm
>> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
>_______________________________________________
>linux-lvm mailing list
>linux-lvm@redhat.com
>https://www.redhat.com/mailman/listinfo/linux-lvm
>read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

-- 
Sent from my Android device with K-9 Mail. Please excuse my brevity.
------RCFHGK6789078MBILQ9JUZDQYOTY7P
Content-Type: text/html;
 charset=utf-8
Content-Transfer-Encoding: 8bit

<html><head></head><body>I find it is important with md to make sure your /boot or / if you do not have one uses metadata version 0.90 which sticks the metadata at the end of the disk, not the beginning. Grub does not really understand metadisk however a mirrored fs with metadata at the end can be read read only like a normal fs, and that is how it works.<br>
<br>
James<br><br><div class="gmail_quote">On 30 October 2015 12:59:47 GMT+00:00, Heinz Mauelshagen &lt;heinzm@redhat.com&gt; wrote:<blockquote class="gmail_quote" style="margin: 0pt 0pt 0pt 0.8ex; border-left: 1px solid rgb(204, 204, 204); padding-left: 1ex;">
<pre class="k9mail"><br />Hi,<br /><br />this is likely caused by a missing raid1 module in the initramfs,<br />as now commented on the referenced bz as well.<br /><br />Your Ubuntu kernel package needs fixing itr.<br /><br />- lvmguy<br /><br />On 10/25/2015 01:05 AM, MegaBrutal wrote:<br /><blockquote class="gmail_quote" style="margin: 0pt 0pt 1ex 0.8ex; border-left: 1px solid #729fcf; padding-left: 1ex;"> Hi all,<br /><br /> I have an inconvenient boot-time phenomenon which prevents me from<br /> booting a RAID1 mirrored root volume.<br /><br /> Reported it on Launchpad:<br /> <a href="https://bugs.launchpad.net/ubuntu/+source/initramfs-tools/+bug/1509717">https://bugs.launchpad.net/ubuntu/+source/initramfs-tools/+bug/1509717</a><br /><br /> It's most probably distro-specific, but I wonder if you have some comments.<br /><br /> Thanks if you check it out!<br /><br /><br /> Best regards,<br /> MegaBrutal<br /><br /><hr /><br /> linux-lvm mailing list<br /> linux-lvm@redhat!
 .com<br
/> <a href="https://www.redhat.com/mailman/listinfo/linux-lvm">https://www.redhat.com/mailman/listinfo/linux-lvm</a><br /> read the LVM HOW-TO at <a href="http://tldp.org/HOWTO/LVM-HOWTO">http://tldp.org/HOWTO/LVM-HOWTO</a>/<br /></blockquote><br /><hr /><br />linux-lvm mailing list<br />linux-lvm@redhat.com<br /><a href="https://www.redhat.com/mailman/listinfo/linux-lvm">https://www.redhat.com/mailman/listinfo/linux-lvm</a><br />read the LVM HOW-TO at <a href="http://tldp.org/HOWTO/LVM-HOWTO">http://tldp.org/HOWTO/LVM-HOWTO</a>/<br /></pre></blockquote></div><br>
-- <br>
Sent from my Android device with K-9 Mail. Please excuse my brevity.</body></html>
------RCFHGK6789078MBILQ9JUZDQYOTY7P--
