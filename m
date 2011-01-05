Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.13])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id p05Kvud1022184
	for <linux-lvm@redhat.com>; Wed, 5 Jan 2011 15:57:56 -0500
Received: from ps536.phatservers.com (ps536.phatservers.com [216.17.105.202])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id p05Kvlkt006947
	for <linux-lvm@redhat.com>; Wed, 5 Jan 2011 15:57:48 -0500
Received: from r74-192-2-154.bcstcmta01.clsttx.tl.dh.suddenlink.net
	([74.192.2.154] helo=raydesk1.bettercgi.com)
	by ps536.phatservers.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.66) (envelope-from <support@bettercgi.com>)
	id 1PaaMQ-0000db-MY
	for linux-lvm@redhat.com; Wed, 05 Jan 2011 12:54:43 -0800
Date: Wed, 05 Jan 2011 14:53:33 -0600
From: Ray Morris <support@bettercgi.com>
References: <201101051848.55092.roberto.sassu@polito.it>
In-Reply-To: <201101051848.55092.roberto.sassu@polito.it> (from
	roberto.sassu@polito.it on Wed Jan  5 11:48:54 2011)
Message-Id: <1294260813.2185.35@raydesk1.bettercgi.com>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] LVM over iSCSI
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

What says lvscan -vv ?
--
Ray Morris
support@bettercgi.com

Strongbox - The next generation in site security:
http://www.bettercgi.com/strongbox/

Throttlebox - Intelligent Bandwidth Control
http://www.bettercgi.com/throttlebox/

Strongbox / Throttlebox affiliate program:
http://www.bettercgi.com/affiliates/user/register.php


On 01/05/2011 11:48:54 AM, Roberto Sassu wrote:
> Hi all
> 
> i configured a LVM volume group using two iSCSI devices as
> physical volumes.
> I designed one node (A) to create snapshots of a Logical Volume,
> called 'lv_origin' and i want other nodes (B, C) access them
> exclusively.
> I assume that 'lv_origin' is never modified after the first snapshot
> is created.
> So, A first creates 'lv_origin' and then a snapshot called
> 'lv_snap1', which is available for this node.
> The node B executes the command 'vgscan' and 'vgchange -ay'.
> In this way, 'lv_origin' and 'lv_snap1' become available for B.
> Next step, A creates a new snapshot of 'lv_origin' called
> 'lv_snap2'. This is not available for B and the only way that i
> found to use it is to perform (on the node B) the following
> commands:
> 
> 1) vgscan
> 2) vgchange -an
> 3) vgchange -ay
> 
> However this procedure is not applicable if one of created
> LVs is in use. How to solve this issue?
> 
> Thanks in advance for replies
> 
> Roberto Sassu
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 
> 
