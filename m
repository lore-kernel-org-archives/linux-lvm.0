Received: from dhcp80-216.msp.redhat.com (dhcp80-216.msp.redhat.com
	[10.15.80.216])
	by ns3.rdu.redhat.com (8.13.8/8.13.8) with ESMTP id m9OFkEOn008296
	for <linux-lvm@redhat.com>; Fri, 24 Oct 2008 11:46:14 -0400
Message-Id: <DFD64A83-7917-4C99-8A52-4D546E5F7ACB@redhat.com>
From: Jonathan Brassow <jbrassow@redhat.com>
In-Reply-To: <1224793666.30118.16.camel@behemoth.csg.stercomm.com>
Content-Transfer-Encoding: 7bit
Mime-Version: 1.0 (Apple Message framework v929.2)
Subject: Re: [linux-lvm] LVM corruption possibilites??
Date: Fri, 24 Oct 2008 10:45:28 -0500
References: <20081023193142.GA17753@netfirms.com>
	<1224793666.30118.16.camel@behemoth.csg.stercomm.com>
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
To: LVM general discussion and development <linux-lvm@redhat.com>


On Oct 23, 2008, at 3:27 PM, Chris Cox wrote:

> For safety and to avoid some consistency issues, I'd use
> LUN masking.  Just my opinion.

LUN masking is a good idea.  You can also use LVM tags.

  brassow
