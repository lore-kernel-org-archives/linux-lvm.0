Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p3KFXP1W020236
	for <linux-lvm@redhat.com>; Wed, 20 Apr 2011 11:33:25 -0400
Received: from ciomail2.sc.gov (cioe500.state.sc.us [167.7.36.2])
	by mx1.redhat.com (8.14.4/8.14.4) with SMTP id p3KFXLP4010203
	for <linux-lvm@redhat.com>; Wed, 20 Apr 2011 11:33:21 -0400
Received: from keys.cio.sc.gov (keys.cio.sc.gov [127.0.0.1])
	by keys.cio.sc.gov (PGP Universal) with ESMTP id 82FE010B074D
	for <linux-lvm@redhat.com>; Wed, 20 Apr 2011 11:33:15 -0400 (EDT)
From: "Males, Jess" <jmales@cio.sc.gov>
Date: Wed, 20 Apr 2011 11:33:17 -0400
Message-ID: <0A03EDA0F33C5C428BFFF019C40D609E9CCAE51B46@SCMBXC01.bcbad.state.sc.us>
References: <4DAE0B5E.4090503@stanford.edu> <4DAE0E79.3090503@q7.com>
	<2BF070A7A2375D46BA1B6087F8D5DCB67D93C8349E@seldmbx01.corpusers.net>,
	<4DAEA0FD.60709@ankh.org>
In-Reply-To: <4DAEA0FD.60709@ankh.org>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] LVM Naming Convention
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
To: LVM general discussion and development <linux-lvm@redhat.com>

I concur with the OP on this convention.  My usage scenario is different though.  Most of my linux boxes are on VMware and I rely on cloning and templates a great deal.  I leave the vg name generic so the templates are less messy.  I don't have to worry about SAN naming conventions because my SAN storage is vmfs first, before files are carved out and handed to VMs.  I suppose I could add a vg_rename as part of my cloning/templating instantiation process, but I'm unlikely to pass disks around.

-- Jess

________________________________________
From: linux-lvm-bounces@redhat.com [linux-lvm-bounces@redhat.com] On Behalf Of James Hawtin [oolon@ankh.org]
Sent: Wednesday, April 20, 2011 5:01 AM
To: LVM general discussion and development
Subject: Re: [linux-lvm] LVM Naming Convention

Assarsson, Emil wrote:
> We have also started to use hostnames in the VG names for the same reason. Starting with vg makes is easier to auto complete when using bash :-P. I don't see any reason why to use "lv" to the LV's but it doesn't hurt. I also try to use UUID's in the /etc/fstab as much as possible.
>
> Best regards
> Emil Assarsson
>
I also use the hostname in the volume group name for all the reasons
already suggest, its particularly valuable when dealing with san disk,
as any mistake is very obvious.

personally I use

/dev/<hostname>_<type><number>_vg/<filesystem>_lv

Where type is l for local disk s for san. I keep my raid 1 and raid 5 in
different volume groups to avoid mistakes, however both are called l or s.

Where the disk is for use to virtual machines I used

/dev/<hostname>_<type><number>_vg/<virtual machine>_v<number>_lv

I put _vg at the end of all volume groups mostly for completeness, and
avoidance of any change of a name clash, I also thing _lv is useful as
alots of devices can be mixed up in /dev/mapper so giving them a
seperate namespace so the don't get mixed up with multipathed disk, (and
in the old days raw devices) etc. I can do a ls /dev/mapper/*_lv to see
all my logical volumes all in one go, independant of group.


James

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://www.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
