Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p3CNIC0T016413
	for <linux-lvm@redhat.com>; Tue, 12 Apr 2011 19:18:12 -0400
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p3CNI8hI011127
	for <linux-lvm@redhat.com>; Tue, 12 Apr 2011 19:18:08 -0400
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.14.3/8.14.3) with ESMTP id p3CNI6Tw016318
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Tue, 12 Apr 2011 19:18:06 -0400
Received: from bmsred (bmsred [192.168.9.50])
	by bmsred.bmsi.com (8.14.3/8.14.3) with ESMTP id p3CNI51C023199
	for <linux-lvm@redhat.com>; Tue, 12 Apr 2011 19:18:05 -0400
Date: Tue, 12 Apr 2011 19:18:05 -0400 (EDT)
From: "Stuart D. Gathman" <stuart@bmsi.com>
In-Reply-To: <slrniq9cgq.mna.faheem@Chrestomanci.home.earth>
Message-ID: <alpine.LRH.2.00.1104121916450.23161@bmsred.bmsi.com>
References: <alpine.DEB.2.00.1104121207130.11425@orwell.homelinux.org>
	<alpine.LRH.2.00.1104121214120.19728@bmsred.bmsi.com>
	<slrniq9cgq.mna.faheem@Chrestomanci.home.earth>
MIME-Version: 1.0
Subject: Re: [linux-lvm] lvm devices under /dev/mapper missing
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
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Tue, 12 Apr 2011, Faheem Mitha wrote:

>> You might need "vgchange -ay myvg".
>
> This activates volume groups. Is this the problem, and is so, why? I
> thought the issue was that something had deleted my symbolic links
> under /dev/mapper. Still no idea why.

One of the things activating a VG does is create the symlinks in /dev/mapper.

--
 	      Stuart D. Gathman <stuart@bmsi.com>
     Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
