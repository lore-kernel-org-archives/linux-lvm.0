Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l2A0MJOb013441
	for <linux-lvm@redhat.com>; Fri, 9 Mar 2007 19:22:19 -0500
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx1.redhat.com (8.13.1/8.13.1) with ESMTP id l2A0MIHj006915
	for <linux-lvm@redhat.com>; Fri, 9 Mar 2007 19:22:18 -0500
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.13.6/8.13.6) with ESMTP id l2A0MC7w027108
	(version=TLSv1/SSLv3 cipher=EDH-RSA-DES-CBC3-SHA bits=168 verify=NO)
	for <linux-lvm@redhat.com>; Fri, 9 Mar 2007 19:22:13 -0500
Received: from localhost (localhost [127.0.0.1])
	by bmsred.bmsi.com (8.13.5/8.13.5) with ESMTP id l2A0MCB3019719
	for <linux-lvm@redhat.com>; Fri, 9 Mar 2007 19:22:12 -0500
Date: Fri, 9 Mar 2007 19:22:12 -0500 (EST)
From: "Stuart D. Gathman" <stuart@bmsi.com>
Subject: Re: [linux-lvm] LVM and Windows
In-Reply-To: <08A9A3213527A6428774900A80DBD8D8039FFEE3@xmb-sjc-222.amer.cisco.com>
Message-ID: <Pine.LNX.4.44.0703091920010.19327-100000@bmsred.bmsi.com>
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

> If I format a FAT file system on top of a logic volume created by using
> LVM, will this be accessible from Windows? In other words, does Windows
> understand LVM?

Short answer: No

Long answer: Windows doesn't understand Linux LVM.  However, it doesn't
need to if:

 a) You are running Windows in a virtual machine with the LV as a virtual disk.
    (i.e. VMWare)
 b) You are accessing files in the LV via a network file system such as CIFS.
    (i.e. samba)

-- 
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
