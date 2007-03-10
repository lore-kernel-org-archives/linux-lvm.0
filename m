Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l2A0lpHW001829
	for <linux-lvm@redhat.com>; Fri, 9 Mar 2007 19:47:51 -0500
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx2.redhat.com (8.13.1/8.13.1) with ESMTP id l2A0loKW003426
	for <linux-lvm@redhat.com>; Fri, 9 Mar 2007 19:47:50 -0500
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.13.6/8.13.6) with ESMTP id l2A0liKx027567
	(version=TLSv1/SSLv3 cipher=EDH-RSA-DES-CBC3-SHA bits=168 verify=NO)
	for <linux-lvm@redhat.com>; Fri, 9 Mar 2007 19:47:44 -0500
Received: from localhost (localhost [127.0.0.1])
	by bmsred.bmsi.com (8.13.5/8.13.5) with ESMTP id l2A0linJ019798
	for <linux-lvm@redhat.com>; Fri, 9 Mar 2007 19:47:44 -0500
Date: Fri, 9 Mar 2007 19:47:44 -0500 (EST)
From: "Stuart D. Gathman" <stuart@bmsi.com>
Subject: RE: [linux-lvm] LVM and Windows
In-Reply-To: <08A9A3213527A6428774900A80DBD8D8039FFF76@xmb-sjc-222.amer.cisco.com>
Message-ID: <Pine.LNX.4.44.0703091942380.19788-100000@bmsred.bmsi.com>
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

On Fri, 9 Mar 2007, Lin Shen (lshen) wrote:

> I'm not talking about Samba. If I create a FAT file system on top of
> logic volume on a piece of Compact Flash in a Linux box, can I pull out
> the Compact Flash and insert it into a Windows box and use it? I know
> this should work if the FAT file system is created on a hard partition
> instead of a logic volume?

Short answer: no

Long answer: While Windows does not directly understand Linux LVM, there are
ways to hide LVM from Windows via another software layer, for e.g. a 
virtual machine or a driver.  So depending on what exactly you mean by "Windows
box", you could be able to read the LV.  But a bare metal unmodified install of
Windows can not read the LV.

-- 
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
