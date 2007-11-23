Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id lAN8Rg2X020912
	for <linux-lvm@redhat.com>; Fri, 23 Nov 2007 03:27:42 -0500
Received: from mailrelay01.solcon.nl (mailrelay01.solcon.nl [212.45.32.107])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id lAN8RBxu007513
	for <linux-lvm@redhat.com>; Fri, 23 Nov 2007 03:27:12 -0500
Subject: Re: [linux-lvm] LVM snapshots in a iSCSI and XenSource environment
From: "S. J. van Harmelen" <svh@dds.nl>
In-Reply-To: <20071120172910.GA26444@us.ibm.com>
References: <1195557183.6329.54.camel@sanderbal> <4742C6FA.6020006@wpkg.org>
	<1195561302.6329.73.camel@sanderbal> <4742DBE7.5080706@wpkg.org>
	<1195575140.10434.21.camel@sanderbal>
	<20071120172910.GA26444@us.ibm.com>
Date: Fri, 23 Nov 2007 09:27:06 +0100
Message-Id: <1195806426.5874.4.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
To: malahal@us.ibm.com
Cc: LVM general discussion and development <linux-lvm@redhat.com>


On Tue, 2007-11-20 at 09:29 -0800, malahal@us.ibm.com wrote:
> S. J. van Harmelen [svh@dds.nl] wrote:
> > 
> > Now my thoughts where to take snapshots on the storage server. So that
> > would mean I would take a snapshot of lv_storage. This should not be a
> > problem. But what if virtual machine 2 crashes and has to be restored?
> > 
> > In that case I cannot restore lv_storage with a dd command, because then
> > all the data will be restored (lv_virtualmachine1 and
> > lv_virtualmachine2, because they are both on lv_storage). So is it
> > possible to "restore" only lv_virtualmachine2 when I took a snapshot of
> > lv_storage?
> 
> I see, it is possible but a bit cumbersome. You should be able to run
> LVM on the storage server on the restored/old data (LVM on top of LVM??) and
> get the data for the lv_virtualmachine2 from the storage server to
> XenSource (ftp/tar whatever method). Then, restore that data (tar
> extract) at XenSource.
> 
> If things are NOT changing at the XenSource LVM, you could just "dd" on
> the crashed LV, but things may go really bad otherwise.
> 
> Any better method(s)???

Would it also work when I create lv_storage, take a snapshot of it and
then when I need to restore a virtual machine I tempararly export the
snapshot true iSCSI to the Xen server.

Then on the Xen server I should see the PV and LV's Xen created both on
the real iSCSI exported disk, as the exported snapshot from the storage
server. So then I should be able to do a dd from one lv to the other,
right?

> 
> > I can see the PV and LV's Xen created on lv_storage on the storage
> > server when I run pvs by the way...
> 
> Yes, you will see them but you want the storage server's LVM to NOT use
> them under normal conditions.
> 
> BTW, for backup, you may want snapshot-origin target rather than snapshot
> target directly..
