Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i8G7NPr11975
	for <linux-lvm@redhat.com>; Thu, 16 Sep 2004 03:23:25 -0400
Received: from server.klaube.net (root@www.klaube.net [195.190.148.2])
	by mx3.redhat.com (8.12.11/8.12.10) with ESMTP id i8G7NJCI019741
	for <linux-lvm@redhat.com>; Thu, 16 Sep 2004 03:23:19 -0400
Received: from server.klaube.net (localhost [127.0.0.1])
	by server.klaube.net (8.12.3/8.12.2/SuSE Linux 0.6) with ESMTP id
	i8G7NIJO029175
	for <linux-lvm@redhat.com>; Thu, 16 Sep 2004 09:23:18 +0200
Received: (from t1@localhost)
	by server.klaube.net (8.12.3/8.12.3/Submit) id i8G7NH9i029174
	for linux-lvm@redhat.com; Thu, 16 Sep 2004 09:23:18 +0200
Date: Thu, 16 Sep 2004 09:23:17 +0200
From: Thomas Klaube <t.klaube@efm.de>
Subject: Re: [linux-lvm] snapshot on 6.8.5/FC development
Message-ID: <20040916072317.GA29048@server.klaube.net>
References: <1095296187.4750.12.camel@nelson.hilling.de>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1095296187.4750.12.camel@nelson.hilling.de>
Reply-To: Thomas Klaube <t.klaube@efm.de>,
	LVM general discussion and development <linux-lvm@redhat.com>
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

On Thu, Sep 16, 2004 at 02:56:27AM +0200, Gunnar Hilling wrote:
> Hello,

Hi,

> 
> I just tried the lvm2/dm-snapshot feature and failed miserably...
> After reading some older postings in this and the dm-devel mailing lists
> I'm not sure what to do:
> 

[...]

> 
> lvcreate --snapshot --size 100m --name snap /dev/TestMirrorGroup/OnlineVol
> 
> will block forever. I have to reboot the computer. After
> that /dev/TestMirrorGroup/snap is there...

/dev/TestMirrorGroup/OnlineVol is your root filesystem? I have the same
problem. Snapshots on other (non root fs) work for me. 

AFAIK snapshots and pvmove do not work on the filesystem where the lvm-tools
reside. I hope this will change in the (not so distant) future as I 
need snapshots on root-fs. 

regards
Thomas 
