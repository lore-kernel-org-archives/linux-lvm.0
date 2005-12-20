Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id jBKMcx131238
	for <linux-lvm@redhat.com>; Tue, 20 Dec 2005 17:38:59 -0500
Received: from shell.wgops.com (postfix@free.wgops.com [69.51.116.66])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id jBKMcrpx014188
	for <linux-lvm@redhat.com>; Tue, 20 Dec 2005 17:38:53 -0500
Received: from d216-220-25-20.dynip.modwest.com (localhost [127.0.0.1])
	by shell.wgops.com (Postfix) with ESMTP id A937724FB1
	for <linux-lvm@redhat.com>; Tue, 20 Dec 2005 15:38:21 -0700 (MST)
Date: Tue, 20 Dec 2005 15:38:19 -0700
From: Michael Loftis <mloftis@wgops.com>
Subject: Re: [linux-lvm] Recovery of data in LVM from a corrupt disk
Message-ID: <AED6CFAFF9F260323C3E5890@d216-220-25-20.dynip.modwest.com>
In-Reply-To: <20051220220301.2309.qmail@web80902.mail.scd.yahoo.com>
References: <20051220220301.2309.qmail@web80902.mail.scd.yahoo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
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



--On December 20, 2005 2:03:01 PM -0800 mymail mymail 
<internetbizmail@yahoo.com> wrote:

>
> I have a FC3 system with two disks. The first (/dev/hda) is a new disk on
> which I have a rebuilt system which has a new LVM installed. The other
> disk (/dev/hdc) is the system disk that failed. As I couldn't get hdc to
> boot, my intention is to access hdc by mounting it on the hda system to
> copy data around, or try other ways to recover what's on there. However
> whenever I try
>
>    # mount /dev/hdc2 /mnt
>    FAT: invalid media value (0x8e)
>    mount: you must specify the filesystem type
>
> I get filesystem not found errors. The filesystem type according to fdisk
> is 8e (LVM), but can I get at the data that's on there and then copy that?
>
> Any hints on how to recover this would be appreciated. I can find loads
> of info on LVM a! nd how it works, which is great when you have a working
> system, but not so good when it's corrupt!
>
> Any help on how to do backups and the best procedure to follow in the
> event of another disaster will also be useful -- there is nothing in the
> FAQs, etc I've seen on this.

LVM is not a filesystem, it's a block device layer.  If you're 
running/using LVM on the existing system it's vgscan and vgchange on 
startup should have activated all the old LVs/VGs and mapped them to 
/dev/VGNAME/LVNAME -- those are the devices you mount.
