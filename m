Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j4KF1TO18987
	for <linux-lvm@redhat.com>; Fri, 20 May 2005 11:01:29 -0400
Received: from smtpout01-04.mesa1.secureserver.net
	(smtpout01-04.mesa1.secureserver.net [64.202.165.79])
	by mx3.redhat.com (8.12.11/8.12.11) with SMTP id j4KF1MDe001564
	for <linux-lvm@redhat.com>; Fri, 20 May 2005 11:01:23 -0400
Message-ID: <428DFBC0.3010003@starnetworks.us>
Date: Fri, 20 May 2005 08:01:20 -0700
From: "Kevin P. Fleming" <kpfleming@starnetworks.us>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Import LVM2 config from existing disk array?
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com

(I know this is slightly off-topic for this list, but I figured since 
there are lots of SuSE experts here too it was worth a shot <G>)

I just converted a server over to SLES9 from another distro. This server 
has a QLogic FC card, attached to an external array.

I had created a single PV on the array (no partition table, the whole 
disk), and a VG using that PV.

When I attach the array to the SLES9 server, and go into the YaST2 LVM 
tool, it shows the volume group and it's volumes, but only partially. It 
has no idea what PVs the VG consists of, what the size is, etc. and the 
VG is not started automatically on boot. This may be because nothing was 
setup in the YaST2 Partitioner for this VG/PV, but I don't want to do 
anything there for fear that it will be destructive.

How can I get the YaST2 LVM tool to "import" the configuration of the 
existing PV/VG/LVs, so that it can be managed normally from that point 
forward?
