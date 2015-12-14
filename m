Received: from [10.34.131.78] (dhcp131-78.brq.redhat.com [10.34.131.78])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id tBEALoRm006978
	for <linux-lvm@redhat.com>; Mon, 14 Dec 2015 05:21:50 -0500
References: <02c701d13102$e0027c90$a00775b0$@helmholtz-muenchen.de>
	<000b01d1312a$8f8105c0$ae831140$@helmholtz-muenchen.de>
	<CAAxjCExKV0Dq1nx974s274jbZ+UN5B7syu2ZTeVKSwwFnjDYLg@mail.gmail.com>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <566E983E.3050901@redhat.com>
Date: Mon, 14 Dec 2015 11:21:50 +0100
MIME-Version: 1.0
In-Reply-To: <CAAxjCExKV0Dq1nx974s274jbZ+UN5B7syu2ZTeVKSwwFnjDYLg@mail.gmail.com>
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] backup with snapshots - some principal questions
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
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Dne 9.12.2015 v 18:52 Stefan Ring napsal(a):
> On Mon, Dec 7, 2015 at 9:05 PM, Lentes, Bernd
> <bernd.lentes@helmholtz-muenchen.de> wrote:
>> What does the message " ext3_orphan_cleanup: deleting unreferenced inode
>> xxxxxx" means ?
>> And it appears always when the script runs.
>
> I'm not entirely sure, but I would guess that these are deleted files
> that were kept alive by some process holding them open at the time the
> snapshot was taken. Since this unreferenced space would be leaked in
> the event of a system crash – and snapshotting behaves essentially
> like a crash –, the log recovery routine cleans them up during mount.

Hi

When lvm2 creates a volume snapshot - it does 2 things during needed suspend,
it's using  'fsfreeze' and it's flushing all bio in process,
so it's not comparable with just a plain crash.

Zdenek
