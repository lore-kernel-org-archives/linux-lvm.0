Received: from [10.33.0.40] (breeves.fab.redhat.com [10.33.0.40])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id nA3H8BVu017903
	for <linux-lvm@redhat.com>; Tue, 3 Nov 2009 12:08:12 -0500
Subject: Re: [linux-lvm] Re: error creating snapshots
From: "Bryn M. Reeves" <bmr@redhat.com>
In-Reply-To: <Pine.LNX.4.64.0911031147050.30149@bmsred.bmsi.com>
References: <Pine.LNX.4.64.0911022226110.26129@bmsred.bmsi.com>
	<20091103141626.GA15344@redhat.com>
	<Pine.LNX.4.64.0911031147050.30149@bmsred.bmsi.com>
Date: Tue, 03 Nov 2009 17:17:52 +0000
Message-Id: <1257268672.6488.145.camel@breeves.fab.redhat.com>
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
To: LVM general discussion and development <linux-lvm@redhat.com>

On Tue, 2009-11-03 at 11:48 -0500, Stuart D. Gathman wrote:
> On Tue, 3 Nov 2009, Mike Snitzer wrote:
> 
> > > # lvcreate -s -L20G -n dmm_snap bms_data/dmm
> > >   bms_data-dmm_snap: event registration failed: 10071:3 
> > > libdevmapper-event-lvm2snapshot.so dlopen failed: 
> > > /usr/lib64/liblvm2cmd.so.2.02: undefined symbol: dm_list_empty
> > >   bms_data/snapshot0: snapshot segment monitoring function failed.
> > >   Logical volume "dmm_snap" created
> > 
> > This is harmless but it does mean that dmeventd-based snapshot
> > usage monitoring is not currently enabled for this snapshot.
> > 
> > But if you restart dmeventd (kill the process and it'll restart next
> > time you activate the snapshot) it should work.
> 
> How can restarting a daemon make a library symbol suddenly become defined?
> Isn't this a library issue?
> 

If the daemon has been running since before the package update it will
still use the old binary/library images. Killing and re-starting it will
force it to use the newly updated versions.

Regards,
Bryn.
