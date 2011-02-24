Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p1O0Wnt9006159
	for <linux-lvm@redhat.com>; Wed, 23 Feb 2011 19:32:49 -0500
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p1O0WdGs014748
	for <linux-lvm@redhat.com>; Wed, 23 Feb 2011 19:32:39 -0500
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.14.3/8.14.3) with ESMTP id p1O0W68n007160
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Wed, 23 Feb 2011 19:32:10 -0500
Received: from bmsred (bmsred [192.168.9.50])
	by bmsred.bmsi.com (8.14.3/8.14.3) with ESMTP id p1O0W1nN017933
	for <linux-lvm@redhat.com>; Wed, 23 Feb 2011 19:32:02 -0500
Date: Wed, 23 Feb 2011 19:32:01 -0500 (EST)
From: "Stuart D. Gathman" <stuart@bmsi.com>
In-Reply-To: <4D65A1A9.1040205@abpni.co.uk>
Message-ID: <Pine.LNX.4.64.1102231929520.17901@bmsred.bmsi.com>
References: <4D64FF3C.6080602@abpni.co.uk> <1298466573.19562.147.camel@ubuntu>
	<4D65124C.1070505@abpni.co.uk> <1298470564.19562.150.camel@ubuntu>
	<4D651735.1000802@abpni.co.uk>
	<20110223101259.77143753@bettercgi.com>
	<4D653BEF.5010600@abpni.co.uk>
	<Pine.LNX.4.64.1102231245550.14373@bmsred.bmsi.com>
	<Pine.LNX.4.64.1102231304240.14448@bmsred.bmsi.com>
	<4D654FBD.8030504@abpni.co.uk> <4D655459.6050806@gmail.com>
	<Pine.LNX.4.64.1102231434260.14448@bmsred.bmsi.com>
	<4D656817.6060900@gmail.com>
	<Pine.LNX.4.64.1102231529030.16359@bmsred.bmsi.com>
	<4D6572C0.6070008@abpni.co.uk>
	<Pine.LNX.4.64.1102231813180.17476@bmsred.bmsi.com>
	<4D65A1A9.1040205@abpni.co.uk>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Snapshots and disk re-use
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

On Thu, 24 Feb 2011, Jonathan Tripathy wrote:

> So I'm guessing then, that when a snapshot is created for an origin, then
> there are 2 physical copies of the data on disk? (Albeit only one is
> accessible at the regular filesystem level)

NO, NO, NO.  There is still only *one* physical copy of the data
after creating a snapshot.  You have simply created a "branch point"
which can now diverge as each branch is written to.

-- 
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
