Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.8])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p07DuYWi028720
	for <linux-lvm@redhat.com>; Fri, 7 Jan 2011 08:56:34 -0500
Received: from ps536.phatservers.com (ps536.phatservers.com [216.17.105.202])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id p07DuPn8019225
	for <linux-lvm@redhat.com>; Fri, 7 Jan 2011 08:56:25 -0500
Received: from r74-192-2-154.bcstcmta01.clsttx.tl.dh.suddenlink.net
	([74.192.2.154] helo=raydesk1.bettercgi.com)
	by ps536.phatservers.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.66) (envelope-from <support@bettercgi.com>)
	id 1PbCno-0005ma-6A
	for linux-lvm@redhat.com; Fri, 07 Jan 2011 05:56:24 -0800
Date: Fri, 07 Jan 2011 07:56:23 -0600
From: Ray Morris <support@bettercgi.com>
In-Reply-To: <AANLkTi=n-aH71XgUmx4U157UWxjj2o416+T21p0mPzr9@mail.gmail.com>
	(from mightydreams@gmail.com on Fri Jan  7 04:12:09 2011)
Message-Id: <1294408583.2185.72@raydesk1.bettercgi.com>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] lvm to vmdk conversion
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; delsp="Yes"; format="Flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

> if this is not the right list for question the give me any link.

These are qemu questions, so indeed this is not the right list.
Your logical volumes happen to be the files you want to use
qemu-img on, but they are just files in this context, there's
no logical volume management (LVM) questions.

> I came across many tutorials on internet which talk of converting a
> vmdk to qcow2 image using qemu-img.

If you read at least one of those tutorials, you probably know
more about it than anyone on this list, so I'm waiting to learn
from you after confirm as below.

> qemu-img convert -c -f raw -O vmdk /dev/abcd/lvm4 /backup/lvm4.img
> 
> Will the above affect the lvm4.
> I do not want the VM running on original server to at all loose its
> any of the content

Most of the time, commands don't affect their input, so I'd guess
that the input file would be unchanged. Try it and see.  Maybe
make an extra copy of the source image, such as with dd, and test
it.  I'm curious to know what you learn during this process because
I also happen to have a bunch of virtual machine on LVs, which I
may convert to another type of image file at some point.
--
Ray Morris
support@bettercgi.com

Strongbox - The next generation in site security:
http://www.bettercgi.com/strongbox/

Throttlebox - Intelligent Bandwidth Control
http://www.bettercgi.com/throttlebox/

Strongbox / Throttlebox affiliate program:
http://www.bettercgi.com/affiliates/user/register.php


On 01/07/2011 04:12:09 AM, Tapas Mishra wrote:
> Hi,
> if this is not the right list for question the give me any link.
> I am not clear as the term I want to know.
> I have a virtualization setup(kvm) where few guest Operating Systems
> are running in separate LVM partitions.
> 
> Here is output of lvscan
> 
>  ACTIVE            '/dev/abcd/lvm1' [100.00 GiB] inherit
>   ACTIVE            '/dev/abcd/lvm2' [150.00 GiB] inherit
>   ACTIVE            '/dev/abcd/lvm3' [50.00 GiB] inherit
>   ACTIVE            '/dev/abcd/lvm4' [100.00 GiB] inherit
> 
> 
> I want all these OSeS running inside LVMs to be into a vmdk image.
> I came across many tutorials on internet which talk of converting a
> vmdk to qcow2 image using qemu-img.
> 
> I tried vmware-converter-client  also on a test machine which  
> actually failed.
> I want to convert all the above LVMs to vmdk image which I can give to
> some people who will do experiments on the things installed in the VMs
> as above on a Vmware environment or Xen even.
> So what way should I go.
> I came across a command
> qemu-img convert -c -f raw -O vmdk /dev/abcd/lvm4 /backup/lvm4.img
> 
> Will the above affect the lvm4.
> I do not want the VM running on original server to at all loose its
> any of the content but also have a vmdk file for each of the Guest OS
> which is running on kvm as mentioned above.
> What should I google exactly I am not clear with this part.
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 
> 
