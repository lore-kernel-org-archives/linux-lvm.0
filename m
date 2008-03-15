Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m2FMXlIe012992
	for <linux-lvm@redhat.com>; Sat, 15 Mar 2008 18:33:47 -0400
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m2FMXHRG001259
	for <linux-lvm@redhat.com>; Sat, 15 Mar 2008 18:33:17 -0400
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.13.6/8.13.6) with ESMTP id m2FMXCJ6003701
	for <linux-lvm@redhat.com>; Sat, 15 Mar 2008 18:33:12 -0400
Received: from localhost (localhost [127.0.0.1])
	by bmsred.bmsi.com (8.13.5/8.13.6) with ESMTP id m2FMXC07002258
	for <linux-lvm@redhat.com>; Sat, 15 Mar 2008 18:33:12 -0400
Date: Sat, 15 Mar 2008 18:33:12 -0400 (EDT)
From: "Stuart D. Gathman" <stuart@bmsi.com>
Subject: Re: [linux-lvm] how to recover lvm after OS re-install
In-Reply-To: <990512.92515.qm@web58305.mail.re3.yahoo.com>
Message-ID: <Pine.LNX.4.44.0803151832180.2199-100000@bmsred.bmsi.com>
MIME-Version: 1.0
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Sat, 15 Mar 2008, lemon lemon wrote:

> I have backup of /etc/lvm directory from the previous OS setup. 

If it is lvm2, you can look at the metadata with a text editor to check
which disk/partition your VG was on.

-- 
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
