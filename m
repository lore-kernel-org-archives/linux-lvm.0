Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j9SH0AV15710
	for <linux-lvm@redhat.com>; Fri, 28 Oct 2005 13:00:10 -0400
Received: from volumehost.com
	(IDENT:VKR9qDr5sm/2j+1evhnh+VUC+WeNYBLh@adsl-69-154-123-201.dsl.fyvlar.swbell.net
	[69.154.123.201])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j9SH04NV010543
	for <linux-lvm@redhat.com>; Fri, 28 Oct 2005 13:00:08 -0400
Received: from volumehost.com (localhost.localdomain [127.0.0.1])
	by volumehost.com (8.12.8/8.12.5) with ESMTP id j9SGxvUN007962
	for <linux-lvm@redhat.com>; Fri, 28 Oct 2005 11:59:57 -0500
Received: (from apache@localhost)
	by volumehost.com (8.12.8/8.12.8/Submit) id j9SGxuxx007960
	for linux-lvm@redhat.com; Fri, 28 Oct 2005 11:59:56 -0500
Message-ID: <1130518796.4362590c75cf0@webmail.volumehost.com>
Date: Fri, 28 Oct 2005 11:59:56 -0500
From: Zac Slade <krakrjak@volumehost.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] pvresize patch pending
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


A friend and I have been working on a patch to provide pvresize to the lvm2
distribution.  We have a working version now and are looking for some code
review/testing.  Currently it only supports growing a pv and it only supports
growing it to the actual size of the device that backs the pv.

Is this the right venue to distribute this patch or is there another way that it
should be disseminated?

Thank you,
Zac Slade
krakrjak@volumehost.com

-------------------------------------------------
This mail sent through IMP: http://horde.org/imp/
