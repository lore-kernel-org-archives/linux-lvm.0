Message-ID: <457FC11B.3090105@redhat.com>
Date: Wed, 13 Dec 2006 09:00:11 +0000
From: Patrick Caulfield <pcaulfie@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] LVM2 and OCFS2
References: <fd8dc0d20612120940w2c6c4c07m51de6ea8337973d9@mail.gmail.com>
	<fd8dc0d20612120946l1fe841fvbc284b28453ff270@mail.gmail.com>
In-Reply-To: <fd8dc0d20612120946l1fe841fvbc284b28453ff270@mail.gmail.com>
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
To: Boris Ostrovsky <baostr@gmail.com>
Cc: linux-lvm@redhat.com

Boris Ostrovsky wrote:
> (Resending with cc: fixed)
> 
>> It's true that lvm is not cluster-aware. What that means is that if
>> you update the
>> volume groups on one node then the other nodes in the cluster will not
>> see the
>> changes and you could end up with the block devices on the machines
>> dangerously
>> out of sync.
> 
> What if I can guarantee that other nodes will not access LVM metadata
> (i.e. they will not issue any LVM command) until I run 'vgchange -ay'
> on them? The only access that those other nodes will have to volumes
> is that they will have some of them mounted.
> 
> Is this still dangerous? My (limited) understanding of metadata is
> that it is stored in the first few blocks of a disk (or striped, if
> necessary) and is cached in lvm.cache. vgchange will sync disk and
> cache, so it should be OK, right?

Yes, that should work.

Just be VERY, VERY careful!

patrick
