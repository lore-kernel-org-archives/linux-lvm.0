Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id k11I4o129666
	for <linux-lvm@redhat.com>; Wed, 1 Feb 2006 13:04:50 -0500
Received: from smtpout01-04.mesa1.secureserver.net
	(smtpout01-04.mesa1.secureserver.net [64.202.165.79])
	by mx1.redhat.com (8.12.11/8.12.11) with SMTP id k11I4mU6023311
	for <linux-lvm@redhat.com>; Wed, 1 Feb 2006 13:04:48 -0500
Message-ID: <43E0F614.8070000@starnetworks.us>
Date: Wed, 01 Feb 2006 11:55:32 -0600
From: "Kevin P. Fleming" <kpfleming@starnetworks.us>
MIME-Version: 1.0
Subject: Re: [linux-lvm] 'snapshot' target still experimental :-(
References: <0456A130F613AD459887FF012652963F33ED09@mail7.amherst.edu>
In-Reply-To: <0456A130F613AD459887FF012652963F33ED09@mail7.amherst.edu>
Content-Transfer-Encoding: 7bit
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

Steffen Plotner wrote:

> With FC4 for example I cannot remove a snapshot while the underlying
> logical volume is under heavy I/O.  Once all I/O stops I can remove the
> snapshot. Doing a lvremove will hang.

Interesting.

I am using this on a Gentoo system using vanilla kernel 2.6.15.1, and my 
volumes don't experience 'heavy I/O' at the times I make backups, so it 
shouldn't be too bad.

Thanks for the info :-)
