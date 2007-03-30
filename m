Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l2UG3foU032453
	for <linux-lvm@redhat.com>; Fri, 30 Mar 2007 12:03:41 -0400
Received: from vadmzmailmx02.bankofamerica.com (vamx02.bankofamerica.com
	[171.159.192.79])
	by mx1.redhat.com (8.13.1/8.13.1) with ESMTP id l2UG3YQt014150
	for <linux-lvm@redhat.com>; Fri, 30 Mar 2007 12:03:34 -0400
Received: from vadmzmailmx03.bankofamerica.com ([171.182.200.79])
	by vadmzmailmx02.bankofamerica.com (8.13.6/8.13.6) with ESMTP id
	l2UG3Rxq030808
	for <linux-lvm@redhat.com>; Fri, 30 Mar 2007 16:03:30 GMT
Received: from memvampra01.bankofamerica.com (memvampra01.bankofamerica.com
	[171.177.171.57])
	by vadmzmailmx03.bankofamerica.com (8.13.6/8.13.6) with ESMTP id
	l2UG3Rdv015047
	for <linux-lvm@redhat.com>; Fri, 30 Mar 2007 16:03:27 GMT
Received: from memmta0301.bankofamerica.com (memmta0301.bankofamerica.com
	[171.186.140.73])
	by memvampra01.bankofamerica.com (8.13.6/8.13.6) with ESMTP id
	l2UG3RGl027800
	for <linux-lvm@redhat.com>; Fri, 30 Mar 2007 16:03:27 GMT
Date: Fri, 30 Mar 2007 12:03:27 -0400
From: "Brown, Rodrick R" <rodrick.r.brown@bofasecurities.com>
Message-id: <5F4277955102E74E8EE270AA4F0C2AD303443A8C@ex2k.bankofamerica.com>
MIME-version: 1.0
Content-transfer-encoding: 7BIT
Content-class: urn:content-classes:message
Subject: [linux-lvm] Pv in unavailable state
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

I have a newly create emc powerpath filesystem that fails to mount
because the pv is in an "unavailable" state after the reboot. 

This caused the server to boot to the normal/maint boot window.
Anyone know of steps I could use to address the following issue thanks. 

 ___
{o,o} Rodrick R. Brown
|)__)	UNIX Platform Operations (SME)
-"-"-	Banc of America Securities LLC.
ORLY? Global Trading Infrastructure (GCIB)
100 West 33rd ST. 3rd Flr. 
New York, NY 10001
Mail Code: NY1-509-03-18
Office: 646 733 4473
Cell: 646-261-5286
 
