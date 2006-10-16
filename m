Received: from [10.15.80.229] (dhcp80-229.msp.redhat.com [10.15.80.229])
	by pobox.corp.redhat.com (8.13.1/8.12.8) with ESMTP id k9GJTn4p006445
	for <linux-lvm@redhat.com>; Mon, 16 Oct 2006 15:29:49 -0400
Mime-Version: 1.0 (Apple Message framework v624)
In-Reply-To: <452E9D4B.8020104@cs.drexel.edu>
References: <452E9D4B.8020104@cs.drexel.edu>
Message-Id: <56b16185ee451ddb7bb4f8155b62ba26@redhat.com>
Content-Transfer-Encoding: 7bit
From: Jonathan E Brassow <jbrassow@redhat.com>
Subject: Re: [linux-lvm] How to force lvm2 to remove volume group?
Date: Mon, 16 Oct 2006 14:32:23 -0500
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
To: LVM general discussion and development <linux-lvm@redhat.com>

did the volume group contain any other disks?  with the removal of the 
disk, is the vg completely gone?  If you do a 'vgs', isn't it already 
gone (without errors)?

  brassow

On Oct 12, 2006, at 2:53 PM, Gaylord Holder wrote:

> I created a volume group on a disk which was hot removed.
>
> How can remove the volume group without replacing the drive or 
> rebooting
> my machine?
>
> I've tried vgreduce --removemissing without any luck.
>
> Thanks,
> -Gaylord
>
>
>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
