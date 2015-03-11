Received: from mx1.redhat.com (ext-mx16.extmail.prod.ext.phx2.redhat.com
	[10.5.110.21])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t2BFwFML020932
	for <linux-lvm@redhat.com>; Wed, 11 Mar 2015 11:58:15 -0400
Received: from mailrelay3.lanline.com (mailrelay3.lanline.com [216.187.10.24])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t2BFw9CD018041
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Wed, 11 Mar 2015 11:58:10 -0400
Received: from mycroft.westnet.com (Mycroft.westnet.com [216.187.52.7])
	by mailrelay3.lanline.com (8.14.5/8.14.5) with ESMTP id t2BFw8CV094559
	for <linux-lvm@redhat.com>; Wed, 11 Mar 2015 11:58:08 -0400 (EDT)
	(envelope-from john@stoffel.org)
Received: from quad.stoffel.org (66-189-26-192.dhcp.oxfr.ma.charter.com
	[66.189.26.192]) (authenticated bits=0)
	by mycroft.westnet.com (8.14.4/8.14.4) with ESMTP id t2BFqd0X010831
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Wed, 11 Mar 2015 11:52:40 -0400 (EDT)
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-ID: <21760.26103.886193.529742@quad.stoffel.home>
Date: Wed, 11 Mar 2015 11:57:43 -0400
From: "John Stoffel" <john@stoffel.org>
In-Reply-To: <1586988.am8mh8BZtm@libor-nb>
References: <2134825.VZEVSUbKJK@libor-nb>
	<21758.64050.13647.314608@quad.stoffel.home>
	<1586988.am8mh8BZtm@libor-nb>
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


Libor,

Can you please post the output of the following commands, so that we
can understand your setup and see what's really going on here.  More
info is better than less!

  cat /proc/partitions
  pvs -v
  pvdisplay
  vgs -v 
  vgdisplay
  lvs -v
  lvdisplay

and if you have PVs which are NOT on top of raw partitions, then
include cat /proc/mdstat as well, or whatever device tool you have.  

Basically, we're trying to understand how you configured your setup
from the physical disks, to the volumes on them.  I don't care much
about the filesystems, they're going to be inside individual LVs I
assume.  

John
