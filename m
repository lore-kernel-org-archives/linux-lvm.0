Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id iA5Jcfr29006
	for <linux-lvm@redhat.com>; Fri, 5 Nov 2004 14:38:41 -0500
Received: from storix.com ([206.71.178.18])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id iA5JcOPc032612
	for <linux-lvm@redhat.com>; Fri, 5 Nov 2004 14:38:34 -0500
Received: from [192.168.1.126] (65.106.88.139.ptr.us.xo.net [65.106.88.139])
	by storix.com (Postfix) with ESMTP id C5AC01590C
	for <linux-lvm@redhat.com>; Fri,  5 Nov 2004 11:23:20 -0800 (PST)
Subject: Re: [linux-lvm] unable to create physical volume
From: rich turner <rich@storix.com>
In-Reply-To: <20041105191932.GB2036@agk.surrey.redhat.com>
References: <1099678572.3681.88.camel@rich>
	<20041105191932.GB2036@agk.surrey.redhat.com>
Message-Id: <1099683509.3578.0.camel@rich>
Mime-Version: 1.0
Date: Fri, 05 Nov 2004 11:38:29 -0800
Content-Transfer-Encoding: 7bit
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
To: LVM general discussion and development <linux-lvm@redhat.com>

it does have a special entry in /proc/devices -> aoe
(ata-over-ethernet). added this type in lvm.conf and BINGO. thanks for
the help.

On Fri, 2004-11-05 at 11:19, Alasdair G Kergon wrote:
> On Fri, Nov 05, 2004 at 10:16:13AM -0800, rich turner wrote:
> > [root@redhat proc]# pvcreate /dev/etherd/e0.1
> >   /dev/etherd/e0.1: Couldn't find device.
>  
> Does 'cat /proc/devices' have a special entry for them?
> 
> If so, then you'll need to update the 'types' line in the
> config file to include them.
> 
> Alasdair
