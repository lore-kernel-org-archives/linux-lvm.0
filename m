Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n0EMmm2O022886
	for <linux-lvm@redhat.com>; Wed, 14 Jan 2009 17:48:48 -0500
Received: from mail-bw0-f20.google.com (mail-bw0-f20.google.com
	[209.85.218.20])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id n0EMkU6J028768
	for <linux-lvm@redhat.com>; Wed, 14 Jan 2009 17:46:30 -0500
Received: by bwz13 with SMTP id 13so2339604bwz.3
	for <linux-lvm@redhat.com>; Wed, 14 Jan 2009 14:46:29 -0800 (PST)
Message-ID: <e80b0eb70901141446t5b970680ve2096929f48d53eb@mail.gmail.com>
Date: Wed, 14 Jan 2009 14:46:27 -0800
From: "lu ping" <luping.nju@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_11657_24615176.1231973188024"
Subject: [linux-lvm] Take snapshot on root filesystem
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
Cc: lu ping <luping.nju@gmail.com>

------=_Part_11657_24615176.1231973188024
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi Folks,

I have a question on the capability of LVM snapshot on root filesystem. I
have my root ("/") sitting on a LVM logical volume and I want to snapshot
it, backup it up and then remove the snapshot. During the snapshot and
removal there can be quite some disk IO activities going on.

So does the lastest LVM could support doing the above job smoothly? I had
experience that snapshot the root filesystem hangs my RHEL 4 system, and I
saw similar reports (
http://www.interworx.com/forums/archive/index.php/t-1590.html).
Is this problem fixed now? If so, could somebody explain where the original
problem is, in device mapper, in LVM user space tool, or somewhere else?

Thanks
Ping

------=_Part_11657_24615176.1231973188024
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi Folks,<br><br>I have a question on the capability of LVM snapshot on root filesystem. I have my root (&quot;/&quot;) sitting on a LVM logical volume and I want to snapshot it, backup it up and then remove the snapshot. During the snapshot and removal there can be quite some disk IO activities going on.<br>
<br>So does the lastest LVM could support doing the above job smoothly? I had experience that snapshot the root filesystem hangs my RHEL 4 system, and I saw similar reports (<a href="http://www.interworx.com/forums/archive/index.php/t-1590.html">http://www.interworx.com/forums/archive/index.php/t-1590.html</a>).<br>
Is this problem fixed now? If so, could somebody explain where the original problem is, in device mapper, in LVM user space tool, or somewhere else?<br><br>Thanks<br>Ping<br>

------=_Part_11657_24615176.1231973188024--
