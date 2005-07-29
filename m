Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j6TLVMV00601
	for <linux-lvm@redhat.com>; Fri, 29 Jul 2005 17:31:22 -0400
Received: from mail55.messagelabs.com (mail55.messagelabs.com [216.82.240.35])
	by mx3.redhat.com (8.13.1/8.13.1) with SMTP id j6TLVBZU007937
	for <linux-lvm@redhat.com>; Fri, 29 Jul 2005 17:31:15 -0400
Received: (from b034547 [10.88.9.110])
	by smtp.boscovs.com (SAVSMTP 3.1.7.47) with SMTP id
	M2005072917333317641
	for <linux-lvm@redhat.com>; Fri, 29 Jul 2005 17:33:33 -0400
Message-ID: <00d101c59484$91b72520$6e09580a@b034547>
From: "Rob Schwartz" <rschwartz@boscovs.com>
References: <42EA9F25.20608@deadhookers.org>
Subject: Re: [linux-lvm] best way to make lv with 3 500G luns
Date: Fri, 29 Jul 2005 17:29:14 -0400
MIME-Version: 1.0
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
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="response"
To: LVM general discussion and development <linux-lvm@redhat.com>

Have you tried the vgcreate with the -v  (for verbose) or -d  (for debug) 
options?
----- Original Message ----- 
From: "Eric Wagar" <eric@deadhookers.org>
To: "LVM" <linux-lvm@redhat.com>
Sent: Friday, July 29, 2005 5:27 PM
Subject: [linux-lvm] best way to make lv with 3 500G luns


> What are the steps to create a volume comprised of 3 500G SGI TP9500 LUNS 
> on SLES9?
>
> I'm only able to get as far as pvcreate.  Afterwards, I am unable to 
> create a visible vg.  By that I mean, I receive no error when I issue 
> vgcreate, but I am unable to vgdisplay the new vg.
>
> This is on SLES9/SN2 with two module SGI A350 and using two FC paths.
>
> thanks
> eric
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 
