Received: from homer.msp.redhat.com (homer.msp.redhat.com [172.16.30.9])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i3IJ2Gj23242
	for <linux-lvm@redhat.com>; Sun, 18 Apr 2004 15:02:16 -0400
Received: (from agk@localhost)
	by homer.msp.redhat.com (8.11.6/8.11.6) id i3IJ2FT07967
	for linux-lvm@redhat.com; Sun, 18 Apr 2004 14:02:15 -0500
Date: Sun, 18 Apr 2004 14:02:15 -0500
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] lvextend fails on v2 metadata
Message-ID: <20040418140215.C5005@homer.msp.redhat.com>
References: <20040418182303.GD21069@fi.muni.cz>
	<20040418133837.B5005@homer.msp.redhat.com>
	<20040418185259.GF21069@fi.muni.cz>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20040418185259.GF21069@fi.muni.cz>;
	from kas@informatics.muni.cz on Sun, Apr 18, 2004 at 08:53:00PM
	+0200
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

On Sun, Apr 18, 2004 at 08:53:00PM +0200, Jan Kasprzak wrote:
> The metadata size depends on the PV size? 
Normally, no.  But in your case, yes.

You could say the metadata grows with the number of lvcreate and
lvextend operations necessary to generate the configuration.

Alasdair
-- 
agk@redhat.com
