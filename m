Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i2HHYjj01886
	for <linux-lvm@redhat.com>; Wed, 17 Mar 2004 12:34:45 -0500
Received: from mail.osdl.org (fw.osdl.org [65.172.181.6])
	by mx1.redhat.com (8.12.10/8.12.10) with SMTP id i2HHYi4b006884
	for <linux-lvm@redhat.com>; Wed, 17 Mar 2004 12:34:44 -0500
Date: Wed, 17 Mar 2004 09:36:38 -0800
From: Dave Olien <dmo@osdl.org>
Message-ID: <20040317173637.GA2126@osdl.org>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] LVM2 scalability within volume group
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


Greetings,

I'm doing some evaluation of LVM2 on large systems, with lots of disk
devices.  I'm currently using LVM2.2.00.08, along with device-mapper.1.00.07.
I plan to eventually upgrade to the lastest CVS trees for LVM2.  I recall
earlier mail that it's faster than what I'm using.

The first thing I noticed is that creating a VG with lots of PVs is a bad
idea.  Creating a volume group with one PV takes about 12
seconds elapsed time.  Adding a new PV initially takes about 5 seconds.
But this grows to 15 seconds when adding the 40th PV, 25 seconds adding
the 60th PV.  Adding the 200th PV takes about 6 minutes.

Activing this volume group (with 200 PVs) takes about 48 minutes.

I can be spreading PVs out among the available 99 VGs.
The individual VGs seem to be independent of each other, so having
large numbers of VGs with a few PVs performs OK.

But stil, would it make sense for adding PVs to VG to scale better?
I'm guessing that the current lack of scaling is from the way redundant
meta data is stored.  Are redundant copies of meta data being updated on
every PV within the VG whenever a new PV is added?  Even so, why should
200 read/writes take so long?

Having redundant copies of meta data is a good thing.  But how about
allowing the adminstrator to set a limit on the degree of redundancy when
a VG is created.  You could limit a VG to having for example 10 redundant
copies.  Then adding more PVs beyond the 10th would encounter less overhead.

Am I missing something important?

Thanks!
Dave Olien
