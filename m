Date: Tue, 21 Feb 2012 17:07:43 +0000
From: Alasdair G Kergon <agk@redhat.com>
Message-ID: <20120221170743.GC14666@agk-dp.fab.redhat.com>
References: <4F43588B.8040202@agenda.si>
	<20120221120933.GB12645@agk-dp.fab.redhat.com>
	<20120221103503.4ba74c70@bettercgi.com>
	<20120221164321.GA14666@agk-dp.fab.redhat.com>
	<4F43CB24.5060901@bmsi.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4F43CB24.5060901@bmsi.com>
Subject: Re: [linux-lvm] Duplicate PV's - how does LVM choose which one
	to	use
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Stuart D Gathman <stuart@bmsi.com>
Cc: linux-lvm@redhat.com

On Tue, Feb 21, 2012 at 11:49:40AM -0500, Stuart D Gathman wrote:
> But if they are different paths, incrementing seqno won't hurt, both  
> paths will see the change.  And if it is a mirror that failed to start,  
> then the chosen leg is now distinguishable.  Is there a problem with  
> incrementing seqno an extra time at startup when multipath is the normal  
> situation?

If you update some PV-level indicator and only one path sees the update, then
that's exactly a case where you must use neither until the sysadmin decides
which was the right one to use.  And the other case - multipath - well again,
why didn't your multipath software start up and take control?

Alasdair
