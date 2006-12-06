Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id kB6FacGJ008153
	for <linux-lvm@redhat.com>; Wed, 6 Dec 2006 10:36:39 -0500
Received: from web51103.mail.yahoo.com (web51103.mail.yahoo.com
	[206.190.38.145])
	by mx2.redhat.com (8.12.11.20060308/8.12.11) with SMTP id
	kB6FabV7018262
	for <linux-lvm@redhat.com>; Wed, 6 Dec 2006 10:36:37 -0500
Date: Wed, 6 Dec 2006 07:36:31 -0800 (PST)
From: Dave <davo_muc@yahoo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID: <421154.69996.qm@web51103.mail.yahoo.com>
Subject: [linux-lvm] corrupt VGDA kernel status, but on only one node
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
To: Linux LVM <linux-lvm@redhat.com>

Hi,

I can import and activate my $vg on one node fine, but after I switch it to the
backup node I get the following error upon import:

vgimport -- ERROR: VGDA in kernel and lvmtab are NOT consistent; please run vgscan
return code is: 98  <--->  from running /sbin/vgimport  infx-ao /dev/sdq /dev/sdr
/dev/sds

The /dev/infx-ao/* logical volumes do not exist, though they are created properly
when the $vg is activated on the first node.

This seems to indicate that the $vg itself is fine, but the VGDA in the kernel on
the backup node is inconsistent.  If so, can this be rectified without a reboot?!?  

Thanks,
Dave




 
____________________________________________________________________________________
Cheap talk?
Check out Yahoo! Messenger's low PC-to-Phone call rates.
http://voice.yahoo.com
