Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j1O8ZqK02701
	for <linux-lvm@redhat.com>; Thu, 24 Feb 2005 03:35:52 -0500
Received: from ratbert.donck.com (ratbert.donck.com [212.204.192.81])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j1O8ZjG0025849
	for <linux-lvm@redhat.com>; Thu, 24 Feb 2005 03:35:45 -0500
Received: from dogbert.homenet (ratbert.donck.com [212.204.192.81])
	by ratbert.donck.com (8.12.8/8.12.8/rock) with ESMTP id j1O8Zi33011442
	for <linux-lvm@redhat.com>; Thu, 24 Feb 2005 09:35:44 +0100
Date: Thu, 24 Feb 2005 09:35:03 +0100
From: Fred Donck <fred@donck.com>
Subject: Re: [linux-lvm] lvm liveCD help needed
Message-ID: <20050224083503.GD7705@dogbert>
References: <1109195021.4695.65.camel@aragorn.intranet>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1109195021.4695.65.camel@aragorn.intranet>
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


Paul Pianta <pantz@lqt.ca>
   wrote at Wed, Feb 23, 2005 at 04:43:41PM -0500:

> Hi people
> 
> I have a gentoo live cd (with lvm support) and I assume this is what I
> need to use to 
> 1. create the volume group vgRoot
> 2. create the three logical volumes lvUsr, lvHome, lvVar
> 3. copy /usr, /home, /var from /dev/md1 over to these newly created
> logical volumes
> 4. edit /etc/fstab to reflect the new partition layout
> 5. reboot and dance around the room with my pants down singing 'oh what
> a beautiful morning'
> 
Paul,

The url below is what i used and it runs perfectly.
http://gentoo-wiki.com/HOWTO_Gentoo_Install_on_Software_RAID_mirror_and_LVM2_on_top_of_RAID

I have a 4x250Gb machine with disk 0 and 3 as raid pair. My fstab looks
like this:

/dev/md0         /boot           ext3            noauto,noatime 1 1
/dev/md2         /               reiserfs        noatime 0 0
/dev/md1         none            swap            sw 0 0
/dev/vg/usr      /usr            reiserfs        noatime 0 0
/dev/vg/var      /var            reiserfs        noatime 0 0
/dev/vg/tmp      /tmp            reiserfs        noatime 0 0
/dev/vg/opt      /opt            reiserfs        noatime 0 0
/dev/vg/home     /home           reiserfs        noatime 0 0

have a look at the URL 

> thanks
> 
> pantz
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

--- End of pantz@lqt.ca's quote ---

cheers,
-- 
Fred	

Buzzwords are like annoying little flies that deserve to be swatted
