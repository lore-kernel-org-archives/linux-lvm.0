Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id k0OITI107615
	for <linux-lvm@redhat.com>; Tue, 24 Jan 2006 13:29:18 -0500
Received: from shell.wgops.com (postfix@free.wgops.com [69.51.116.66])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k0OITC56022357
	for <linux-lvm@redhat.com>; Tue, 24 Jan 2006 13:29:12 -0500
Received: from [10.1.2.206] (localhost [127.0.0.1])
	by shell.wgops.com (Postfix) with ESMTP id D7A5924FB0
	for <linux-lvm@redhat.com>; Tue, 24 Jan 2006 11:28:52 -0700 (MST)
Date: Tue, 24 Jan 2006 11:28:51 -0700
From: Michael Loftis <mloftis@wgops.com>
Message-ID: <15B770F7AE82DAADD9A7C9D6@dhcp-2-206.wgops.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Subject: [linux-lvm] State of LVM Snapshotting?
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com

In 2.4 atleast snapshots aren't very useful to me because they require huge 
chunks of contiguous kernel memory for the COW bitmap table.  I was 
wondering if 2.6 improves this situation any.  currently we use a 64M PE on 
volumes ranging in size from 30Gb up to and over 300Gb.  The smaller 
volumes we can usually take snapshots of, but anything up over 100Gb we've 
never been able to reliably take any snapshots, much less have more than 
one because of this limitation.

Any feedback would be welcome, if you need specifics on the versions we 
were using I c cna provide them.  Currently starting to (try) to migrate to 
2.6.  Though that's proving difficult and might be impossible because of 
reasons discussed on LKML.

--
"Genius might be described as a supreme capacity for getting its possessors
into trouble of all kinds."
-- Samuel Butler
