Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q4MHvCHT022690
	for <linux-lvm@redhat.com>; Tue, 22 May 2012 13:57:12 -0400
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q4MHvB3t012739
	for <linux-lvm@redhat.com>; Tue, 22 May 2012 13:57:11 -0400
Received: from sdg.bmsi.com (sdg.bmsi.com [192.168.9.34] (may be forged))
	(authenticated bits=0)
	by mail.bmsi.com (8.14.3/8.14.3) with ESMTP id q4MHvAjO000930
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Tue, 22 May 2012 13:57:11 -0400
Message-ID: <4FBBD376.7070001@bmsi.com>
Date: Tue, 22 May 2012 13:57:10 -0400
From: Stuart D Gathman <stuart@bmsi.com>
MIME-Version: 1.0
References: <53772.172.16.0.29.1337698212.squirrel@beer.org.uk>
In-Reply-To: <53772.172.16.0.29.1337698212.squirrel@beer.org.uk>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Fun and games with mirroring
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

Long ago, Nostradamus foresaw that on 05/22/2012 10:50 AM, Vic would write:
> p.s. The reason I want to do this with LVM mirrors rather than MD RAID is
> that this is potentially a very useful way of grabbing a backup snapshot
> of a machine prior to some risky operation - it allows me to "fork" a
> machine onto two sets of media. But if it leaves the result unbootable,
> that's something of a problem...
>
LVM RAID is mainly used for pvmove at the moment.  LVM has a ways to go 
to match ZFS or AIX in LVM mirroring features.   MD RAID takes a 
snapshot just fine.  Add the mirror with mdadm, sync it, and "fail" the 
mirror and remove it before physically removing the drive.  I can see 
the issue with multiple PVs, however.  There is no atomic way to fail 
multiple mirrors at once.
