Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m18BUmBT008421
	for <linux-lvm@redhat.com>; Fri, 8 Feb 2008 06:30:48 -0500
Received: from mail155.messagelabs.com (mail155.messagelabs.com
	[85.158.138.35])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id m18BUF77010496
	for <linux-lvm@redhat.com>; Fri, 8 Feb 2008 06:30:15 -0500
Content-class: urn:content-classes:message
MIME-Version: 1.0
Subject: RE: [linux-lvm] LVM and RAID
Date: Fri, 8 Feb 2008 11:30:08 -0000
Message-ID: <A78DB34D00374344A0AB65B6523C05DC02AFC437@marsden.win.datacash.com>
In-Reply-To: <47AC3520.3050608@gmail.com>
References: <47AC3520.3050608@gmail.com>
From: "Gerrard Geldenhuis" <Gerrard.Geldenhuis@datacash.com>
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

Hi Thomas,
You most certainly can, however I believe your question to be more
relevant to a xen mailing list. Might I suggest fedora-xen@redhat.com. I
don't have the subscribing page to hand right now...

Regards

> -----Original Message-----
> From: linux-lvm-bounces@redhat.com
[mailto:linux-lvm-bounces@redhat.com]
> On Behalf Of Thomas Bellembois
> Sent: 08 February 2008 10:55
> To: linux-lvm@redhat.com
> Subject: [linux-lvm] LVM and RAID
> 
> Hello,
> 
> I wonder if we can use RAID (hard) under LVM for Xen domU.
> What kind of RAID is recommanded ?
> 
> I was thinking about the following configuration:
> - RAID 1 (two 70 GB disks) for the dom0
> - RAID 5 (three 285 GB disks) for domU on LVM partitions
> 
> Any idea ?
> 
> Regards,
> 
> Thomas
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
