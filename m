Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k42BXJev007987
	for <linux-lvm@redhat.com>; Tue, 2 May 2006 07:33:19 -0400
Received: from smtp2.BelWue.DE (smtp2.belwue.de [129.143.2.15])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k42BXHVc028915
	for <linux-lvm@redhat.com>; Tue, 2 May 2006 07:33:18 -0400
Received: from scmx.science-computing.de (blackhole.science-computing.de
	[193.197.16.3]) by smtp2.BelWue.DE with ESMTP id k42BXHF1014279
	for <linux-lvm@redhat.com>; Tue, 2 May 2006 13:33:17 +0200 (MEST)
	env-from (O.Tennert@science-computing.de)
Received: from localhost (localhost [127.0.0.1])
	by scmx.science-computing.de (Postfix) with ESMTP id 238F91804504
	for <linux-lvm@redhat.com>; Tue,  2 May 2006 13:33:17 +0200 (CEST)
Received: from scmx.science-computing.de ([127.0.0.1])
	by localhost (guinesstest [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 11431-05 for <linux-lvm@redhat.com>;
	Tue, 2 May 2006 13:33:14 +0200 (CEST)
Received: from picard.science-computing.de (picard.science-computing.de
	[10.0.4.27])
	by scmx.science-computing.de (Postfix) with ESMTP id 580E5180494E
	for <linux-lvm@redhat.com>; Tue,  2 May 2006 13:33:14 +0200 (CEST)
From: Oliver Tennert <O.Tennert@science-computing.de>
Date: Tue, 2 May 2006 13:33:13 +0200
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200605021333.13986.tennert@science-computing.de>
Subject: [linux-lvm] Importing a VG with existing name
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
To: linux-lvm@redhat.com

Hello,

can anybody tell me what the best way is to import a volume group, when the 
vg's name already exists in the system?

Many Linux installations (like Fedora or RedHat) use default names for volume 
groups. Whenever the issue arises to access the VGs from another system, 
trying to imprt the VG leads to an inconsistent LVM database.

I failed to rename the still exported VG, which is already plugged into 
thethis leads to a wrong checksum.

So: what is the best solution?

Best regards

Oliver Tennert

-- 
Waiter: "Tea or coffee, gentlemen?"
1st customer: "I'll have tea."
2nd customer: "Me, too -- and be sure the glass is clean!"
	(Waiter exits, returns)
Waiter: "Two teas.  Which one asked for the clean glass?"
--
__
________________________________________creating IT solutions

Dr. Oliver Tennert
Senior Solutions Engineer
CAx Professional Services
                                        science + computing ag
phone   +49(0)7071 9457-598             Hagellocher Weg 71-75	
fax     +49(0)7071 9457-411             D-72070 Tuebingen, Germany
O.Tennert@science-computing.de          www.science-computing.de
