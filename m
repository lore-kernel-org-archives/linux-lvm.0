Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E87E9C433F5
	for <linux-lvm@archiver.kernel.org>; Tue, 31 May 2022 05:52:58 +0000 (UTC)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-101-YS-M42sMNR6BPN9dpBbmGw-1; Tue, 31 May 2022 01:52:56 -0400
X-MC-Unique: YS-M42sMNR6BPN9dpBbmGw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6C1D63801EC1;
	Tue, 31 May 2022 05:52:53 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E9152C23DBF;
	Tue, 31 May 2022 05:52:45 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id A449C1947061;
	Tue, 31 May 2022 05:52:45 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 3218019466DF
 for <linux-lvm@listman.corp.redhat.com>; Mon, 30 May 2022 11:55:21 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id F32672166B2A; Mon, 30 May 2022 11:55:20 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EE9102166B26
 for <linux-lvm@redhat.com>; Mon, 30 May 2022 11:55:20 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CF760811E80
 for <linux-lvm@redhat.com>; Mon, 30 May 2022 11:55:20 +0000 (UTC)
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com
 [209.85.222.171]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-659-oX2Wk3m3MYmEHoBzSdRYCQ-1; Mon, 30 May 2022 07:55:18 -0400
X-MC-Unique: oX2Wk3m3MYmEHoBzSdRYCQ-1
Received: by mail-qk1-f171.google.com with SMTP id c197so1913921qke.12
 for <linux-lvm@redhat.com>; Mon, 30 May 2022 04:55:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=vPT0S9PbIlMDPHuawEtzroSUAmK6IoholfdpDV2FVAE=;
 b=FjPKyBdblQnZACO1qi3nmY5OY/jVuPLRHoSaoM59z0pEoLFwFA3zWEc50j3IGjOBJi
 q57Eet6fevD2V3Pm97BpWvj+vUGRujHZO8aZOr0YI3PEKacApSkxVHupEjK4cQ+4Y60Q
 nz6fntUSWzkYvQ4XechhsZBFV1Eim8o4sVDANcftKLR27dXlKOMPQNHzogn4Ql1hhMNc
 /UABvN4VGR2ZJ/Wc6/DC0Xe9+T8FmBnyzfRD+ZSzESDGjCCl4VEkVzNLLoL770aQrUDl
 vNMT20E4IKBkH4tTkN95UrWL3JhM0Q2eAM3XPpdIY2WlHc9aVjgQcYF1oQqo3ORkFvLb
 PmUA==
X-Gm-Message-State: AOAM5310mXi2fjhQzTfU6PUnn+lKaXCizAQD3rc4Fwc+vliYiXIEEfc3
 E6L2n1739CeGNvRzWcRijFpbmSmWW4mOnQeJfSzDvMzk
X-Google-Smtp-Source: ABdhPJxynp2Fxf3z5ngtkLODiQHpeCWA3SNUi0Kx0CPy8FMoqujdCnqzBg4OhbyIUsBTFHLvZVTP7EkwSxe21OPgkE4=
X-Received: by 2002:a05:620a:c52:b0:648:d550:5583 with SMTP id
 u18-20020a05620a0c5200b00648d5505583mr38038615qki.232.1653911714720; Mon, 30
 May 2022 04:55:14 -0700 (PDT)
MIME-Version: 1.0
References: <CAM3OQJGWsYo=boQBHqmLj1HRRtg14p3-Tp3yeu7KMYcKV2_hOA@mail.gmail.com>
In-Reply-To: <CAM3OQJGWsYo=boQBHqmLj1HRRtg14p3-Tp3yeu7KMYcKV2_hOA@mail.gmail.com>
From: Roger Heflin <rogerheflin@gmail.com>
Date: Mon, 30 May 2022 06:55:03 -0500
Message-ID: <CAAMCDecMgzcyQOdb2n-zLRwrHhK9wFSicHJDeA_9zhvSQbyPdw@mail.gmail.com>
To: LVM general discussion and development <linux-lvm@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Mailman-Approved-At: Tue, 31 May 2022 05:52:45 +0000
Subject: Re: [linux-lvm] lvm commands hanging when run from inside a
 kubernetes pod
