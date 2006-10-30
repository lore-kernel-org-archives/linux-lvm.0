Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id k9ULnceB012630
	for <linux-lvm@redhat.com>; Mon, 30 Oct 2006 16:49:38 -0500
Received: from karakal.cosy.sbg.ac.at (karakal.cosy.sbg.ac.at [141.201.2.175])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k9ULnZal008754
	for <linux-lvm@redhat.com>; Mon, 30 Oct 2006 16:49:36 -0500
Received: from webmail.cosy.sbg.ac.at (localhost.localdomain [127.0.0.1])
	by karakal.cosy.sbg.ac.at (Postfix) with ESMTP id C1DCE8D4786
	for <linux-lvm@redhat.com>; Mon, 30 Oct 2006 22:49:44 +0100 (CET)
Message-ID: <3999.62.99.165.114.1162244984.squirrel@webmail.cosy.sbg.ac.at>
In-Reply-To: <20061030111339.GF7809@soda.linbit>
References: <2813.62.99.165.114.1162122375.squirrel@webmail.cosy.sbg.ac.at>
	<3377.62.99.165.114.1162134421.squirrel@webmail.cosy.sbg.ac.at>
	<2813.62.99.165.114.1162122375.squirrel@webmail.cosy.sbg.ac.at>
	<20061030111339.GF7809@soda.linbit>
Date: Mon, 30 Oct 2006 22:49:44 +0100 (CET)
Subject: Re: [linux-lvm] Lost partition table --> Lost 4th PV partition on 
	disk - how to find the partition bounderies
From: gklima@cosy.sbg.ac.at
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
To: LVM general discussion and development <linux-lvm@redhat.com>

> /dev/hda4 : start= 51277968, size=144093600, Id=8e

I now found the correct starting sector: 51271920

The main clue I needed was the magic /^.{24}LVM2/, thanks for that!

and a friend of me who rewrote your code in python:

code by Michael Gschwanter:
#!/usr/bin/python
import re,sys

isLVM = re.compile("^.{24}LVM2") # This is how the Sector should look like

if __name__=="__main__":
	args = sys.argv
	device = args[1]
	startSector = int(args[2])
	howMuch = int(args[3])
	endSector = startSector + howMuch
	print "Searching for LVM2 on %s. From Sector %d to
%d"%(device,startSector,endSector)

	dev = file(device,"r") # Read only, just for Security
	dev.seek(startSector * 512)
	t = 0
	while t < howMuch:
		sectorData = dev.read(512)
		m = isLVM.search(sectorData)
		if m:
			print "We found the Start sector of the pv@%d\n"%(startSector+t)
			break
		t = t + 1


	dev.close()

Usage:  ./findlvm.py  /dev/<deindevice>   startSector  maximumSectorsToTry

just used the output sector minus one!

Great thanks to all who tried and helped to save my data!!!


Georg
