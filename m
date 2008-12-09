Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id mB9L4Zo7017229
	for <linux-lvm@redhat.com>; Tue, 9 Dec 2008 16:04:35 -0500
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id mB9L4P60005126
	for <linux-lvm@redhat.com>; Tue, 9 Dec 2008 16:04:25 -0500
Date: Tue, 9 Dec 2008 16:04:23 -0500 (EST)
From: "Stuart D. Gathman" <stuart@bmsi.com>
Subject: Re: [linux-lvm] shift PV from disk to raid device?
In-Reply-To: <VA.000034fc.04d542d4@news.conactive.com>
Message-ID: <Pine.LNX.4.64.0812091604000.18598@bmsred.bmsi.com>
References: <VA.000034ec.0056c987@news.conactive.com>
	<493E48DE.3070705@redhat.com>
	<Pine.LNX.4.64.0812091146560.16428@bmsred.bmsi.com>
	<VA.000034f2.04473327@news.conactive.com>
	<493EB3A0.6020306@redhat.com> <VA.000034f4.0456d5b7@news.conactive.com>
	<Pine.LNX.4.64.0812091325290.17327@bmsred.bmsi.com>
	<VA.000034f7.04a27ead@news.conactive.com>
	<1228852584.32405.37.camel@firewall.xsintricity.com>
	<VA.000034fc.04d542d4@news.conactive.com>
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
To: maillists@conactive.com, LVM general discussion and development <linux-lvm@redhat.com>

On Tue, 9 Dec 2008, Kai Schaetzl wrote:

> Doug Ledford wrote on Tue, 09 Dec 2008 14:56:24 -0500:
> 
> > superblock
> 
> another question: this is not the same as the filesystem superblock, 
> right? e.g. "dumpe2fs -h /dev/mdn" shows me "Bad magic number in super-
> block" on all raid arrays that have LVM on them. That's to be expected, 
> right?

Yes, because they are PVs, not filesystems.

-- 
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
