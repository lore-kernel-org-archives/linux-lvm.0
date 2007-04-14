Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l3EDsX1t017478
	for <linux-lvm@redhat.com>; Sat, 14 Apr 2007 09:54:34 -0400
Received: from extmail.dtnet.de (extmail.dtnet.de [87.193.12.202])
	by mx2.redhat.com (8.13.1/8.13.1) with ESMTP id l3EDsWSg011051
	for <linux-lvm@redhat.com>; Sat, 14 Apr 2007 09:54:32 -0400
Message-ID: <4620D7E3.9090609@dtnet.de>
Date: Sat, 14 Apr 2007 15:32:19 +0200
From: Daniel Schwager <daniel.schwager@dtnet.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Limitation: Snapshots does not work in cluster
	enviroment ?
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

Hi all,

i read, snapshots are not supported in a cluster enviroment (CLVM)
    http://sources.redhat.com/lvm2/wiki/RoadMap

So, is it not possible to create a LVM2 snapshot on one server and use
it in another server ?

QUESTION: Is this limitation also valid for my verion:

xentor:/etc/lvm# lvm version
  LVM version:     2.02.07 (2006-07-17)
  Library version: 1.02.08 (2006-07-17)
  Driver version:  4.7.0

If so, is it valid for the current LVM2 2.02.24 ?

Thanks for helping

regards

Danny
