Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j7Q6h8V18598
	for <linux-lvm@redhat.com>; Fri, 26 Aug 2005 02:43:08 -0400
Received: from smtp.unc.edu (smtpsrv0.isis.unc.edu [152.2.1.139])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id j7Q6h2nr032035
	for <linux-lvm@redhat.com>; Fri, 26 Aug 2005 02:43:02 -0400
Date: Fri, 26 Aug 2005 02:42:58 -0400 (EDT)
From: Faheem Mitha <faheem@email.unc.edu>
Subject: Re: [linux-lvm] problems with basic lvm commands on Debian
In-Reply-To: <7D1B3B5A91BC5E4215864733@dhcp-2-206.wgops.com>
Message-ID: <Pine.LNX.4.62.0508260242080.27495@Chrestomanci>
References: <Pine.LNX.4.62.0508252240480.27495@Chrestomanci>
	<7D1B3B5A91BC5E4215864733@dhcp-2-206.wgops.com>
MIME-Version: 1.0
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
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: Michael Loftis <mloftis@wgops.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>



On Thu, 25 Aug 2005, Michael Loftis wrote:

> Yeah.  You CAN'T use mounted filesystems for LVM.  You'll corrupt both.

Thanks. In hindsight, this seems obvious, but I completely missed it, and 
none of the documentation I looked at mentions this.

                                                                   Faheem.
