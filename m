Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CFEE797CFD
	for <linux-lvm@redhat.com>; Tue, 10 Dec 2019 09:24:39 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 40F4785A333
	for <linux-lvm@redhat.com>; Tue, 10 Dec 2019 09:24:39 +0000 (UTC)
From: Daniel Janzon <daniel.janzon@edgeware.tv>
Date: Tue, 10 Dec 2019 09:24:28 +0000
Message-ID: <A8A53B0E4B7ACF4BAD5C77D3671AC8976ABE96EE@EX01.edgeware.tv>
References: <mailman.48461.1575969111.11187.linux-lvm@redhat.com>
In-Reply-To: <mailman.48461.1575969111.11187.linux-lvm@redhat.com>
Content-Language: en-US
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] linux-lvm Digest, Vol 190, Issue 6
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
To: "linux-lvm@redhat.com" <linux-lvm@redhat.com>

> From: Marian Csontos <mcsontos@redhat.com>

>> The origin of my problem is indeed the poor performance of RAID5,
>> which maxes out the single core the driver runs on. But if I accept that
>> as a given, the next problem is LVM striping. Since I do get 10x better

>What stripesize was used for striped LV? IIRC the default is 64k.

I ran  "lvcreate -L 2400G -i8 -I512 -n volume-name group-name".  And I tried various numbers, 512 was the greatest I could set but does not seem to be crucial for performance.

> IIUC you are serving mostly large files. I have no numbers, and no HW to
> test the hypothesis, but using larger stripesize could help here as this
> would split the load on multiple RAID5 volumes, while not splitting the
> IOs too early into too many small requests.

File size are typically a few megabytes. I guess the file abstraction is not visible
on the LVM layer though, but at least there won't be many blocks with a lot
of unused space.
