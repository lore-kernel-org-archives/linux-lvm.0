Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m188Upnn016763
	for <linux-lvm@redhat.com>; Fri, 8 Feb 2008 03:30:51 -0500
Received: from septimus.inrp.fr (septimus.inrp.fr [193.51.247.28])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id m188UJwg017178
	for <linux-lvm@redhat.com>; Fri, 8 Feb 2008 03:30:19 -0500
Received: from septimus.inrp.fr (septimus.inrp.fr [127.0.0.1])
	by localhost.septimus.inrp.fr (Postfix) with ESMTP id A7A52E3242
	for <linux-lvm@redhat.com>; Fri,  8 Feb 2008 09:30:16 +0100 (CET)
Received: from valerian.inrp.fr (valerian.inrp.fr [195.83.134.122])
	by septimus.inrp.fr (Postfix) with ESMTP id 7272EE323C
	for <linux-lvm@redhat.com>; Fri,  8 Feb 2008 09:30:16 +0100 (CET)
Received: from localhost (localhost.localdomain [127.0.0.1])
	by valerian.inrp.fr (Postfix) with ESMTP id 5B1CB2BFDC
	for <linux-lvm@redhat.com>; Fri,  8 Feb 2008 09:30:16 +0100 (CET)
Received: from valerian.inrp.fr ([127.0.0.1])
	by localhost (valerian [127.0.0.1]) (amavisd-new, port 10024) with ESMTP
	id 16522-01 for <linux-lvm@redhat.com>;
	Fri,  8 Feb 2008 09:30:15 +0100 (CET)
Received: from [195.83.134.19] (SCI004.inrp.fr [195.83.134.19])
	by valerian.inrp.fr (Postfix) with ESMTP id 6579D2BEAD
	for <linux-lvm@redhat.com>; Fri,  8 Feb 2008 09:30:15 +0100 (CET)
Message-ID: <47AC1317.8050708@gmail.com>
Date: Fri, 08 Feb 2008 09:30:15 +0100
From: Thomas Bellembois <thomas.bellembois@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] LVM snapshot and Plone data FS
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

I am new to the list and I have a question about LVM snapshot.
We have a Zope/Plone server running with its database stored on a LVM
volume (actually this is a uge file used as a database (with transactions)).

I would like to know if it is possible to snapshot/restore the LVM
volume while the server is running ? What about transactions ?

I have googled the question about mysql databases but it was not always
mentionned that the server has to be stopped.

Any idea ?

Regards.

Thomas
