Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m6KMUGob000571
	for <linux-lvm@redhat.com>; Sun, 20 Jul 2008 18:30:16 -0400
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m6KMU5nW017214
	for <linux-lvm@redhat.com>; Sun, 20 Jul 2008 18:30:05 -0400
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.13.6/8.13.6) with ESMTP id m6KMTxgH001924
	for <linux-lvm@redhat.com>; Sun, 20 Jul 2008 18:29:59 -0400
Received: from localhost (localhost [127.0.0.1])
	by bmsred.bmsi.com (8.13.5/8.13.6) with ESMTP id m6KMTxEw006566
	for <linux-lvm@redhat.com>; Sun, 20 Jul 2008 18:29:59 -0400
Date: Sun, 20 Jul 2008 18:29:59 -0400 (EDT)
From: "Stuart D. Gathman" <stuart@bmsi.com>
Subject: Re: [linux-lvm] Re: Split LV mirror or something
In-Reply-To: <bf6f43f40807200925p5bb2d9a2xc22a7ff323ced6ce@mail.gmail.com>
Message-ID: <Pine.LNX.4.44.0807201827410.6462-100000@bmsred.bmsi.com>
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

On Sun, 20 Jul 2008, Levy Abinajm Melero Sant'Anna wrote:

> I was thinking about snapshot and copy, but it looks like "less
> professional" than split a LV mirror.
> I can explain: When I copy is difficult to say that I kept the same
> permissions and ownership; Different of a mirror, that the process really
> guarantee by itself that the data is still with the same characteristic.

What kind of permissions are you talking about?  'dd' (or your favorite
raw block copy) does the same thing as a mirror.  It just copies raw blocks
verbatim.  No filesystem is involved.

-- 
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
