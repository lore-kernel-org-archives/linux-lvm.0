Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id iBSETEr30781
	for <linux-lvm@redhat.com>; Tue, 28 Dec 2004 09:29:14 -0500
Received: from postfix3-1.free.fr (postfix3-1.free.fr [213.228.0.44])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id iBSET7HS029881
	for <linux-lvm@redhat.com>; Tue, 28 Dec 2004 09:29:08 -0500
Received: from eric.placeverte.home
	(lns-vlq-9-lil-82-65-144-147.adsl.proxad.net [82.65.144.147])
	by postfix3-1.free.fr (Postfix) with SMTP id 4A4A51734A9
	for <linux-lvm@redhat.com>; Tue, 28 Dec 2004 15:29:07 +0100 (CET)
Date: Tue, 28 Dec 2004 15:29:06 +0100
From: messmate <messmate@free.fr>
Message-ID: <20041228152906.5bca399d@eric.placeverte.home>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] lvm and unmounting lv
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
To: linux-lvm <linux-lvm@redhat.com>

Hi list;
I'm new to lvm and had a few questions:
- after adding a hd (hdb) and configured/partitioned , 
creating a gv for hdb1 and hdb2, and creating 2 lv's on hdb2 
i've always to 'fsck' the 2 lv's.
Apparantly they are not unmounted when system halted.
 error messages :
"removing gv_hdb-lv_res"
"Unable to unlink device node for ' gv_hdb-lv_res'  "

What happen exactly ?
Thanks for your help in advance

mess-mate
