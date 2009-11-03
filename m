Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.8])
	by int-mx05.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id nA3Eoj68028538
	for <linux-lvm@redhat.com>; Tue, 3 Nov 2009 09:50:45 -0500
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id nA3EoSRp025904
	for <linux-lvm@redhat.com>; Tue, 3 Nov 2009 09:50:29 -0500
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.14.3/8.14.3) with ESMTP id nA3EoPJK019776
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Tue, 3 Nov 2009 09:50:26 -0500
Received: from localhost (localhost.localdomain [127.0.0.1])
	by bmsred.bmsi.com (8.14.3/8.14.3) with ESMTP id nA3EoPfQ029351
	for <linux-lvm@redhat.com>; Tue, 3 Nov 2009 09:50:25 -0500
Date: Tue, 3 Nov 2009 09:50:25 -0500 (EST)
From: "Stuart D. Gathman" <stuart@bmsi.com>
Subject: Re: [linux-lvm] Re: error creating snapshots
In-Reply-To: <20091103141626.GA15344@redhat.com>
Message-ID: <Pine.LNX.4.64.0911030929380.29181@bmsred.bmsi.com>
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

> Stuart D. Gathman <stuart@bmsi.com> wrote:
> 
> > Is this a harmless error having to do with some misreported option to
> > notify a user process when the snapshot is almost full?  Or should I switch
> > backups over
> This is harmless but it does mean that dmeventd-based snapshot
> usage monitoring is not currently enabled for this snapshot.
> 
> But if you restart dmeventd (kill the process and it'll restart next
> time you activate the snapshot) it should work.

Looks like "service lvm2-monitor restart" should do this.  Maybe
the update should restart this service?

> I'll have a look at how best to cope with this within lvm2 (either
> rpm upgrade triggers or...).  But out of curiosity: had you upgraded
> lvm2 (lvm2-libs et al) prior to creating the snapshot and dmeventd was
> running prior to the upgrade?

Yes.  Have not yet rebooted after the update.  Strangely, this doesn't
seem to happen on 32-bit systems at the same update level with the same
update sequence.  

The dmeventd was not restarted with the lvm2 update.  There is some
logic in lvm2-monitor about when stopping dmeventd is dangerous, but
it doesn't seem to think a restart is dangerous.

-- 
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
