Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p8CL9ISN009872
	for <linux-lvm@redhat.com>; Mon, 12 Sep 2011 17:09:18 -0400
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p8CL9EnQ007075
	for <linux-lvm@redhat.com>; Mon, 12 Sep 2011 17:09:14 -0400
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.14.3/8.14.3) with ESMTP id p8CL8sUW020327
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Mon, 12 Sep 2011 17:08:54 -0400
Received: from bmsred (bmsred [192.168.9.50])
	by bmsred.bmsi.com (8.14.3/8.14.3) with ESMTP id p8CL8rKG019155
	for <linux-lvm@redhat.com>; Mon, 12 Sep 2011 17:08:53 -0400
Date: Mon, 12 Sep 2011 17:08:53 -0400 (EDT)
From: "Stuart D. Gathman" <stuart@bmsi.com>
In-Reply-To: <4E6E6BDE.1040301@unfoo.net>
Message-ID: <alpine.LRH.2.00.1109121706310.19095@bmsred.bmsi.com>
References: <4E6E6BDE.1040301@unfoo.net>
MIME-Version: 1.0
Subject: Re: [linux-lvm] harddisk dies while pvmove is in progress
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

On Mon, 12 Sep 2011, Robert Sch?ftner wrote:

> So, LV homevideo is definitely lost, but shares seems to be OK, modulo the 
> "running"/interrupted pvmove. Is there a way to clean up this mess without 
> creating another LV and copying the contents of shares over?

Remove the missing PV as the error message suggested.  Unless you
have some hope of resurrecting it (has had success with connecting
deceased drive via USB and putting in freezer to run it long enough
to recover a little more data), it is gone now.

--
 	      Stuart D. Gathman <stuart@bmsi.com>
     Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
