Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r62HMXjE022747
	for <linux-lvm@redhat.com>; Tue, 2 Jul 2013 13:22:34 -0400
Received: from mail.gathman.org (wsip-70-169-160-205.dc.dc.cox.net
	[70.169.160.205])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r62HMWPS012371
	for <linux-lvm@redhat.com>; Tue, 2 Jul 2013 13:22:33 -0400
Received: from melissa.gathman.org (ip72-205-26-231.dc.dc.cox.net
	[72.205.26.231]) (authenticated bits=0)
	by mail.gathman.org (8.14.4/8.14.4) with ESMTP id r62HNIQ4025615
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Tue, 2 Jul 2013 13:23:19 -0400
Message-ID: <51D30C57.5000808@gathman.org>
Date: Tue, 02 Jul 2013 13:22:31 -0400
From: Stuart Gathman <stuart@gathman.org>
MIME-Version: 1.0
References: <CAFrGbuUmN82Pw77=EC4ViVPAnTApnawiWWEWB2KnZ92xwn-zRw@mail.gmail.com>
In-Reply-To: <CAFrGbuUmN82Pw77=EC4ViVPAnTApnawiWWEWB2KnZ92xwn-zRw@mail.gmail.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] LVM handling the entire physical disk
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
To: linux-lvm@redhat.com

Long ago, Nostradamus foresaw that on 07/01/2013 06:51 AM, Alessandro
MACUZ would write:
> What are the benefits/disadvantages between building VGs over 0x8e
> partitions or having LVM managing the entire disk with no partition
> table?
>
> We're not speaking about boot volumes since I assume I know how to
> handle that case.

Disadvantage:

If the disk will/could ever be seen by another OS, it is better if the
alien OS knows there is some data (of unknown format) there via the
partition table.  This can help prevent accidental reformatting.

Advantage:

When mapping virtual disks to virtual machines, I find it especially
useful to bypass partition tables.  Using kpartx to access partitions
from the host is just another layer of complexity that doesn't buy you
anything.
