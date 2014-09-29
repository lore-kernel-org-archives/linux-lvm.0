Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s8TIGbtK018405
	for <linux-lvm@redhat.com>; Mon, 29 Sep 2014 14:16:37 -0400
Received: from Ishtar.hs.tlinx.org (ishtar.tlinx.org [173.164.175.65])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s8TIGXqF018466
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Mon, 29 Sep 2014 14:16:35 -0400
Message-ID: <5429A1BD.2000206@tlinx.org>
Date: Mon, 29 Sep 2014 11:15:25 -0700
From: "Linda A. Walsh" <lvm@tlinx.org>
MIME-Version: 1.0
References: <1411839754687039500@businessgrade.com>
In-Reply-To: <1411839754687039500@businessgrade.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Why is my LVM Mirror performance so bad?
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
To: eneal@businessgrade.com, LVM general discussion and development <linux-lvm@redhat.com>

Errol Neal wrote:
> Is this just the life of a LVM mirror and the performance here is about as good as it gets?
> ----
>   
It's a bit confusing from what you have above, but *usually*, if you
want performance, you set up 1 duplicate device (disk) to duplicate another
of the same type.  That way when the controller is writing to 1, it will 
be able to
write to the other in the same location and expect *similar* speeds 
(speeds will
vary more on desktop drives vs. enterprise, so overall RAID performance 
is lost).

 From what it looks like you have multiple segments mirroring other 
(parallel?? not sure)
segments... but as data is being written to one segment, it also may not 
have finished
writing a  parallel copy to another segment.

Don't setup multiple segments mirroring each other on 2 devices... have 
1 be the mirror
of the other and both be of similar type if you want near device speed.

i.e. you don't want 4 mirrors, but want to make all of sdb mirror all of 
sdc.
