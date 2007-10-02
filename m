Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l92Eskx2023554
	for <linux-lvm@redhat.com>; Tue, 2 Oct 2007 10:54:46 -0400
Received: from mail.gmx.net (mail.gmx.net [213.165.64.20])
	by mx3.redhat.com (8.13.1/8.13.1) with SMTP id l92Esj5H021570
	for <linux-lvm@redhat.com>; Tue, 2 Oct 2007 10:54:45 -0400
Content-Type: text/plain; charset="us-ascii"
Date: Tue, 02 Oct 2007 16:54:39 +0200
From: "Paul Muster" <paul.muster@gmx.net>
In-Reply-To: <20071002145032.118800@gmx.net>
Message-ID: <20071002145439.118800@gmx.net>
MIME-Version: 1.0
References: <20071002145032.118800@gmx.net>
Subject: Re: [linux-lvm] cannot access LVM1 any more
Content-Transfer-Encoding: 7bit
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
To: linux-lvm@redhat.com

additional info:

# pvscan --version
  LVM version:     2.02.05 (2006-04-21)
  Library version: 1.02.05 (2006-04-19)
  Driver version:  4.6.0

also only tells:

# pvscan
  Invalid LV in extent map (PV /dev/sda3, PE 1080, LV 5, LE 0)
  Couldn't fill logical volume maps.
  Invalid LV in extent map (PV /dev/sda3, PE 1080, LV 5, LE 0)
  Couldn't fill logical volume maps.
  No matching physical volumes found
