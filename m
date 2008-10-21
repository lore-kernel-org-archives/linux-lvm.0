Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m9LBDmca007816
	for <linux-lvm@redhat.com>; Tue, 21 Oct 2008 07:13:48 -0400
Received: from mailstore03.fastname.no (mailstore03.fastname.no [85.19.150.34])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m9LBDEfN010807
	for <linux-lvm@redhat.com>; Tue, 21 Oct 2008 07:13:15 -0400
Received: from [195.212.29.67] (helo=[192.168.94.25])
	by mailstore03.fastname.no with esmtpa (Exim 4.69)
	(envelope-from <morten@mortent.org>) id 1KsFAo-0003aB-3i
	for linux-lvm@redhat.com; Tue, 21 Oct 2008 13:13:14 +0200
Message-ID: <48FDB947.3090509@mortent.org>
Date: Tue, 21 Oct 2008 13:13:11 +0200
From: Morten Torstensen <morten@mortent.org>
MIME-Version: 1.0
Subject: Re: [linux-lvm] LVs corrupted after pvresize
References: <48F7AD78.1000002@knebb.de>	<Pine.LNX.4.64.0810161829570.14457@bmsred.bmsi.com>	<48F80EFB.30404@knebb.de>	<1224221030.7772.17.camel@localhost.localdomain>	<Pine.LNX.4.64.0810201136250.14488@bmsred.bmsi.com>
	<1224528632.6013.66.camel@localhost.localdomain>
In-Reply-To: <1224528632.6013.66.camel@localhost.localdomain>
Content-Transfer-Encoding: 7bit
Reply-To: morten@mortent.org,
	LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Peter Larsen wrote:
> Can you give an example or two on how the LVM differs on the
> user-friendliness areas?

Say you want to mirror a LV, then you just do a "mklvcopy mylvname 2" to 
have 2 copies of data (one extra, like raid-1). If you want to migrate 
your disks to a new system, add the new PV to your VG and do a "mklvcopy 
mylvname 3 newpv", then when it finish remove your old mirrors and 
delete the old PVs.

The AIX concept of physical extent/logical extent mapping is sorely 
missed on linux.

Generally speaking, LVM on AIX is also more mature. Exporting and 
importing VGs (to move VGs between systems) works better in my 
experience, clustering is more stable, but that is also something where 
YMMV can show.

Managing mirrors, data placement and hotspot detection are what I mainly 
miss on Linux.

-- 

//Morten Torstensen
//Email: morten@mortent.org
//IM: Cartoon@jabber.no morten.torstensen@gmail.com

And if it turns out that there is a God, I don't believe that he is evil.
The worst that can be said is that he's an underachiever.
