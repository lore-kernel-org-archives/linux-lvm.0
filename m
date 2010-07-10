Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.13])
	by int-mx08.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o6A2AtSk005805
	for <linux-lvm@redhat.com>; Fri, 9 Jul 2010 22:10:56 -0400
Received: from mail-wy0-f174.google.com (mail-wy0-f174.google.com
	[74.125.82.174])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o6A2Ahfc004691
	for <linux-lvm@redhat.com>; Fri, 9 Jul 2010 22:10:43 -0400
Received: by wyf23 with SMTP id 23so2468140wyf.33
	for <linux-lvm@redhat.com>; Fri, 09 Jul 2010 19:10:42 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <AANLkTilc126w-ScRl_Vn_WMf4jYrE3jPnd1hIYvvbOf0@mail.gmail.com>
References: <AANLkTilc126w-ScRl_Vn_WMf4jYrE3jPnd1hIYvvbOf0@mail.gmail.com>
Date: Sat, 10 Jul 2010 07:10:59 +0530
Message-ID: <AANLkTil_oN8awYAtgRvu45izb46MPxxbw10H6thr3l-h@mail.gmail.com>
From: Renil Thomas <renilthomas82@gmail.com>
Content-Type: multipart/alternative; boundary=0015175cd7f2848872048afe9c5b
Subject: [linux-lvm] Online Update by using alternate root partition (as in
	Solaris)
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

--0015175cd7f2848872048afe9c5b
Content-Type: text/plain; charset=ISO-8859-1

Hi All,

This is about the online update on a linux machine. For instance, on a
running machine (RHEL 5.5), software update has to be carried out without
affecting the active root partition(LVM2 is used here), i.e., on an
alternate root partition or environment , can snapshots help? Also, after
updating in order to check the status of my update, can I boot from the
alternate partition (if possible above)  and then if it works fine, can I
sync the data into the older partition with these changes?

Thanks & Regards,
Renil Thomas

--0015175cd7f2848872048afe9c5b
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div class=3D"gmail_quote"><br><br>Hi All,<div><br></div><div>This is about=
 the online update on a linux machine. For instance, on a running machine (=
RHEL 5.5), software update has to be carried out without affecting the acti=
ve root partition(LVM2 is used here), i.e., on an alternate root partition =
or environment , can snapshots help? Also, after updating=A0in order=A0to c=
heck the status of my update, can I boot from the alternate partition (if p=
ossible above) =A0and then if it works fine, can I sync the data into the o=
lder partition with these changes?</div>

<div><br></div><div>Thanks &amp; Regards,</div><div>Renil Thomas</div>
</div><br>

--0015175cd7f2848872048afe9c5b--
