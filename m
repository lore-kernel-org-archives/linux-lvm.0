Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l1DAR3Hl013578
	for <linux-lvm@redhat.com>; Tue, 13 Feb 2007 05:27:04 -0500
Received: from percy.comedia.it (percy.comedia.it [212.97.59.71])
	by mx2.redhat.com (8.13.1/8.13.1) with ESMTP id l1DAQxTh003285
	for <linux-lvm@redhat.com>; Tue, 13 Feb 2007 05:27:00 -0500
Date: Tue, 13 Feb 2007 11:26:57 +0100
From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] Extending the Root Volume with LVM
Message-ID: <20070213102657.GD16573@percy.comedia.it>
References: <682963.73875.qm@web38214.mail.mud.yahoo.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <682963.73875.qm@web38214.mail.mud.yahoo.com>
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
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

On Mon, Feb 12, 2007 at 12:11:30PM -0800, Sean McGlynn wrote:
>
>
>I am working with 
>RHEL 4 Update 4.  When initially installing the OS I allowed the installation to 
...
>Now, as an 
>experiment, I am attempting to extend the volume group and logical volume on 
>which root is mounted.  Everything appeared to be going smoothly (extending the 
>VG, extending the LV, doing a vgchange, and then a lvm lvchange), but I am now 
>at the point where I want to run e2fsck to check the file system and resize2fs 
>to resize the files system to realize the added space, and I can't do either 
>because the volume is mounted, and cannot be unmounted.
>
>I've read a few 
you probablu missed to "read the fine manual(TM)" provided with your rhel.
or the fine release notes

rhel 4 supports online resize of filesystem, check the man page of
ext2online to find more.

L.

-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
