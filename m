Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l1KAjSIN009286
	for <linux-lvm@redhat.com>; Tue, 20 Feb 2007 05:45:28 -0500
Received: from mrp.swissptt.ch (outmail20.swisscom.com [138.190.3.140])
	by mx1.redhat.com (8.13.1/8.13.1) with ESMTP id l1KAjLJl006540
	for <linux-lvm@redhat.com>; Tue, 20 Feb 2007 05:45:22 -0500
Received: from slopi.osk.ch (mwdsp001.swissptt.ch [10.225.18.78])
	by mrp.swissptt.ch with ESMTP id l1KAjJob001091
	(using TLSv1/SSLv3 with cipher DHE-RSA-AES256-SHA (256 bits) verified
	NO) for <linux-lvm@redhat.com>; Tue, 20 Feb 2007 11:45:19 +0100 (MET)
Received: from slopi (localhost [127.0.0.1])
	by slopi.osk.ch (8.13.7/8.13.7) with ESMTP id l1KAjILi004277
	for <linux-lvm@redhat.com>; Tue, 20 Feb 2007 11:45:19 +0100
Date: Tue, 20 Feb 2007 11:45:18 +0100
From: Chris Osicki <osk@admin.swisscom-mobile.ch>
Subject: Re: [linux-lvm] Re: Extending the Root Volume with LVM
Message-ID: <20070220114518.13e93256@slopi>
In-Reply-To: <45D0CFA1.9070508@akamail.com>
References: <682963.73875.qm@web38214.mail.mud.yahoo.com>
	<45D0CFA1.9070508@akamail.com>
Mime-Version: 1.0
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
To: linux-lvm@redhat.com


Clark

Have a look at ext2online. It comes with RHEL 4.

Regards,
Chris

On Mon, 12 Feb 2007 12:35:45 -0800
Duane Clark <dclark@akamail.com> wrote:

> Sean McGlynn wrote:
> > I am working with RHEL 4 Update 4.  When initially installing the OS I 
> > allowed the installation to automatically partition the disk, and it 
> > used LVM to create a logical volume to mount the root file system.  The 
> > only other logical volume it created was for the swap file.
> >  
> > Now, as an experiment, I am attempting to extend the volume group and 
> > logical volume on which root is mounted.  Everything appeared to 
> > be going smoothly (extending the VG, extending the LV, doing a vgchange, 
> > and then a lvm lvchange), but I am now at the point where I want to run 
> > e2fsck to check the file system and resize2fs to resize the files system 
> > to realize the added space, and I can't do either because the volume is 
> > mounted, and cannot be unmounted.
> >  
> > I've read a few suggestions such as using the installation media to go 
> > in in rescue mode, but nothing seems to do the trick. 
> 
> Why, what problems did you run into? When rescue mode asked you whether 
> you wanted it to find and mount the root partitions, did you select 
> "skip"? Here are step by step instructions on how I reduced the LVM (on 
> FC4), including e2fsck and resize2fs.
> 
> https://www.redhat.com/archives/linux-lvm/2006-August/msg00081.html
> 
> > I also read 
> > something that said that you cannot extend the root volume, and that you 
> > shouldn't have to.  This appears to be more accurate than anything else 
> > I've read.
> 
> Definitely not true.
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 
