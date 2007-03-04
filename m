Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l241xtP3007711
	for <linux-lvm@redhat.com>; Sat, 3 Mar 2007 20:59:55 -0500
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx1.redhat.com (8.13.1/8.13.1) with ESMTP id l241xsJQ012139
	for <linux-lvm@redhat.com>; Sat, 3 Mar 2007 20:59:54 -0500
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.13.6/8.13.6) with ESMTP id l241xcdk018996
	(version=TLSv1/SSLv3 cipher=EDH-RSA-DES-CBC3-SHA bits=168 verify=NO)
	for <linux-lvm@redhat.com>; Sat, 3 Mar 2007 20:59:38 -0500
Received: from localhost (localhost [127.0.0.1])
	by bmsred.bmsi.com (8.13.5/8.13.5) with ESMTP id l241xcs7006721
	for <linux-lvm@redhat.com>; Sat, 3 Mar 2007 20:59:38 -0500
Date: Sat, 3 Mar 2007 20:59:38 -0500 (EST)
From: "Stuart D. Gathman" <stuart@bmsi.com>
Message-ID: <Pine.LNX.4.44.0703032051050.6632-100000@bmsred.bmsi.com>
MIME-Version: 1.0
Subject: [linux-lvm] Questions
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

Which display commands display on-disk metadata, which display 
lvmtab/lvmtab.d, and which display kernel data structures?  I'd like to 
know if the metadata is trashed on my original two PVs, or just on
the new one I tried to add.

Given my situation described previously (where vgextend/me screwed up and 
kernel data is fine, VG is active, but disk metadata seems to be toast),
should I run vgcfgrestore on the live VG in the hope that things might 
boot?  I have Centos-3  /etc/lvmconf backups of metadata (I think) for
prior to the attempt to vgextend.

What is the equivalent of pvremove (which is what I needed) in LVM1?
I tried using pvcreate "I'm really really sure", but that seems to have
screwed up.  If VG metadata is stored at the beginning of a PV, then
I guess dd might be the answer.

Does the last /etc/lvmconf entry respresent the result of the last 
command?  Or is it a backup of things just before the last autobackup
command?


-- 
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
