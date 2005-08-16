Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j7GJecV17458
	for <linux-lvm@redhat.com>; Tue, 16 Aug 2005 15:40:38 -0400
Received: from web52201.mail.yahoo.com (web52201.mail.yahoo.com
	[206.190.48.124])
	by mx1.redhat.com (8.12.11/8.12.11) with SMTP id j7GJebZR023636
	for <linux-lvm@redhat.com>; Tue, 16 Aug 2005 15:40:37 -0400
Message-ID: <20050816194027.34305.qmail@web52201.mail.yahoo.com>
Date: Tue, 16 Aug 2005 12:40:27 -0700 (PDT)
From: <john_gore@yahoo.com>
Subject: Re: [linux-lvm] vg works fine under FC3, but not FC4
In-Reply-To: <20050816190423.GN29587@agk.surrey.redhat.com>
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="0-1085835760-1124221227=:32724"
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
To: LVM general discussion and development <linux-lvm@redhat.com>

--0-1085835760-1124221227=:32724
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit

Thanks, I guess the right way to do this is to use fdisk to remove partitions 1 and 5, then extend the lv to cover the whole disk, then use resize2fs or ext2resize to resize the filesystem
 
This seems preferrable to reverting to version 2.00 and maintaining an old version
 
Thanks, John

Alasdair G Kergon <agk@redhat.com> wrote:
On Tue, Aug 16, 2005 at 12:26:00AM -0700, john_gore@yahoo.com wrote:
> My vg mounts fine under fc3, but when i installed fc4 on a new drive, I cant bring in the vg. I get errors for hdc like "Couldn't find device with uuid..." and PV unknown device (from pvscan). 

Check for a bogus partition table.

If a device (e.g. /dev/hdd) is partitioned, you can't use /dev/hdd as the PV
but have to use one of its partitions instead e.g. /dev/hdd1.
If something like this happened, you need to remove the partition table.

Alasdair
-- 
agk@redhat.com

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://www.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

--0-1085835760-1124221227=:32724
Content-Type: text/html; charset=iso-8859-1
Content-Transfer-Encoding: 8bit

<DIV>Thanks, I guess the right way to do this is to use fdisk to remove partitions 1 and 5, then extend the lv to cover the whole disk, then use resize2fs or ext2resize to resize the filesystem</DIV>
<DIV>&nbsp;</DIV>
<DIV>This seems preferrable to&nbsp;reverting to version 2.00 and maintaining an old version</DIV>
<DIV>&nbsp;</DIV>
<DIV>Thanks, John<BR><BR><B><I>Alasdair G Kergon &lt;agk@redhat.com&gt;</I></B> wrote:</DIV>
<BLOCKQUOTE class=replbq style="PADDING-LEFT: 5px; MARGIN-LEFT: 5px; BORDER-LEFT: #1010ff 2px solid">On Tue, Aug 16, 2005 at 12:26:00AM -0700, john_gore@yahoo.com wrote:<BR>&gt; My vg mounts fine under fc3, but when i installed fc4 on a new drive, I cant bring in the vg. I get errors for hdc like "Couldn't find device with uuid..." and PV unknown device (from pvscan). <BR><BR>Check for a bogus partition table.<BR><BR>If a device (e.g. /dev/hdd) is partitioned, you can't use /dev/hdd as the PV<BR>but have to use one of its partitions instead e.g. /dev/hdd1.<BR>If something like this happened, you need to remove the partition table.<BR><BR>Alasdair<BR>-- <BR>agk@redhat.com<BR><BR>_______________________________________________<BR>linux-lvm mailing list<BR>linux-lvm@redhat.com<BR>https://www.redhat.com/mailman/listinfo/linux-lvm<BR>read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/<BR></BLOCKQUOTE>
--0-1085835760-1124221227=:32724--
