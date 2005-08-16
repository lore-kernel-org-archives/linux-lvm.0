Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j7GN9dV15326
	for <linux-lvm@redhat.com>; Tue, 16 Aug 2005 19:09:39 -0400
Received: from web52203.mail.yahoo.com (web52203.mail.yahoo.com
	[206.190.48.126])
	by mx3.redhat.com (8.13.1/8.13.1) with SMTP id j7GN9SZw016174
	for <linux-lvm@redhat.com>; Tue, 16 Aug 2005 19:09:28 -0400
Message-ID: <20050816230922.54275.qmail@web52203.mail.yahoo.com>
Date: Tue, 16 Aug 2005 16:09:22 -0700 (PDT)
From: <john_gore@yahoo.com>
Subject: Re: [linux-lvm] vg works fine under FC3, but not FC4
In-Reply-To: <20050816194210.GO29587@agk.surrey.redhat.com>
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="0-989369107-1124233762=:54161"
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

--0-989369107-1124233762=:54161
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit

Thanks - I now see a post you make last year and I think this is exactly the situation
Another cause of problems could be if people created a whole-disk PV 
on a device that actually held a partition table - i.e. they
ignored the partition table, even though the kernel would still be using it.

From 2.00.29, lvm2 tries to detect partitioned devices and stop you
using them directly as PVs unless you remove the partition table first.
(i.e. if it's partitioned, only the partitions can be PVs, not the whole
disk device)
 
I can remove the partition table, but dont I still have to do something with the sectors residing on the other partitions? If I delete the partition table, LVM would assume the entire disk is formatted the same, but there will still be sectors at the beginning and end that were left over from the boot and swap partitions.
 
Thanks, John

Alasdair G Kergon <agk@redhat.com> wrote:
No - I'm suggesting you need to check if any *whole device* PVs like hdd 
actually have partition tables on them, and if so, remove them.

Alasdair

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://www.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

--0-989369107-1124233762=:54161
Content-Type: text/html; charset=iso-8859-1
Content-Transfer-Encoding: 8bit

<DIV>Thanks - I now see a post you make last year and I think this is exactly the situation</DIV>
<BLOCKQUOTE dir=ltr style="MARGIN-RIGHT: 0px">
<DIV>Another cause of problems could be if people created a whole-disk PV <BR>on a device that actually held a partition table - i.e. they<BR>ignored the partition table, even though the kernel would still be using it.<BR><BR>&gt;From 2.00.29, lvm2 tries to detect partitioned devices and stop you<BR>using them directly as PVs unless you remove the partition table first.<BR>(i.e. if it's partitioned, only the partitions can be PVs, not the whole<BR>disk device)</DIV>
<DIV>&nbsp;</DIV></BLOCKQUOTE>
<DIV dir=ltr>I can remove the partition table, but dont I still have to do something with the sectors residing on the other partitions? If I delete the partition table, LVM would assume the entire disk is formatted the same, but there will still be sectors at the beginning and end that were left over from the boot and swap partitions.</DIV>
<DIV dir=ltr>&nbsp;</DIV>
<DIV dir=ltr>Thanks, John</DIV>
<DIV dir=ltr><BR><B><I>Alasdair G Kergon &lt;agk@redhat.com&gt;</I></B> wrote:</DIV>
<BLOCKQUOTE class=replbq style="PADDING-LEFT: 5px; MARGIN-LEFT: 5px; BORDER-LEFT: #1010ff 2px solid">No - I'm suggesting you need to check if any *whole device* PVs like hdd <BR>actually have partition tables on them, and if so, remove them.<BR><BR>Alasdair<BR><BR>_______________________________________________<BR>linux-lvm mailing list<BR>linux-lvm@redhat.com<BR>https://www.redhat.com/mailman/listinfo/linux-lvm<BR>read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/<BR></BLOCKQUOTE>
--0-989369107-1124233762=:54161--
