Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id iB7EH7H6030307
	for <linux-lvm@redhat.com>; Tue, 7 Dec 2004 14:17:07 GMT
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1Cbg9L-00055P-EH
	for linux-lvm@redhat.com; Tue, 07 Dec 2004 14:17:07 +0000
Date: Tue, 7 Dec 2004 14:17:07 +0000
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] pvmove on the same PV
Message-ID: <20041207141707.GZ24229@agk.surrey.redhat.com>
References: <1102387034.5390.13.camel@cain>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1102387034.5390.13.camel@cain>
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

On Mon, Dec 06, 2004 at 08:37:13PM -0600, Aran Cox wrote:
> Is it possible to move an extent from one position to another on the
> same PV?  It used to be possible under LVM1.  
 
pvmove --alloc anywhere

tells overrides normal common-sense restrictions.

Alasdair
-- 
agk@redhat.com
