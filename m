Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i5HKbx014339
	for <linux-lvm@redhat.com>; Thu, 17 Jun 2004 16:37:59 -0400
Received: from mwinf0303.wanadoo.fr (smtp3.wanadoo.fr [193.252.22.28])
	by mx1.redhat.com (8.12.10/8.12.10) with ESMTP id i5HKbve1006733
	for <linux-lvm@redhat.com>; Thu, 17 Jun 2004 16:37:57 -0400
Received: from [192.168.0.35] (AVelizy-151-1-20-56.w82-120.abo.wanadoo.fr
	[82.120.154.56])
	by mwinf0303.wanadoo.fr (SMTP Server) with ESMTP id 9B3A9500092B
	for <linux-lvm@redhat.com>; Thu, 17 Jun 2004 22:37:51 +0200 (CEST)
Subject: Re: [linux-lvm] How to extend a root LVM volume?
From: Pascal Garcia dld <dld.pascal.garcia@wanadoo.fr>
In-Reply-To: <40D1D120.3070605@miksis.com>
References: <40D1D120.3070605@miksis.com>
Message-Id: <1087504670.2697.23.camel@localhost.localdomain>
Mime-Version: 1.0
Date: Thu, 17 Jun 2004 22:37:50 +0200
Content-Transfer-Encoding: 8bit
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="utf-8"
To: LVM general discussion and development <linux-lvm@redhat.com>

Hello,
Sorry but I will not solve your problem.
The problem I see is that you must declare the volume and "import the
pvs" but I am not sure you will be, afterwards able to reboot.


I just want to tell about what I did not to have that problem. It does
not help for your problem.
They are file systems that can be resized (at least extended) without
unmounting the partition.
ext2 and ext3 partitions, as far as I know, can not. reiserfs partition
can, but I believe there are few others. Reiserfs is the one I use. 
This is the script I use to extend my root partition by 500M when needed
! I just make sure my important data is saved before I do that, just in
case ...

lvextend -L +500M /dev/rootvg/1
resize_reiserfs /dev/rootvg/1

No need to reboot, to stop to start rescue disk, ... That is done!


Easy no!

Regards
Pascal Garcia

 
Le jeu 17/06/2004 � 19:13, Mark Miksis a �crit :
> I'm trying to extend a root LVM.  I'm using LVM2 on FC2.  Here is what
> I've tried:
> 
> I ran lvextend when the system was booted normally and the volumes were
> mounted.  This worked as expected and lvdisplay properly shows the new
> larger size.
> 
> Then I booted into the FC2 rescue CD and instructed it to NOT search for
> and mount Fedora installations.  I then ran:
> # resize2fs /dev/Volume00/LogVol00
> I don't have the specific error, but it basically says that the
> specified volume doesn't exist.  Indeed if I look in /dev, my volume
> group and volumes are nowhere to be found.
> 
> At that point I tried:
> # lvm
> lvm> vgscan
> After only about 1 second, it responds that no volumes are found.
> 
> I also tried rebooting from the CD and letting it mount my
> installations.  In this case, the volume and volume groups are properly
> discovered and mounted.  However, if I try to unmount the volume, it
> always responds with "device busy".
> 
> Is this a problem with how the FC2 rescue disk scans for volumes?  Any
> help would be appreciated.
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
