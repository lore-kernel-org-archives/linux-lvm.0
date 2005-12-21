Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id jBL1Cp131496
	for <linux-lvm@redhat.com>; Tue, 20 Dec 2005 20:12:51 -0500
Received: from web80907.mail.scd.yahoo.com (web80907.mail.scd.yahoo.com
	[66.218.95.70])
	by mx3.redhat.com (8.13.1/8.13.1) with SMTP id jBL1Cg2Z017668
	for <linux-lvm@redhat.com>; Tue, 20 Dec 2005 20:12:42 -0500
Message-ID: <20051221011236.10857.qmail@web80907.mail.scd.yahoo.com>
Date: Tue, 20 Dec 2005 17:12:36 -0800 (PST)
From: mymail mymail <internetbizmail@yahoo.com>
Subject: Re: [linux-lvm] Recovery of data in LVM from a corrupt disk
In-Reply-To: <AED6CFAFF9F260323C3E5890@d216-220-25-20.dynip.modwest.com>
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="0-353243383-1135127556=:8445"
Content-Transfer-Encoding: 8bit
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

--0-353243383-1135127556=:8445
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit



Michael Loftis <mloftis@wgops.com> wrote: 
LVM is not a filesystem, it's a block device layer.  If you're 
running/using LVM on the existing system it's vgscan and vgchange on 
startup should have activated all the old LVs/VGs and mapped them to 
/dev/VGNAME/LVNAME -- those are the devices you mount.
Thanks.

I realise this. But the disk I'm trying to mount is built the same way as the new disk I've built. So the both have a VolGroup00. What I would like to do is to either understand how I can change the volume group info so it will become a distinct volume group, and then I can 'import' this into my new environment, or how I can get into the block system so I can access the filesystem structure it embeds.

This is where I'm struggling. I would like to create a VolGroup01 device file, rename the volume group within the physical volume, and then mount that. Is it possible to 'hack' the old drive like this?


__________________________________________________
Do You Yahoo!?
Tired of spam?  Yahoo! Mail has the best spam protection around 
http://mail.yahoo.com 
--0-353243383-1135127556=:8445
Content-Type: text/html; charset=iso-8859-1
Content-Transfer-Encoding: 8bit

<div id="RTEContent"><br><br><b><i>Michael Loftis &lt;mloftis@wgops.com&gt;</i></b> wrote:<blockquote class="replbq" style="border-left: 2px solid rgb(16, 16, 255); margin-left: 5px; padding-left: 5px;"> <br><internetbizmail@yahoo.com>LVM is not a filesystem, it's a block device layer.  If you're <br>running/using LVM on the existing system it's vgscan and vgchange on <br>startup should have activated all the old LVs/VGs and mapped them to <br>/dev/VGNAME/LVNAME -- those are the devices you mount.<br></internetbizmail@yahoo.com></blockquote>Thanks.<br><br>I realise this. But the disk I'm trying to mount is built the same way as the new disk I've built. So the both have a VolGroup00. What I would like to do is to either understand how I can change the volume group info so it will become a distinct volume group, and then I can 'import' this into my new environment, or how I can get into the block system so I can access the filesystem structure it embeds.<br><br>This is where I!
'm
 struggling. I would like to create a VolGroup01 device file, rename the volume group within the physical volume, and then mount that. Is it possible to 'hack' the old drive like this?<br></div><p>__________________________________________________<br>Do You Yahoo!?<br>Tired of spam?  Yahoo! Mail has the best spam protection around <br>http://mail.yahoo.com 
--0-353243383-1135127556=:8445--
