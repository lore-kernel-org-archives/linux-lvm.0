Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j2U12fO09698
	for <linux-lvm@redhat.com>; Tue, 29 Mar 2005 20:02:41 -0500
Received: from wproxy.gmail.com (wproxy.gmail.com [64.233.184.197])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j2U12Z9O009520
	for <linux-lvm@redhat.com>; Tue, 29 Mar 2005 20:02:35 -0500
Received: by wproxy.gmail.com with SMTP id 68so801565wra
	for <linux-lvm@redhat.com>; Tue, 29 Mar 2005 17:02:30 -0800 (PST)
Message-ID: <c23be1c305032917022b076064@mail.gmail.com>
Date: Wed, 30 Mar 2005 09:02:28 +0800
From: Andy Sy <andy.sy@gmail.com>
In-Reply-To: <mailman.11694.1112144246.19557.linux-lvm@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
References: <mailman.11694.1112144246.19557.linux-lvm@redhat.com>
Subject: [linux-lvm] Re: Welcome to the "linux-lvm" mailing list
Reply-To: Andy Sy <andy.sy@gmail.com>,
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
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com

Just like the kernel is now able to autodetect and
autoenable md RAID arrays, are there plans to make
lvm do the same?  (i.e integrate the functionality
of vgscan / vgchange -ay,-an into the kernel)

If lvm really introduces as negligible an overhead
as it is touted to, there really seems to be no
reason to go with 'physical' partitions anymore and
it should go the way of the dodo.  I can see a future
where everyone installs their Linux distros on logical
volumes.
