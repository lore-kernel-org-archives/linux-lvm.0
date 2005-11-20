Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id jAKHd4V30904
	for <linux-lvm@redhat.com>; Sun, 20 Nov 2005 12:39:04 -0500
Received: from fed1rmmtao12.cox.net (fed1rmmtao12.cox.net [68.230.241.27])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id jAKHcuap031708
	for <linux-lvm@redhat.com>; Sun, 20 Nov 2005 12:38:57 -0500
Received: from [70.181.66.125] by fed1rmmtao12.cox.net
	(InterMail vM.6.01.05.02 201-2131-123-102-20050715) with ESMTP
	id <20051120173735.VHLF17437.fed1rmmtao12.cox.net@[70.181.66.125]>
	for <linux-lvm@redhat.com>; Sun, 20 Nov 2005 12:37:35 -0500
Message-ID: <4380B4AA.5080705@tsss.org>
Date: Sun, 20 Nov 2005 09:38:50 -0800
From: kelsey hudson <khudson@tsss.org>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Hosed up arrays and LVM
References: <1132507550.24931.29.camel@joesgrill.cc.vt.edu>
In-Reply-To: <1132507550.24931.29.camel@joesgrill.cc.vt.edu>
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

Bill Ranck wrote:
> It continues on like that with another volume group and different uuids.
> I have /dev/md0 through /dev/md11 defined with md and some of those seem
> OK, but md1, md2, md3, md4, md8, md9, md11 are not seen by vgscan.  I
> tried pvcreate on those missing arrays, which made them visible, but LVM
> does not recognize them as part of the volume groups they belong to
> anymore.  
> 
> Can anyone suggest a course of action here?

ouch, you ran pvcreate on a volume which already had data on it? From 
all I've read, you had better have a good backup laying around, 'cause 
you may not be able to get that data back pvcreate, IIRC, wipes out the 
metadata ...

If you have the old UUIDs for the physical volumes, you may be able to 
write those back to the device using pvcreate -u <old-uuid> on each such 
PV, then try vgscan again.

but, as from the man page:

    You can not recreate (reinitialize)  a  physical  volume  belonging
    to  an existing  volume  group.

so, you may be out of luck. But, good luck anyways ...

-kelsey
