Received: from agk.fab.redhat.com (agk.fab.redhat.com [10.33.0.19])
	by pobox.fab.redhat.com (8.13.1/8.13.1) with ESMTP id l77KOA3k027064
	for <linux-lvm@redhat.com>; Tue, 7 Aug 2007 16:24:10 -0400
Received: from agk by agk.fab.redhat.com with local (Exim 4.34)
	id 1IIVb7-0006QW-Uk
	for linux-lvm@redhat.com; Tue, 07 Aug 2007 21:24:09 +0100
Date: Tue, 7 Aug 2007 21:24:09 +0100
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] Listing physical volumes in a volume group
Message-ID: <20070807202409.GW2064@agk.fab.redhat.com>
References: <46B3395A.5020701@terrascale.net> <46B34DDC.6020609@redhat.com>
	<46B35149.6090604@terrascale.net>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <46B35149.6090604@terrascale.net>
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

On Fri, Aug 03, 2007 at 12:01:13PM -0400, Steeve McCauley wrote:
> Ah, I didn't realise one could use the pv_ column names
> with the vgs utility.
 
pvs, vgs, and lvs simply set up different defaults before entering the
same reporting engine.  One such default is what prefix to add to column
names that are supplied without any prefix.  If you request -o name,
vgs would turn that into 'vg_name' whereas pvs would turn it into
'pv_name', for example.

Use '-o help' (in sufficiently recent versions) to see the list of
fields.

Alasdair
-- 
agk@redhat.com
