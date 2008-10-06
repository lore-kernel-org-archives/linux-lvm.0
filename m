Received: from pobox.fab.redhat.com (pobox.fab.redhat.com [10.33.63.12])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m96DBfLr003481
	for <linux-lvm@redhat.com>; Mon, 6 Oct 2008 09:11:42 -0400
Received: from agk.fab.redhat.com (agk.fab.redhat.com [10.33.0.19])
	by pobox.fab.redhat.com (8.13.1/8.13.1) with ESMTP id m96DBf61028211
	for <linux-lvm@redhat.com>; Mon, 6 Oct 2008 09:11:41 -0400
Received: from agk by agk.fab.redhat.com with local (Exim 4.34)
	id 1KmpsD-000745-Ha
	for linux-lvm@redhat.com; Mon, 06 Oct 2008 14:11:41 +0100
Date: Mon, 6 Oct 2008 14:11:41 +0100
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] Create Snapshot volume,
	with sized based on size of original lv
Message-ID: <20081006131141.GA23898@agk.fab.redhat.com>
References: <20081004090534.227400@gmx.net>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20081004090534.227400@gmx.net>
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
To: LVM general discussion and development <linux-lvm@redhat.com>

On Sat, Oct 04, 2008 at 11:05:34AM +0200, Michael Schmarck wrote:
> $ sudo lvm lvcreate -s -l 25%LV -n Bilder_snap /dev/sys/Bilder
>   Please express size as %VG, %PVS, or %FREE.
> Did I do something wrong, or is the output "--help"
> just wrong?
 
%LV is for resizing an existing LV.
lvcreate -s -l n%LV would indeed be unambiguous,
but what then about lvresize on a snapshot?  Would it be % of 
base LV or % of existing snapshot?  (Perhaps we need %ORIGIN.)

Alasdair
-- 
agk@redhat.com
