Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j16J4CO01035
	for <linux-lvm@redhat.com>; Sun, 6 Feb 2005 14:04:12 -0500
Received: from out1.smtp.messagingengine.com (out1.smtp.messagingengine.com
	[66.111.4.25])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j16J46qH016180
	for <linux-lvm@redhat.com>; Sun, 6 Feb 2005 14:04:06 -0500
Received: from web3.messagingengine.com (web3.internal [10.202.2.212])
	by frontend1.messagingengine.com (Postfix) with ESMTP id 84D29C54FD7
	for <linux-lvm@redhat.com>; Sun,  6 Feb 2005 14:04:05 -0500 (EST)
Message-Id: <1107716646.1759.214446453@webmail.messagingengine.com>
From: "Ajeet Nankani" <fromkth+lvm@fastmail.fm>
Content-Disposition: inline
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
References: <1107714005.31216.214443428@webmail.messagingengine.com>
Subject: Re: [linux-lvm] Mapping between PEs and Logical Volumes - Remapping
	ofP Es in a Volume Group which is on one PV
In-Reply-To: <1107714005.31216.214443428@webmail.messagingengine.com>
Date: Sun, 06 Feb 2005 11:04:06 -0800
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


On Sun, 06 Feb 2005 10:20:05 -0800, fromkth+lvm@fastmail.fm said:
> Ok i have figured it out that 
> lvdisplay -m
> command shows the mapping of PEs and Logical Volumes.
> and in my case it shows that total PEs are 266 that means from 0 to 265,
> allocated are 224 and 42 are free PEs
> 
> Logical Volume 0 is from 0 to 191 PEs = 192 PEs
> and Logical Volume 1 is from 233 to 264 = 32 PEs 
> so total is 224 PEs
> 
> and in between these 2 logical volumes 41 PEs(PE# 191 to 232) are free
> and 1 PE (PE#265) is free at the end after 2nd logical Volume.
> Now i want to be LogVols in VolGroup to be contiguous physically, such
> that logical Volume 0 remains on 0 to 191 PEs and logical volume 1
> should start from PE 192 and finishes at PE 223.
> 
> I figured it out that for this shuffling of PEs the command should be,
> 
> # pvmove -v /dev/hda6:233-264 /dev/hda6:192-223
> 
> which gives following error
> 
> Finding volume group "VolGroup00"
>   No extents available for allocation
> 
> or 
> 
> # pvmove -v -n /dev/Volgroup00/logVol01 /dev/hda6 /dev/hda6:192-223
> 
> which gives following error
> 
>   Named LV and old PV must be in the same VG
>   pvmove: Move extents from one physical volume to another
> 
> in both cases i cant figure out what is the problem as there are PEs
> available and also LV and the "old PV" infact are in same VG.
> 
> I have also tried the simple command
> # pvmove -v -n /dev/Volgroup00/logVol01
> which does not give any error, but do nothing as the mapping remains
> same.
> 
> anybody here to help me out?


After reading archives i findout that this command may help which infact
worked.

# pvmove -v --alloc anywhere /dev/hda6:233-164 /dev/hda6:192-223

but this --alloc option is not mentioned in man page!!
also does anybody know what other options(Allocation Type) can be used
with --alloc?


> 
> -ajeet.
> 
> On Sun, 06 Feb 2005 07:44:25 -0800, fromkth+lvm@fastmail.fm said:
> > Hi,
> > 
> > I have one Volume Group and it contains two Logical Volumes.
> > There are many free PEs in Volume Group.
> > I want to know which PEs inside a Physical Volume(Volume Group) are
> > assigned to which Logical Volume.
> > 
> > So which command shows this.
> > 
> > 
> > Thanks.
> > 
> > -ajeet.
> > 
