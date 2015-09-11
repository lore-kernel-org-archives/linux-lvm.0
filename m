Received: from mx1.redhat.com (ext-mx02.extmail.prod.ext.phx2.redhat.com
	[10.5.110.26])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t8BFW9ub024236
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Fri, 11 Sep 2015 11:32:09 -0400
Received: from mailrelay3.lanline.com (mailrelay3.lanline.com [216.187.10.24])
	by mx1.redhat.com (Postfix) with ESMTPS id 574C9A0B48
	for <linux-lvm@redhat.com>; Fri, 11 Sep 2015 15:32:08 +0000 (UTC)
Received: from mycroft.westnet.com (Mycroft.westnet.com [216.187.52.7])
	by mailrelay3.lanline.com (8.14.5/8.14.5) with ESMTP id t8BFW6HH037993
	for <linux-lvm@redhat.com>; Fri, 11 Sep 2015 11:32:07 -0400 (EDT)
	(envelope-from john@stoffel.org)
Received: from quad.stoffel.org (66-189-26-192.dhcp.oxfr.ma.charter.com
	[66.189.26.192]) (authenticated bits=0)
	by mycroft.westnet.com (8.14.4/8.14.4) with ESMTP id t8BFVnlw001332
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Fri, 11 Sep 2015 11:31:50 -0400 (EDT)
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-ID: <22002.62453.398853.122097@quad.stoffel.home>
Date: Fri, 11 Sep 2015 11:32:05 -0400
From: "John Stoffel" <john@stoffel.org>
In-Reply-To: <BLU436-SMTP1874EF3850CD97A7431F95690500@phx.gbl>
References: <CAAxjCEwMqpAWFc+BBNW6bLUC7mkjkjdvFkRz66WnZEB__qW2dw@mail.gmail.com>
	<20150911125104.GA8027@rh-vpn>
	<22002.55040.1446.845946@quad.stoffel.home>
	<BLU436-SMTP1874EF3850CD97A7431F95690500@phx.gbl>
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


Simon,
I have multiple terabytes of file storage at home.  I'm looking to use
an SSD to speed up access to the more frequently used data.  Don't
have the cash to upgrade to a full SSD environment.  

Simon> Avoid losing data by imaging the drive using Clonezilla. I do it all the 
Simon> time.

Simon> On 11/09/2015 14:28, John Stoffel wrote:
>>>>>>> "Joe" == Joe Thornber <thornber@redhat.com> writes:
Joe> On Thu, Sep 10, 2015 at 11:30:27AM +0200, Stefan Ring wrote:
>>>> Is this normal/expected? What does it do? Why does it write back huge
>>>> amounts of data to the HDD after each system start?
Joe> No, this is not expected.  The most likely cause is your system was
Joe> not shutdown cleanly so dm-cache has no choice but to assume all
Joe> blocks are dirty and need writing back.  Make sure your volumes are
Joe> being deactivated as part of shutdown.
>> 
>> How would you double check to make sure this happening properly in the
>> logs?  I'm interested in using an SSD to cache my home file server
>> /home and /local directories to make NFS access faster... but I've
>> been hesitant to upgrade since I'd hate to lose all this data.
>> 
>> John
>> 
>> _______________________________________________
>> linux-lvm mailing list
>> linux-lvm@redhat.com
>> https://www.redhat.com/mailman/listinfo/linux-lvm
>> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

Simon> _______________________________________________
Simon> linux-lvm mailing list
Simon> linux-lvm@redhat.com
Simon> https://www.redhat.com/mailman/listinfo/linux-lvm
Simon> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
