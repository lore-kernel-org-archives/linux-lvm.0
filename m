Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j21K6LK08887
	for <linux-lvm@redhat.com>; Tue, 1 Mar 2005 15:06:21 -0500
Received: from epithumia.math.uh.edu (epithumia.math.uh.edu [129.7.128.2])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j21K6Jg4018193
	for <linux-lvm@redhat.com>; Tue, 1 Mar 2005 15:06:19 -0500
Received: from epithumia.math.uh.edu (epithumia.math.uh.edu [127.0.0.1])
	by epithumia.math.uh.edu (8.12.11/8.12.5) with ESMTP id j21K6EFd015145
	for <linux-lvm@redhat.com>; Tue, 1 Mar 2005 14:06:14 -0600
Subject: Re: [linux-lvm] *** Announcement: dmraid 1.0.0.rc6 ***
References: <20050301191127.GA13482@redhat.com> <20050301195734.GA4852@pob>
From: Jason L Tibbitts III <tibbs@math.uh.edu>
Date: Tue, 01 Mar 2005 14:06:13 -0600
In-Reply-To: <20050301195734.GA4852@pob> (Robin Green's message of "Tue, 1
	Mar 2005 19:57:34 +0000")
Message-ID: <ufaekez9lmy.fsf@epithumia.math.uh.edu>
MIME-Version: 1.0
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
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

>>>>> "RG" == Robin Green <greenrd@greenrd.org> writes:

RG> If those pieces of hardware aren't doing hardware RAID, what is?

On Windows, the driver does it.  On Linux, device-mapper does it.
None of the listed chipsets support true hardware RAID.  Look for
something like the 3ware or Areca cards for that.

 - J<
