Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 824F4F9AA1
	for <linux-lvm@redhat.com>; Mon, 23 Mar 2020 18:05:48 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 263A28007CB
	for <linux-lvm@redhat.com>; Mon, 23 Mar 2020 18:05:48 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id f3so18269278wrw.7
	for <linux-lvm@redhat.com>; Mon, 23 Mar 2020 11:05:43 -0700 (PDT)
Received: from [192.168.100.26] ([45.66.41.73])
	by smtp.gmail.com with ESMTPSA id
	v26sm24519147wra.7.2020.03.23.11.05.38 for <linux-lvm@redhat.com>
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Mon, 23 Mar 2020 11:05:38 -0700 (PDT)
From: pasxizeis <pasxizeis@gmail.com>
Message-ID: <d390efc5-f7f1-4891-72f2-598adbc68997@gmail.com>
Date: Mon, 23 Mar 2020 20:03:27 +0200
MIME-Version: 1.0
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="------------94F2468A9AFB8A86F6FDE215"
Subject: [linux-lvm] Q: lvcreate, systemd and tmp.mount
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

This is a multi-part message in MIME format.
--------------94F2468A9AFB8A86F6FDE215
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

Hi all,

Perhaps this is more of a systemd-related question, but I wasn't sure so=20
here I go. I'm running into an issue where an lvcreate invocation=20
somehow (supposedly) results in systemd trying to activate tmp.mount.

    fooctl.py[14099]: foopkg-utils [14099]: INFO RunCmd: lvcreate -kn
    --addtag @bar -s -n bar_elastic-1582433367.seven
    storage/bar_elastic-1582433367

    dmeventd[663]: No longer monitoring thin pool
    storage-thinpool-tpool. lvm[663]: Monitoring thin pool
    storage-thinpool-tpool.

    fooctl.py[14099]: foopkg-utils [14099]: WARNING Command 'lvcreate
    -kn --addtag @bar -s -n bar_elastic-1582433367seven
    storage/bar_elastic-1582433367' stderr out: ' WARNING: Sum of all
    thin volume sizes (2.98 TiB) exceeds the size of thin pool
    storage/thinpool and the size of whole volume group (378.00 GiB)! '

    systemd[1]: tmp.mount: Directory /tmp to mount over is not empty,
    mounting anyway.

    systemd[1]: tmp.mount: Failed to run 'mount' task: No such file or
    directory systemd[1]: Failed to mount /tmp.

The thing is (a) I don't have tmp.mount activated (my /tmp belongs in=20
the root fs) and there is no relevant entry in `/etc/fstab`. The unit is=20
only defined at `/usr/share/systemd/tmp.mount`. So I don't get why=20
systemd is trying to mount tmp.mount at all and why only after the=20
`lvcreate` invocation.

Another interesting observation, is that even though I also do other=20
lvcreate invocations from the same group, the tmp.mount issue only comes=20
after invocations where the lv name ends with `.seven` (like in my=20
example above).

This is Debian Stretch with lvm 2.02.168.

Any ideas?

Thanks in advance!



--------------94F2468A9AFB8A86F6FDE215
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<html>
  <head>

    <meta http-equiv=3D"content-type" content=3D"text/html; charset=3DUTF-8=
">
  </head>
  <body bgcolor=3D"#FFFFFF" text=3D"#000000">
    <p>Hi all,</p>
    <p>Perhaps this is more of a systemd-related question, but I wasn't
      sure so here I go. I'm running into an issue where an lvcreate
      invocation somehow (supposedly) results in systemd trying to
      activate tmp.mount.</p>
    <blockquote>
      <p>fooctl.py[14099]: foopkg-utils [14099]: INFO RunCmd: lvcreate
        -kn --addtag @bar -s -n bar_elastic-1582433367.seven
        storage/bar_elastic-1582433367</p>
      <p>dmeventd[663]: No longer monitoring thin pool
        storage-thinpool-tpool.
        lvm[663]: Monitoring thin pool storage-thinpool-tpool.</p>
      <p>fooctl.py[14099]: foopkg-utils [14099]: WARNING Command
        'lvcreate -kn --addtag @bar -s -n bar_elastic-1582433367seven
        storage/bar_elastic-1582433367' stderr out: ' WARNING: Sum of
        all thin volume sizes (2.98 TiB) exceeds the size of thin pool
        storage/thinpool and the size of whole volume group (378.00
        GiB)! '</p>
      <p>systemd[1]: tmp.mount: Directory /tmp to mount over is not
        empty, mounting anyway.</p>
      <p>systemd[1]: tmp.mount: Failed to run 'mount' task: No such file
        or directory
        systemd[1]: Failed to mount /tmp. <br>
      </p>
    </blockquote>
    <p>The thing is (a) I don't have tmp.mount activated (my /tmp
      belongs in the root fs) and there is no relevant entry in
      `/etc/fstab`. The unit is only defined at
      `/usr/share/systemd/tmp.mount`. So I don't get why systemd is
      trying to mount tmp.mount at all and why only after the `lvcreate`
      invocation.</p>
    <p>Another interesting observation, is that even though I also do
      other lvcreate invocations from the same group, the tmp.mount
      issue only comes after invocations where the lv name ends with
      `.seven` (like in my example above).<br>
    </p>
    <p>This is Debian Stretch with lvm 2.02.168.</p>
    <p>Any ideas?</p>
    <p>Thanks in advance!<br>
    </p>
    <p><br>
    </p>
  </body>
</html>

--------------94F2468A9AFB8A86F6FDE215--
