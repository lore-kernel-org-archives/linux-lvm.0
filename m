Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l8IL7icj013695
	for <linux-lvm@redhat.com>; Tue, 18 Sep 2007 17:07:44 -0400
Received: from e34.co.us.ibm.com (e34.co.us.ibm.com [32.97.110.152])
	by mx1.redhat.com (8.13.1/8.13.1) with ESMTP id l8IL7WtD032661
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK)
	for <linux-lvm@redhat.com>; Tue, 18 Sep 2007 17:07:33 -0400
Received: from d03relay02.boulder.ibm.com (d03relay02.boulder.ibm.com
	[9.17.195.227])
	by e34.co.us.ibm.com (8.13.8/8.13.8) with ESMTP id l8IL7P4M017796
	for <linux-lvm@redhat.com>; Tue, 18 Sep 2007 17:07:25 -0400
Received: from d03av03.boulder.ibm.com (d03av03.boulder.ibm.com [9.17.195.169])
	by d03relay02.boulder.ibm.com (8.13.8/8.13.8/NCO v8.5) with ESMTP id
	l8IL7OCw458350
	for <linux-lvm@redhat.com>; Tue, 18 Sep 2007 15:07:24 -0600
Received: from d03av03.boulder.ibm.com (loopback [127.0.0.1])
	by d03av03.boulder.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id
	l8IL7OUk030975
	for <linux-lvm@redhat.com>; Tue, 18 Sep 2007 15:07:24 -0600
Received: from malahal.beaverton.ibm.com (malahal.beaverton.ibm.com
	[9.47.17.130])
	by d03av03.boulder.ibm.com (8.12.11.20060308/8.12.11) with ESMTP id
	l8IL7OBV030950
	for <linux-lvm@redhat.com>; Tue, 18 Sep 2007 15:07:24 -0600
Date: Tue, 18 Sep 2007 14:07:23 -0700
From: malahal@us.ibm.com
Subject: Re: [linux-lvm] Resizing an ext3 file system after extending a
	logical volume group
Message-ID: <20070918210723.GA8224@us.ibm.com>
References: <78B3687E-533C-4AEF-BD23-7DA4E3308C40@uiuc.edu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <78B3687E-533C-4AEF-BD23-7DA4E3308C40@uiuc.edu>
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

Depending on your kernel, you may be able to resize a mounted ext3. Just
run resize2fs. It worked fine on my gentoo distro on a plain partition.

Thanks, Malahal.

Richard Kollmar [rkollmar@uiuc.edu] wrote:
>    Dear All:
>    I apologize if this has been asked before, but I can't find a way to
>    search the list archives:
>    How do you safely resize an ext3 filesystem after extending a logical
>    volume?
>    I am adding a new hard drive to increase the size of my logical volume
>    "home1" in logical volume group "home" with LVM2 under Ubuntu 6.10.1 LTS.*
>    The instructions*in the LVM Howto are pretty straightforward; the only
>    part that spooks me is the resizing of the ext3 filesystem.* This is what
>    I have done so far:
>            (installed new hardware & partitioned with fdisk; shows up as
>    /dev/sdb1)
>            (backed up the existing logical volume in case something bad
>    happens)
>            # pvcreate /dev/sdb1
>                    * Physical volume "/dev/sdb1" successfully created
>            # vgextend home /dev/sdb1
>                    * Volume group "home" successfully extended
>            # lvextend -l 357700 /dev/home/home1
>                    * Extending logical volume home1 to 1.36 TB
>                    * Logical volume home1 successfully resized
>    From what I googled, the next steps are a bit more involved for LVM2 than
>    the Howto lets on.* Does the following look o.k. to the experts:
>            ' use a root login, not su or sudo, because /home will be
>    unmounted
>            # umount*/dev/home/home1        ' the next steps should be done
>    off-line
>            # e2fsck -C 0 -v*dev/home/home1                 ' make sure the
>    file system is ok
>            #*tune2fs -O ^has_journal*/dev/home/home1       'disable
>    journaling on the logical volume
>            # resize2fs /dev/home/home1             'do the resizing
>            # e2fsck -C 0 -v*dev/home/home1                 ' make sure the
>    file system is still ok
>            #*tune2fs -O has_journal*/dev/home/home1                're-enable
>    journaling
>            # e2fsck -C 0 -v*dev/home/home1                 ' yes, I am a
>    first-timer and somewhat paranoid
>            # mount*/dev/home/home1 /home   ' back on-line
>    Thanks in advance for any help,
>    microscope

> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
