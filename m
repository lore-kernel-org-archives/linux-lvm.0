Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l17HJl9i003526
	for <linux-lvm@redhat.com>; Wed, 7 Feb 2007 12:19:47 -0500
Received: from cmpmail.ucsf.edu (cmpmail.ucsf.edu [169.230.18.155])
	by mx1.redhat.com (8.13.1/8.13.1) with ESMTP id l17HJgMK009258
	for <linux-lvm@redhat.com>; Wed, 7 Feb 2007 12:19:43 -0500
Received: from [169.230.6.55] (account nico [169.230.6.55] verified)
	by cmpmail.ucsf.edu (CommuniGate Pro SMTP 5.0.8)
	with ESMTPA id 3263804 for linux-lvm@redhat.com;
	Wed, 07 Feb 2007 09:14:53 -0800
Mime-Version: 1.0 (Apple Message framework v752.3)
In-Reply-To: <20070207075112.GB12469@percy.comedia.it>
References: <C40752F5-E7A4-4B4A-98F1-3DFF485DD152@cmpmail.ucsf.edu>
	<20070207075112.GB12469@percy.comedia.it>
Message-Id: <0927DA20-9D44-4EB1-8A45-51B183E72E28@cmp.ucsf.edu>
Content-Transfer-Encoding: 7bit
From: Nico Stuurman <nico@cmp.ucsf.edu>
Subject: Re: [linux-lvm] pvscan does not detect lvm1 exported volume group
Date: Wed, 7 Feb 2007 09:19:41 -0800
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
Content-Type: text/plain; charset="us-ascii"; delsp="yes"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Thanks Luca,

I was not aware that md was ever used on the system (that is what you  
get for not configuring things yourself).  I disabled  
md_component_detection and all was fine.

Thanks!


Nico

On Feb 6, 2007, at 11:51 PM, Luca Berra wrote:

> On Thu, Feb 01, 2007 at 08:21:00AM -0800, Nico Stuurman wrote:
>> The relevant output of pvscan -vvvv is copied below.  The volume   
>> group consists of /dev/sdb1 and /dev/sdc1.  Apparently, pvscan  
>> sees  some kind of md raid information on /dev/sdb1 and decides to  
>> skip it?
>
> I don't know why there is a md superblock at the end of sdb1 and sdc1,
> maybe you used to mirror or stripe them before, then forgot to remove
> the superblock when you quit md.
> anyway you can use mdadm to examine and remove the superblock from  
> sdb1
> and sdc1.
> In alternative you can disable md_component_detection in
> /etc/lvm/lvm.conf (if you will never use lvm over md anymore, that is)
>
> L.
>
>
> -- 
> Luca Berra -- bluca@comedia.it
>        Communication Media & Services S.r.l.
> /"\
> \ /     ASCII RIBBON CAMPAIGN
>  X        AGAINST HTML MAIL
> / \
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
