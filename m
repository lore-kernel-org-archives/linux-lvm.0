Return-Path: <erik@bagfors.nu>
Subject: Re: [linux-lvm] can't remove logical volume  under snapshot???
From: Erik =?ISO-8859-1?Q?B=E5gfors?= <erik@bagfors.nu>
In-Reply-To: <20010411170727.A23096@sistina.com>
References: <987004247.3002.10.camel@detrius> 
	<20010411170727.A23096@sistina.com>
Date: 11 Apr 2001 18:11:25 +0200
Message-Id: <987005485.3003.11.camel@detrius>
Mime-Version: 1.0
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: linux-lvm@sistina.com

Ok, thank you. I love fast answers like this. :)

/Erik

> Erik,
> 
> you seem to have an older LVM version here which had this problem.
> 
> Please upgrade to the recent one from www.sistina.com which should fix it.
> 
> On Wed, Apr 11, 2001 at 05:50:47PM +0200, Erik B�gfors wrote:
> > What does this mean??
> > 
> > detrius:/# lvremove  -v /dev/disk_vg/home_lv 
> > lvremove -- locking logical volume manager
> > lvremove -- checking logical volume name "/dev/disk_vg/home_lv"
> > lvremove -- checking existence of volume group "disk_vg"
> > lvremove -- checking for active volume group "disk_vg"
> > lvremove -- getting status of volume group "disk_vg" from kernel
> > lvremove -- getting status of logical volume /dev/disk_vg/home_lv from
> > VGDA in kernel
> > lvremove -- can't remove logical volume "/dev/disk_vg/home_lv" under
> > snapshot
> > 
> > I've tried making a snapshot once but I removed that.  Does this lv
> > still think there is one???  How do I get past this?
> > 
> > /Erik
> > 
> > -- 
> > Erik B�gfors               | http://erik.bagfors.nu/    
> > erik@bagfors.nu            | Erik.Bagfors@engohol.se
> > Supporter of free software | GSM +46 733 279 273
> > fingerprint: 6666 A85B 95D3 D26B 296B 6C60 4F32 2C0B 693D 6E32
> > _______________________________________________
> > linux-lvm mailing list
> > linux-lvm@sistina.com
> > http://lists.sistina.com/mailman/listinfo/linux-lvm
> 
> -- 
> 
> Regards,
> Heinz    -- The LVM Guy --
> 
> *** Software bugs are stupid.
>     Nevertheless it needs not so stupid people to solve them ***
> 
> =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
> 
> Heinz Mauelshagen                                 Sistina Software Inc.
> Senior Consultant/Developer                       Am Sonnenhang 11
>                                                   56242 Marienrachdorf
>                                                   Germany
> Mauelshagen@Sistina.com                           +49 2626 141200
>                                                        FAX 924446
> =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> 

-- 
Erik B�gfors               | http://erik.bagfors.nu/    
erik@bagfors.nu            | Erik.Bagfors@engohol.se
Supporter of free software | GSM +46 733 279 273
fingerprint: 6666 A85B 95D3 D26B 296B 6C60 4F32 2C0B 693D 6E32
