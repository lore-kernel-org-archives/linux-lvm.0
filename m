Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j4JErgO15636
	for <linux-lvm@redhat.com>; Thu, 19 May 2005 10:53:42 -0400
Received: from breemxgw3s01.ras (relay1.rasnet.it [213.156.34.249])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j4JEra0A008558
	for <linux-lvm@redhat.com>; Thu, 19 May 2005 10:53:36 -0400
Content-class: urn:content-classes:message
MIME-Version: 1.0
Subject: RE: [linux-lvm] same LV UUID after vgmerge
Date: Thu, 19 May 2005 16:53:35 +0200
Message-ID: <BFCF159FFD14F444B205968F32DBD5BB01700409@MAILEX01.rasgroup.ita.localnet>
From: "Magni Fabrizio" <Fabrizio.Magni@rasnet.it>
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


> > Is it safe to edit the UUID by hand?
>  
> Yes, as long as the LVs are not active (the vgchange -an step).
> 
> I've reproduced the bug here.
> 

Tried again and obtained the same result.

Switched to change the LV UUID manually and everything worked.

Even oracle could be opened on the newly-merged volume group.

Thanks
Fabrizio
