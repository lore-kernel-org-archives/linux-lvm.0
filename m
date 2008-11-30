Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id mAU94rXJ018464
	for <linux-lvm@redhat.com>; Sun, 30 Nov 2008 04:04:53 -0500
Received: from wf-out-1314.google.com (wf-out-1314.google.com [209.85.200.175])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id mAU94gJf016231
	for <linux-lvm@redhat.com>; Sun, 30 Nov 2008 04:04:42 -0500
Received: by wf-out-1314.google.com with SMTP id 25so2091515wfc.6
	for <linux-lvm@redhat.com>; Sun, 30 Nov 2008 01:04:41 -0800 (PST)
Message-ID: <41519ea60811300104v5b54cdd1t104c2e6140f5c075@mail.gmail.com>
Date: Sun, 30 Nov 2008 10:04:41 +0100
From: "Fabio Coatti" <fabio.coatti@gmail.com>
Subject: Re: [linux-lvm] pvresize complains about too many metadata
In-Reply-To: <4932275A.6000905@bmsi.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <41519ea60811290713g46083998v6c42bb7b578f1472@mail.gmail.com>
	<4932275A.6000905@bmsi.com>
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
To: LVM general discussion and development <linux-lvm@redhat.com>

2008/11/30 Stuart D. Gathman <stuart@bmsi.com>:
> Fabio Coatti wrote:
>> Hi all, I'm playing a bit with lvm/raid on linux, (on a pretty
>> experimental box) and now I'm facing a problem that leaves me a bit
>> stuck
>>
>> Basically, I've a volume group based on several mdraid partition
>> (vg1  with md0/md1/md4 as pvs)
>>
>> recently I've increased the size of md1/md4 arrays by adding more
>> disks and /proc/mdstats shows that the operation was successful.
>>
> Why not just add another md device?

Sorry? I've added one disk to a raid5 array, I can't figure out how I
can add more md devices.
basically, the question is: given a correct and successful operation
on the underlying block device, why lvm is complaining about too much
metadata? is there any way to fix this behaviour?
