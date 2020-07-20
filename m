Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EEFF1215670C
	for <linux-lvm@redhat.com>; Mon, 20 Jul 2020 11:02:32 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 09CAB101244D
	for <linux-lvm@redhat.com>; Mon, 20 Jul 2020 11:02:32 +0000 (UTC)
From: "heming.zhao@suse.com" <heming.zhao@suse.com>
Message-ID: <b482a655-342c-86f9-085d-e09a1ffe8bb0@suse.com>
Date: Mon, 20 Jul 2020 19:02:15 +0800
Content-Language: en-US
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Suggestion: lvm2 filters lib needs to show some
 readable info for end user
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

Hello list,

first, I give a example, if a disk (/dev/sdb) has md metadata info. the pvcreate cmd will be failed and show info:
```
# pvcreate /dev/sdb
Device /dev/sdb excluded by a filter
```

For developer, if he wants to know the reason, he may execute below command:
```
# pvcreate -vvvv -ddddd 2>&1 /dev/sdb | grep filter | grep sdb
17:55:50.87938 pvcreate[15739] filters/filter-partitioned.c:31 filter partitioned deferred /dev/sdb
17:55:50.87964 pvcreate[15739] filters/filter-signature.c:32 filter signature deferred /dev/sdb
17:55:50.87982 pvcreate[15739] filters/filter-md.c:101 filter md deferred /dev/sdb
17:55:50.87999 pvcreate[15739] filters/filter-persistent.c:125 filter cache deferred /dev/sdb
17:55:50.99973 pvcreate[15739] label/label.c:377 Scan filtering /dev/sdb
17:55:50.101008 pvcreate[15739] filters/filter-md.c:109 md filter full 1 excluding md component /dev/sdb
17:55:50.101022 pvcreate[15739] filters/filter-md.c:111 /dev/sdb: Skipping md component device
17:55:50.101028 pvcreate[15739] filters/filter-persistent.c:134 filter caching bad /dev/sdb
17:55:50.101035 pvcreate[15739] label/label.c:389 /dev/sdb: Not processing filtered
17:55:50.104423 pvcreate[15739] filters/filter-persistent.c:94 /dev/sdb: filter cache skipping (cached bad)
17:55:50.104478 pvcreate[15739] filters/filter-persistent.c:94 /dev/sdb: filter cache skipping (cached bad)
17:55:50.104600 pvcreate[15739] toollib.c:5459 Device /dev/sdb excluded by a filter.
```

from above info, there is a key output:
```
filters/filter-md.c:109 md filter full 1 excluding md component /dev/sdb
```
It will help developer to locate the rootcause: it's not issue/error, /dev/sdb just a md dev. pvcreate doesn't work because there has md metadata.

But these info is mystical & unclear for end user, who only knows there is a filter config in /etc/lvm/lvm.conf. And the end user has no clue what's going on. The end user is expecting some likely useful clue at the first place.

So, in my opinion, I suggest there should be some code improvement for all filter failed info. Some filter failed debug log should convert from debug level to standard output level.

For this pvcreate example, If pvcreate print some thing like, for example, "/dev/sdb" might be has md meta data, and refuse to continue, bla bla, ... It's more readable.

Thanks,
