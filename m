Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l29Nvw7u028253
	for <linux-lvm@redhat.com>; Fri, 9 Mar 2007 18:57:59 -0500
Received: from lx11.mdmiller.com (wsip-68-96-21-160.om.om.cox.net
	[68.96.21.160])
	by mx2.redhat.com (8.13.1/8.13.1) with ESMTP id l29Nvtdw023341
	for <linux-lvm@redhat.com>; Fri, 9 Mar 2007 18:57:55 -0500
Received: from [192.168.0.133] (wsip-68-96-21-155.om.om.cox.net [68.96.21.155])
	by lx11.mdmiller.com (Postfix) with ESMTP id 3C21C39D61E
	for <linux-lvm@redhat.com>; Fri,  9 Mar 2007 17:57:51 -0600 (CST)
Message-ID: <45F1F47C.3060602@mdmiller.com>
Date: Fri, 09 Mar 2007 17:57:48 -0600
From: Mitch Miller <mitch@mdmiller.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] LVM and Windows
References: <08A9A3213527A6428774900A80DBD8D8039FFEE3@xmb-sjc-222.amer.cisco.com>
In-Reply-To: <08A9A3213527A6428774900A80DBD8D8039FFEE3@xmb-sjc-222.amer.cisco.com>
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

Are you talking about accessing it via Samba?  Samba can share 
filesystems of any format (that I know of), and Windows can connect to 
Samba shares.

Does that answer your question?

-- Mitch


Lin Shen (lshen) wrote:

>If I format a FAT file system on top of a logic volume created by using
>LVM, will this be accessible from Windows? In other words, does Windows
>understand LVM?
>
>Lin
>
>_______________________________________________
>linux-lvm mailing list
>linux-lvm@redhat.com
>https://www.redhat.com/mailman/listinfo/linux-lvm
>read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
>  
>
