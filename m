Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n6G3iGoN015943
	for <linux-lvm@redhat.com>; Wed, 15 Jul 2009 23:44:16 -0400
Received: from e32.co.us.ibm.com (e32.co.us.ibm.com [32.97.110.150])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id n6G3hxlg006031
	for <linux-lvm@redhat.com>; Wed, 15 Jul 2009 23:43:59 -0400
Received: from d03relay02.boulder.ibm.com (d03relay02.boulder.ibm.com
	[9.17.195.227])
	by e32.co.us.ibm.com (8.13.1/8.13.1) with ESMTP id n6G3dqDS001659
	for <linux-lvm@redhat.com>; Wed, 15 Jul 2009 21:39:52 -0600
Received: from d03av02.boulder.ibm.com (d03av02.boulder.ibm.com [9.17.195.168])
	by d03relay02.boulder.ibm.com (8.13.8/8.13.8/NCO v9.2) with ESMTP id
	n6G3hxZ5246560
	for <linux-lvm@redhat.com>; Wed, 15 Jul 2009 21:43:59 -0600
Received: from d03av02.boulder.ibm.com (loopback [127.0.0.1])
	by d03av02.boulder.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id
	n6G3hxMS018232
	for <linux-lvm@redhat.com>; Wed, 15 Jul 2009 21:43:59 -0600
Received: from malahal.localdomain (malahal.beaverton.ibm.com [9.47.17.130])
	by d03av02.boulder.ibm.com (8.12.11.20060308/8.12.11) with ESMTP id
	n6G3hwVv018227
	for <linux-lvm@redhat.com>; Wed, 15 Jul 2009 21:43:59 -0600
Date: Wed, 15 Jul 2009 20:43:58 -0700
From: malahal@us.ibm.com
Subject: Re: [linux-lvm] multipath works; lvm on multipath does not
Message-ID: <20090716034358.GB3285@us.ibm.com>
References: <21354387.222841247696527230.JavaMail.root@zimbra>
	<1247699245.9792.31.camel@chandra-ubuntu>
	<20090715232638.GA29350@us.ibm.com> <4A5E74A0.5040902@anl.gov>
	<20090716005322.GA31324@us.ibm.com> <4A5E978B.1070403@anl.gov>
	<4A5E9A1E.1040705@anl.gov> <4A5E9BA9.1000508@anl.gov>
	<4A5E9D2C.2020404@anl.gov>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4A5E9D2C.2020404@anl.gov>
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
> And, after putting the fix referenced in the bug report in place,
> re-creating the initrd, I rebooted.  Once back up, I took another look,
> and what I see is below.
> 
> Success!  I'll have to test it by yanking the fibre pairs again
> tomorrow, but it sure looks like we have conclusively found the culprit,
> and the solution.
> 
> Many thanks to you, Malahal, and also to Chandra.  You guys rock!

You are very welcome.
