Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8D89C1000DA5
	for <linux-lvm@redhat.com>; Tue,  3 Nov 2020 14:40:37 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AC5A790E420
	for <linux-lvm@redhat.com>; Tue,  3 Nov 2020 14:40:37 +0000 (UTC)
MIME-Version: 1.0
Message-ID: <24481.27617.970157.143521@quad.stoffel.home>
Date: Tue, 3 Nov 2020 09:40:33 -0500
From: "John Stoffel" <john@stoffel.org>
In-Reply-To: <87wnz2akqc.fsf@oracle.com>
References: <87362fg62i.fsf@oracle.com>
	<24457.45991.672260.342062@quad.stoffel.home>
	<87wnz2akqc.fsf@oracle.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Identifying Unused VG
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
To: Annamalai Gurusami <annamalai.gurusami@oracle.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

>>>>> "Annamalai" == Annamalai Gurusami <annamalai.gurusami@oracle.com> writes:

Annamalai> "John Stoffel" <john@stoffel.org> writes:
>> Looking at your 'lsblk' output, I suspect you can remove drive sda,
>> the Seagate.  So I'd probably try to shutdown cleanly, then remove
>> that drive and boot up again.

Annamalai> Finally I was able to spend sometime doing this.  And you are correct.
Annamalai> I shutdown the computer and removed the Seagate HDD and started the
Annamalai> computer.  Everything went smooth.

Annamalai> Thanks for helping me.

Great!  Gald to help.  Now what I would do is re-install the Seagte
drive, boot up and then once you've identified it properly, I would
wipe the beginning of the disk with:

  dd if=/dev/zero of=/dev/sd<letter> count=10000

where <letter> would *probably* be 'b' without quotes.  But confirm!

Then just reboot the system and you should see only the boot disk,
along with a new blank disk.  Then you can do what you want with it.

John
