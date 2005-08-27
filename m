Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j7RD10V21096
	for <linux-lvm@redhat.com>; Sat, 27 Aug 2005 09:01:00 -0400
Received: from wproxy.gmail.com (wproxy.gmail.com [64.233.184.196])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id j7RD0sJT029227
	for <linux-lvm@redhat.com>; Sat, 27 Aug 2005 09:00:54 -0400
Received: by wproxy.gmail.com with SMTP id 55so314238wri
	for <linux-lvm@redhat.com>; Sat, 27 Aug 2005 06:00:49 -0700 (PDT)
Message-ID: <fa61edfd05082706007d36d221@mail.gmail.com>
Date: Sat, 27 Aug 2005 23:00:49 +1000
From: Chris Jensen <cjensen@gmail.com>
Subject: Re: [linux-lvm] Saving files from full failing volume
In-Reply-To: <1124806695.17889.22.camel@bats.omnifarious.org>
Mime-Version: 1.0
Content-Disposition: inline
References: <fa61edfd0508200022235af787@mail.gmail.com>
	<1124806695.17889.22.camel@bats.omnifarious.org>
Content-Transfer-Encoding: 8bit
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

> The only way to really identify where files live in LVM is to identify
> which filesystem they're on.  Then they might end up being on any random
> block of that filesystem.  You can identify which physical extents a
> particular filesystem is using easily, but not which physical extents a
> particular file is using.
> 
> Perhaps someone else can correct me if I'm wrong about this, but as I
> understand things this is how it works.

Thanks for the response Eric. Let me check that I understand this correctly:
 If I were to use LVM to create a file system that spans 2 hard disks,
of capacity 80G each (for simplicities sake), giving a total capacity
of 160G, if that filesystem grows to (say) 100G and then one of the
disks begins to fail, there is no way for me to backup the files that
would be endangered, short of backing up the entire 100G, to another
disk entirely.

Is there a better way I should go about organising my disks and LVM so
that surviving a hard disk failure is not so difficult?
