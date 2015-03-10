Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t2AE5pK9019334
	for <linux-lvm@redhat.com>; Tue, 10 Mar 2015 10:05:51 -0400
Received: from mailrelay3.lanline.com (mailrelay3.lanline.com [216.187.10.24])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t2AE5fKQ001786
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Tue, 10 Mar 2015 10:05:42 -0400
Received: from mycroft.westnet.com (Mycroft.westnet.com [216.187.52.7])
	by mailrelay3.lanline.com (8.14.5/8.14.5) with ESMTP id t2AE5ePe007274
	for <linux-lvm@redhat.com>; Tue, 10 Mar 2015 10:05:40 -0400 (EDT)
	(envelope-from john@stoffel.org)
Received: from quad.stoffel.org (66-189-26-192.dhcp.oxfr.ma.charter.com
	[66.189.26.192]) (authenticated bits=0)
	by mycroft.westnet.com (8.14.4/8.14.4) with ESMTP id t2AE0eik022167
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Tue, 10 Mar 2015 10:00:41 -0400 (EDT)
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-ID: <21758.64050.13647.314608@quad.stoffel.home>
Date: Tue, 10 Mar 2015 10:05:38 -0400
From: "John Stoffel" <john@stoffel.org>
In-Reply-To: <2134825.VZEVSUbKJK@libor-nb>
References: <2134825.VZEVSUbKJK@libor-nb>
Subject: Re: [linux-lvm] Removing disk from raid LVM
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
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>


Libor> web have 4x3TB disks in LVM for backups and I setup per
Libor> customer/per "task" LV type raid5 on it.

Can you post the configuration details please, since they do matter.
It would seem to me, that it would be better to use 'md' to create the
underlying RAID5 device, and then use LVM on top of that /dev/md0 to
create the customer LV(s) as needed.  

Libor> Last week, smartd started to alarm us, that one of the disk
Libor> will soon go away.

Libor> So we shut down the computer, replaced disk and then i used
Libor> vgcfgrestore on new disk to restore metadata.

You should have shutdown the system, added in a new disk, and then
rebooted the system.  At that point you would add the new disk into
the RAID5, and then fail the dying disk.  It would be transparent to
the LVM setup and be much safer.

I'd also strongly advise you to get RAID6 setup and have a hot spare
also setup, so that you don't have this type of issue in the future.  

Libor> Result was, that some LVs came up with damaged filesystem, some
Libor> didn't came up at all with messages like (one of rimage and
Libor> rmeta was "wrong", when i used KVPM util, it was type "virtual"

This sounds very much like you just lost a bunch of data, which RAID5
shouldn't do.  So please post the details of your setup, starting at
the disk level and moving up the stack to the filesystem(s) you have
mounted for backups.  We don't need the customer names, etc, just the
details of the system.

Also, which version of lvm, md, linux kernel, etc are you using?  The
more details the better.
