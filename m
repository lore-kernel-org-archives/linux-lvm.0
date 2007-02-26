Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l1QBXw1C010510
	for <linux-lvm@redhat.com>; Mon, 26 Feb 2007 06:33:58 -0500
Received: from hawk.dcu.ie (mail.dcu.ie [136.206.1.5])
	by mx2.redhat.com (8.13.1/8.13.1) with ESMTP id l1QBXu38006446
	for <linux-lvm@redhat.com>; Mon, 26 Feb 2007 06:33:57 -0500
Received: from deathray.redbrick.dcu.ie (136.206.15.3) by hawk.dcu.ie (7.3.120)
	id 45E2BC5300001E1E for linux-lvm@redhat.com;
	Mon, 26 Feb 2007 11:33:51 +0000
Received: from login.redbrick.dcu.ie
	([2001:770:107:15::50] helo=murphy.redbrick.dcu.ie ident=Debian-exim)
	by deathray.redbrick.dcu.ie with esmtp (Exim 4.50)
	id 1HLe74-0001eV-SO
	for linux-lvm@redhat.com; Mon, 26 Feb 2007 11:33:50 +0000
Received: from kpodesta by murphy.redbrick.dcu.ie with local (Exim 4.60)
	(envelope-from <kpodesta@murphy.redbrick.dcu.ie>) id 1HLe74-0004Vs-Mz
	for linux-lvm@redhat.com; Mon, 26 Feb 2007 11:33:50 +0000
Date: Mon, 26 Feb 2007 11:33:50 +0000
From: Karl Podesta <kpodesta@redbrick.dcu.ie>
Message-ID: <20070226113350.GC31458@murphy.redbrick.dcu.ie>
MIME-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] lvchange read ahead sectors
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
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

Hi there, 

Does anyone know if I can change "read ahead sectors" to 1024 with LVM1 ?

I'm using lvm-1.0.5-129 on SUSE/SLES 8 - I have a logical volume with 
"read ahead sectors" set to 1024, and another one with the value as
0 (i.e. disabled). When I try to set the latter one to 1024 using 
"lvchange -r 1024", I get:

lvchange -- ERROR "Invalid argument" read ahead sector change

... and then in the lvchange man page I notice: 
 -r, --readahead ReadAheadSectors
              Change read ahead sector count per logical  between
              2 and 120.

If I can only set the value to 120, how come I have a volume with 1024? 
Is there a conversion needed between the two values? 

If anyone could shed some light on this or point me in the right 
direction, that would be great! Haven't had any joy looking through 
stuff on the net, or on the archives of this list... 

Many thanks!

Karl

PS - I realise this list is hosted on redhat.com, so sorry for any 
cross-distro pollination! :-)

-- 
Karl Podesta
