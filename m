Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i4G8bY004831
	for <linux-lvm@redhat.com>; Sun, 16 May 2004 04:37:34 -0400
Received: from outmta-1.esr.lvcm.net (outmta-1.esr.lvcm.net [24.234.0.14])
	by mx3.redhat.com (8.12.10/8.12.10) with ESMTP id i4G8bS8K024679
	for <linux-lvm@redhat.com>; Sun, 16 May 2004 04:37:29 -0400
Received: from localhost (localhost [127.0.0.1])
	by outmta-1.esr.lvcm.net (Postfix) with ESMTP id D73A824049
	for <linux-lvm@redhat.com>; Sun, 16 May 2004 01:38:54 -0700 (PDT)
Received: from outmta-1.esr.lvcm.net ([127.0.0.1])
	by localhost (outmta-1.esr.lvcm.net [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id 17566-12 for <linux-lvm@redhat.com>;
	Sun, 16 May 2004 01:38:54 -0700 (PDT)
Received: from mlug.missouri.edu (ip68-104-28-32.lv.lv.cox.net [68.104.28.32])
	by outmta-1.esr.lvcm.net (Postfix) with ESMTP id 808BE24012
	for <linux-lvm@redhat.com>; Sun, 16 May 2004 01:38:54 -0700 (PDT)
Message-ID: <40A72846.5050801@mlug.missouri.edu>
Date: Sun, 16 May 2004 01:37:26 -0700
From: Michael <mogmios@mlug.missouri.edu>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] /boot on lvm?
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Is it okay to put everything, including /boot and other critical Linux 
files on an LVM drive? How about swap space?
