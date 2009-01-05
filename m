Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n05K9ceU029988
	for <linux-lvm@redhat.com>; Mon, 5 Jan 2009 15:09:38 -0500
Received: from e8.ny.us.ibm.com (e8.ny.us.ibm.com [32.97.182.138])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id n05K8LLo028414
	for <linux-lvm@redhat.com>; Mon, 5 Jan 2009 15:08:21 -0500
Received: from d01relay04.pok.ibm.com (d01relay04.pok.ibm.com [9.56.227.236])
	by e8.ny.us.ibm.com (8.13.1/8.13.1) with ESMTP id n05K2hFP021551
	for <linux-lvm@redhat.com>; Mon, 5 Jan 2009 15:02:43 -0500
Received: from d01av03.pok.ibm.com (d01av03.pok.ibm.com [9.56.224.217])
	by d01relay04.pok.ibm.com (8.13.8/8.13.8/NCO v9.1) with ESMTP id
	n05K8Kcv186044
	for <linux-lvm@redhat.com>; Mon, 5 Jan 2009 15:08:20 -0500
Received: from d01av03.pok.ibm.com (loopback [127.0.0.1])
	by d01av03.pok.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id
	n05K8KOA014447
	for <linux-lvm@redhat.com>; Mon, 5 Jan 2009 15:08:20 -0500
Received: from malahal.localdomain (malahal.beaverton.ibm.com [9.47.17.130])
	by d01av03.pok.ibm.com (8.12.11.20060308/8.12.11) with ESMTP id
	n05K8Kn9014438
	for <linux-lvm@redhat.com>; Mon, 5 Jan 2009 15:08:20 -0500
Date: Mon, 5 Jan 2009 12:08:19 -0800
From: malahal@us.ibm.com
Subject: Re: [linux-lvm] LVM2 on-disk layout
Message-ID: <20090105200819.GA23624@us.ibm.com>
References: <ffa0f8300901050222y2083fbb1pbbc4bdb5c10aeb5a@mail.gmail.com>
	<Pine.LNX.4.64.0901051346580.508@bmsred.bmsi.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.64.0901051346580.508@bmsred.bmsi.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

Stuart D. Gathman [stuart@bmsi.com] wrote:
> > 3) Why the metadata inside MDA wraps around, instead of the offset
> > pointing to the start of metadata?
> 
> Someone else?

Probably because when something bad happens while changing the metadata,
you want to go back to the old state. To preserve the old state, you
don't want to wipe the old metadata. You need offset other than the
start of the metadata! Circular buffer is an optimal solution to
implement this, I guess.
