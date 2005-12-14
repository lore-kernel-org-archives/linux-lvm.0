Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id jBEEpjUB029192
	for <linux-lvm@redhat.com>; Wed, 14 Dec 2005 14:51:45 GMT
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1EmXyq-00021j-V1
	for linux-lvm@redhat.com; Wed, 14 Dec 2005 14:51:44 +0000
Date: Wed, 14 Dec 2005 14:51:44 +0000
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] Invalid new snapshot
Message-ID: <20051214145144.GO25866@agk.surrey.redhat.com>
References: <539807300512131937s72661636h@mail.gmail.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <539807300512131937s72661636h@mail.gmail.com>
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
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Wed, Dec 14, 2005 at 11:37:22AM +0800, Lee Rocky wrote:
> when I try to create multi snapshot volumes, sometimes the new snapshot
> volume will be marked Invalid after created, somtimes remove then recreate
> without problem.
 
> dmesg error
> attempt to access beyond end of device
> dm-9: rw=17, want=2271285024, limit=8257536
> device-mapper: Error reading/writing snapshot
> device-mapper: snapshot is marked invalid

What kernel?
What software version?
  (e.g. output of 'lvm version')

What lvcreate -s command parameters? (After how many existing snapshots?)
What configuration of original LV?
  ('lvs --segments -v')

Any I/O happening to any of the devices involved at around the same time?

Alasdair
-- 
agk@redhat.com
