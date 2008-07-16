Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m6GFAf3e020690
	for <linux-lvm@redhat.com>; Wed, 16 Jul 2008 11:10:41 -0400
Received: from e5.ny.us.ibm.com (e5.ny.us.ibm.com [32.97.182.145])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m6GFASgr009790
	for <linux-lvm@redhat.com>; Wed, 16 Jul 2008 11:10:28 -0400
Received: from d01relay02.pok.ibm.com (d01relay02.pok.ibm.com [9.56.227.234])
	by e5.ny.us.ibm.com (8.13.8/8.13.8) with ESMTP id m6GFAM7p011876
	for <linux-lvm@redhat.com>; Wed, 16 Jul 2008 11:10:22 -0400
Received: from d01av04.pok.ibm.com (d01av04.pok.ibm.com [9.56.224.64])
	by d01relay02.pok.ibm.com (8.13.8/8.13.8/NCO v9.0) with ESMTP id
	m6GFA5ho121028
	for <linux-lvm@redhat.com>; Wed, 16 Jul 2008 11:10:05 -0400
Received: from d01av04.pok.ibm.com (loopback [127.0.0.1])
	by d01av04.pok.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id
	m6GFA57f009858
	for <linux-lvm@redhat.com>; Wed, 16 Jul 2008 11:10:05 -0400
Received: from malahal.beaverton.ibm.com (malahal.beaverton.ibm.com
	[9.47.17.130])
	by d01av04.pok.ibm.com (8.12.11.20060308/8.12.11) with ESMTP id
	m6GFA4Rr009843
	for <linux-lvm@redhat.com>; Wed, 16 Jul 2008 11:10:05 -0400
Date: Wed, 16 Jul 2008 08:10:04 -0700
From: malahal@us.ibm.com
Subject: Re: [linux-lvm] Re: Split LV mirror or something
Message-ID: <20080716151004.GA13989@us.ibm.com>
References: <bf6f43f40807160121j27df33c5o5135e1fb9fdd16f1@mail.gmail.com>
	<Pine.LNX.4.44.0807161020330.715-100000@bmsred.bmsi.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.44.0807161020330.715-100000@bmsred.bmsi.com>
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
> On Wed, 16 Jul 2008, Levy Abinajm Melero Sant'Anna wrote:
> 
> > > I have one LV with some critical data, and want to make a safe copy with
> > > less time possible of downtime. Could I make one mirror on a new PV
> > > (lvconvert -m1) and split this copy into a new LV or/and maybe split the VG
> > > into a new VG?
> 
> Why not take a snapshot, and copy that to an LV on new VG ?

More over, this is a better approach than an LVM mirror in your case.
