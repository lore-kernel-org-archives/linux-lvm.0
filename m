Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with SMTP id n5GED8Al029298
	for <linux-lvm@redhat.com>; Tue, 16 Jun 2009 10:13:08 -0400
Received: from fela.liber4e.com (fela.liber4e.com [208.77.96.130])
	by mx1.redhat.com (8.13.8/8.13.8) with SMTP id n5GECqcF011052
	for <linux-lvm@redhat.com>; Tue, 16 Jun 2009 10:12:53 -0400
Received: from [127.0.0.1] (fela.liber4e.com [127.0.0.1])
	(authenticated bits=0)
	by fela.liber4e.com (8.14.2/8.14.2) with ESMTP id n5GEB0Cg011327
	for <linux-lvm@redhat.com>; Tue, 16 Jun 2009 15:11:12 +0100
Message-ID: <4A37A746.2000006@liber4e.com>
Date: Tue, 16 Jun 2009 15:08:06 +0100
From: jose nuno neto <jose.neto@liber4e.com>
MIME-Version: 1.0
References: <9245306.1047171245156310508.JavaMail.servlet@kundenserver>
In-Reply-To: <9245306.1047171245156310508.JavaMail.servlet@kundenserver>
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] pvcreate --uuid and keep data
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

Hellos

I've got a error on vgdisplay saying that a physical volume is lost

vgdisplay --partial oracle
  Partial mode. Incomplete volume groups will be activated read-only.
  Couldn't find device with uuid '1dIe2G-QEtx-MGsI-DGF1-Lk10-nl8E-eg1Bb6'.


Checked the archive/backup metadata info and it's not up2date, so can't 
issue a vgcfgrestore, right?
I googled and found this aproach
pvcreate --uuid LOST ID
My question is, what about the date in the partiton? is it kept? no 
problemos with it?

Thanks
Jose


-- 
This message has been scanned for viruses and
dangerous content by MailScanner, and is
believed to be clean.
