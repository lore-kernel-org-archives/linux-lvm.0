Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l84BSMD6014748
	for <linux-lvm@redhat.com>; Tue, 4 Sep 2007 07:28:22 -0400
Received: from web57203.mail.re3.yahoo.com (web57203.mail.re3.yahoo.com
	[216.252.111.219])
	by mx2.redhat.com (8.13.1/8.13.1) with SMTP id l84BSFFH000813
	for <linux-lvm@redhat.com>; Tue, 4 Sep 2007 07:28:15 -0400
Date: Tue, 4 Sep 2007 04:28:09 -0700 (PDT)
From: Cliff Avey <mpwr5@yahoo.com>
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="0-1232244412-1188905289=:11486"
Content-Transfer-Encoding: 8bit
Message-ID: <764899.11486.qm@web57203.mail.re3.yahoo.com>
Subject: [linux-lvm] Attaching an existing LVM volume to a new linux on same
	box
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

--0-1232244412-1188905289=:11486
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit

I have an old Fedora system on which I just installed Fedora 7 in new partitions. I have chained the bootloaders so I can boot either the old or new Fedora. Separate from that drive, I have two SATA drives. Under the old Fedora, I build a raid with the these drives with md, then created a single PV on that, and a LV on that.

Now I want to be able to mount this LVM partition when I boot the new Fedora 7 system. I don't want to destroy existing data on it, and until I get the new Fedora 7 fully set up, I still want to be able to boot the old Fedora and use it as before.

Looks like I can configure the md array on the new system by using "mdadm --assemble", but I'm not quite sure about the correct commands to use on the new system to make the the LVM volume available.

       
---------------------------------
Shape Yahoo! in your own image.  Join our Network Research Panel today!
--0-1232244412-1188905289=:11486
Content-Type: text/html; charset=iso-8859-1
Content-Transfer-Encoding: 8bit

I have an old Fedora system on which I just installed Fedora 7 in new partitions. I have chained the bootloaders so I can boot either the old or new Fedora. Separate from that drive, I have two SATA drives. Under the old Fedora, I build a raid with the these drives with md, then created a single PV on that, and a LV on that.<br><br>Now I want to be able to mount this LVM partition when I boot the new Fedora 7 system. I don't want to destroy existing data on it, and until I get the new Fedora 7 fully set up, I still want to be able to boot the old Fedora and use it as before.<br><br>Looks like I can configure the md array on the new system by using "mdadm --assemble", but I'm not quite sure about the correct commands to use on the new system to make the the LVM volume available.<br><p>&#32;
      <hr size=1>Shape Yahoo! in your own image.  
<a href="http://us.rd.yahoo.com/evt=48517/*http://surveylink.yahoo.com/gmrs/yahoo_panel_invite.asp?a=7">Join our Network Research Panel today!</a>

--0-1232244412-1188905289=:11486--
