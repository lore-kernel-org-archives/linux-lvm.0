Received: from mx1.redhat.com (ext-mx10.extmail.prod.ext.phx2.redhat.com
	[10.5.110.14])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id oAIEZEbc010382
	for <linux-lvm@redhat.com>; Thu, 18 Nov 2010 09:35:14 -0500
Received: from web37902.mail.mud.yahoo.com (web37902.mail.mud.yahoo.com
	[209.191.91.164])
	by mx1.redhat.com (8.13.8/8.13.8) with SMTP id oAIEZ1Rr024032
	for <linux-lvm@redhat.com>; Thu, 18 Nov 2010 09:35:01 -0500
Message-ID: <714075.64821.qm@web37902.mail.mud.yahoo.com>
Date: Thu, 18 Nov 2010 06:08:19 -0800 (PST)
From: Rowland Agboro <agboro2000@yahoo.com>
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="0-1958006838-1290089299=:64821"
Subject: [linux-lvm] volume group does not activate after reboot
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@redhat.com

--0-1958006838-1290089299=:64821
Content-Type: text/plain; charset=us-ascii

Hi,
I have a Red Hat Enterprise Linux 5 running

I have just created a volume group but anytime i do a reboot the logical volume 
becomes inactive.

I will manually run vgchange -ay and this brings the logical volume online.

How do I make this logical volume to be active after each reboot?

Please note that the volume group is created from a NetApp ISCSI LUN.

Regards
Ejiro



      
--0-1958006838-1290089299=:64821
Content-Type: text/html; charset=us-ascii

<html><head><style type="text/css"><!-- DIV {margin:0px;} --></style></head><body><div style="font-family:times new roman,new york,times,serif;font-size:14pt"><div>Hi,<br>I have a Red Hat Enterprise Linux 5 running<br><br>I have just created a volume group but anytime i do a reboot the logical volume becomes inactive.<br><br>I will manually run vgchange -ay and this brings the logical volume online.<br><br>How do I make this logical volume to be active after each reboot?<br><br>Please note that the volume group is created from a NetApp ISCSI LUN.<br><br>Regards<br>Ejiro<br></div>
</div><br>

      </body></html>
--0-1958006838-1290089299=:64821--
