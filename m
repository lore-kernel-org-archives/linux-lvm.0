Received: from [10.34.131.16] (dhcp131-16.brq.redhat.com [10.34.131.16])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t0S9Smnl009456
	for <linux-lvm@redhat.com>; Wed, 28 Jan 2015 04:28:49 -0500
Message-ID: <54C8ABD0.4090402@redhat.com>
Date: Wed, 28 Jan 2015 10:28:48 +0100
From: Zdenek Kabelac <zkabelac@redhat.com>
MIME-Version: 1.0
References: <CAPWkaSVZEeL6yP+3ax2Z0Z7iMJQezEGUvVOXZ8PUrA7ytEeA=w@mail.gmail.com>	<20150119222134.GA17599@agk-dp.fab.redhat.com>	<CAPWkaSV-o0Tf=1yopWbrmKLuEnS6qbp_pEhikgean7M5vitr4w@mail.gmail.com>
	<CAPcfVV-KGCWda4fKdtVdo=xGQftCU8kURoqR6PDuLKz15wpKqg@mail.gmail.com>
In-Reply-To: <CAPcfVV-KGCWda4fKdtVdo=xGQftCU8kURoqR6PDuLKz15wpKqg@mail.gmail.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Slow response from lvs and vgs commands
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

Dne 27.1.2015 v 16:04 Marcos Dutra napsal(a):
> Hi everybody,
>
> I have the same problem when I use vgs command, so I used vgs -vvv command and
> it was slow when the output command showed me this "Archiving volume group
> "vgoracle" metadata (seqno 3)", I have many vgs with this status, Archiving
> volume group xxx, Is it normal? What can I do to solve this?
>

If you are creating lots of randomly named VGs - then you'll need to manual 
prune /etc/lvm/archive directory.

When you use consistently the same VG name - you could configure some limits
via lvm.conf settings:

backup/retain_min
backup/retain_days

(Or you could disable backup completely)

Zdenek
