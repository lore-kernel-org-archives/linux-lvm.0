Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id iBEGYjr00406
	for <linux-lvm@redhat.com>; Tue, 14 Dec 2004 11:34:45 -0500
Message-ID: <689DC84CA0F01F458599C0D733BCB9E134760A@NOANDC-MXU12.NOA.Alcoa.com>
From: "Phanse, Ameet" <Ameet.Phanse@alcoa.com>
Date: Tue, 14 Dec 2004 11:34:11 -0500
MIME-Version: 1.0
Subject: [linux-lvm] Vgimport/export in Linux Servers
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
To: Linux-LVM@sistina.com

Hi Heinz Mauelshagen,

We are using Red Hat Advance Server 3. Filesystems are created using Volume Group. We have EMC disks connected to system using Emulex Card & Powerpath.

We move data from one system to other on HP servers using vgimport/export. Only it requires us to map those disks on another system. I would like to know if you have any document how to use vgimport / vgexport for doing this same method or mounting filesystems on another system if required. 

Thanks,
Ameet
