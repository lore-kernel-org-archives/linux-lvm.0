Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l5EJpAKb021140
	for <linux-lvm@redhat.com>; Thu, 14 Jun 2007 15:51:10 -0400
Received: from HOUMAIL003.halliburton.com (houmail003.halliburton.com
	[34.254.16.15])
	by mx1.redhat.com (8.13.1/8.13.1) with ESMTP id l5EJp6ap011075
	for <linux-lvm@redhat.com>; Thu, 14 Jun 2007 15:51:07 -0400
Received: from HOUEXGR001.corp.halliburton.com
	(houexgr001.corp.halliburton.com [34.224.35.122])
	by HOUMAIL003.corp.halliburton.com (8.13.7/8.13.7) with ESMTP id
	l5EJpUBD024057
	for <linux-lvm@redhat.com>; Thu, 14 Jun 2007 14:52:57 -0500
Content-class: urn:content-classes:message
MIME-Version: 1.0
Subject: RE: [linux-lvm] lvextend problem
Date: Thu, 14 Jun 2007 14:50:04 -0500
Message-ID: <3FA34846740FF448A01F5B48A52C014F03DB5138@HOUEXCH078.corp.halliburton.com>
In-Reply-To: <20070614190147.GK18457@agk.fab.redhat.com>
References: <3FA34846740FF448A01F5B48A52C014F03DB50AB@HOUEXCH078.corp.halliburton.com>
	<20070614190147.GK18457@agk.fab.redhat.com>
From: "Nikolay Yevik" <Nikolay.Yevik@Halliburton.com>
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
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

Thanks,

I updated to lvm2-2.02.13-10.2 (this is on OpenSUSE 10.2) and the
problem went away.


-----Original Message-----
From: linux-lvm-bounces@redhat.com [mailto:linux-lvm-bounces@redhat.com]
On Behalf Of Alasdair G Kergon
Sent: Thursday, June 14, 2007 2:02 PM
To: LVM general discussion and development
Subject: Re: [linux-lvm] lvextend problem

On Thu, Jun 14, 2007 at 01:08:30PM -0500, Nikolay Yevik wrote:
>   LVM version:     2.02.13 (2006-10-27)
 
Upgrade.  There was a bug causing this (only) in 2.02.13.

Alasdair
-- 
agk@redhat.com

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://www.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

----------------------------------------------------------------------
This e-mail, including any attached files, may contain confidential and privileged information for the sole use of the intended recipient.  Any review, use, distribution, or disclosure by others is strictly prohibited.  If you are not the intended recipient (or authorized to receive information for the intended recipient), please contact the sender by reply e-mail and delete all copies of this message.
