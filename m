Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m510gPIl026972
	for <linux-lvm@redhat.com>; Sat, 31 May 2008 20:42:25 -0400
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m510gFCF012670
	for <linux-lvm@redhat.com>; Sat, 31 May 2008 20:42:15 -0400
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.13.6/8.13.6) with ESMTP id m510g93n012755
	for <linux-lvm@redhat.com>; Sat, 31 May 2008 20:42:09 -0400
Received: from localhost (localhost [127.0.0.1])
	by bmsred.bmsi.com (8.13.5/8.13.6) with ESMTP id m510g9ZS015270
	for <linux-lvm@redhat.com>; Sat, 31 May 2008 20:42:09 -0400
Date: Sat, 31 May 2008 20:42:09 -0400 (EDT)
From: "Stuart D. Gathman" <stuart@bmsi.com>
Subject: Re: [linux-lvm] Distributed LVM/filesystem/storage
In-Reply-To: <20080531070328.GD19431@lug-owl.de>
Message-ID: <Pine.LNX.4.44.0805312039360.15217-100000@bmsred.bmsi.com>
MIME-Version: 1.0
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Sat, 31 May 2008, Jan-Benedict Glaw wrote:

> GFS (or GFS2 fwiw) imposes a single, shared storage as its backend. At
> least I get that from reading the documentation. This would result in
> merging all the single disks via NBD/LVM to one machine first and
> export that merged volume back via NBD/iSCSI to the nodes. In case the
> actual data is local to a client, it would still be first send to the
> central machine (running LVM) and loaded back from there. Not as
> distributed as I hoped, or are there other configuration possibilities
> to not go that route?

Any possible scheme combining disks over the network is going to
send the data over the network twice.  The solution is simple -
put the low level disk traffic on its own network.  Consider it
a long distance SCSI bus.  If you think about it, normal NFS disk traffic
goes over a "network" twice also.  Once over the ethernet, and again
over the IDE/SCSI/SATA "network".

-- 
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
