Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id k1DEak102165
	for <linux-lvm@redhat.com>; Mon, 13 Feb 2006 09:36:46 -0500
Received: from io.iol.unh.edu (io.iol.unh.edu [132.177.123.82])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id k1DEaiqZ025786
	for <linux-lvm@redhat.com>; Mon, 13 Feb 2006 09:36:44 -0500
Received: from kraken (d122130.iol.unh.edu [132.177.122.130])
	by io.iol.unh.edu (8.13.4/8.13.4) with SMTP id k1DEaVZG028975
	for <linux-lvm@redhat.com>; Mon, 13 Feb 2006 09:36:32 -0500
From: "Matthew Plante" <maplante@iol.unh.edu>
Subject: RE: [linux-lvm] removing bad PVs
Date: Mon, 13 Feb 2006 09:36:31 -0500
Message-ID: <NNEEKMEDALGMPDKHFPJHEELNDHAA.maplante@iol.unh.edu>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <43EBCF85.8060605@struzak.com>
Reply-To: maplante@iol.unh.edu,
	LVM general discussion and development <linux-lvm@redhat.com>
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

The solution I ended up with was actually to add a new disk and make new PVs
with the same uuid, which wasn't exactly the solution I was going for, but
it ended up working out.  I wasn't able to get the --removemissing option in
vgreduce to work for the scenario I mentioned before.
The test scenario I was going for was an unexpected removal of a disk, where
I could remove the disk from the vg, and bring the vg back up in a
semi-working state, minus one disk/some data.

-- Matt

+--
|Matthew Plante
| University of New Hampshire
| InterOperability Lab
| Research & Development
| SMTP: maplante@iol.unh.edu
| Phone: +1-603-862-0203
+-


-----Original Message-----
From: linux-lvm-bounces@redhat.com
[mailto:linux-lvm-bounces@redhat.com]On Behalf Of Marcin Struzak
Sent: Thursday, February 09, 2006 6:26 PM
To: maplante@iol.unh.edu; LVM general discussion and development
Subject: Re: [linux-lvm] removing bad PVs


Matthew Plante wrote:
> actually, nevermind, I figured it out :-)

Could you share with the list what you did?
Thanks!

--Marcin

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://www.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
