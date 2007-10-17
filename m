Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l9HGB2N2007153
	for <linux-lvm@redhat.com>; Wed, 17 Oct 2007 12:11:02 -0400
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id l9HGB1dh026770
	for <linux-lvm@redhat.com>; Wed, 17 Oct 2007 12:11:01 -0400
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.13.6/8.13.6) with ESMTP id l9HGAp3j006136
	for <linux-lvm@redhat.com>; Wed, 17 Oct 2007 12:10:56 -0400
Received: from localhost (localhost [127.0.0.1])
	by bmsred.bmsi.com (8.13.5/8.13.5) with ESMTP id l9HGAp8G030833
	for <linux-lvm@redhat.com>; Wed, 17 Oct 2007 12:10:51 -0400
Date: Wed, 17 Oct 2007 12:10:51 -0400 (EDT)
From: "Stuart D. Gathman" <stuart@bmsi.com>
Subject: Re: [linux-lvm] new LVM2 feature?
In-Reply-To: <1192636222.4275.97.camel@hermosa.morrealenet>
Message-ID: <Pine.LNX.4.44.0710171210050.30797-100000@bmsred.bmsi.com>
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

On Wed, 17 Oct 2007, Peter W. Morreale wrote:

> The idea is COW LV stacking below a primary LV.  The intent is to allow
> a number of 'users' the ability to share a common dataset, and
> independently save their changes to to a 'private' LV.    

How does this differ from rw snapshots?

-- 
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
