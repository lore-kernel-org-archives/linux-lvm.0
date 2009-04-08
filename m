Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n38DBbYE001585
	for <linux-lvm@redhat.com>; Wed, 8 Apr 2009 09:11:37 -0400
Received: from oceanic.CalvaEDI.COM (oceanic.CalvaEDI.COM [81.252.197.184])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n38DBJBP013112
	for <linux-lvm@redhat.com>; Wed, 8 Apr 2009 09:11:19 -0400
Received: from f.baltic (baltic.CalvaEDI.COM [192.168.6.66])
	(authenticated (0 bits))
	by oceanic.CalvaEDI.COM (8.11.1-20030923/8.11.1/6.31) with ESMTP id
	n38DBHr24921
	(using TLSv1/SSLv3 with cipher RC4-MD5 (128 bits) verified NO)
	for <linux-lvm@redhat.com>; Wed, 8 Apr 2009 15:11:18 +0200 (CEST)
Message-ID: <49DCA275.8070203@Calva.COM>
Date: Wed, 08 Apr 2009 15:11:17 +0200
From: John Hughes <john@Calva.COM>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Will LVM2 ever be able to do striped mirrors "raid 10"?
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
To: linux-lvm@redhat.com

                if (lp->stripes > 1) {
                        log_error("mirrors and stripes are currently "
                                  "incompatible");
                        return 0;
                }

Should I just stick with mdadm for my mirroring and striping needs?
