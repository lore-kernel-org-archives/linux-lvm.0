Received: from homer.msp.redhat.com (homer.msp.redhat.com [172.16.30.9])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i44LePv13899
	for <linux-lvm@redhat.com>; Tue, 4 May 2004 17:40:25 -0400
Received: (from agk@localhost)
	by homer.msp.redhat.com (8.11.6/8.11.6) id i44LeOD05742
	for linux-lvm@redhat.com; Tue, 4 May 2004 16:40:24 -0500
Date: Tue, 4 May 2004 16:40:24 -0500
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] [PATCH] crypto for LVM2
Message-ID: <20040504164024.A5316@homer.msp.redhat.com>
References: <20040503232018.GD7384@fukurou.paranoiacs.org>
	<20040504064935.GV29503@lug-owl.de>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20040504064935.GV29503@lug-owl.de>;
	from jbglaw@lug-owl.de on Tue, May 04, 2004 at 08:49:35AM +0200
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

On Tue, May 04, 2004 at 08:49:35AM +0200, Jan-Benedict Glaw wrote:
> So I don't think it's really neccessary to place this functionality into
> the lvm2 tools; 

Nothing's necessary of course, but the best idea is to offer people
choices and then they can choose what's best for their own particular
circumstances.

e.g. someone's encrypted data could be in a separate VG, activated
manually after booting by inserting a read-only floppy/CD containing
the VG metadata (optionally also containing the encryption key) - and
removing that disk after activation.

Alasdair
-- 
agk@redhat.com
