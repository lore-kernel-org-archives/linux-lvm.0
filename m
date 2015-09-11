Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.29])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t8BEoWDE022924
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Fri, 11 Sep 2015 10:50:32 -0400
Received: from BLU004-OMC3S4.hotmail.com (blu004-omc3s4.hotmail.com
	[65.55.116.79])
	by mx1.redhat.com (Postfix) with ESMTPS id 69C1C341AE3
	for <linux-lvm@redhat.com>; Fri, 11 Sep 2015 14:50:28 +0000 (UTC)
Message-ID: <BLU436-SMTP1874EF3850CD97A7431F95690500@phx.gbl>
References: <CAAxjCEwMqpAWFc+BBNW6bLUC7mkjkjdvFkRz66WnZEB__qW2dw@mail.gmail.com>
	<20150911125104.GA8027@rh-vpn>
	<22002.55040.1446.845946@quad.stoffel.home>
From: "Simon O'Riordan" <verucasaltuk@hotmail.co.uk>
Date: Fri, 11 Sep 2015 15:50:17 +0100
MIME-Version: 1.0
In-Reply-To: <22002.55040.1446.845946@quad.stoffel.home>
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com

Avoid losing data by imaging the drive using Clonezilla. I do it all the 
time.

On 11/09/2015 14:28, John Stoffel wrote:
>>>>>> "Joe" == Joe Thornber <thornber@redhat.com> writes:
> Joe> On Thu, Sep 10, 2015 at 11:30:27AM +0200, Stefan Ring wrote:
>>> Is this normal/expected? What does it do? Why does it write back huge
>>> amounts of data to the HDD after each system start?
> Joe> No, this is not expected.  The most likely cause is your system was
> Joe> not shutdown cleanly so dm-cache has no choice but to assume all
> Joe> blocks are dirty and need writing back.  Make sure your volumes are
> Joe> being deactivated as part of shutdown.
>
> How would you double check to make sure this happening properly in the
> logs?  I'm interested in using an SSD to cache my home file server
> /home and /local directories to make NFS access faster... but I've
> been hesitant to upgrade since I'd hate to lose all this data.
>
> John
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
