Received: from mx1.redhat.com (ext-mx15.extmail.prod.ext.phx2.redhat.com
	[10.5.110.20])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s9DCLQeK004782
	for <linux-lvm@redhat.com>; Mon, 13 Oct 2014 08:21:26 -0400
Received: from mail-ig0-f172.google.com (mail-ig0-f172.google.com
	[209.85.213.172])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s9DCLOxW028777
	(version=TLSv1/SSLv3 cipher=RC4-SHA bits=128 verify=FAIL)
	for <linux-lvm@redhat.com>; Mon, 13 Oct 2014 08:21:25 -0400
Received: by mail-ig0-f172.google.com with SMTP id r2so10111379igi.11
	for <linux-lvm@redhat.com>; Mon, 13 Oct 2014 05:21:24 -0700 (PDT)
MIME-Version: 1.0
From: Kees de Jong <keesdejong@gmail.com>
Date: Mon, 13 Oct 2014 14:20:43 +0200
Message-ID: <CAAH150aKPX-scGh3QCbOkPxwcH+PSHtLZ47ZMHN84mfQaFTgUA@mail.gmail.com>
Subject: [linux-lvm] How to calculate the LVM SSD cache size?
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
To: linux-lvm@redhat.com

Hi,



The documentation is not clear about how big the cache size should be
for optimal performance. It only gives pointers about how big the meta
data for the cache should be.

"Create the cache metadata LV. This LV will hold cache pool metadata.
The size of this LV should be 1000 times smaller than the cache data
LV, with a minimum size of 8MiB."

There is however an example in the man page with a 100GB OriginLV
which apparently needs (at least) 10GB of cache size. But what is the
math? I for example have 4 LV's I want to cache. 6GB, 60GB, 100GB and
2TB and I have a 240GB SSD which will act as the caching disk.

Could someone please fill in the gaps here?




Thanks!
Kees.
