Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j16L1VO26605
	for <linux-lvm@redhat.com>; Sun, 6 Feb 2005 16:01:31 -0500
Received: from out1.smtp.messagingengine.com (out1.smtp.messagingengine.com
	[66.111.4.25])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j16L1VNP002191
	for <linux-lvm@redhat.com>; Sun, 6 Feb 2005 16:01:31 -0500
Received: from web3.messagingengine.com (web3.internal [10.202.2.212])
	by frontend1.messagingengine.com (Postfix) with ESMTP id CEA07C539FA
	for <linux-lvm@redhat.com>; Sun,  6 Feb 2005 16:01:29 -0500 (EST)
Message-Id: <1107723690.9660.214451087@webmail.messagingengine.com>
From: "Ajeet Nankani" <fromkth+lvm@fastmail.fm>
Content-Disposition: inline
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
References: <1107720948.6351.214448095@webmail.messagingengine.com>
	<20050206202440.GI14093@agk.surrey.redhat.com>
Subject: Re: [linux-lvm] Reducing PV/ Reclaiming free PEs from a PV to be
	usedfor another partition/purpose outside of LVM
In-Reply-To: <20050206202440.GI14093@agk.surrey.redhat.com>
Date: Sun, 06 Feb 2005 13:01:30 -0800
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

On Sun, 6 Feb 2005 20:24:40 +0000, "Alasdair G Kergon" <agk@redhat.com>
said:
> On Sun, Feb 06, 2005 at 12:15:48PM -0800, Ajeet Nankani wrote:
> > vgcfgbackup which would give me meta file data as below 
>  
> >         extent_size = 65536             # 32 Megabytes
> 
> >                         device = "/dev/hda6"    # Hint only
>  
> >                         pe_start = 384
> >                         pe_count = 266  # 8.3125 Gigabytes
> 
> >                                 extent_count = 192      # 6 Gigabytes
> >                                         "pv0", 0
> 
> 0-191
> 
> >                                 extent_count = 32       # 1024 Megabytes
> >                                         "pv0", 192
> 
> 192-223
> 
> > Now here if i edit it and in physical volume section where it says that
> > pe_count = 266, i change it to pe_count = 224 which is the last PE used
> > by the Logical Volume.
>  
> Yes.
> 
> > after saving it if i run vgcfgrestore with this file, will my PV be
> > reduced?? 
> 
> That's what pvresize would do.

but pvresize says command not implemented yet. 

also what this "pe_start = 384" in meta data means.

Thanks

-ajeet.

> 
> > after that i can reduce hda6 with parted or similar utility.
>  
> and the new size is 384 sectors plus 224 extents of 65536 sectors each.
> 
> Alasdair
> -- 
> agk@redhat.com
> 
