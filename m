Received: from localhost (dhcp-100-19-150.bos.redhat.com [10.16.19.150])
	by int-mx05.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id nA3EGRxG017119
	for <linux-lvm@redhat.com>; Tue, 3 Nov 2009 09:16:27 -0500
Date: Tue, 3 Nov 2009 09:16:26 -0500
From: Mike Snitzer <snitzer@redhat.com>
Message-ID: <20091103141626.GA15344@redhat.com>
References: <Pine.LNX.4.64.0911022226110.26129@bmsred.bmsi.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.64.0911022226110.26129@bmsred.bmsi.com>
Subject: [linux-lvm] Re: error creating snapshots
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
To: LVM general discussion and development <linux-lvm@redhat.com>

On Mon, Nov 02 2009 at 10:35pm -0500,
Stuart D. Gathman <stuart@bmsi.com> wrote:

> Is this a harmless error having to do with some misreported option to notify a
> user process when the snapshot is almost full?  Or should I switch backups over
> to network based because this means LVM might corrupt data?
> 
> CentOS-5.4
> 
> # uname -a
> Linux xerces.jsconnor.com 2.6.18-164.el5xen #1 SMP Thu Sep 3 04:03:03 EDT 2009 x86_64 x86_64 x86_64 GNU/Linux
> # lvcreate -s -L20G -n dmm_snap bms_data/dmm
>   bms_data-dmm_snap: event registration failed: 10071:3 
> libdevmapper-event-lvm2snapshot.so dlopen failed: 
> /usr/lib64/liblvm2cmd.so.2.02: undefined symbol: dm_list_empty
>   bms_data/snapshot0: snapshot segment monitoring function failed.
>   Logical volume "dmm_snap" created

This is harmless but it does mean that dmeventd-based snapshot
usage monitoring is not currently enabled for this snapshot.

But if you restart dmeventd (kill the process and it'll restart next
time you activate the snapshot) it should work.

I'll have a look at how best to cope with this within lvm2 (either
rpm upgrade triggers or...).  But out of curiosity: had you upgraded
lvm2 (lvm2-libs et al) prior to creating the snapshot and dmeventd was
running prior to the upgrade?

Mike
