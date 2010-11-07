Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.5])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id oA7Jtvq5025500
	for <linux-lvm@redhat.com>; Sun, 7 Nov 2010 14:55:57 -0500
Received: from cdptpa-omtalb.mail.rr.com (cdptpa-omtalb.mail.rr.com
	[75.180.132.121])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id oA7JtgJZ025390
	for <linux-lvm@redhat.com>; Sun, 7 Nov 2010 14:55:43 -0500
Message-ID: <4CD7043D.5030306@cfl.rr.com>
Date: Sun, 07 Nov 2010 14:55:41 -0500
From: Phillip Susi <psusi@cfl.rr.com>
MIME-Version: 1.0
References: <4CD35D3E.5030200@cfl.rr.com>	<Pine.LNX.4.64.1011050022550.31032@bmsred.bmsi.com>	<4CD5F804.3040906@cfl.rr.com>
	<4CD6252A.9040003@spinn.net>
In-Reply-To: <4CD6252A.9040003@spinn.net>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] LVM + raid + san
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
To: allane@spinn.net, LVM general discussion and development <linux-lvm@redhat.com>

On 11/07/2010 12:03 AM, allan wrote:
> Have you considered using mdadm for the RAID configuration and lvm to
> carve it up?

As I said in my original message, I understand that is what most people 
do, but multiple servers can not have mdadm mount the same disks at the 
same time AFAIK.
