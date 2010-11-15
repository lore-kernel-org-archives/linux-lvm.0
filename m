Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.7])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id oAFHlQJ0003935
	for <linux-lvm@redhat.com>; Mon, 15 Nov 2010 12:47:26 -0500
Received: from mail-vw0-f46.google.com (mail-vw0-f46.google.com
	[209.85.212.46])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id oAFHlHNE010574
	for <linux-lvm@redhat.com>; Mon, 15 Nov 2010 12:47:17 -0500
Received: by vws13 with SMTP id 13so1815676vws.33
	for <linux-lvm@redhat.com>; Mon, 15 Nov 2010 09:47:17 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <AANLkTi=76kmpsTY=wFdW3HAje47ovanTT7LQEqF4f5Dd@mail.gmail.com>
References: <AANLkTi=+iwZLBxZFzhb++KMevOy55QJrg9xg9Ey2w_kX@mail.gmail.com>
	<AANLkTi=76kmpsTY=wFdW3HAje47ovanTT7LQEqF4f5Dd@mail.gmail.com>
From: "chris (fool) mccraw" <gently@gmail.com>
Date: Mon, 15 Nov 2010 09:46:55 -0800
Message-ID: <AANLkTik11giH9uQ0GR4JEhD6GcDKzSdnTZexZuG=xdgd@mail.gmail.com>
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] advice for curing terrible snapshot performance?
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
Content-Type: text/plain; charset="utf-8"
To: LVM general discussion and development <linux-lvm@redhat.com>

On Mon, Nov 15, 2010 at 06:35, Romeo Theriault
<romeo.theriault@maine.edu> wrote:
>
>
> On Sat, Nov 13, 2010 at 06:52, chris (fool) mccraw <gently@gmail.com> wrote:
>>
>> however, snapshots really shoot my system in the foot. �in my (12
>> processor, 12GB RAM, x86_64 centos 5.5) server, i have two pricey
>> areca hardware raid cards that give me ridiculous write performance:
>> i can sustain over 700MByte/sec write speeds (writing a file with dd
>> if=/dev/zero bs=1M, twice the size of the raid card's onboard memory
>> and timing the write + a sync afterwards) to the volumes on either
>> card (both backed by 7 or more fast disks). �enabling a single
>> snapshot reduces that speed by a factor of 10! �enabling more
>> snapshots isn't as drastic but still doesn't really scale well:
>
>
> Once you have snapshots and are doing new dd's are you creating new files or
> dd'ing over the old file?

tried both ways with no obvious performance difference (like i said,
sometimes things go up to 30% faster or slower for 1 run, but that's
happened doing it both ways).

>> no snapshot �= ~11sec (727MB/sec)
>> 1 snapshot � = ~102sec (78MB/sec)
>> 2 snapshots �= ~144sec (55MB/sec)
>> 3 snapshots �= ~313sec (25MB/sec)
>> 4 snapshots �= ~607sec (15MB/sec)
>
> I would assume a "yes", but does your write performance return to normal
> after you remove all the snapshots?

absolutely, it does.
