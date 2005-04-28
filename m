Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j3SANMO31957
	for <linux-lvm@redhat.com>; Thu, 28 Apr 2005 06:23:22 -0400
Received: from mail.cluj.astral.ro (mx0.astral.ro [193.226.99.20])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j3SANKod006429
	for <linux-lvm@redhat.com>; Thu, 28 Apr 2005 06:23:21 -0400
Message-ID: <4270B992.50805@nextra.ro>
Date: Thu, 28 Apr 2005 13:23:14 +0300
From: Gergely Imre <gimre@nextra.ro>
MIME-Version: 1.0
Subject: Re: [linux-lvm] pvmove hangs
References: <426F8DD4.1090801@nextra.ro> <20050428094506.M1118@pk25.com>
In-Reply-To: <20050428094506.M1118@pk25.com>
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
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>


the main question is, why it keeps hanging when i want to move "/" ? it
doesn't even begin to move the PEs. i tried to move some other live
partitions while writing on them, and it worked.

Diaz Rodriguez, Eduardo wrote:
> too much dificult for me, only have one idea, update lvm to last version and
> check changelog for some updates about pvmove.
> 
> If you solve the problem, please sumarice.
> 
> Good Luck!
> 
> On Wed, 27 Apr 2005 16:04:20 +0300, Gergely Imre wrote
> 
>>let me 'restart' this thread. i ran into another problem. or it's 
>>the same?
