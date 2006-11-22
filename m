Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id kAMELb9F029455
	for <linux-lvm@redhat.com>; Wed, 22 Nov 2006 09:21:37 -0500
Received: from ug-out-1314.google.com (ug-out-1314.google.com [66.249.92.168])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id kAMELYxn007504
	for <linux-lvm@redhat.com>; Wed, 22 Nov 2006 09:21:34 -0500
Received: by ug-out-1314.google.com with SMTP id 30so180571ugs
	for <linux-lvm@redhat.com>; Wed, 22 Nov 2006 06:21:33 -0800 (PST)
Message-ID: <9cf248670611220621s4899578btf40320037c620473@mail.gmail.com>
Date: Wed, 22 Nov 2006 19:51:33 +0530
From: "Vasan V S" <vasan.vs@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_45896_3664738.1164205293177"
Subject: [linux-lvm] LVM2 snapshot contents on a reboot
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

------=_Part_45896_3664738.1164205293177
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi all,

We are using the latest version of LVM2 and creating a snapshot LV (This is
a fresh snapshot LV and we are not attempting to migrate from LVM1).
However, on rebooting the server, we find the snapshot contents are getting
synced up with the original source volume contents completely. Any changes
that has been made in the source volume after the snapshot volume has been
taken is getting reflected in the snapshot volume as well after the reboot.

The following are the commands that we are using:

For the creation of snapshot:

lvcreate -s -L <snap size> -n <snapshot Name> -p <R-W permission> <original
volume>

For deleting the snapshot:

lvremove -f <snap shot node entry>

However, if the server (running Linux 2.6.15.4) is not rebooted, the
snapshot contents are correctly shown even if there has been any changes on
the source volume.

Should we do anything specific at the time of the server shutdown to ensure
that the snapshot contents should not be getting synced with the source
volume on start up?

Please advice.

Thanks

vasan

------=_Part_45896_3664738.1164205293177
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi all,<br><br>We are using the latest version of LVM2 and creating a snapshot LV (This is a fresh snapshot LV and we are not attempting to migrate from LVM1). However, on rebooting the server, we find the snapshot contents are getting synced up with the original source volume contents completely. Any changes that has been made in the source volume after the snapshot volume has been taken is getting reflected in the snapshot volume as well after the reboot.
<br><br>The following are the commands that we are using:<br><br>For the creation of snapshot:<br><br>lvcreate -s -L 
&lt;snap size&gt; -n &lt;snapshot Name&gt; -p &lt;R-W permission&gt; &lt;original volume&gt;<br><br>For deleting the 
snapshot:<br><br>lvremove -f &lt;snap shot node 
entry&gt;<br><br>However, if the server (running Linux <a href="http://2.6.15.4" target="_blank" onclick="return top.js.OpenExtLink(window,event,this)">2.6.15.4</a>) is not rebooted, the snapshot contents are correctly shown even if there has been any changes on the source volume.
<br><br>Should we do anything specific at the time of the server shutdown to ensure that the snapshot contents should not be getting synced with the source volume on start up? 
<br><br>Please advice.<br><br>Thanks<br><br>vasan<br>


------=_Part_45896_3664738.1164205293177--
