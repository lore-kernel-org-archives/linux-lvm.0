Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n55DJCZU024711
	for <linux-lvm@redhat.com>; Fri, 5 Jun 2009 09:19:12 -0400
Received: from moutng.kundenserver.de (moutng.kundenserver.de
	[212.227.126.188])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n55DIxnW007937
	for <linux-lvm@redhat.com>; Fri, 5 Jun 2009 09:18:59 -0400
Message-Id: <24264124.2266451244207938283.JavaMail.servlet@kundenserver>
From: liam@landv.org.uk
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Date: Fri, 05 Jun 2009 15:18:58 +0200
Subject: [linux-lvm] Exposing the same VG from two different disks
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

I'm not sure if what I'm trying to do is possible or not but hopefully someone out there can help!!

I have a volume group which consists of a LUN (/dev/emcpowerv1) in an EMC cabinet. To backup up the disk I use EMC technology to synchronise a second LUN (/dev/emcpoweraf1) with the first, when the synchronisation is complete I then break the connection. At this point I have two identical volume groups exposed to the same host. What I would like to do is rename the second volume group and mount its logical volumes. However I can't because (understandably) LVM doesn't like having two identical volume groups so when I issue pvchange -u I get...


# pvchange -u /dev/emcpoweraf1
  Found duplicate PV dXiYI6nVqu8UpXO2mlaWiKKPKSBPrRbn: using /dev/emcpowerv1 not /dev/emcpoweraf1
  get_pv_from_vg_by_id: vg_read failed to read VG !
  /dev/emcpowerv1: write failed after 0 of 4096 at 4096: Operation not permitted
  pv_write with new uuid failed for /dev/emcpowerv1.
  0 physical volumes changed / 1 physical volume not changed

Notice I issue the command against /dev/emcpoweraf1 but it complains about writing to /dev/emcpowerv1.

does anyone have any ideas?
Thanks in advance
Liam
