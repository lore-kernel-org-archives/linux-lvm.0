Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.13])
	by int-mx05.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o3LL2WnS025274
	for <linux-lvm@redhat.com>; Wed, 21 Apr 2010 17:02:33 -0400
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o3LL2Kxl007712
	for <linux-lvm@redhat.com>; Wed, 21 Apr 2010 17:02:21 -0400
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.14.3/8.14.3) with ESMTP id o3LL2JLP018180
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Wed, 21 Apr 2010 17:02:20 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
	by bmsred.bmsi.com (8.14.3/8.14.3) with ESMTP id o3LL2Jvr024669
	for <linux-lvm@redhat.com>; Wed, 21 Apr 2010 17:02:19 -0400
Date: Wed, 21 Apr 2010 17:02:19 -0400 (EDT)
From: "Stuart D. Gathman" <stuart@bmsi.com>
In-Reply-To: <4BCE910C.5020108@tlinx.org>
Message-ID: <Pine.LNX.4.64.1004211659240.24588@bmsred.bmsi.com>
References: <4BCE910C.5020108@tlinx.org>
MIME-Version: 1.0
Subject: Re: [linux-lvm] volume developing problems even though should be
 static...
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Tue, 20 Apr 2010, Linda A. Walsh wrote:

> What I don't get and what worries me a fair amount are the I/O errors --
> any idea what's going on and how I shoudl fix this?

Looks dm-1 is a snapshot that is full.  Did you edit lvs output?
Perhaps the snapshot was removed, but something still has it open.

-- 
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
