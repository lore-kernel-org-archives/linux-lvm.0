Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q5KFMpBg013843
	for <linux-lvm@redhat.com>; Wed, 20 Jun 2012 11:22:51 -0400
Received: from qmta09.westchester.pa.mail.comcast.net
	(qmta09.westchester.pa.mail.comcast.net [76.96.62.96])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q5KFMnmo005000
	for <linux-lvm@redhat.com>; Wed, 20 Jun 2012 11:22:50 -0400
Message-ID: <4FE1EAC9.3030105@mohawksoft.com>
Date: Wed, 20 Jun 2012 11:22:49 -0400
From: Mark Woodward <markw@mohawksoft.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Consistency groups
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

How would you create a consistent "group" of snapshots across multiple 
LVM volumes? For example, say that I have a database that spreads across 
multiple volumes. For "crash consistency" I need to create logically 
single snapshot across all the databases volumes.

Is there a way to do this?
