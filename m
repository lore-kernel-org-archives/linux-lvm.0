Received: from [10.34.130.232] (dhcp130-232.brq.redhat.com [10.34.130.232])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id uAT8cCwi028903
	for <linux-lvm@redhat.com>; Tue, 29 Nov 2016 03:38:12 -0500
References: <59a4ab68-65cc-5205-65c6-6cd7ea41f582@topit.si>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <b7987159-2cce-6323-e170-7c7dea53f3b4@redhat.com>
Date: Tue, 29 Nov 2016 09:38:11 +0100
MIME-Version: 1.0
In-Reply-To: <59a4ab68-65cc-5205-65c6-6cd7ea41f582@topit.si>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] deadlock during lvm snapshot
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

Dne 28.11.2016 v 12:58 Tomaz Beltram napsal(a):
> Hi,
>
> I'm doing backup of a running mongodb using LVM snapshot. Sometimes I
> run into a deadlock situation and kernel reports blocked tasks for jbd2,
> mongod, dmeventd and my tar doing backup.
>
> This happens very rarely (one in a thousand) but the effect is rather
> severe as mongodb stops working. I also can't remove and unmount the
> snapshot. I have attached syslog of two occurrences. The stack traces of
> the blocked tasks are very similar so I suspect a potential race
> condition between the affected tasks.
>
> Sep 15 17:06:53 dss2 kernel: [719277.567904] INFO: task jbd2/dm-2-8:9048
> blocked for more than 120 seconds.
> Sep 15 17:06:53 dss2 kernel: [719277.568130] INFO: task mongod:23239
> blocked for more than 120 seconds.
> Sep 15 17:06:53 dss2 kernel: [719277.568267] INFO: task mongod:23242
> blocked for more than 120 seconds.
> Sep 15 17:06:53 dss2 kernel: [719277.568350] INFO: task mongod:23243
> blocked for more than 120 seconds.
> Sep 15 17:06:53 dss2 kernel: [719277.568397] INFO: task dmeventd:12427
> blocked for more than 120 seconds.
> Sep 15 17:06:53 dss2 kernel: [719277.568523] INFO: task
> kworker/u16:2:31890 blocked for more than 120 seconds.
> Sep 15 17:06:53 dss2 kernel: [719277.568713] INFO: task tar:12446
> blocked for more than 120 seconds.
> Sep 15 17:08:53 dss2 kernel: [719397.567614] INFO: task jbd2/dm-2-8:9048
> blocked for more than 120 seconds.
> Sep 15 17:08:53 dss2 kernel: [719397.567731] INFO: task mongod:23239
> blocked for more than 120 seconds.
> Sep 15 17:08:53 dss2 kernel: [719397.567870] INFO: task mongod:23240
> blocked for more than 120 seconds.
>
> Nov 25 17:10:56 dss2 kernel: [282360.865020] INFO: task jbd2/dm-4-8:878
> blocked for more than 120 seconds.
> Nov 25 17:10:56 dss2 kernel: [282360.865624] INFO: task mongod:1652
> blocked for more than 120 seconds.
> Nov 25 17:10:56 dss2 kernel: [282360.866279] INFO: task mongod:1655
> blocked for more than 120 seconds.
> Nov 25 17:10:56 dss2 kernel: [282360.866771] INFO: task mongod:1656
> blocked for more than 120 seconds.
> Nov 25 17:10:56 dss2 kernel: [282360.867294] INFO: task dmeventd:3504
> blocked for more than 120 seconds.
> Nov 25 17:10:56 dss2 kernel: [282360.867783] INFO: task
> kworker/u16:2:8016 blocked for more than 120 seconds.
> Nov 25 17:10:56 dss2 kernel: [282360.868351] INFO: task tar:3560 blocked
> for more than 120 seconds.
> Nov 25 17:10:56 dss2 kernel: [282360.868865] INFO: task
> kworker/u16:1:5561 blocked for more than 120 seconds.
> Nov 25 17:12:56 dss2 kernel: [282480.868656] INFO: task jbd2/dm-4-8:878
> blocked for more than 120 seconds.
> Nov 25 17:12:56 dss2 kernel: [282480.869015] INFO: task mongod:1652
> blocked for more than 120 seconds.
>
> Full syslogs of two occurrences are attached.
>
> I have Ubuntu 16.04.1 (lvm2 2.02.133-1ubuntu10) with mongod 3.2.9 on a
> 64bit system.
>


Please switch to newer version of lvm2.

Sequence with  snapshot activation had been reworked to minimize possibility 
to hit this kernel race - race is still there even with the latest kernel,
but in the real world you should not have a much chance to hit it.
If you still do - please report again - we will take more closer look and your 
workflow.

Regards

Zdenek
