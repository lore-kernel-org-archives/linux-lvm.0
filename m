Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i7AMXYa04817
	for <linux-lvm@redhat.com>; Tue, 10 Aug 2004 18:33:34 -0400
Date: Tue, 10 Aug 2004 15:32:39 -0700
From: Parker.Christine@epamail.epa.gov
Message-id: <OF4389A259.1F4C61A4-ON88256EEC.007B49FD-88256EEC.007BD660@epamail.epa.gov>
MIME-version: 1.0
Subject: [linux-lvm] question about physical disks with LVM
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
To: Linux-LVM@Sistina.com
Cc: Wolfe.Jennifer@epamail.epa.gov





Hello.  I got your name from the LVM man page in Enterprise Linux.  I
have a question about creating one filesystem
on multiple physical volumes:  can the physical volumes be of different
sizes?

Here's our situation:  We have a SAN setup here, and we currently have
one filesystem that spans 10disks.
We want to add 10 more disks (one DAE), but the new disks are larger
than the old ones.  Will we be able to extend the old file
system to include the new disks using LVM?  If not, can you suggest
alternatives for us?

Thanks for any information you can send us.

cp
Christine Parker
US EPA Region 10, OEMI, IRU
206.553.2987
parker.christine@epa.gov
