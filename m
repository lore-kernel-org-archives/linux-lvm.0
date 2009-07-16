Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n6G3hSww015731
	for <linux-lvm@redhat.com>; Wed, 15 Jul 2009 23:43:28 -0400
Received: from e33.co.us.ibm.com (e33.co.us.ibm.com [32.97.110.151])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n6G3hCeO010784
	for <linux-lvm@redhat.com>; Wed, 15 Jul 2009 23:43:12 -0400
Received: from d03relay04.boulder.ibm.com (d03relay04.boulder.ibm.com
	[9.17.195.106])
	by e33.co.us.ibm.com (8.13.1/8.13.1) with ESMTP id n6G3eqFS021994
	for <linux-lvm@redhat.com>; Wed, 15 Jul 2009 21:40:52 -0600
Received: from d03av04.boulder.ibm.com (d03av04.boulder.ibm.com [9.17.195.170])
	by d03relay04.boulder.ibm.com (8.13.8/8.13.8/NCO v9.2) with ESMTP id
	n6G3h8O3214284
	for <linux-lvm@redhat.com>; Wed, 15 Jul 2009 21:43:08 -0600
Received: from d03av04.boulder.ibm.com (loopback [127.0.0.1])
	by d03av04.boulder.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id
	n6G3h78A003492
	for <linux-lvm@redhat.com>; Wed, 15 Jul 2009 21:43:07 -0600
Received: from malahal.localdomain (malahal.beaverton.ibm.com [9.47.17.130])
	by d03av04.boulder.ibm.com (8.12.11.20060308/8.12.11) with ESMTP id
	n6G3h7KJ003483
	for <linux-lvm@redhat.com>; Wed, 15 Jul 2009 21:43:07 -0600
Date: Wed, 15 Jul 2009 20:43:06 -0700
From: malahal@us.ibm.com
Subject: Re: [linux-lvm] multipath works; lvm on multipath does not
Message-ID: <20090716034306.GA3285@us.ibm.com>
References: <21354387.222841247696527230.JavaMail.root@zimbra>
	<1247699245.9792.31.camel@chandra-ubuntu>
	<20090715232638.GA29350@us.ibm.com> <4A5E74A0.5040902@anl.gov>
	<20090716005322.GA31324@us.ibm.com> <4A5E978B.1070403@anl.gov>
	<4A5E9A1E.1040705@anl.gov>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4A5E9A1E.1040705@anl.gov>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

Brian Elliott Finley [finley@anl.gov] wrote:
> Malahal,
> 
> I took a look inside the initrd to see what it might be doing to
> contribute to this.  What I see is the following:
> 
> ./etc/udev/rules.d/85-lvm2.rules
> ./etc/udev/rules.d/95-multipath.rules
> 
> Looks like a vgscan is being done inside the initrd (without an lvm.conf
> file) before multipath is setup.  Could that be the cause?

Yes, yes! Also, you *should* see some failures from multipath command
as it will fail to grab one of the paths...
