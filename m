Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q0HIGLhn003949
	for <linux-lvm@redhat.com>; Tue, 17 Jan 2012 13:16:21 -0500
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q0HIGK71027446
	for <linux-lvm@redhat.com>; Tue, 17 Jan 2012 13:16:21 -0500
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.14.3/8.14.3) with ESMTP id q0HIFdxS020979
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Tue, 17 Jan 2012 13:15:39 -0500
Received: from bmsred (bmsred [192.168.9.50])
	by bmsred.bmsi.com (8.14.3/8.14.3) with ESMTP id q0HIFcth022799
	for <linux-lvm@redhat.com>; Tue, 17 Jan 2012 13:15:38 -0500
Date: Tue, 17 Jan 2012 13:15:38 -0500 (EST)
From: "Stuart D. Gathman" <stuart@bmsi.com>
In-Reply-To: <CALe_PVkSZD-ij5D7HQiKoL=obeQMuV3ZnJfd9f_1rocFdkt71A@mail.gmail.com>
Message-ID: <alpine.LRH.2.00.1201171311000.22642@bmsred.bmsi.com>
References: <CALe_PVkSZD-ij5D7HQiKoL=obeQMuV3ZnJfd9f_1rocFdkt71A@mail.gmail.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Resizing a logical volume which is mounted (at
 /home)
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
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

Long ago, Nostradamus foresaw that on Jan 16, Kiran Rao would write:

> Now, I tried the GUI (system-config-lvm) tool to do this. I can click on
> lvhome and try to resize it. However, the problem is that since I am logged
> in as a non-root user, the /home is mounted. Resizing requires one to
> unmount it, but the unmount operation fails since I am mounted.
> 
> How do I work around this?

Log out of GUI
Switch to text console (on linux try Ctrl-Alt-F3 for vt3)
Login as root 
Unmount /home
resize2fs <device-for-home>
# WARNING!  Make sure lvresize size is >= resize2fs size.  If you aren't
# sure about the units, make lvresize larger than you think you made
# the filesystem.  You can always expand the filesystems again, but
# you can't undo shrinking the LV too far.
lvresize <device-for-home>
mount /home

--
 	      Stuart D. Gathman <stuart@bmsi.com>
     Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
