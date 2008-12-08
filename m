Received: from [10.16.10.55] (vpn-10-55.bos.redhat.com [10.16.10.55])
	by ns3.rdu.redhat.com (8.13.8/8.13.8) with ESMTP id mB8KXiTQ030649
	for <linux-lvm@redhat.com>; Mon, 8 Dec 2008 15:33:44 -0500
Subject: Re: [linux-lvm] system-config-lvm bug with using lv as swap space
From: jim parsons <jparsons@redhat.com>
In-Reply-To: <d66ef690812080037k5d99dbcdm1ce11ab32744efff@mail.gmail.com>
References: <d66ef690812080037k5d99dbcdm1ce11ab32744efff@mail.gmail.com>
Date: Mon, 08 Dec 2008 15:33:44 -0500
Message-Id: <1228768424.4271.1.camel@localhost.localdomain>
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
To: LVM general discussion and development <linux-lvm@redhat.com>

Hello, Wu. Thanks for your help. Can you please file a new bugzilla and
attach your patch, please? 

Much obliged,

-Jim

On Mon, 2008-12-08 at 16:37 +0800, wu jessinay wrote:
> Hi,all
> I have encountered several bugs of system-config-lvm.
> The first one is if there is a logical volume entry in /etc/fstab
> and another raw device entry for swap
> such as
> /dev/my_vg1/my_lv1   swap  swap  defaults 0 0
> /dev/hda1       swap    swap   defaults   0  0
>  
> then if we use system-config-lvm to remove my_lv1,
> Not only the my_lv1 entry,but all other swap entries in /etc/fstab
> will get removed.
>  
> After some investigation on the system-config-lvm python source file.
> It seems that the problem is in the InputController.py file.
> When we click the remove button,the program will check if there is any
> entry of the removed logical volume in /etc/fstab.
> If any entry exist in /etc/fstab, it will remove this line
> from /etc/fstab so that when the system reboot it won't mount this
> logical volume(since it has been removed).
>  
> This procedure is OK.However,the program will delete the corresponding
> entry in the following way:
> 1.check what is the mount point of this logical volume.(in our case it
> is swap)
> 2.search /etc/fstab file,delete all the entries with the same mount
> point.This won't result in any trouble if the logical volume is
> mounted on /mnt/mylv1 .but if the mount point is swap ,it will delete
> all swap entries in /etc/fstab file.
>  
> I have created a patch to solve this problem,which modify the removing
> procedure if the mount point is swap.
>  
> There is several other bugs with system-config-lvm but the root cause
> should be the same.
>  
> this problem exist in enterprise linux 5 and enterprise linux 5 U1. 
> Is this a fixed bug?Any advice is appreciated!
>  
> Thanks
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
