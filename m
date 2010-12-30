Received: from mx1.redhat.com (ext-mx02.extmail.prod.ext.phx2.redhat.com
	[10.5.110.6])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id oBUJCUcb019524
	for <linux-lvm@redhat.com>; Thu, 30 Dec 2010 14:12:30 -0500
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id oBUJCKWZ008455
	for <linux-lvm@redhat.com>; Thu, 30 Dec 2010 14:12:20 -0500
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.14.3/8.14.3) with ESMTP id oBUJCJOA015939
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Thu, 30 Dec 2010 14:12:19 -0500
Received: from bmsred (bmsred [192.168.9.50])
	by bmsred.bmsi.com (8.14.3/8.14.3) with ESMTP id oBUJCJBY023507
	for <linux-lvm@redhat.com>; Thu, 30 Dec 2010 14:12:19 -0500
Date: Thu, 30 Dec 2010 14:12:19 -0500 (EST)
From: "Stuart D. Gathman" <stuart@bmsi.com>
In-Reply-To: <4D1BF8DF.20908@shiftmail.org>
Message-ID: <Pine.LNX.4.64.1012301402010.22982@bmsred.bmsi.com>
References: <4D1A9FAF.6050401@shiftmail.org> <4D1B3F6A.4070309@shiftmail.org>
	<Pine.LNX.4.64.1012292136500.19697@bmsred.bmsi.com>
	<4D1BF8DF.20908@shiftmail.org>
MIME-Version: 1.0
Subject: Re: [linux-lvm] pvmove painfully slow on parity RAID
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

On Thu, 30 Dec 2010, Spelic wrote:

> Also there is still the mystery of why times appear *randomly* related to the
> number of devices, chunk sizes, and stripe sizes! if the rmw cycle was the
> culprit, how come I see:
> raid5, 4 devices, 16384k chunk: 41sec (4.9MB/sec)
> raid5, 6 device, 4096k chunk: 2m18sec ?!?! (1.44 MB/sec!?)
> the first has much larger stripe size of 49152K , the second has 20480K !

Ok, next theory.  Pvmove works by allocating a mirror for each
contiguous segment of the source LV, update metadata (how many metadata
copies do you have?), sync mirror, update metadata and allocate and sync
next segment until finished. 

Pvmove will be fastest when the source LV has a single contiguous chunk.

If you restored the metadata after every test, then the variation by
dest PV would blow this theory.  But if not, then the slow pvmoves would
be for fragmented source LVs.  The metadata updates between every
segment are rather expensive (but necessary).

-- 
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
