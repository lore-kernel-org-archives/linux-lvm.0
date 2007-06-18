Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l5I7njHW002074
	for <linux-lvm@redhat.com>; Mon, 18 Jun 2007 03:49:45 -0400
Received: from mail.ukfsn.org (s2.ukfsn.org [217.158.120.143])
	by mx2.redhat.com (8.13.1/8.13.1) with ESMTP id l5I7nh8j004095
	for <linux-lvm@redhat.com>; Mon, 18 Jun 2007 03:49:43 -0400
Message-ID: <4676390E.6010202@dgreaves.com>
Date: Mon, 18 Jun 2007 08:49:34 +0100
From: David Greaves <david@dgreaves.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] 2.6.22-rc4 XFS fails after hibernate/resume
References: <46744065.6060605@dgreaves.com> <4674645F.5000906@gmail.com>
	<46751D37.5020608@dgreaves.com>
In-Reply-To: <46751D37.5020608@dgreaves.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: David Robinson <zxvdr.au@gmail.com>
Cc: LinuxRaid <linux-raid@vger.kernel.org>, xfs@oss.sgi.com, linux-pm <linux-pm@lists.osdl.org>, "'linux-kernel@vger.kernel.org'" <linux-kernel@vger.kernel.org>, LVM general discussion and development <linux-lvm@redhat.com>

David Greaves wrote:
> David Robinson wrote:
>> David Greaves wrote:
>>> This isn't a regression.
>>>
>>> I was seeing these problems on 2.6.21 (but 22 was in -rc so I waited 
>>> to try it).
>>> I tried 2.6.22-rc4 (with Tejun's patches) to see if it had improved - 
>>> no.
>>>
>>> Note this is a different (desktop) machine to that involved my recent 
>>> bugs.
>>>
>>> The machine will work for days (continually powered up) without a 
>>> problem and then exhibits a filesystem failure within minutes of a 
>>> resume.

<snip>

> OK, that gave me an idea.
> 
> Freeze the filesystem
> md5sum the lvm
> hibernate
> resume
> md5sum the lvm
<snip>
> So the lvm and below looks OK...
> 
> I'll see how it behaves now the filesystem has been frozen/thawed over 
> the hibernate...


And it appears to behave well. (A few hours compile/clean cycling kernel builds 
on that filesystem were OK).


Historically I've done:
sync
echo platform > /sys/power/disk
echo disk > /sys/power/state
# resume

and had filesystem corruption (only on this machine, my other hibernating xfs 
machines don't have this problem)

So doing:
xfs_freeze -f /scratch
sync
echo platform > /sys/power/disk
echo disk > /sys/power/state
# resume
xfs_freeze -u /scratch

Works (for now - more usage testing tonight)

David
