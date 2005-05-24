Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j4OIV3O04454
	for <linux-lvm@redhat.com>; Tue, 24 May 2005 14:31:03 -0400
Received: from SMTPAVW1.corp.isib.net (mailb.rbcdain.com [199.250.13.151])
	by mx3.redhat.com (8.12.11/8.12.11) with SMTP id j4OIUvQh016563
	for <linux-lvm@redhat.com>; Tue, 24 May 2005 14:30:57 -0400
Received: from SMTPM1.corp.isib.net (unverified) by MSMP2.corp.isib.net 
	(Content Technologies SMTPRS 4.3.17) with ESMTP id 
	<T711b4ec615aaaf065d994@MSMP2.corp.isib.net> for <linux-lvm@redhat.com>;
	Tue, 24 May 2005 13:30:51 -0500
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Subject: RE: [linux-lvm] "pvchange --uuid" failed when PV is in use
Date: Tue, 24 May 2005 13:30:51 -0500
Message-ID: <2711988D405D2247BC9B82786F99E8E5066307@MAIL4.corp.isib.net>
From: "Page, Jennifer \(RBC Dain\)" <Jennifer.Page@rbcdain.com>
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
To: LVM general discussion and development <linux-lvm@redhat.com>

Please remove jennifer.page@rbcdain.com from distribution list. 

-----Original Message-----
From: linux-lvm-bounces@redhat.com [mailto:linux-lvm-bounces@redhat.com]
On Behalf Of Shinn'ya Hoshino
Sent: Tuesday, May 24, 2005 7:32 AM
To: linux-lvm@redhat.com
Subject: [linux-lvm] "pvchange --uuid" failed when PV is in use

Hello,

I tried to "pvchange --uuid /dev/sdc1" to change of PV UUID.
But FAILED to change PV UUID on PV metadata, only changed on VG
metadata. I'm trying to correct source code, please help.

When PV is orphan, "pvchange --uuid /dev/sdc1" changes PV UUID
successfully. At this time, pvchange calls pv_write(). But when PV is in
use by VG, pvchange only calls vg_write(), pv_write() is not called.

vg_write() does not have function to change PV metadata.
Therefore, probably pvchange needs to call pv_write() to write UUID into
PV metadata. But pv_write() is forbidden to call when PV is in use by
VG. LV is not mounted... Even if there was no LV, it failed.

Please teach me why it is forbidden.
If there is a method of allowing pv_write(), I want to try it.

BTW, I want to activate VG on raw-level duplicated PV. I look for this
ML. When edit lvm.conf and "pvchange --uuid" and vgrename, it turned out
that it is possible. However, if pvchange does not function correctly,
there is no how to adopt a measure.

Best Regards,

--
/* -------------------------------------------------------------
   Shinn'ya Hoshino     mailto:s-hoshino@vx.cnt.dnes.jp.nec.com
------------------------------------------------------------- */

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://www.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/



RBC Dain Rauscher does not accept buy, sell or cancel orders by e-mail, or any instructions by e-mail that would require your signature.  Information contained in this communication is not considered an official record of your account and does not supersede normal trade confirmations or statements.  Any information provided has been prepared from sources believed to be reliable but is not guaranteed, does not represent all available data necessary for making investment decisions and is for informational purposes only.

This e-mail may be privileged and/or confidential, and the sender does not waive any related rights and obligations.  Any distribution, use or copying of this e-mail or the information it contains by other than an intended recipient is unauthorized.  If you receive this e-mail in error, please advise me (by return e-mail or otherwise) immediately.

Information received by or sent from this system is subject to review by supervisory personnel, is retained and may be produced to regulatory authorities or others with a legal right to the information.
