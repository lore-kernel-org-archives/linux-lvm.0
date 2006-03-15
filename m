Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id k2FErF130031
	for <linux-lvm@redhat.com>; Wed, 15 Mar 2006 09:53:15 -0500
Received: from smtpout08-04.prod.mesa1.secureserver.net
	(smtpout08-04.prod.mesa1.secureserver.net [64.202.165.12])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with SMTP id
	k2FErBMh009435
	for <linux-lvm@redhat.com>; Wed, 15 Mar 2006 09:53:11 -0500
Message-ID: <44182A54.8010708@starnetworks.us>
Date: Wed, 15 Mar 2006 08:53:08 -0600
From: "Kevin P. Fleming" <kpfleming@starnetworks.us>
MIME-Version: 1.0
Subject: Re: [linux-lvm] XFS Decreasing Size
References: <200603151527.30115.problems@gmx.net>
	<p06230906c03dd5b8e2e6@[128.83.162.209]>
In-Reply-To: <p06230906c03dd5b8e2e6@[128.83.162.209]>
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
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

James Hammett wrote:

> Is this possible with XFS, or does one need to use XFS Dump to migrate
> the data to another partition?

XFS does not currently support shrinking filesystems, only growing.
