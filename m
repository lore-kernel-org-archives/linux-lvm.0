Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m0L3gkqY010644
	for <linux-lvm@redhat.com>; Sun, 20 Jan 2008 22:42:46 -0500
Received: from py-out-1112.google.com (py-out-1112.google.com [64.233.166.182])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id m0L3gPL7013302
	for <linux-lvm@redhat.com>; Sun, 20 Jan 2008 22:42:25 -0500
Received: by py-out-1112.google.com with SMTP id a29so2262650pyi.0
	for <linux-lvm@redhat.com>; Sun, 20 Jan 2008 19:42:25 -0800 (PST)
Message-ID: <e2be335f0801201942w1c3a7687gbe0d57df3cb754f5@mail.gmail.com>
Date: Sun, 20 Jan 2008 22:42:25 -0500
From: "J Lindsay" <lindsay.james@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_11545_24052806.1200886945344"
Subject: [linux-lvm] Recover UUID
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

------=_Part_11545_24052806.1200886945344
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello,
I recently had a hardware failure on my OS disk, which means I lost all
files including /etc/lvm/archive. My LVM2 volume spans 3 disks, all of which
are intact. How do I go about recreating this volume, without knowing the
UUID's of the disks. I tried running uuid_fixer but was given the error
"pv_read(): pv_flush". Running lvscan and pvscan returns no results.

Thanks,
James

------=_Part_11545_24052806.1200886945344
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello,<br>I recently had a hardware failure on my OS disk, which means I lost all files including /etc/lvm/archive. My LVM2 volume spans 3 disks, all of which are intact. How do I go about recreating this volume, without knowing the UUID&#39;s of the disks. I tried running uuid_fixer but was given the error &quot;pv_read(): pv_flush&quot;. Running lvscan and pvscan returns no results.
<br><br>Thanks,<br>James<br>

------=_Part_11545_24052806.1200886945344--
