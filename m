Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l43BmeTx007215
	for <linux-lvm@redhat.com>; Thu, 3 May 2007 07:48:41 -0400
Received: from wx-out-0506.google.com (wx-out-0506.google.com [66.249.82.239])
	by mx2.redhat.com (8.13.1/8.13.1) with ESMTP id l43BmdvZ007877
	for <linux-lvm@redhat.com>; Thu, 3 May 2007 07:48:39 -0400
Received: by wx-out-0506.google.com with SMTP id s11so430923wxc
	for <linux-lvm@redhat.com>; Thu, 03 May 2007 04:48:39 -0700 (PDT)
Message-ID: <aad5bb0705030448i100ffe37of929baac081535b4@mail.gmail.com>
Date: Thu, 3 May 2007 13:48:39 +0200
From: "Damir Hasakovic" <bosnianx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Subject: [linux-lvm] How to remove crashed inaccessible harddrive from LVM2.
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com

Hi everyone,

I have a big big issue with my LVM2 system. Im running Debian 3.1 with
6 harddrives and no RAID. Last drive that i added have now crashed.
When i boot the machine, during the bootproecess fsck starts to check
LVM and after 50 % terminal gets filled with I/O error. I have tracked
down wich HDD is the crashed one.

The problem is i cant't type anything in terminal because it spits I/O
error every 5 secs. What i can do is to connect via SSH and than i can
navigate through the system but as soon i type for example "lvdisplay"
or anything that have to do with LVM the SSH session hangs.

Im very desperate to get this system upp and running.

Other drives are full and working. Is there any way to just remove the
last hardrive. I don't care about the information that is on the last
driver because it's just couple of movies and some pics.

Please help if u can :)


Thanx in advanced

Kind regards

//damir
