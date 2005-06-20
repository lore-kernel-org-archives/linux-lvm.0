Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j5KBjfu08986
	for <linux-lvm@redhat.com>; Mon, 20 Jun 2005 07:45:41 -0400
Received: from lucifer.nerdfest.org (lucifer.nerdfest.org [216.243.209.218])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j5KBjYoC030762
	for <linux-lvm@redhat.com>; Mon, 20 Jun 2005 07:45:34 -0400
From: Mukund <muks@mukund.org>
Date: Mon, 20 Jun 2005 12:45:14 +0100
Message-Id: <1119267914.21477.3.camel@dilbert>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Progress on LVM2 snapshots
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

Dear all,

	Please can anyone -authoritative- tell me about the current state of
snapshots support in LVM2? It was broken a while ago and I want to know
if it has been fixed now. I am the author of a storage management
project (www.openfiler.org), and we are currently stuck with LVM1 (and
the RHEL3 2.4 kernel and hence smaller device sizes) due to non-working
snapshots. Can LVM2 snapshots now be created and used reliably?

				Mukund
