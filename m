Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l51Jbwea002522
	for <linux-lvm@redhat.com>; Fri, 1 Jun 2007 15:37:58 -0400
Received: from bycast.com (bycast.com [209.139.229.1])
	by mx2.redhat.com (8.13.1/8.13.1) with ESMTP id l51JbqOx011544
	for <linux-lvm@redhat.com>; Fri, 1 Jun 2007 15:37:53 -0400
Received: from [192.168.110.200] (account kjamieson HELO [192.168.110.200])
	by bycast.com (CommuniGate Pro SMTP 4.3.9)
	with ESMTPA id 1916926 for linux-lvm@redhat.com;
	Fri, 01 Jun 2007 12:37:47 -0700
Message-ID: <4660758B.7010908@bycast.com>
Date: Fri, 01 Jun 2007 12:37:47 -0700
From: Kevin Jamieson <kjamieson@bycast.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Should I expect snapshot origin LV's to be 10x slower?
Content-Transfer-Encoding: 7bit
Reply-To: kjamieson@bycast.com,
	LVM general discussion and development <linux-lvm@redhat.com>
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
To: linux-lvm@redhat.com

Alex Owen wrote:

> I have been using commands of the form:
>   time dd if=/dev/zero of=/dev/volgroup/test bs=1M count=100
> to get speeds for copying to a LVM device both WITH and WITHOUT a
> single snapshot.
>
> It seems that writes take >=10 times longer the first time a newly
> snapshot origin device is written to.

You may want to try the kernel patch posted here:
http://marc.info/?l=dm-devel&m=118056593528910&w=1

That change gave me a significant speedup in similar tests.

Kevin
