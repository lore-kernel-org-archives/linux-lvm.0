Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m75HctWR008735
	for <linux-lvm@redhat.com>; Tue, 5 Aug 2008 13:39:00 -0400
Received: from mk-outboundfilter-1.mail.uk.tiscali.com
	(mk-outboundfilter-1.mail.uk.tiscali.com [212.74.114.37])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m75Hc1eI016152
	for <linux-lvm@redhat.com>; Tue, 5 Aug 2008 13:38:23 -0400
Received: from [192.168.100.54] (daisy.localdomain [192.168.100.54])
	by katy.localdomain (Postfix) with ESMTP id E60D680054
	for <linux-lvm@redhat.com>; Tue,  5 Aug 2008 18:36:59 +0100 (BST)
Message-ID: <48988FD2.5050401@ianburnett.com>
Date: Tue, 05 Aug 2008 18:37:22 +0100
From: Ian Burnett <maillist-lvm@ianburnett.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Problem in LVM settings in VMware
References: <a847b5a10808040735n59431d13h6a9ae8c91326e143@mail.gmail.com>
In-Reply-To: <a847b5a10808040735n59431d13h6a9ae8c91326e143@mail.gmail.com>
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

Jason Lee wrote:
> Hi,
>
> I am quite new to VMware and recently installed a VM of Fedora in my 
> Host OS Win XP. In this VM, I have couple of VMDK files which comes 
> together as parts of vmdk file. Each vmdk file is about 2-3GB size and 
> I have 4 of them totalling to 8-12GB. However, currently, I am facing 
> shortage of space.
>
> What I did was freeing up some space from my Host OS and in the VM, I 
> can see this "unallocated space" partition. So, I have no idea how to 
> proceed with these unallocated space partition. Ultimate goal is to 
> absorb this unallocated partition as similar LVM so these current LVM 
> can expand beyond the existing size.
The VMware image appears to the guest OS as a whole machine complete 
with what look like standard disks. In the case of a Linux guest OS, any 
allocated disk space will appear as /dev/sd? devices, which will require 
partitioning, marking these partitions as type "Linux LVM" and then 
initialising with pvcreate. In this respect there's nothing special 
about your setup and any of the on-line LVM guides should work in this 
case.

If your host OS is reporting unallocated space, then you need to make 
that space available to WinXP first, then VMware, then add it to the 
Linux guest image as an extra or larger drive. How you do that is a 
question for a WinXP or VMware newsgroup.

Try to separate in your mind the difference between the Linux guest OS 
and the Windows host OS and the disks that they are viewing. The Windows 
host OS sees the real physical drives spinning in your system (assuming 
no RAID controller stuff, etc.) The Linux guest OS simply knows about 
what VMware has told it about. The data stored by the Linux image just 
happens to be stored in a bunch of vmdk files in the WinXP filesystem.

The ultimate goal should certainly be achievable - just a question of 
working out who knows about this "unallocated space".
> I am currently using VM server 1.0.5 Build and LVM2. I tried to find 
> several articles from the net but that didnt help due to my specific 
> problem.
> I tried Pvdisplay and only able to see one VG even though it has 
> various parts of vmdk. Besides, Im not sure whether issuing Pvcreate 
> for this newly created partition would help.
Have you tried pvcreate? What happened? I know Microsoft VirtualPC has a 
feature known as "scratch disks", which allows you to decide on VM 
shutdown whether to commit the changes made to the image or rollback to 
the last time the VM started. In effect you can completly trash the 
system, then quickly restore it to a known working state.

What disk devices does your Fedora system show? (fdisk -l) What physical 
volumes have you already created? (pvscan and pvdisplay).

Ian

-- 
Ian Burnett :: www.ianburnett.com
