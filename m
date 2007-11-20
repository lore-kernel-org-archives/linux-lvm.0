Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id lAKHU7ei016444
	for <linux-lvm@redhat.com>; Tue, 20 Nov 2007 12:30:07 -0500
Received: from e1.ny.us.ibm.com (e1.ny.us.ibm.com [32.97.182.141])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id lAKHTRJE027918
	for <linux-lvm@redhat.com>; Tue, 20 Nov 2007 12:29:27 -0500
Received: from d01relay07.pok.ibm.com (d01relay07.pok.ibm.com [9.56.227.147])
	by e1.ny.us.ibm.com (8.13.8/8.13.8) with ESMTP id lAKHTMSG029483
	for <linux-lvm@redhat.com>; Tue, 20 Nov 2007 12:29:22 -0500
Received: from d03av01.boulder.ibm.com (d03av01.boulder.ibm.com [9.17.195.167])
	by d01relay07.pok.ibm.com (8.13.8/8.13.8/NCO v8.6) with ESMTP id
	lAKHTL121347814
	for <linux-lvm@redhat.com>; Tue, 20 Nov 2007 12:29:22 -0500
Received: from d03av01.boulder.ibm.com (loopback [127.0.0.1])
	by d03av01.boulder.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id
	lAKHTBNX027242
	for <linux-lvm@redhat.com>; Tue, 20 Nov 2007 10:29:11 -0700
Date: Tue, 20 Nov 2007 09:29:10 -0800
From: malahal@us.ibm.com
Subject: Re: [linux-lvm] LVM snapshots in a iSCSI and XenSource environment
Message-ID: <20071120172910.GA26444@us.ibm.com>
References: <1195557183.6329.54.camel@sanderbal> <4742C6FA.6020006@wpkg.org>
	<1195561302.6329.73.camel@sanderbal> <4742DBE7.5080706@wpkg.org>
	<1195575140.10434.21.camel@sanderbal>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1195575140.10434.21.camel@sanderbal>
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
Content-Transfer-Encoding: 7bit
To: "S. J. van Harmelen" <svh@dds.nl>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

S. J. van Harmelen [svh@dds.nl] wrote:
> 
> Now my thoughts where to take snapshots on the storage server. So that
> would mean I would take a snapshot of lv_storage. This should not be a
> problem. But what if virtual machine 2 crashes and has to be restored?
> 
> In that case I cannot restore lv_storage with a dd command, because then
> all the data will be restored (lv_virtualmachine1 and
> lv_virtualmachine2, because they are both on lv_storage). So is it
> possible to "restore" only lv_virtualmachine2 when I took a snapshot of
> lv_storage?

I see, it is possible but a bit cumbersome. You should be able to run
LVM on the storage server on the restored/old data (LVM on top of LVM??) and
get the data for the lv_virtualmachine2 from the storage server to
XenSource (ftp/tar whatever method). Then, restore that data (tar
extract) at XenSource.

If things are NOT changing at the XenSource LVM, you could just "dd" on
the crashed LV, but things may go really bad otherwise.

Any better method(s)???

> I can see the PV and LV's Xen created on lv_storage on the storage
> server when I run pvs by the way...

Yes, you will see them but you want the storage server's LVM to NOT use
them under normal conditions.

BTW, for backup, you may want snapshot-origin target rather than snapshot
target directly..
