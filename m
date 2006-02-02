Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id k12GG8123683
	for <linux-lvm@redhat.com>; Thu, 2 Feb 2006 11:16:08 -0500
Received: from out001.atlarge.net (out001.atlarge.net [129.41.63.69])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id k12GG7K0022898
	for <linux-lvm@redhat.com>; Thu, 2 Feb 2006 11:16:07 -0500
Content-class: urn:content-classes:message
MIME-Version: 1.0
Date: Thu, 2 Feb 2006 10:15:52 -0600
Message-ID: <D3DC8F9206F0D24085E459720ECDF3EDC3FC34@mail-18ps.atlarge.net>
From: "Don Shesnicky" <don.shesnicky@liquidcomputing.com>
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] raidtools/mdadm stability
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
To: linux-lvm@redhat.com

 

Couple of quick questions on raidtools/mdadm if anyone cares to comment:

1. In the raid faq it states "However, if you find raidtools cumbersome 
or limited, mdadm (multiple devices admin) is an extremely useful tool 
for running RAID systems. It can be used as a replacement for the 
raidtools, or as a supplement." I want to mirror the root drives of a 
RHEL4 ES U2 system, what's the prefered method for stability -
raidtools, 
mdadm or mdadm with raidtools. 

2. I take it from a previous posting I can mirror my two root drives, 
installed the MBRs and be good to go to boot off either drive, that 
the mirror is not at the bit level and does not include the MBR?

3. Is RHEL4 ES Update2 generally stable or is there something that 
could burn us here?

Don
