Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.12])
	by int-mx04.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id nA3Gmovu031466
	for <linux-lvm@redhat.com>; Tue, 3 Nov 2009 11:48:50 -0500
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id nA3GmeZ9006458
	for <linux-lvm@redhat.com>; Tue, 3 Nov 2009 11:48:41 -0500
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.14.3/8.14.3) with ESMTP id nA3GmO8N026332
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Tue, 3 Nov 2009 11:48:40 -0500
Received: from localhost (localhost.localdomain [127.0.0.1])
	by bmsred.bmsi.com (8.14.3/8.14.3) with ESMTP id nA3GmO5D030188
	for <linux-lvm@redhat.com>; Tue, 3 Nov 2009 11:48:24 -0500
Date: Tue, 3 Nov 2009 11:48:24 -0500 (EST)
From: "Stuart D. Gathman" <stuart@bmsi.com>
Subject: Re: [linux-lvm] Re: error creating snapshots
In-Reply-To: <20091103141626.GA15344@redhat.com>
Message-ID: <Pine.LNX.4.64.0911031147050.30149@bmsred.bmsi.com>
References: <Pine.LNX.4.64.0911022226110.26129@bmsred.bmsi.com>
	<20091103141626.GA15344@redhat.com>
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

On Tue, 3 Nov 2009, Mike Snitzer wrote:

> > # lvcreate -s -L20G -n dmm_snap bms_data/dmm
> >   bms_data-dmm_snap: event registration failed: 10071:3 
> > libdevmapper-event-lvm2snapshot.so dlopen failed: 
> > /usr/lib64/liblvm2cmd.so.2.02: undefined symbol: dm_list_empty
> >   bms_data/snapshot0: snapshot segment monitoring function failed.
> >   Logical volume "dmm_snap" created
> 
> This is harmless but it does mean that dmeventd-based snapshot
> usage monitoring is not currently enabled for this snapshot.
> 
> But if you restart dmeventd (kill the process and it'll restart next
> time you activate the snapshot) it should work.

How can restarting a daemon make a library symbol suddenly become defined?
Isn't this a library issue?

-- 
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
