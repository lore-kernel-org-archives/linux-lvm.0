Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i1K8LXi30698
	for <linux-lvm@redhat.com>; Fri, 20 Feb 2004 03:21:33 -0500
Received: from mail.gmx.net (pop.gmx.de [213.165.64.20])
	by mx1.redhat.com (8.11.6/8.11.6) with SMTP id i1K8LWb23299
	for <linux-lvm@redhat.com>; Fri, 20 Feb 2004 03:21:32 -0500
From: "Stefan Jenkner" <jenkner@gmx.de>
MIME-Version: 1.0
References: <20040219121317.GB32407@redhat.com>
Subject: Re: [linux-lvm] Lost free PV  -> error reading VG
Message-ID: <12990.1077265287@www68.gmx.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: linux-lvm-admin@redhat.com
Errors-To: linux-lvm-admin@redhat.com
Reply-To: linux-lvm@redhat.com
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Post: <mailto:linux-lvm@redhat.com>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm/>
Date: Fri Feb 20 03:20:27 2004
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@redhat.com

> [...]
> 
> lvm2 tools are able to reduce VGs by missing PVs.
> Fetch and build them and run "vgreduce --removemissing debian"

Thanks a lot!
I did it the LVM2-way!

Regards,
 Stefan

-- 
GMX ProMail (250 MB Mailbox, 50 FreeSMS, Virenschutz, 2,99 EUR/Monat...)
jetzt 3 Monate GRATIS + 3x DER SPIEGEL +++ http://www.gmx.net/derspiegel +++
