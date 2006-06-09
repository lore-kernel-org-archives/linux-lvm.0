Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k59DL167032400
	for <linux-lvm@redhat.com>; Fri, 9 Jun 2006 09:21:01 -0400
Received: from stamper.stc.ricplc.com (smtp.ricardo.co.uk [195.162.98.110])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k59DKxfL016588
	for <linux-lvm@redhat.com>; Fri, 9 Jun 2006 09:21:00 -0400
From: "Gary Mansell" <Gary.Mansell@ricardo.com>
Date: Fri, 09 Jun 2006 14:20:28 +0100
Content-Class: urn:content-classes:message
Message-ID: <1149859228.5433.96.camel@grma-lap>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] Using LVM with EMC Powerpath...
Reply-To: Gary.Mansell@ricardo.com,
	LVM general discussion and development <linux-lvm@redhat.com>
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

I have a powerpath device that I want to encapsulate in LVM so that I
can grow it in the future but when I try and create the physical volume,
I get an error:

[root@ricserver ~]# powermt display dev=emcpowera
Pseudo name=emcpowera
CLARiiON ID=29R231J [Ricardo]
Logical device ID=600601604EC01000E0FC2ED6AAF5DA11 [5FCALRAID5]
state=alive; policy=CLAROpt; priority=0; queued-IOs=0
Owner: default=SP B, current=SP B
==============================================================================
---------------- Host ---------------   - Stor -   -- I/O Path -  --
Stats ---
### HW Path                 I/O Paths    Interf.   Mode    State  Q-IOs
Errors
==============================================================================
   1 lpfc                      sde       SP B0     active  alive      0
0
   2 lpfc                      sdi       SP A1     active  alive      0
0
   3 lpfc                      sdm       SP A0     active  alive      0
0
   4 lpfc                      sdq       SP B1     active  alive      0
0


When I try to create the physical volume:

[root@ricserver ~]# pvcreate /dev/emcpowera1
  Physical volume "/dev/emcpowera1" successfully created


[root@ricserver ~]# pvscan
  Found duplicate PV QwbwqAi02sELEsEpefW6PNZ53XY8Wgo0:
using /dev/emcpowera1 not /dev/sdq1
  Found duplicate PV QwbwqAi02sELEsEpefW6PNZ53XY8Wgo0: using /dev/sde1
not /dev/sdq1
  Found duplicate PV QwbwqAi02sELEsEpefW6PNZ53XY8Wgo0: using /dev/sdi1
not /dev/sdq1
  Found duplicate PV QwbwqAi02sELEsEpefW6PNZ53XY8Wgo0: using /dev/sdm1
not /dev/sdq1
  PV /dev/sda2   VG VolGroup00   lvm2 [33.75 GB / 32.00 MB free]
  PV /dev/sdq1                   lvm2 [266.42 GB]
  Total: 2 [300.17 GB] / in use: 1 [33.75 GB] / in no VG: 1 [266.42 GB]

What am I doing wrong?

Any help gladly recieved

Regards

Gary Mansell


-- 

This e-mail and any files transmitted with it are confidential and intended
solely for the use of the individual or entity to whom they are addressed.
If you have received this e-mail in error please notify the sender immediately
and delete this e-mail from your system.  Please note that any views or opinions
presented in this e-mail are solely those of the author and do not necessarily
represent those of Ricardo (save for reports and other documentation formally
approved and signed for release to the intended recipient).  Only Directors
or Duly Authorised Officers are authorised to enter into legally binding
obligations on behalf of Ricardo unless the obligation is contained within
a Ricardo Purchase Order.

Ricardo may monitor outgoing and incoming e-mails and other telecommunications
on its e-mail and telecommunications systems.  By replying to this e-mail you
give consent to such monitoring.  The recipient should check this e-mail and
any attachments for the presence of viruses.  Ricardo accepts no liability for
any damage caused by any virus transmitted by this e-mail.  "Ricardo" means
Ricardo plc and its subsidiary companies.

Ricardo plc is a public limited company registered in England with registered
number 00222915.
The registered office of Ricardo plc is Shoreham Technical Centre, Shoreham-by Sea,
West Sussex, BN43 5FG.
 
