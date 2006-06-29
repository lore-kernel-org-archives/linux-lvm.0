Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k5TIhhuX006999
	for <linux-lvm@redhat.com>; Thu, 29 Jun 2006 14:43:43 -0400
Received: from mi.npn ([206.58.200.39])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k5TIhfDc025285
	for <linux-lvm@redhat.com>; Thu, 29 Jun 2006 14:43:42 -0400
Received: from [127.0.0.1] (unknown [10.32.70.91])
	by mi.npn (Postfix) with ESMTP id 942C2D5009
	for <linux-lvm@redhat.com>; Thu, 29 Jun 2006 11:12:39 -0700 (PDT)
Message-ID: <44A4181F.8070703@neatech.com>
Date: Thu, 29 Jun 2006 11:12:47 -0700
From: Patrick Nelson <pnelson@neatech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] FC5 Increase LV in VolGroup00
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
To: linux-lvm@redhat.com

FC4 - Up to date

I'm trying to figure out how to increase the size of VolGroup00/LogVol00 
on my FC4 install.  This is the root dir and I can not unmount it.

I figure some one can give me the step by step way of doing this because 
I have tried everything I can think of to do this, including:

- booting to rescue mode
- going to single user mode


But no matter what I try I can not resize this LV.  If anyone has done 
this can you please help me with the steps to do this.  I'm adding a new 
drive (pv) and I have done the following:

- pvcreate /dev/sdb
- vgextend VolGroup00 /dev/sdb
- I grabbed the PE from pvdisplay -> 191
- lvextend -l 191 /dev/VolGroup00/LogVol00 /dev/sdb

And I need to run resize2fs /dev/VolGroup00/LogVol00 but I need to 
umount it first. 

Any help greatly appreciated.
