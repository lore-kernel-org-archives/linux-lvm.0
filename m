Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.13])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o4RDruPd006701
	for <linux-lvm@redhat.com>; Thu, 27 May 2010 09:53:56 -0400
Received: from relay.ihostexchange.net (relay.ihostexchange.net [66.46.182.58])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o4RDrcAp006285
	for <linux-lvm@redhat.com>; Thu, 27 May 2010 09:53:41 -0400
From: Mikhail Malamud <mmalamud@freedomoss.com>
Date: Thu, 27 May 2010 09:53:27 -0400
Message-ID: <2ADD0684-F8F0-46E4-88CC-32FA375AE24D@freedomoss.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] changed block for snapshots
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
To: "linux-lvm@redhat.com" <linux-lvm@redhat.com>


I am trying to understand how snapshots work but I guess I am stuck on what consitutes a changed block. A block that written to, even with the same data as before. Or block what actually has modified data. What method does LVM use to decide whether block has been changed or not. 



Thanks
