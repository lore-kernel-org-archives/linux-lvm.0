Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k6DC859C028015
	for <linux-lvm@redhat.com>; Thu, 13 Jul 2006 08:08:05 -0400
Received: from dgate1.fujitsu-siemens.com (dgate1.fujitsu-siemens.com
	[217.115.66.35])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k6DC82q3027832
	for <linux-lvm@redhat.com>; Thu, 13 Jul 2006 08:08:03 -0400
Received: from pdbzex1e.pdb.fsc.net (pdbzex1e.pdb.fsc.net [172.25.96.71])
	by plim.pdb.fsc.net (8.12.6/8.12.6/SuSE Linux 0.6) with ESMTP id
	k6DC7tA8009547
	for <linux-lvm@redhat.com>; Thu, 13 Jul 2006 14:07:56 +0200
Content-class: urn:content-classes:message
MIME-Version: 1.0
Date: Thu, 13 Jul 2006 14:07:55 +0200
Message-ID: <D81E5F9261AA644D90FF7B8E4005881737C122@PDBEX02E.pdb.fsc.net>
From: "Laurenz, Dirk" <Dirk.Laurenz@fujitsu-siemens.com>
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] Error setting up a mirrored lv
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
To: LVM general discussion and development <linux-lvm@redhat.com>

Hi,

i'm doing this:

>> hgest3301:~/LVM2.2.02.06 # lvcreate -m1 -n lvmirror -L 10G 
>> vgtest /dev/dm-55 /dev/dm-56
>>   Not enough PVs with free space available for parallel allocation.
>>   Consider --alloc anywhere if desperate.

here are the pvs?

>> hgest3301:~/LVM2.2.02.06 # pvs
>>   PV         VG          Fmt  Attr PSize   PFree
>>   /dev/dm-10 vgAGEST004  lvm2 a-    49.94G 25.94G
>>   /dev/dm-11 vgHGEST3901 lvm2 a-    49.94G     0
>>   /dev/dm-12 ehltest     lvm2 a-    25.00G 22.00G
>>   /dev/dm-13 vgtest      lvm2 a-    24.94G 24.94G
>>   /dev/dm-55 vgtest      lvm2 a-    99.94G 99.94G
>>   /dev/dm-56 vgtest      lvm2 a-    99.94G 99.94G
>>   /dev/dm-8  vgAGEST002  lvm2 a-    49.94G 45.94G
>>   /dev/dm-9  vgAGEST003  lvm2 a-    49.94G 43.94G
>>   /dev/sda8  vgOS        lvm2 a-    20.00G  3.00G
>>   /dev/sda9  vgBOTEST    lvm2 a-   111.25G 15.25G

what's wrong? 
Is there any documentation out there?
Why do we need three pvs? for a mirror?
Are there any other options?

Mit freundlichem Gruss,

Dirk Laurenz
Systems Engineer
S DE SE PS N/O
Fujitsu Siemens Computers GmbH
Hildesheimer Strasse 25
30880 Laatzen
Germany

Telephone:	+49 511 84 89 18 08
Telefax:	+49 511 84 89 25 18 08
Mobile:	+49 170 22 10 78 1 
Email:	mailto: dirk.laurenz@fujitsu-siemens.com
Internet:	http://www.fujitsu-siemens.com
