Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8D50AF84D7
	for <linux-lvm@redhat.com>; Wed, 26 Feb 2020 01:03:28 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 353E885A30E
	for <linux-lvm@redhat.com>; Wed, 26 Feb 2020 01:03:28 +0000 (UTC)
Received: from h.pine.lan (h.pine.lan
	[IPv6:fcac:2107:3b9c:fd0d:b15d:a259:5a56:2d83])
	(authenticated bits=0)
	by mail.gathman.org (8.14.7/8.14.7) with ESMTP id 01Q0cQUe007341
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Tue, 25 Feb 2020 19:38:35 -0500
Date: Tue, 25 Feb 2020 19:38:28 -0500 (EST)
From: "Stuart D. Gathman" <stuart@gathman.org>
In-Reply-To: <d5dd6c06-1e9f-3737-8712-137f92e351cb@uwaterloo.ca>
Message-ID: <alpine.LFD.2.21.2002251931270.21045@pine.gathman.org>
References: <d5dd6c06-1e9f-3737-8712-137f92e351cb@uwaterloo.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] faster snapshot creation?
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
To: LVM general discussion and development <linux-lvm@redhat.com>

On Sat, 22 Feb 2020, Eric Toombs wrote:

> Snapshot creation is already pretty fast:
>
>> $ time sudo lvcreate --size 512M --snapshot --name snap /dev/testdbs/template
>>   Logical volume "snap" created.
>> 0.03user 0.05system 0:00.46elapsed 18%CPU (0avgtext+0avgdata 28916maxresident)k
>> 768inputs+9828outputs (0major+6315minor)pagefaults 0swaps
>
> That's about half a second in real time. But I have a scenario that
> would benefit from it being even faster. I'm doing many small unit tests
>
> So, is there a sort of "dumber" way of making these snapshots, maybe by
> changing the allocation algorithm or something?

How about using a filesystem that supports snapshot, e.g. nilfs, or
(I think) btrfs?  That would be much faster than doing it at the LVM
level, which has to sync metadata and stuff.

a) load your template into work directory
b) tag snapshot
c) run test (possibly in container)
d) restore tagged snapshot
e) goto c
