Received: from [10.11.9.48] (vpn-9-48.rdu.redhat.com [10.11.9.48])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id q4MJ8IBG002726
	for <linux-lvm@redhat.com>; Tue, 22 May 2012 15:08:19 -0400
Mime-Version: 1.0 (Apple Message framework v1084)
From: Brassow Jonathan <jbrassow@redhat.com>
In-Reply-To: <4FB8031A.90503@cox.net>
Date: Tue, 22 May 2012 14:08:18 -0500
Message-Id: <89079453-416A-4E43-8633-51BB13AE59E1@redhat.com>
References: <1816793.YNuiVBaGhv@laptop>
	<20120519191004.GN29330@agk-dp.fab.redhat.com>
	<4FB8031A.90503@cox.net>
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] Is the new RAID implementation going to deprecate
	traditional stripes and mirrors?
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
To: LVM general discussion and development <linux-lvm@redhat.com>


On May 19, 2012, at 3:31 PM, Ron Johnson wrote:

> On 05/19/2012 02:10 PM, Alasdair G Kergon wrote:
>> On Sat, May 19, 2012 at 11:58:54AM -0700, ben wrote:
>>> Does all the new RAID MD support mean the standard LVM type of mirrors and
>>> stripes will go away or at least not be further developed?
>> 
>> Current thinking:
>> 
>> Stripes remain as-is (they're very simple, it's not worth changing).
>> 
>> Preferred mirror switches to md, but existing mirror implementation
>> remains available and continues to be used for temporary mirrors like
>> pvmove.
>> 
> 
> IOW, md is "best practice" for mirroring?

I would say so.  It has a number of improvements over the original that help it deal better with snapshots and transient failures.

You can make the "raid1" segment type the default type by setting 'mirror_segtype_default' in lvm.conf.

 brassow
