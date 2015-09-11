Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.29])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t8BDY7fD004706
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Fri, 11 Sep 2015 09:34:07 -0400
Received: from mailrelay3.lanline.com (mailrelay3.lanline.com [216.187.10.24])
	by mx1.redhat.com (Postfix) with ESMTPS id 43056550CC
	for <linux-lvm@redhat.com>; Fri, 11 Sep 2015 13:34:02 +0000 (UTC)
Received: from mycroft.westnet.com (Mycroft.westnet.com [216.187.52.7])
	by mailrelay3.lanline.com (8.14.5/8.14.5) with ESMTP id t8BDSXp9015933
	for <linux-lvm@redhat.com>; Fri, 11 Sep 2015 09:28:33 -0400 (EDT)
	(envelope-from john@stoffel.org)
Received: from quad.stoffel.org (66-189-26-192.dhcp.oxfr.ma.charter.com
	[66.189.26.192]) (authenticated bits=0)
	by mycroft.westnet.com (8.14.4/8.14.4) with ESMTP id t8BDSIMD008856
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Fri, 11 Sep 2015 09:28:18 -0400 (EDT)
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-ID: <22002.55040.1446.845946@quad.stoffel.home>
Date: Fri, 11 Sep 2015 09:28:32 -0400
From: "John Stoffel" <john@stoffel.org>
In-Reply-To: <20150911125104.GA8027@rh-vpn>
References: <CAAxjCEwMqpAWFc+BBNW6bLUC7mkjkjdvFkRz66WnZEB__qW2dw@mail.gmail.com>
	<20150911125104.GA8027@rh-vpn>
Subject: Re: [linux-lvm] Strange dm-cache activity at startup
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

>>>>> "Joe" == Joe Thornber <thornber@redhat.com> writes:

Joe> On Thu, Sep 10, 2015 at 11:30:27AM +0200, Stefan Ring wrote:
>> Is this normal/expected? What does it do? Why does it write back huge
>> amounts of data to the HDD after each system start?

Joe> No, this is not expected.  The most likely cause is your system was
Joe> not shutdown cleanly so dm-cache has no choice but to assume all
Joe> blocks are dirty and need writing back.  Make sure your volumes are
Joe> being deactivated as part of shutdown.

How would you double check to make sure this happening properly in the
logs?  I'm interested in using an SSD to cache my home file server
/home and /local directories to make NFS access faster... but I've
been hesitant to upgrade since I'd hate to lose all this data.

John