X-BeenThere: linux-lvm@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-lvm>,
 <mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/linux-lvm/>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-lvm>,
 <mailto:linux-lvm-request@redhat.com?subject=subscribe>
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
Errors-To: linux-lvm-bounces@redhat.com
Sender: "linux-lvm" <linux-lvm-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="===============2848748846609733788=="

--===============2848748846609733788==
Content-Type: multipart/alternative; boundary="0000000000003ef0d605e03954ed"

--0000000000003ef0d605e03954ed
Content-Type: text/plain; charset="UTF-8"

You need to rerun with an "strace -f".  That way it will also strace the
fork's one of which it appears to be waiting on.

On Mon, May 30, 2022 at 1:52 AM Abhishek Agarwal <
mragarwal.developer@gmail.com> wrote:

> When a kubernetes pod is scheduled on the node having lvm2 libraries
> already installed and trying to run lvm commands using those node binaries
> from inside the pod container, the commands hang and are waiting on
> something to complete. Although when ctrl+c is pressed the terminal session
> resumes and checking the final code for the execution returns a "0" error
> code and the commands operation is also carried out successfully.
>
>
> Below is the command output and strace for the command:-
>
> strace of lvcreate on the pod container scheduled on the node where lvm2
> binaries are present:
> # strace /sbin/lvm-eg/lvcreate -n test-lv -L 1G shared-vg
> execve("/sbin/lvm-eg/lvcreate", ["/sbin/lvm-eg/lvcreate", "-n", "test-lv",
> "-L", "1G", "shared-vg"], 0x7ffe7d7a6c98 /* 37 vars */) = 0
> brk(NULL)                = 0x55d196f41000
> arch_prctl(0x3001 /* ARCH_??? */, 0x7ffdd8247a80) = -1 EINVAL (Invalid
> argument)
> access("/etc/ld.so.preload", R_OK)   = -1 ENOENT (No such file or
> directory)
> openat(AT_FDCWD, "/etc/ld.so.cache", O_RDONLY|O_CLOEXEC) = 3
> fstat(3, {st_mode=S_IFREG|0644, st_size=8679, ...}) = 0
> mmap(NULL, 8679, PROT_READ, MAP_PRIVATE, 3, 0) = 0x7f0d37895000
> close(3)                = 0
> openat(AT_FDCWD, "/lib/x86_64-linux-gnu/libc.so.6", O_RDONLY|O_CLOEXEC) = 3
> read(3,
> "\177ELF\2\1\1\3\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0\360A\2\0\0\0\0\0"..., 832)
> = 832
> pread64(3, "\6\0\0\0\4\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0"...,
> 784, 64) = 784
> pread64(3,
> "\4\0\0\0\20\0\0\0\5\0\0\0GNU\0\2\0\0\300\4\0\0\0\3\0\0\0\0\0\0\0", 32,
> 848) = 32
> pread64(3,
> "\4\0\0\0\24\0\0\0\3\0\0\0GNU\0\237\333t\347\262\27\320l\223\27*\202C\370T\177"...,
> 68, 880) = 68
> fstat(3, {st_mode=S_IFREG|0755, st_size=2029560, ...}) = 0
> mmap(NULL, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) =
> 0x7f0d37893000
> pread64(3, "\6\0\0\0\4\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0"...,
> 784, 64) = 784
> pread64(3,
> "\4\0\0\0\20\0\0\0\5\0\0\0GNU\0\2\0\0\300\4\0\0\0\3\0\0\0\0\0\0\0", 32,
> 848) = 32
> pread64(3,
> "\4\0\0\0\24\0\0\0\3\0\0\0GNU\0\237\333t\347\262\27\320l\223\27*\202C\370T\177"...,
> 68, 880) = 68
> mmap(NULL, 2037344, PROT_READ, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) =
> 0x7f0d376a1000
> mmap(0x7f0d376c3000, 1540096, PROT_READ|PROT_EXEC,
> MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x22000) = 0x7f0d376c3000
> mmap(0x7f0d3783b000, 319488, PROT_READ,
> MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x19a000) = 0x7f0d3783b000
> mmap(0x7f0d37889000, 24576, PROT_READ|PROT_WRITE,
> MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x1e7000) = 0x7f0d37889000
> mmap(0x7f0d3788f000, 13920, PROT_READ|PROT_WRITE,
> MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0x7f0d3788f000
> close(3)                = 0
> arch_prctl(ARCH_SET_FS, 0x7f0d37894580) = 0
> mprotect(0x7f0d37889000, 16384, PROT_READ) = 0
> mprotect(0x55d196662000, 8192, PROT_READ) = 0
> mprotect(0x7f0d378c5000, 4096, PROT_READ) = 0
> munmap(0x7f0d37895000, 8679)      = 0
> getuid()                = 0
> getgid()                = 0
> getpid()                = 19163
> rt_sigaction(SIGCHLD, {sa_handler=0x55d196657c30, sa_mask=~[RTMIN RT_1],
> sa_flags=SA_RESTORER, sa_restorer=0x7f0d376e40c0}, NULL, 8) = 0
> geteuid()                = 0
> brk(NULL)                = 0x55d196f41000
> brk(0x55d196f62000)           = 0x55d196f62000
> getppid()                = 19160
> stat("/", {st_mode=S_IFDIR|0755, st_size=4096, ...}) = 0
> stat(".", {st_mode=S_IFDIR|0755, st_size=4096, ...}) = 0
> openat(AT_FDCWD, "/sbin/lvm-eg/lvcreate", O_RDONLY) = 3
> fcntl(3, F_DUPFD, 10)          = 10
> close(3)                = 0
> fcntl(10, F_SETFD, FD_CLOEXEC)     = 0
> geteuid()                = 0
> getegid()                = 0
> rt_sigaction(SIGINT, NULL, {sa_handler=SIG_DFL, sa_mask=[], sa_flags=0},
> 8) = 0
> rt_sigaction(SIGINT, {sa_handler=0x55d196657c30, sa_mask=~[RTMIN RT_1],
> sa_flags=SA_RESTORER, sa_restorer=0x7f0d376e40c0}, NULL, 8) = 0
> rt_sigaction(SIGQUIT, NULL, {sa_handler=SIG_DFL, sa_mask=[], sa_flags=0},
> 8) = 0
> rt_sigaction(SIGQUIT, {sa_handler=SIG_DFL, sa_mask=~[RTMIN RT_1],
> sa_flags=SA_RESTORER, sa_restorer=0x7f0d376e40c0}, NULL, 8) = 0
> rt_sigaction(SIGTERM, NULL, {sa_handler=SIG_DFL, sa_mask=[], sa_flags=0},
> 8) = 0
> rt_sigaction(SIGTERM, {sa_handler=SIG_DFL, sa_mask=~[RTMIN RT_1],
> sa_flags=SA_RESTORER, sa_restorer=0x7f0d376e40c0}, NULL, 8) = 0
> read(10, "#!/bin/sh\npath=$(/sbin/lvm-eg/ge"..., 8192) = 79
> pipe([3, 4])              = 0
> clone(child_stack=NULL,
> flags=CLONE_CHILD_CLEARTID|CLONE_CHILD_SETTID|SIGCHLD,
> child_tidptr=0x7f0d37894850) = 19164
> close(4)                = 0
> read(3, "/usr/sbin/lvcreate\n", 128)  = 19
> --- SIGCHLD {si_signo=SIGCHLD, si_code=CLD_EXITED, si_pid=19164, si_uid=0,
> si_status=0, si_utime=0, si_stime=0} ---
> rt_sigreturn({mask=[]})         = 19
> read(3, "", 128)            = 0
> close(3)                = 0
> wait4(-1, [{WIFEXITED(s) && WEXITSTATUS(s) == 0}], 0, NULL) = 19164
> stat("/usr/local/sbin/chroot", 0x7ffdd8247710) = -1 ENOENT (No such file
> or directory)
> stat("/usr/local/bin/chroot", 0x7ffdd8247710) = -1 ENOENT (No such file or
> directory)
> stat("/usr/sbin/chroot", {st_mode=S_IFREG|0755, st_size=43352, ...}) = 0
> clone(child_stack=NULL,
> flags=CLONE_CHILD_CLEARTID|CLONE_CHILD_SETTID|SIGCHLD,
> child_tidptr=0x7f0d37894850) = 19168
> wait4(-1, ^Cstrace: Process 19163 detached
>  <detached ...>
>
> # ^C
>
> `lvs` output on the node after pressing ctrl+c on the pod
> container's terminal:
> ubuntu@ip-172-31-85-197:~$ sudo lvs
>  LV                    VG       Attr    LSize  Pool      Origin Data%
> Meta% Move Log Cpy%Sync Convert
>  test-lv                 shared-vg    -wi-a-----  1.00g
>
> If ctrl+c is not pressed and trying to see the above output on the node
> also hangs until the pod operation is interrupted.
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://listman.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>

--0000000000003ef0d605e03954ed
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">You need to rerun with an &quot;strace -f&quot;.=C2=A0 Tha=
t way it will also strace the fork&#39;s one of which it appears to be wait=
ing on.<br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"g=
mail_attr">On Mon, May 30, 2022 at 1:52 AM Abhishek Agarwal &lt;<a href=3D"=
mailto:mragarwal.developer@gmail.com">mragarwal.developer@gmail.com</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=
=3D"ltr">When a kubernetes pod is scheduled on the node having lvm2 librari=
es already installed and trying to run lvm commands using those node binari=
es from inside the pod container, the commands hang and are waiting on some=
thing to complete. Although when ctrl+c is pressed the terminal session res=
umes and checking the final code for the execution returns a &quot;0&quot; =
error code and the commands operation is also carried out successfully.<div=
><br></div><div><br>Below is the command output and strace for the command:=
-</div><div><br>strace of lvcreate on the pod container scheduled on the no=
de where lvm2 binaries are present:<br># strace /sbin/lvm-eg/lvcreate -n te=
st-lv -L 1G shared-vg<br>execve(&quot;/sbin/lvm-eg/lvcreate&quot;, [&quot;/=
sbin/lvm-eg/lvcreate&quot;, &quot;-n&quot;, &quot;test-lv&quot;, &quot;-L&q=
uot;, &quot;1G&quot;, &quot;shared-vg&quot;], 0x7ffe7d7a6c98 /* 37 vars */)=
 =3D 0<br>brk(NULL) =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
=3D 0x55d196f41000<br>arch_prctl(0x3001 /* ARCH_??? */, 0x7ffdd8247a80) =3D=
 -1 EINVAL (Invalid argument)<br>access(&quot;/etc/ld.so.preload&quot;, R_O=
K) =C2=A0 =3D -1 ENOENT (No such file or directory)<br>openat(AT_FDCWD, &qu=
ot;/etc/ld.so.cache&quot;, O_RDONLY|O_CLOEXEC) =3D 3<br>fstat(3, {st_mode=
=3DS_IFREG|0644, st_size=3D8679, ...}) =3D 0<br>mmap(NULL, 8679, PROT_READ,=
 MAP_PRIVATE, 3, 0) =3D 0x7f0d37895000<br>close(3) =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D 0<br>openat(AT_FDCWD, &quot;/lib/x86_64-=
linux-gnu/libc.so.6&quot;, O_RDONLY|O_CLOEXEC) =3D 3<br>read(3, &quot;\177E=
LF\2\1\1\3\0\0\0\0\0\0\0\0\3\0&gt;\0\1\0\0\0\360A\2\0\0\0\0\0&quot;..., 832=
) =3D 832<br>pread64(3, &quot;\6\0\0\0\4\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\=
0@\0\0\0\0\0\0\0&quot;..., 784, 64) =3D 784<br>pread64(3, &quot;\4\0\0\0\20=
\0\0\0\5\0\0\0GNU\0\2\0\0\300\4\0\0\0\3\0\0\0\0\0\0\0&quot;, 32, 848) =3D 3=
2<br>pread64(3, &quot;\4\0\0\0\24\0\0\0\3\0\0\0GNU\0\237\333t\347\262\27\32=
0l\223\27*\202C\370T\177&quot;..., 68, 880) =3D 68<br>fstat(3, {st_mode=3DS=
_IFREG|0755, st_size=3D2029560, ...}) =3D 0<br>mmap(NULL, 8192, PROT_READ|P=
ROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) =3D 0x7f0d37893000<br>pread64(=
3, &quot;\6\0\0\0\4\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0&quot=
;..., 784, 64) =3D 784<br>pread64(3, &quot;\4\0\0\0\20\0\0\0\5\0\0\0GNU\0\2=
\0\0\300\4\0\0\0\3\0\0\0\0\0\0\0&quot;, 32, 848) =3D 32<br>pread64(3, &quot=
;\4\0\0\0\24\0\0\0\3\0\0\0GNU\0\237\333t\347\262\27\320l\223\27*\202C\370T\=
177&quot;..., 68, 880) =3D 68<br>mmap(NULL, 2037344, PROT_READ, MAP_PRIVATE=
|MAP_DENYWRITE, 3, 0) =3D 0x7f0d376a1000<br>mmap(0x7f0d376c3000, 1540096, P=
ROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x22000) =3D 0x=
7f0d376c3000<br>mmap(0x7f0d3783b000, 319488, PROT_READ, MAP_PRIVATE|MAP_FIX=
ED|MAP_DENYWRITE, 3, 0x19a000) =3D 0x7f0d3783b000<br>mmap(0x7f0d37889000, 2=
4576, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x1e700=
0) =3D 0x7f0d37889000<br>mmap(0x7f0d3788f000, 13920, PROT_READ|PROT_WRITE, =
MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) =3D 0x7f0d3788f000<br>close(3) =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D 0<br>arch_prctl(=
ARCH_SET_FS, 0x7f0d37894580) =3D 0<br>mprotect(0x7f0d37889000, 16384, PROT_=
READ) =3D 0<br>mprotect(0x55d196662000, 8192, PROT_READ) =3D 0<br>mprotect(=
0x7f0d378c5000, 4096, PROT_READ) =3D 0<br>munmap(0x7f0d37895000, 8679) =C2=
=A0 =C2=A0 =C2=A0=3D 0<br>getuid() =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0=3D 0<br>getgid() =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0=3D 0<br>getpid() =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0=3D 19163<br>rt_sigaction(SIGCHLD, {sa_handler=3D0x55d1966=
57c30, sa_mask=3D~[RTMIN RT_1], sa_flags=3DSA_RESTORER, sa_restorer=3D0x7f0=
d376e40c0}, NULL, 8) =3D 0<br>geteuid() =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0=3D 0<br>brk(NULL) =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0=3D 0x55d196f41000<br>brk(0x55d196f62000) =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =3D 0x55d196f62000<br>getppid() =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D 19160<br>stat(&quot;/&quot;, {st_mode=
=3DS_IFDIR|0755, st_size=3D4096, ...}) =3D 0<br>stat(&quot;.&quot;, {st_mod=
e=3DS_IFDIR|0755, st_size=3D4096, ...}) =3D 0<br>openat(AT_FDCWD, &quot;/sb=
in/lvm-eg/lvcreate&quot;, O_RDONLY) =3D 3<br>fcntl(3, F_DUPFD, 10) =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D 10<br>close(3) =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D 0<br>fcntl(10, F_SETFD, FD_CLOEXEC) =C2=A0 =
=C2=A0 =3D 0<br>geteuid() =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0=3D 0<br>getegid() =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0=3D 0<br>rt_sigaction(SIGINT, NULL, {sa_handler=3DSIG_DFL, sa_mask=3D=
[], sa_flags=3D0}, 8) =3D 0<br>rt_sigaction(SIGINT, {sa_handler=3D0x55d1966=
57c30, sa_mask=3D~[RTMIN RT_1], sa_flags=3DSA_RESTORER, sa_restorer=3D0x7f0=
d376e40c0}, NULL, 8) =3D 0<br>rt_sigaction(SIGQUIT, NULL, {sa_handler=3DSIG=
_DFL, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0<br>rt_sigaction(SIGQUIT, {sa_ha=
ndler=3DSIG_DFL, sa_mask=3D~[RTMIN RT_1], sa_flags=3DSA_RESTORER, sa_restor=
er=3D0x7f0d376e40c0}, NULL, 8) =3D 0<br>rt_sigaction(SIGTERM, NULL, {sa_han=
dler=3DSIG_DFL, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0<br>rt_sigaction(SIGTE=
RM, {sa_handler=3DSIG_DFL, sa_mask=3D~[RTMIN RT_1], sa_flags=3DSA_RESTORER,=
 sa_restorer=3D0x7f0d376e40c0}, NULL, 8) =3D 0<br>read(10, &quot;#!/bin/sh\=
npath=3D$(/sbin/lvm-eg/ge&quot;..., 8192) =3D 79<br>pipe([3, 4]) =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D 0<br>clone(child_stack=3DNULL, fl=
ags=3DCLONE_CHILD_CLEARTID|CLONE_CHILD_SETTID|SIGCHLD, child_tidptr=3D0x7f0=
d37894850) =3D 19164<br>close(4) =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0=3D 0<br>read(3, &quot;/usr/sbin/lvcreate\n&quot;, 128) =C2=A0=
=3D 19<br>--- SIGCHLD {si_signo=3DSIGCHLD, si_code=3DCLD_EXITED, si_pid=3D1=
9164, si_uid=3D0, si_status=3D0, si_utime=3D0, si_stime=3D0} ---<br>rt_sigr=
eturn({mask=3D[]}) =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D 19<br>read(3, &quot;&quo=
t;, 128) =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D 0<br>close(3) =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D 0<br>wait4(-1, [{WIFEXI=
TED(s) &amp;&amp; WEXITSTATUS(s) =3D=3D 0}], 0, NULL) =3D 19164<br>stat(&qu=
ot;/usr/local/sbin/chroot&quot;, 0x7ffdd8247710) =3D -1 ENOENT (No such fil=
e or directory)<br>stat(&quot;/usr/local/bin/chroot&quot;, 0x7ffdd8247710) =
=3D -1 ENOENT (No such file or directory)<br>stat(&quot;/usr/sbin/chroot&qu=
ot;, {st_mode=3DS_IFREG|0755, st_size=3D43352, ...}) =3D 0<br>clone(child_s=
tack=3DNULL, flags=3DCLONE_CHILD_CLEARTID|CLONE_CHILD_SETTID|SIGCHLD, child=
_tidptr=3D0x7f0d37894850) =3D 19168<br>wait4(-1, ^Cstrace: Process 19163 de=
tached<br>=C2=A0&lt;detached ...&gt;<br><br># ^C<br><div><br></div><div>`lv=
s` output on the node after pressing ctrl+c on the pod container&#39;s=C2=
=A0terminal:</div></div><div>ubuntu@ip-172-31-85-197:~$ sudo lvs<br>=C2=A0L=
V =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0VG =
=C2=A0 =C2=A0 =C2=A0 Attr =C2=A0 =C2=A0LSize =C2=A0Pool =C2=A0 =C2=A0 =C2=
=A0Origin Data% Meta% Move Log Cpy%Sync Convert =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <br>=C2=A0t=
est-lv =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 shared-vg =
=C2=A0 =C2=A0-wi-a----- =C2=A01.00g<br></div><div><br></div><div>If ctrl+c =
is not pressed and trying to see the above output on the node also hangs un=
til the pod operation is interrupted.</div></div>
_______________________________________________<br>
linux-lvm mailing list<br>
<a href=3D"mailto:linux-lvm@redhat.com" target=3D"_blank">linux-lvm@redhat.=
com</a><br>
<a href=3D"https://listman.redhat.com/mailman/listinfo/linux-lvm" rel=3D"no=
referrer" target=3D"_blank">https://listman.redhat.com/mailman/listinfo/lin=
ux-lvm</a><br>
read the LVM HOW-TO at <a href=3D"http://tldp.org/HOWTO/LVM-HOWTO/" rel=3D"=
noreferrer" target=3D"_blank">http://tldp.org/HOWTO/LVM-HOWTO/</a><br>
</blockquote></div>

--0000000000003ef0d605e03954ed--

--===============2848748846609733788==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

--===============2848748846609733788==--

