Received: from homer.msp.redhat.com (homer.msp.redhat.com [172.16.30.9])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i3IIccj17749
	for <linux-lvm@redhat.com>; Sun, 18 Apr 2004 14:38:38 -0400
Received: (from agk@localhost)
	by homer.msp.redhat.com (8.11.6/8.11.6) id i3IIcb607447
	for linux-lvm@redhat.com; Sun, 18 Apr 2004 13:38:37 -0500
Date: Sun, 18 Apr 2004 13:38:37 -0500
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] lvextend fails on v2 metadata
Message-ID: <20040418133837.B5005@homer.msp.redhat.com>
References: <20040418182303.GD21069@fi.muni.cz>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20040418182303.GD21069@fi.muni.cz>;
	from kas@informatics.muni.cz on Sun, Apr 18, 2004 at 08:23:03PM
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

On Sun, Apr 18, 2004 at 08:23:03PM +0200, Jan Kasprzak wrote:
> Then I have written a simple Perl script to lvextend the test_lv volume
> by 1 extent from either md5 or md6, depending on which one has the higher
> fraction of free extents. This way I will get as perfect interleaving as I
> can get on the PVs of different size.

The method you're using means every extent gets listed separately in the
metadata, so you'll need to prepare a lot more space for it when you
run pvcreate.

Check out the --metadatasize option to pvcreate.
[NB You can't manipulate these settings yet without losing the data 
on the device]

[A striping implementation which lets you specify differently-sized 
chunks for each device, anyone?]
 
Alasdair
-- 
agk@redhat.com
