Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id iAFHpur06563
	for <linux-lvm@redhat.com>; Mon, 15 Nov 2004 12:51:56 -0500
Received: from mail.o2w.nl (postfix@mail.o2w.nl [213.227.141.209])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id iAFHpoEs010708
	for <linux-lvm@redhat.com>; Mon, 15 Nov 2004 12:51:51 -0500
Date: Mon, 15 Nov 2004 18:51:49 +0100
From: Jelle Herold <wires@o2w.nl>
Subject: Re: [linux-lvm] recover lost VG (VG data differs between PVs)
Message-ID: <20041115175149.GA317@hotwire.nl>
References: <20041114225853.GB20425@hotwire.nl>
	<20041114232126.GH24229@agk.surrey.redhat.com>
	<20041115102400.GA19918@hotwire.nl>
	<20041115141510.GI24229@agk.surrey.redhat.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20041115141510.GI24229@agk.surrey.redhat.com>
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Mon, Nov 15, 2004 at 02:15:10PM +0000, Alasdair G Kergon wrote:
> > Just a question out of curiosity, what does "VG data differs..."
> > mean,
>
> LVM2 checks its metadata is consistent on disk every time you access a
> VG.   LVM1 caches its metadata and has less-stringent checks.
> 
> That message means it found an anomaly that it couldn't fix - the
> metadata on 3 of your devices formed a consistent VG after you
> restored the backup, but the metadata on the 4th device hdf3 still
> said it was part of the VG.
> 
> Filtering tells LVM2 to ignore hdf3 completely, then pvremove hdf3
> wipes LVM metadata from it.

Nice system, this LVM. Easy to use, very stable, fool proof. I love it!

Thanks a lot for the clean explanation and the help with getting my VG
back online. You don't know how happy I am with the positive outcome of
this accident :-)

cheers!
Jelle
