Received: from dhcp80-216.msp.redhat.com (dhcp80-216.msp.redhat.com
	[10.15.80.216])
	by ns3.rdu.redhat.com (8.13.8/8.13.8) with ESMTP id m9OFf2tq007560
	for <linux-lvm@redhat.com>; Fri, 24 Oct 2008 11:41:02 -0400
Message-Id: <C687347B-6A3C-45CD-9951-A03C0646E59D@redhat.com>
From: Jonathan Brassow <jbrassow@redhat.com>
In-Reply-To: <61f78fbe0810221237u7ed9ad8cjf551936f605c7061@mail.gmail.com>
Content-Transfer-Encoding: 7bit
Mime-Version: 1.0 (Apple Message framework v929.2)
Subject: Re: [linux-lvm] Need help with lost XFS file system
Date: Fri, 24 Oct 2008 10:40:16 -0500
References: <61f78fbe0810221237u7ed9ad8cjf551936f605c7061@mail.gmail.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"; delsp="yes"
To: LVM general discussion and development <linux-lvm@redhat.com>

Seems like you have some xfs issues.  I hate to punt you over to them  
directly (xfs@oss.sgi.com) without knowing for sure that the problem  
is not with LVM (they probably wouldn't like that much either :).

So, I would say if you can activate the logical volume and you can  
read from the whole thing, then you know the problem lies in the file  
system.  You must be sure that the logical volume is mapped correctly  
though.  You can check that by doing a 'dmsetup table', or 'lvs -a -o  
+devices'.

  brassow

On Oct 22, 2008, at 2:37 PM, Larry K wrote:

> I have an LVM2 xfs file system that spans two partitions:  /dev/sda4  
> (150GB)  and /dev/sdb1 (300GB).   /dev/sda also hosts my O/S (/dev/ 
> sda1 is /boot and /dev/sda2 is root).
>
> Apparently, something went amiss with the /dev/sda disk, and the  
> first indication was a hung system, followed by the loss of certain  
> O/S files in the /lib directory following a reboot.  I was hopeful  
> that the damage was limited to the O/S files, so, after much  
> troubleshooting and fschk attempts, I just reinstalled the O/S.   
> After the O/S reinstall, I was finally able to reboot the machine  
> and try to run an xfs_check and xfs_repair -L.  Anyway, vgscan,  
> pvscan, and lvscan all look good.  Nothing seems wrong from this  
> standpoint.  The file system mounts, but it takes forever to do so.   
> And when I try to ls the files, I get an Input/output error.  If I  
> unmount and run an xfs_repair, I get a bad magic number or some such  
> message.
>
> Even if /dev/sda4 is a total loss, I am pretty certain that all the  
> files stored on the  /dev/sdb1 are in tact, but the xfs file system  
> just won't mount properly.  Is there anything I can do, or am I just  
> screwed?  Of course, if I had a backup I would just use that, but  
> there is none.
>
> Larry _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
