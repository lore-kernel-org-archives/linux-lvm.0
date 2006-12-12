Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id kBCHkkxV025784
	for <linux-lvm@redhat.com>; Tue, 12 Dec 2006 12:46:46 -0500
Received: from ug-out-1314.google.com (ug-out-1314.google.com [66.249.92.173])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	kBCHkjQh025307
	for <linux-lvm@redhat.com>; Tue, 12 Dec 2006 12:46:45 -0500
Received: by ug-out-1314.google.com with SMTP id 30so2058768ugs
	for <linux-lvm@redhat.com>; Tue, 12 Dec 2006 09:46:44 -0800 (PST)
Message-ID: <fd8dc0d20612120946l1fe841fvbc284b28453ff270@mail.gmail.com>
Date: Tue, 12 Dec 2006 12:46:43 -0500
From: "Boris Ostrovsky" <baostr@gmail.com>
Subject: Re: [linux-lvm] LVM2 and OCFS2
In-Reply-To: <fd8dc0d20612120940w2c6c4c07m51de6ea8337973d9@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <fd8dc0d20612120940w2c6c4c07m51de6ea8337973d9@mail.gmail.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: pcaulfie@redhat.com
Cc: linux-lvm@redhat.com

(Resending with cc: fixed)

> It's true that lvm is not cluster-aware. What that means is that if you update the
> volume groups on one node then the other nodes in the cluster will not see the
> changes and you could end up with the block devices on the machines dangerously
> out of sync.

What if I can guarantee that other nodes will not access LVM metadata
(i.e. they will not issue any LVM command) until I run 'vgchange -ay'
on them? The only access that those other nodes will have to volumes
is that they will have some of them mounted.

Is this still dangerous? My (limited) understanding of metadata is
that it is stored in the first few blocks of a disk (or striped, if
necessary) and is cached in lvm.cache. vgchange will sync disk and
cache, so it should be OK, right?

Thanks.
-boris


> What you tried (it seems to me) is just created LVM volumes and run OCFS2 on
> them. that will/ work provided you never change the volume groups!
