Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j3Q38fO00551
	for <linux-lvm@redhat.com>; Mon, 25 Apr 2005 23:08:42 -0400
Received: from w3f.coventive.coms.coventive.com (202-145-53-92.adsl.ttn.net
	[202.145.53.92])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j3Q38cD1030216
	for <linux-lvm@redhat.com>; Mon, 25 Apr 2005 23:08:39 -0400
Received: from [192.168.20.46] (pc46.sa.coventive.com [192.168.20.46])
	by w3f.coventive.coms.coventive.com (8.11.6/8.11.6) with ESMTP id
	j3Q38RB13353
	for <linux-lvm@redhat.com>; Tue, 26 Apr 2005 11:08:30 +0800
Message-ID: <426DB214.4080009@coventive.com>
Date: Tue, 26 Apr 2005 11:14:28 +0800
From: Chung Hsien Hu <mozo@coventive.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] How to resize a PV partition
References: <d4dq72$an3$1@sea.gmane.org>
In-Reply-To: <d4dq72$an3$1@sea.gmane.org>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

I think the possible ways is:
1. Reduce the filesystem(resize2fs) to some minimal capacity a bit 
larger than the used size.
2. Do vgcfgbackup. Rename the backup file (for later use)
3. Recreate a smaller partition(larger than the filesystem capacity), 
and the new non-LVM
regular partition next to it.
4. Recreate an new PV on the partition(pvcreate -ff), and than create a 
VG with the orignal name.
5. Do vgcfgbackup again, use this PV information of Size and UUID to 
modify the old backup.
6. Restore LVM with the modified old backup file.

Erik Meitner wrote:

>Hello,
>I have a disk partition(type 0x8e) that is the single PV for the VG
>where my other partitions reside. I would like to recover the unused PEs
>from this PV and use them to create a non-LVM regular parition at the
>end of the disk. How do I:
>B) move used PEs from the 'end' of the PV so that it can be resized?
>A) resize the PV (previous messages suggest vgcfgbackup, edit backup
>file, vgcfgrestore)
>C) resize the type 0x8e partition?(parted won't do it)
>
>Thanks.
>
>_______________________________________________
>linux-lvm mailing list
>linux-lvm@redhat.com
>https://www.redhat.com/mailman/listinfo/linux-lvm
>read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
>  
>


-- 
Mozo Hu. mozo@coventive
R&D Assistant Manager, Coventive Advance Technologies
