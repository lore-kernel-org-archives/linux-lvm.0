Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q78DE44i028193
	for <linux-lvm@redhat.com>; Wed, 8 Aug 2012 09:14:05 -0400
Received: from mail-qc0-f174.google.com (mail-qc0-f174.google.com
	[209.85.216.174])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q78DE3uK024315
	for <linux-lvm@redhat.com>; Wed, 8 Aug 2012 09:14:03 -0400
Received: by qcro28 with SMTP id o28so440937qcr.33
	for <linux-lvm@redhat.com>; Wed, 08 Aug 2012 06:14:03 -0700 (PDT)
MIME-Version: 1.0
Date: Wed, 8 Aug 2012 15:14:03 +0200
Message-ID: <CAHwWuAHkaWijyb6NyWvhOEeHBN_Y4qJ1XUuzFSAEp16RKM0GEg@mail.gmail.com>
From: =?ISO-8859-1?B?ROluZXMgTultZXRo?= <mr.nemeth.denes@gmail.com>
Content-Type: multipart/alternative; boundary=20cf302efc6e87cb6504c6c0e206
Subject: [linux-lvm] bug: xfs resize in fsadm
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

--20cf302efc6e87cb6504c6c0e206
Content-Type: text/plain; charset=ISO-8859-1

Dear All

I do not know how to file a bug report. The bug is the following
fsadm do not pass the new size parameter to xfs_growfs
Instead of:
        if [ $NEWBLOCKCOUNT -gt $BLOCKCOUNT ]; then
                verbose "Resizing Xfs mounted on \"$MOUNTPOINT\" to fill
device \"$VOLUME\""
                dry $RESIZE_XFS $MOUNTPOINT
        elif
it should be
        if [ $NEWBLOCKCOUNT -gt $BLOCKCOUNT ]; then
                verbose "Resizing Xfs mounted on \"$MOUNTPOINT\" to fill
device \"$VOLUME\""
                dry $RESIZE_XFS -d $NEWBLOCKCOUNT $MOUNTPOINT
        elif

Best wishes
Denes

--20cf302efc6e87cb6504c6c0e206
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Dear All<br><br>I do not know how to file a bug report. The bug is the foll=
owing <br>fsadm do not pass the new size parameter to xfs_growfs<br>Instead=
 of:<br>=A0=A0=A0=A0=A0=A0=A0 if [ $NEWBLOCKCOUNT -gt $BLOCKCOUNT ]; then<b=
r>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 verbose &quot;Resizing Xfs =
mounted on \&quot;$MOUNTPOINT\&quot; to fill device \&quot;$VOLUME\&quot;&q=
uot;<br>
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 dry $RESIZE_XFS $MOUNTPOINT<b=
r>=A0=A0=A0=A0=A0=A0=A0 elif<br>it should be <br>=A0=A0=A0=A0=A0=A0=A0 if [=
 $NEWBLOCKCOUNT -gt $BLOCKCOUNT ]; then<br>
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 verbose &quot;Resizing Xfs mo=
unted on \&quot;$MOUNTPOINT\&quot; to fill device \&quot;$VOLUME\&quot;&quo=
t;<br>
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 dry $RESIZE_XFS -d $NEWBLOCKC=
OUNT $MOUNTPOINT<br>
=A0=A0=A0=A0=A0=A0=A0 elif<br>
<br>Best wishes<br>Denes<br>

--20cf302efc6e87cb6504c6c0e206--
