Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id lAKHurVE032635
	for <linux-lvm@redhat.com>; Tue, 20 Nov 2007 12:56:53 -0500
Received: from mailrelay02.solcon.nl (mailrelay02.solcon.nl [212.45.32.108])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id lAKHuMD9018945
	for <linux-lvm@redhat.com>; Tue, 20 Nov 2007 12:56:22 -0500
Subject: Re: [linux-lvm] LVM snapshots in a iSCSI and XenSource environment
From: "S. J. van Harmelen" <svh@dds.nl>
In-Reply-To: <20071120172910.GA26444@us.ibm.com>
References: <1195557183.6329.54.camel@sanderbal> <4742C6FA.6020006@wpkg.org>
	<1195561302.6329.73.camel@sanderbal> <4742DBE7.5080706@wpkg.org>
	<1195575140.10434.21.camel@sanderbal>
	<20071120172910.GA26444@us.ibm.com>
Date: Tue, 20 Nov 2007 18:56:18 +0100
Message-Id: <1195581378.10434.29.camel@sanderbal>
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

Well of course this could also be done from the Xen server. Then there
is no need for LVM on the storage server and the lv_storage part can be
left out of this picture.

I could then create a second iSCSI target on a second LUN to export to
the Xen server so that Xen can take snapshots to that second exported
disk. If a problem does occur, then a restore is simple because then I
could do a dd from the snapshot lv (on the Xen server) to the other lv
(also on the Xen server).

But how about network traffic on this one? Everything I do will go
across iSCSI so it will go over the network.

And then I will manually have to greate lv-snapshots for each virtual
machine instead of just one big lv-snapshot as I could do when
lv_storage exists.

Any thoughts?

> 
> > I can see the PV and LV's Xen created on lv_storage on the storage
> > server when I run pvs by the way...
> 
> Yes, you will see them but you want the storage server's LVM to NOT use
> them under normal conditions.
> 
> BTW, for backup, you may want snapshot-origin target rather than snapshot
> target directly..
