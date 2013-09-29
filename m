Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r8TBx4Po002672
	for <linux-lvm@redhat.com>; Sun, 29 Sep 2013 07:59:04 -0400
Received: from mail-wg0-f54.google.com (mail-wg0-f54.google.com [74.125.82.54])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r8TBx20h010242
	for <linux-lvm@redhat.com>; Sun, 29 Sep 2013 07:59:03 -0400
Received: by mail-wg0-f54.google.com with SMTP id m15so4356909wgh.21
	for <linux-lvm@redhat.com>; Sun, 29 Sep 2013 04:59:02 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CALHAVFw1T1vMJwECqCO4-_KfUjU_EyCihFW=DgW5xDh36nR19A@mail.gmail.com>
References: <CALHAVFw1T1vMJwECqCO4-_KfUjU_EyCihFW=DgW5xDh36nR19A@mail.gmail.com>
Date: Sun, 29 Sep 2013 17:29:02 +0530
Message-ID: <CALHAVFx5vVd8OPiEgS=nkE9u+hg0qGt=6q_JrB2oLFUDokKKMw@mail.gmail.com>
From: Prathyush <prathyush.r@gmail.com>
Content-Type: multipart/alternative; boundary=001a11c1ba4a11dba504e7847234
Subject: [linux-lvm] File system read only
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

--001a11c1ba4a11dba504e7847234
Content-Type: text/plain; charset=ISO-8859-1

Hi
In our server the ext3.fs created on lvm is going read only mode.
When I try to mount it again it suggest for file system check and never
mounted.But I did lvm deactivate and activate.then tried mounting  ....now
this got mounted with out file system check.we took one problematic volume
,deleted and recreated the volume,made file system.But the isse happened on
that fs ....Any idea?

--001a11c1ba4a11dba504e7847234
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<p>Hi<br>
In our server the ext3.fs created on lvm is going read only mode.<br>
When I try to mount it again it suggest for file system check and never mou=
nted.But I did lvm deactivate and activate.then tried mounting=A0 ....now t=
his got mounted with out file system check.we took one problematic volume ,=
deleted and recreated the volume,made file system.But the isse happened on =
that fs ....Any idea?</p>


--001a11c1ba4a11dba504e7847234--
