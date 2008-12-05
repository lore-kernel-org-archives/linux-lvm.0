Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id mB52toU7018393
	for <linux-lvm@redhat.com>; Thu, 4 Dec 2008 21:55:50 -0500
Received: from mail.bucoks.com (wsip-70-167-48-6.ks.ks.cox.net [70.167.48.6])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id mB52rqPj028189
	for <linux-lvm@redhat.com>; Thu, 4 Dec 2008 21:53:53 -0500
Received: from mail.bucoks.com (imss03.bucoks [127.0.0.1])
	by postfix.imss70 (Postfix) with ESMTP id A2227130111
	for <linux-lvm@redhat.com>; Thu,  4 Dec 2008 20:53:52 -0600 (CST)
Received: from EXCS01.BUCOKS (excs01.bucoks [192.168.0.40])
	by mail.bucoks.com (Postfix) with ESMTP id 901291300D4
	for <linux-lvm@redhat.com>; Thu,  4 Dec 2008 20:53:52 -0600 (CST)
content-class: urn:content-classes:message
MIME-Version: 1.0
Subject: RE: [linux-lvm] volume group device nodes are left behind
	afterremoving a san snapshot
Date: Thu, 4 Dec 2008 20:53:52 -0600
Message-ID: <8D07631D47C3CB4F867AD7BCF07D5C232CAE@excs01.bucoks>
References: <8D07631D47C3CB4F867AD7BCF07D5C232CAD@excs01.bucoks>
	<20081205022830.GV26097@agk.fab.redhat.com>
From: "James A. Dinkel" <jdinkel@bucoks.com>
Content-Transfer-Encoding: 8bit
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

Well dmsetup info -c did include this:
vgname-lvname 253   4 L--w    1    4      0 LVM-<snip>

but I went ahead and deleted the /dev/vgname and ran vgmknodes, which
did not put it back.  I was then able to recreate the volume group and
everything appears to be working normally.

Thanks,
James Dinkel


-----Original Message-----
From: linux-lvm-bounces@redhat.com [mailto:linux-lvm-bounces@redhat.com]
On Behalf Of Alasdair G Kergon
Sent: Thursday, December 04, 2008 8:29 PM
To: LVM general discussion and development
Subject: Re: [linux-lvm] volume group device nodes are left behind
afterremoving a san snapshot

The bottom line is whether /dev/vgname is still in use or not.
Use dmsetup info -c to check for any devices with names beginning
vgname.

If you're sure it isn't there, try removing the directory /dev/vgname by
hand
and check vgmknodes doesn't put it back.

Alasdair
-- 
agk@redhat.com

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://www.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
