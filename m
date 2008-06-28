Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m5SIi3iq012584
	for <linux-lvm@redhat.com>; Sat, 28 Jun 2008 14:44:03 -0400
Received: from fg-out-1718.google.com (fg-out-1718.google.com [72.14.220.156])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m5SIhlnv027109
	for <linux-lvm@redhat.com>; Sat, 28 Jun 2008 14:43:47 -0400
Received: by fg-out-1718.google.com with SMTP id e21so561716fga.7
	for <linux-lvm@redhat.com>; Sat, 28 Jun 2008 11:43:46 -0700 (PDT)
Message-ID: <bf6f43f40806281143h5a028857k494a4e4b9ec51@mail.gmail.com>
Date: Sat, 28 Jun 2008 15:43:46 -0300
From: "Levy Abinajm Melero Sant'Anna" <levy.santanna@gmail.com>
Sender: log.todos@gmail.com
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_8284_16582917.1214678626836"
Subject: [linux-lvm] Split LV mirror or something
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
To: LVM general discussion and development <linux-lvm@redhat.com>

------=_Part_8284_16582917.1214678626836
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi all,

I have one question about the LV mirrors.

Anytime that I think about LV mirrors I think that it should be the response
for all the issues.
If I could control the mirrors in the way that I would know each PE
location, and could split the PE mirrors on different LVs it would resolve
almost the problems regarding LV migrations with more security and speed
than snapshot and/or copy the data inside LV.

The question is:

I have one LV with some critical data, and want to make a safe copy with
less time possible of downtime. Could I make one mirror on a new PV
(lvconvert -m1) and split this copy into a new LV or/and maybe split the VG
into a new VG?

Thank you so much,
Levy Sant'Anna

------=_Part_8284_16582917.1214678626836
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi all,<br><br>I have one question about the LV mirrors.<br><br>Anytime that I think about LV mirrors I think that it should be the response for all the issues.<br>If I could control the mirrors in the way that I would know each PE location, and could split the PE mirrors on different LVs it would resolve almost the problems regarding LV migrations with more security and speed than snapshot and/or copy the data inside LV.<br>
<br>The question is:<br><br>I have one LV with some critical data, and want to make a safe copy with less time possible of downtime. Could I make one mirror on a new PV (lvconvert -m1) and split this copy into a new LV or/and maybe split the VG into a new VG?<br>
<br>Thank you so much,<br>Levy Sant&#39;Anna<br>

------=_Part_8284_16582917.1214678626836--
