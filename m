Received: from mx1.redhat.com (ext-mx15.extmail.prod.ext.phx2.redhat.com
	[10.5.110.20])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r2QDg6pO023256
	for <linux-lvm@redhat.com>; Tue, 26 Mar 2013 09:42:06 -0400
Received: from mail.bmsi.com (mail.bmsi.com [68.106.146.44])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r2QDg30G018878
	for <linux-lvm@redhat.com>; Tue, 26 Mar 2013 09:42:04 -0400
Received: from melissa.gathman.org (melissa.gathman.org
	[IPv6:2001:470:8:809::1003]) (authenticated bits=0)
	by mail.bmsi.com (8.14.3/8.14.3) with ESMTP id r2QDfmlO015293
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Tue, 26 Mar 2013 09:42:01 -0400
Message-ID: <5151A59B.5010909@bmsi.com>
Date: Tue, 26 Mar 2013 09:41:47 -0400
From: Stuart D Gathman <stuart@bmsi.com>
MIME-Version: 1.0
References: <FAAB9C9B-FCA0-43CB-8B2C-F4F389941AAE@me.com>
	<533CFD97-2715-4B1C-A8C5-02161911747D@googlemail.com>
	<51509ECB.4050901@bmsi.com>
	<244E0086-C561-4034-BF26-31DFC419B72F@googlemail.com>
	<5150B555.4010207@bmsi.com>
	<0FEAF33E-7395-4820-9732-AFE70D3B5877@googlemail.com>
	<5150C1F8.8090107@bmsi.com>
	<CA+iDeo3WTK1gEiVzdmqA=kJ4nksZH-P76O1pBCL3MCTeme4zqg@mail.gmail.com>
In-Reply-To: <CA+iDeo3WTK1gEiVzdmqA=kJ4nksZH-P76O1pBCL3MCTeme4zqg@mail.gmail.com>
Content-Transfer-Encoding: quoted-printable
Subject: Re: [linux-lvm] vg disappeared after replacing disc in raid10
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
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@redhat.com

Long ago, Nostradamus foresaw that on 03/25/2013 05:45 PM, Bj=EF=BF=BDrn
Nadrowski would write:
> You were right,
> the data has been overwritten.
> It now reads thus (or rather, the first instance of human-readable
> volume group description reads thus; my old volume group description
> is still there, but further down...):
Now you are getting somewhere.  The offset of your PV has shifted.=20
First, copy that 2nd human readable part to removable media somewhere.=20
If possible, backup your drives (e.g. to USB drives) so you can recover
from further mistakes.

Why has the offset shifted?  Possibilities:

1) different md driver version on knoppix (although using an older
version would move the md superblock from end of drive to beginning of
drive - shifting the opposite way).  Or different options.  BUT mdadm
seemed to recognize your RAID, so let's
discount this theory.

2) alignment options to pvcreate - but it still should have been seen by
lvs!

3) the offset hasn't shifted, but you've written over the first few
sectors with the empty VG.  Is the 2nd human readable part, by any
chance, missing the first part?  You could post both parts for us to
look at.
