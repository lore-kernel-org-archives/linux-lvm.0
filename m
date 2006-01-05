Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id k050lr127016
	for <linux-lvm@redhat.com>; Wed, 4 Jan 2006 19:47:54 -0500
Received: from percy.comedia.it (percy.comedia.it [212.97.59.71])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k050llaP004531
	for <linux-lvm@redhat.com>; Wed, 4 Jan 2006 19:47:48 -0500
Date: Thu, 5 Jan 2006 01:47:40 +0100
From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] How can I expand a physical volume ?
Message-ID: <20060105004740.GC12397@percy.comedia.it>
References: <43B39A85.7060107@email.it>
	<20051229214451.GB6629@percy.comedia.it>
	<43BBA500.7040205@email.it>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <43BBA500.7040205@email.it>
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
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Wed, Jan 04, 2006 at 11:35:44AM +0100, Massimiliano wrote:
>Luca Berra ha scritto:
>
>>On Thu, Dec 29, 2005 at 09:12:53AM +0100, Massimiliano wrote:
>>
>>>Hi !
>>
>>
>>two ways, either create a new partition with the free space,
>>pvcreate it and vgextend your volume group
>>or
>>edit your partition table and make the 2nd partition bigger.
>>(you might need to reboot here)
>>then
>
>Did what you suggested (following the first solution) . Now vgdisplay 
....
>How can I Allocate now the Free PE /Size ? The filesystem available 
>space is still 135 GB...

lvextend to increas the size of the logical volume,

then, the tool to resize whatever filesystem you have on that
resize2fs/ext2resize/ext2online (EXT2/EXT3)
resize_reiserfs/mount -o remount,resize (REISER)
xfs_growfs (XFS)
mount -o remount,resize (JFS)
.....


-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
