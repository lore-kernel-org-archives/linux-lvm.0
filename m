Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l9VI0Qc2014112
	for <linux-lvm@redhat.com>; Wed, 31 Oct 2007 14:00:26 -0400
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id l9VI0P6A027253
	for <linux-lvm@redhat.com>; Wed, 31 Oct 2007 14:00:25 -0400
Date: Wed, 31 Oct 2007 14:00:19 -0400 (EDT)
From: "Stuart D. Gathman" <stuart@bmsi.com>
Subject: Re: [linux-lvm] LVM snapshot limits
In-Reply-To: <4727B561.50206@redhat.com>
Message-ID: <Pine.LNX.4.44.0710311359330.10401-100000@bmsred.bmsi.com>
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

On Tue, 30 Oct 2007, Milan Broz wrote:

> > There is however one issue that probably needs attention.  If I create
> > snapshots until I get an error (about 200 snaps), remove them, and
> > repeat the creation/removal multiple times it is possible to destroy the
> > LVM metadata.  When this happens pvscan shows that there is no VG

Cool!  Great torture test!  BwaHaHaHa...

-- 
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
