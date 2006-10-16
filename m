Received: from [10.15.80.229] (dhcp80-229.msp.redhat.com [10.15.80.229])
	by pobox.corp.redhat.com (8.13.1/8.12.8) with ESMTP id k9GFenkR010248
	for <linux-lvm@redhat.com>; Mon, 16 Oct 2006 11:40:50 -0400
Mime-Version: 1.0 (Apple Message framework v624)
In-Reply-To: <452EEB6C.9040701@ibt.unam.mx>
References: <452EEB6C.9040701@ibt.unam.mx>
Message-Id: <99da7b78ee5a23c19e1611e1011082b7@redhat.com>
From: Jonathan E Brassow <jbrassow@redhat.com>
Subject: Re: [linux-lvm] How to restore a PV ??
Date: Mon, 16 Oct 2006 10:43:23 -0500
Content-Transfer-Encoding: 8bit
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
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

does 'vgcfgrestore principal' work?

  brassow

On Oct 12, 2006, at 8:27 PM, Jerome wrote:

> Hi all,
> i've made a mistake on deleting the MBR of a disk who was included in 
> a Volume Group of three disks.
> Now, when i do a pvdisplay command, i have this result:
>
>  pvdisplay
>   2 PV(s) found for VG principal: expected 3
>   Logical volume (Database) contains an incomplete mapping table.
>   PV segment VG free_count mismatch: 0 != 3576
>   PV segment VG extent_count mismatch: 7152 != 10728
>   Internal error: PV segments corrupted in principal.
>
> And a vgdisplay show me this following:
> vgdisplay
>   2 PV(s) found for VG principal: expected 3
>   2 PV(s) found for VG principal: expected 3
>   Volume group "principal" not found
>
> I'm sure that the data on the hard disk are not erased. But i want to 
> restore this third disk, that it is part of the "principal" Volume 
> Group. (I have a fourth disk with the same physical caracteristics).
> So, how can i do to succeed in this?
>
> Best regards.
> -- 
> -- J�r�me
> Si l'on peut trouver moins que rien, c'est que rien vaut d�j� quelque 
> chose.
> 	(Raymond Devos)
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
