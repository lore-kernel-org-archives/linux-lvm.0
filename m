Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l968Zvr5022000
	for <linux-lvm@redhat.com>; Sat, 6 Oct 2007 04:35:57 -0400
Received: from wa-out-1112.google.com (wa-out-1112.google.com [209.85.146.180])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id l968ZuVO003765
	for <linux-lvm@redhat.com>; Sat, 6 Oct 2007 04:35:56 -0400
Received: by wa-out-1112.google.com with SMTP id j37so980191waf
	for <linux-lvm@redhat.com>; Sat, 06 Oct 2007 01:35:55 -0700 (PDT)
Message-ID: <55e074e80710060135g264a3eeatc57178975862f288@mail.gmail.com>
Date: Sat, 6 Oct 2007 01:35:55 -0700
From: "Michael Jiang" <xiaominj@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_33241_6582386.1191659755601"
Subject: [linux-lvm] could not mount LVM2 read only snapshot
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
To: linux-lvm@redhat.com

------=_Part_33241_6582386.1191659755601
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

I use 'lvcreate -p r' to create a read only snapshot. got following error
message when I try to mount it

"mount: wrong fs type, bad option, bad superblock on /dev/VolGroup00/snap,
      or too many mounted file systems"

If I do not use '-p r' and mount -r, then it works fine.

kernel 2.6.9-42.ELsmp
# lvm version
  LVM version:     2.02.06 (2006-05-12)
  Library version: 1.02.07 (2006-05-11)
  Driver version:  4.5.0

Anyone had the same problem before?

Thanks

Michael

------=_Part_33241_6582386.1191659755601
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

I use &#39;lvcreate -p r&#39; to create a read only snapshot. got following error message when I try to mount it<br><br>&quot;mount: wrong fs type, bad option, bad superblock on 
/dev/VolGroup00/snap,
<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; or too many mounted file systems&quot;<br><br>If I do not use &#39;-p r&#39; and mount -r, then it works fine.<br><br>kernel 2.6.9-42.ELsmp<br>
# lvm version<br>
&nbsp; LVM version:&nbsp;&nbsp;&nbsp;&nbsp; 2.02.06 (2006-05-12)<br>
&nbsp; Library version: 1.02.07 (2006-05-11)<br>
&nbsp; Driver version:&nbsp; 4.5.0<br>
<br>Anyone had the same problem before?<br><br>Thanks<br><br>Michael<br>

------=_Part_33241_6582386.1191659755601--
