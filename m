Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j1O9dsK17787
	for <linux-lvm@redhat.com>; Thu, 24 Feb 2005 04:39:54 -0500
Received: from ratbert.donck.com (ratbert.donck.com [212.204.192.81])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j1O9dm3D005643
	for <linux-lvm@redhat.com>; Thu, 24 Feb 2005 04:39:49 -0500
Received: from dogbert.homenet (ratbert.donck.com [212.204.192.81])
	by ratbert.donck.com (8.12.8/8.12.8/rock) with ESMTP id j1O9dm33011958
	for <linux-lvm@redhat.com>; Thu, 24 Feb 2005 10:39:48 +0100
Date: Thu, 24 Feb 2005 10:39:08 +0100
From: Fred Donck <fred@donck.com>
Subject: Re: [linux-lvm] lvm liveCD help needed
Message-ID: <20050224093908.GG7705@dogbert>
References: <1109195021.4695.65.camel@aragorn.intranet>
	<20050224083503.GD7705@dogbert>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20050224083503.GD7705@dogbert>
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
To: linux-lvm@redhat.com


Fred Donck <fred@donck.com>
   wrote at Thu, Feb 24, 2005 at 09:35:03AM +0100:

> 
> Paul,
> 
> The url below is what i used and it runs perfectly.
> http://gentoo-wiki.com/HOWTO_Gentoo_Install_on_Software_RAID_mirror_and_LVM2_on_top_of_RAID
> 
> I have a 4x250Gb machine with disk 0 and 3 as raid pair. My fstab looks
> like this:
> 
> /dev/md0         /boot           ext3            noauto,noatime 1 1
> /dev/md2         /               reiserfs        noatime 0 0
> /dev/md1         none            swap            sw 0 0
> /dev/vg/usr      /usr            reiserfs        noatime 0 0
> /dev/vg/var      /var            reiserfs        noatime 0 0
> /dev/vg/tmp      /tmp            reiserfs        noatime 0 0
> /dev/vg/opt      /opt            reiserfs        noatime 0 0
> /dev/vg/home     /home           reiserfs        noatime 0 0
> 
> have a look at the URL 

forgot to mentions few things:

o) make sure you have latest available version of lvm2 from gentoo using
   ACCEPT_KEYWORDS="~x86" emerge lvm2

o) in my case the volumegroup 'vg' is on /dev/md3

> 
> 
> cheers,
> -- 
> Fred	
> 
> Buzzwords are like annoying little flies that deserve to be swatted
> 

--- End of fred@donck.com's quote ---

-- 
Fred

Objects in a mirror are closer than you think!
