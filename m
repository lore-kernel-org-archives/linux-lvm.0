Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i3Q1F8v25958
	for <linux-lvm@redhat.com>; Sun, 25 Apr 2004 21:15:08 -0400
Received: from gw.mml.usyd.edu.au (client-101.mml.usyd.edu.au [129.78.188.101])
	by mx1.redhat.com (8.12.10/8.12.10) with ESMTP id i3Q1F6KG026446
	for <linux-lvm@redhat.com>; Sun, 25 Apr 2004 21:15:07 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
	by gw.mml.usyd.edu.au (Postfix) with ESMTP id 285164988
	for <linux-lvm@redhat.com>; Mon, 26 Apr 2004 11:14:52 +1000 (EST)
Received: from gw.mml.usyd.edu.au ([127.0.0.1])
	by localhost (gw.mml.usyd.edu.au [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 24874-04 for <linux-lvm@redhat.com>;
	Mon, 26 Apr 2004 11:14:51 +1000 (EST)
Received: from prog.mml.usyd.edu.au (prog.mml.usyd.edu.au [192.168.1.3])
	by gw.mml.usyd.edu.au (Postfix) with ESMTP id A223B4985
	for <linux-lvm@redhat.com>; Mon, 26 Apr 2004 11:14:51 +1000 (EST)
Date: Mon, 26 Apr 2004 11:14:51 +1000
From: Franc Carter <franc@mml.usyd.edu.au>
Subject: Re: [linux-lvm] LVM and multiple HBA ports
Message-ID: <20040426011451.GA12705@prog.mml.usyd.edu.au>
References: <2F75AEE4E86FDE44BF97709D289BAA7C719752@vega.voltaire.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2F75AEE4E86FDE44BF97709D289BAA7C719752@vega.voltaire.com>
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>



They way I have handled this is to use an md multipath device to combine the
two luns that are seen in to one md device, and then put lvm on top of
that.

Seems to work well - however testing 'real' failures rather than capable
pulling is somewhat more difficult/risky

On Wed, Apr 21, 2004 at 07:04:13PM +0300, Dan Bar Dov wrote:
> I have a problem using two (or more) ports connected to the same storage.
> 
> Linux does not identify that the two LUNs it discovers is actually the same.
> When I create a PV all is well. 
> The PV gets created and is ACTIVE. However, through the other port, the PV
> is also discovered, but is marked INACTIVE in the LVM database.
> 
> When I try to create a VG using the active path, LVM scans all PVs in order.
> If it finds the INACTIVE instance first, the VG creation fails.
> 
> I'm using LVM 1.0.3, please let mw know if such a situation (connecting
> storage through multiple ports) is handled better in another version, or
> suggest how to overcome the problem.
> 
> Thanks,
> Dan
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

-- 
Franc Carter     Ph:61-2-8374-5071      Fax: 61-2-8374-5070
Systems Manager, SIRCA Ltd              http://www.sirca.org.au/

DISCLAIMER: The contents of this email, inclusive of attachments, may
be legally privileged and confidential. Any unauthorised use of the
contents is expressly prohibited. If you have received this message in
error or are not the intended recipient, you should destroy the email
message along with any attachment(s).  Unintended recipients of this
email are prohibited from retaining, disclosing, distributing or using
any information contained herein.  This email is also subject to
copyright. No part of it should be reproduced, adapted or transmitted
without the written consent of the copyright owner.
