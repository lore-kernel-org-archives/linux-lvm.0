Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.31])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F3BFB82464
	for <linux-lvm@redhat.com>; Wed, 26 Apr 2017 05:30:06 +0000 (UTC)
Received: from viruswall.wits.ac.za (viruswall.wits.ac.za [146.141.15.4])
	by mx1.redhat.com (Postfix) with ESMTP id CCD4CC04B926
	for <linux-lvm@redhat.com>; Wed, 26 Apr 2017 05:30:00 +0000 (UTC)
Received: from [127.0.0.1] (helo=imss.wits.ac.za)
	by viruswall.wits.ac.za with esmtp (Exim 4.63)
	(envelope-from <Scott.Hazelhurst@wits.ac.za>) id 1d3FWY-0005n1-E7
	for linux-lvm@redhat.com; Wed, 26 Apr 2017 07:29:58 +0200
Received: from imss.wits.ac.za (localhost.localdomain [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id 54D2367CD2D
	for <linux-lvm@redhat.com>; Wed, 26 Apr 2017 07:29:58 +0200 (SAST)
Received: from Castor.ds.WITS.AC.ZA (castor.ds.wits.ac.za [146.141.11.221])
	by imss.wits.ac.za (Postfix) with ESMTP id 49EF667CD24
	for <linux-lvm@redhat.com>; Wed, 26 Apr 2017 07:29:58 +0200 (SAST)
From: Scott Hazelhurst <Scott.Hazelhurst@wits.ac.za>
Date: Wed, 26 Apr 2017 05:29:57 +0000
Message-ID: <20A67DCE-6D87-499B-8AC5-021747229FFB@wits.ac.za>
References: <mailman.12901.1493180509.7444.linux-lvm@redhat.com>
In-Reply-To: <mailman.12901.1493180509.7444.linux-lvm@redhat.com>
Content-Language: en-US
Content-ID: <592AEB40643A854680E8EC3FAFE27233@wits.ac.za>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] VG won't activate -- dm problem
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
To: "linux-lvm@redhat.com" <linux-lvm@redhat.com>


A couple of days ago I raised the problem of not being able to activate a volume group, and getting an error message  device-mapper: reload ioctl on (252:6) failed: Device or resource busy.

In case, this is of help to anyone else, I found the problem. The PV for the volume group was /dev/sdc. About 18 months ago, it was part of a software raid volume (not using LVM). I decided not to run RAID and disabled it. All was fine for a long time through various OS updates and machine reboots. However, after I upgraded Ubuntu from 14.04 to 16.04, something got reactivated in some way. I presume I did something wrong originally. [As an aside I have checked and another of my machines that went through the same update had the same problem]

So here the error message was relatively spot on. I was distracted by the 252:6 part of the message and the absence of /dev/dm-6. The VG could not be activated because the raid was managing it. I used mdadm to stop and delete the RAID and restarted and all is well.

Scott



<table width="100%" border="0" cellspacing="0" cellpadding="0" style="width:100%;"> 
<tr>
<td align="left" style="text-align:justify;"><font face="arial,sans-serif" size="1" color="#999999"><span style="font-size:11px;">This communication is intended for the addressee only. It is confidential. If you have received this communication in error, please notify us immediately and destroy the original message. You may not copy or disseminate this communication without the permission of the University. Only authorised signatories are competent to enter into agreements on behalf of the University and recipients are thus advised that the content of this message may not be legally binding on the University and may contain the personal views and opinions of the author, which are not necessarily the views and opinions of The University of the Witwatersrand, Johannesburg. All agreements between the University and outsiders are subject to South African Law unless the University agrees in writing to the contrary. </span></font></td>
</tr>
</table
