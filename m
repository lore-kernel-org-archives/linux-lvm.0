Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id k13E7k126971
	for <linux-lvm@redhat.com>; Fri, 3 Feb 2006 09:07:46 -0500
Received: from out001.atlarge.net (out001.atlarge.net [129.41.63.69])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k13E7Kj6017922
	for <linux-lvm@redhat.com>; Fri, 3 Feb 2006 09:07:20 -0500
Content-class: urn:content-classes:message
MIME-Version: 1.0
Date: Fri, 3 Feb 2006 08:07:07 -0600
Message-ID: <D3DC8F9206F0D24085E459720ECDF3EDC3FDD9@mail-18ps.atlarge.net>
From: "Don Shesnicky" <don.shesnicky@liquidcomputing.com>
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] Lvm and filesystem rebuilding
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

 
I'm not up on LVM but I can see the benefits of snapshots and 
the ability to grow the fs. The latter is not an issue with me 
on my servers as I'm running off of a netapp. However are there
any issues from a lowlevel fs corruption and rebuilding point 
of view?

Don
