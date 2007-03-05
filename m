Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l25BTmF0013369
	for <linux-lvm@redhat.com>; Mon, 5 Mar 2007 06:29:48 -0500
Received: from lucius.provo.novell.com (lucius.provo.novell.com
	[137.65.248.127])
	by mx1.redhat.com (8.13.1/8.13.1) with ESMTP id l25BTlLP020566
	for <linux-lvm@redhat.com>; Mon, 5 Mar 2007 06:29:47 -0500
Message-Id: <45EC4306.669D.00E9.0@novell.com>
Date: Mon, 05 Mar 2007 03:52:02 -0700
From: "Nallammai S" <snallammai@novell.com>
Mime-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] Snapshot code
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

Hi,

I am new to lvm2. I am looking at the lvm2 code primarily to understand how snapshots are taken. When I debugged, i found that in addition to the COW LV, a LV named 'snapshot0' is also created. Why is this LV created?

Thanks in advance

Nallammai.S 
