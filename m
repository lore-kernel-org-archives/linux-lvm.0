Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i2U7taj08240
	for <linux-lvm@redhat.com>; Tue, 30 Mar 2004 02:55:36 -0500
Received: from vega.voltaire.com ([212.143.27.73])
	by mx1.redhat.com (8.12.10/8.12.10) with SMTP id i2U7tV1X020718
	for <linux-lvm@redhat.com>; Tue, 30 Mar 2004 02:55:35 -0500
Message-ID: <2F75AEE4E86FDE44BF97709D289BAA7C7196EC@vega.voltaire.com>
From: Dan Bar Dov <danb@voltaire.com>
Date: Tue, 30 Mar 2004 10:55:19 +0300
MIME-Version: 1.0
Subject: [linux-lvm] LVM LUNs and scsi reserve/release
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "'linux-lvm@redhat.com'" <linux-lvm@redhat.com>


I wonder if LVM LUNs (LVs) have any means of dealing with scsi
reserve/release commands, and if so how?


Dan
