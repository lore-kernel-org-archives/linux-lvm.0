Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k9DJmpAg015777
	for <linux-lvm@redhat.com>; Fri, 13 Oct 2006 15:48:51 -0400
Received: from mta9.adelphia.net (mta9.adelphia.net [68.168.78.199])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k9DJmm1u022472
	for <linux-lvm@redhat.com>; Fri, 13 Oct 2006 15:48:48 -0400
Received: from mail.waldo.home ([69.175.168.186]) by mta9.adelphia.net
	(InterMail vM.6.01.05.02 201-2131-123-102-20050715) with ESMTP
	id <20061013194834.EVDY18643.mta9.adelphia.net@mail.waldo.home>
	for <linux-lvm@redhat.com>; Fri, 13 Oct 2006 15:48:34 -0400
Received: from [127.0.0.1] (mail.waldo.home [10.0.0.4])
	by mail.waldo.home (Postfix) with ESMTP id 5AB3FEBC2C
	for <linux-lvm@redhat.com>; Fri, 13 Oct 2006 15:48:31 -0400 (EDT)
Message-ID: <452FED8E.1050705@waldoware.com>
Date: Fri, 13 Oct 2006 15:48:30 -0400
From: Paul Waldo <pwaldo@waldoware.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Unable to add new drive to LV
References: <200610130827.42040.pwaldo@waldoware.com>	<452FB129.7020208@gmx.net>
	<452FBCAA.4080000@redhat.com>	<452FD0DC.5030904@waldoware.com>
	<20061013183720.GJ17654@agk.surrey.redhat.com>
In-Reply-To: <20061013183720.GJ17654@agk.surrey.redhat.com>
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
To: LVM general discussion and development <linux-lvm@redhat.com>

Alasdair G Kergon wrote:
> On Fri, Oct 13, 2006 at 01:46:04PM -0400, Paul Waldo wrote:
>> I interpret the above to mean that I can concatenate the single drive after 
>> the existing stripped array.  
> 
> Add -i1 to extend in a single stripe. (man lvextend)
> 
> Alasdair
That did the trick.  Thanks!
