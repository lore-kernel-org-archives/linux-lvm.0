Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id iBLLAFge002929
	for <linux-lvm@redhat.com>; Tue, 21 Dec 2004 21:10:15 GMT
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1CgrGp-0007r7-HE
	for linux-lvm@redhat.com; Tue, 21 Dec 2004 21:10:15 +0000
Date: Tue, 21 Dec 2004 21:10:15 +0000
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] Can't mount after crash
Message-ID: <20041221211015.GS26670@agk.surrey.redhat.com>
References: <41BB808E.60108@danielroth.se> <41BFC24F.6060207@danielroth.se>
	<41C1D30A.6030201@danielroth.se>
	<1103222964.31909.224.camel@tesuji.nac.uci.edu>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1103222964.31909.224.camel@tesuji.nac.uci.edu>
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

On Thu, Dec 16, 2004 at 10:49:24AM -0800, Dan Stromberg wrote:
> ext3 users list, 

But you tried to mount it as ext2?

Is it meant to be ext2 or ext3?

> and don't seem to be getting satisfaction.

Probably because you're not giving people all the information they need
to help you; and maybe even some of the things you've tried have made
the problem worse - I don't understand yet why you did the pvcreates,
for example, and are you certain the lvm2 backup file you used was 
completely up-to-date?  

Have you a kept a complete log (i.e. shell history) of every command 
you ran on the system while trying to recover things?

Alasdair
-- 
agk@redhat.com
