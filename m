Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id k0VLqe110728
	for <linux-lvm@redhat.com>; Tue, 31 Jan 2006 16:52:40 -0500
Received: from out002.atlarge.net (out002.atlarge.net [129.41.63.60])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id k0VLqcRB002264
	for <linux-lvm@redhat.com>; Tue, 31 Jan 2006 16:52:38 -0500
Content-class: urn:content-classes:message
MIME-Version: 1.0
Date: Tue, 31 Jan 2006 15:52:31 -0600
Message-ID: <D3DC8F9206F0D24085E459720ECDF3EDC3F815@mail-18ps.atlarge.net>
From: "Don Shesnicky" <don.shesnicky@liquidcomputing.com>
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] Mirror with G2U or LVM?
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

 
I'm looking to mirror 2 root drives right down to the MBR so I can 
boot off either one in the event of a failure. Can this be done with 
LVM or should I use something like G4U and update during shutdowns. 
I'm using RHEL4 ES.

The drives are different sizes 160 gig and a 200 gig is that an issue?

Don
