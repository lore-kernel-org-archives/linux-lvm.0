Received: from mx1.redhat.com (ext-mx16.extmail.prod.ext.phx2.redhat.com
	[10.5.110.21])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id r98Mwwvq029274
	for <linux-lvm@redhat.com>; Tue, 8 Oct 2013 18:58:58 -0400
Received: from nm16-vm3.access.bullet.mail.gq1.yahoo.com
	(nm16-vm3.access.bullet.mail.gq1.yahoo.com [216.39.63.74])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r98Mwvx4022726
	for <linux-lvm@redhat.com>; Tue, 8 Oct 2013 18:58:57 -0400
References: <5253CB06.2000901@fu-berlin.de>
	<CAJc7SsYG90wMMaK6SrM-mNTiFhDxRJYGR3WapchAZSWD9vsdYw@mail.gmail.com>
Message-ID: <1381273135.70303.YahooMailNeo@web181501.mail.ne1.yahoo.com>
Date: Tue, 8 Oct 2013 15:58:55 -0700 (PDT)
From: matthew patton <pattonme@yahoo.com>
In-Reply-To: <CAJc7SsYG90wMMaK6SrM-mNTiFhDxRJYGR3WapchAZSWD9vsdYw@mail.gmail.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Find Correct LE Size of ext4 Partition (16TB)
Reply-To: matthew patton <pattonme@yahoo.com>,
	LVM general discussion and development <linux-lvm@redhat.com>
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
To: LVM general discussion and development <linux-lvm@redhat.com>


>> So I set the partition to 16TB. Now I'm wasting space on the LV
>> which I would like to again be reduced to the minimum size of the
>> partition (16TB).
>>
>> Has anyone an idea to exactly calculate the amount of logical extends
>> (LE) needed for holding the 16TB partition?


The whole point of using LVM is to dispense with the malarky of hard disk partitions so I don't know why you're resizing them. If I read your email correctly you're going about this dangerously.

1) resize2fs down to say 15.8TB.
2) lvresize to 16TB
3) resize2fs (no args) <LV device>

Step 3 will resize the FS to as close as the LV size allows and won't let you write past the LV's endpoint like your method makes so easy to screw up when doing the extent calculation. Maybe your maths are always perfect but I wouldn't risk my data for a measly few bytes. Do it the fool-proof way.
