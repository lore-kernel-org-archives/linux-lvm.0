Received: from homer.msp.redhat.com (homer.msp.redhat.com [172.16.30.9])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i2HICZj14347
	for <linux-lvm@redhat.com>; Wed, 17 Mar 2004 13:12:35 -0500
Received: (from agk@localhost)
	by homer.msp.redhat.com (8.11.6/8.11.6) id i2HICWi01041
	for linux-lvm@redhat.com; Wed, 17 Mar 2004 12:12:32 -0600
Date: Wed, 17 Mar 2004 12:12:32 -0600
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] LVM2 scalability within volume group
Message-ID: <20040317121232.D31599@homer.msp.redhat.com>
References: <20040317173637.GA2126@osdl.org>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20040317173637.GA2126@osdl.org>;
	from dmo@osdl.org on Wed, Mar 17, 2004 at 09:36:38AM -0800
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
To: LVM general discussion and development <linux-lvm@redhat.com>

On Wed, Mar 17, 2004 at 09:36:38AM -0800, Dave Olien wrote:
> I plan to eventually upgrade to the lastest CVS trees for LVM2.  I recall
> earlier mail that it's faster than what I'm using.
 
Other speed-ups: 
  Add a filter to lvm.conf so it doesn't waste time looking at non-PVs.
  Invoke commands using the lvm shell (configure --enable-readline) so the 
tools retain the maximum amount of internal state between commands.
[I'll fix this to avoid the warning when piping]

Alasdair
-- 
agk@redhat.com
