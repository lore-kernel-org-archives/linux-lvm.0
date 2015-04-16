Received: from mx1.redhat.com (ext-mx15.extmail.prod.ext.phx2.redhat.com
	[10.5.110.20])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t3G7pdtP011399
	for <linux-lvm@redhat.com>; Thu, 16 Apr 2015 03:51:39 -0400
Received: from img2.mail.strath.ac.uk (img2.mail.strath.ac.uk [130.159.228.47])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t3G7pWD5010161
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Thu, 16 Apr 2015 03:51:34 -0400
Received: from mailread-e.mail.strath.ac.uk ([130.159.16.86]:34292
	helo=cc-mail-hub.mail.strath.ac.uk)
	by campus-mail-hub2.mail.strath.ac.uk with esmtp (Exim 4.70 #0
	c=4.48.cmh) id 1YieaA-0006Ii-54
	for <linux-lvm@redhat.com> (return-path <ian.gordon@strath.ac.uk>);
	Thu, 16 Apr 2015 07:51:30 +0000
Received: from pc-ig2.cis.strath.ac.uk ([130.159.184.85]:55085)
	by cc-mail-hub.mail.strath.ac.uk with esmtpsa 
	(Cipher TLSv1:AES128-SHA:128) (Exim 4.69 #1)
	id 1Yiea9-00063A-VZ with auth_plain_dc
	for <linux-lvm@redhat.com> (return-path <ian.gordon@strath.ac.uk>);
	Thu, 16 Apr 2015 07:51:29 +0000
Message-ID: <552F6A01.7080003@strath.ac.uk>
Date: Thu, 16 Apr 2015 08:51:29 +0100
From: Ian Gordon <ian.gordon@strath.ac.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] lvm thinpool metadata spare resizing
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


Hello,

When I manually resized my thinpool's metdata lv with

lvextend -L +200M vg/tp_tmeta

it did not resize the lvol0_pmspare metadata spare lv.
Is this a problem for automatic recovery (or am I worrying too much)?

I can't manually resize the metadata spare lv because I get an error
"Can't resize internal logical volume lvol0_pmspare". Is there a way of
recreating the metadata spare lv?

Cheers,

-- 
Ian Gordon,
Department of Computer and Information Sciences,
University of Strathclyde.
Tel: 0141 548 3592    Fax: 0141 548 4523        Room: LT1307
The University of Strathclyde is a charitable body, registered in
Scotland, with registration number SC015263.
