Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3A97C433F5
	for <linux-lvm@archiver.kernel.org>; Tue,  1 Mar 2022 07:18:02 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-159-RJ3eXDltM_qLLQ5z3hc7dA-1; Tue, 01 Mar 2022 02:17:58 -0500
X-MC-Unique: RJ3eXDltM_qLLQ5z3hc7dA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6E95D1091DA4;
	Tue,  1 Mar 2022 07:17:51 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 13ACA519D2;
	Tue,  1 Mar 2022 07:17:45 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A33254ED79;
	Tue,  1 Mar 2022 07:17:32 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
	[10.11.54.10])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 21SIMkg6031071 for <linux-lvm@listman.util.phx.redhat.com>;
	Mon, 28 Feb 2022 13:22:46 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 9E4E9401E31; Mon, 28 Feb 2022 18:22:46 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9987B401E37
	for <linux-lvm@redhat.com>; Mon, 28 Feb 2022 18:22:46 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4AF513C18527
	for <linux-lvm@redhat.com>; Mon, 28 Feb 2022 18:22:46 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
	[209.85.210.178]) by relay.mimecast.com with ESMTP with STARTTLS
	(version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-618-fHl8jMnDMRqriN9fsh9kFg-1; Mon, 28 Feb 2022 13:22:43 -0500
X-MC-Unique: fHl8jMnDMRqriN9fsh9kFg-1
Received: by mail-pf1-f178.google.com with SMTP id g21so5430376pfj.11
	for <linux-lvm@redhat.com>; Mon, 28 Feb 2022 10:22:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=c96CRIUFXJjnKEJWclsA8F4FgMH5aIxtpUsGFLnHiYs=;
	b=bM6/8iuqUwjZpj2vLoDMNBrOgZzcN0S191ZP2zC8KMBFJQkJsAPKsuS89zhAhrYNaW
	wDYZzjPdl5QMOnk5HruxZT7sMRb/dOwSlsW4Pwfb9xGtRPcrsjlhqI9GpCRZSGgl3HAY
	Y8kWUuPJ1LW80NeCqURvlCYsLpMCAsWwCzBrQQu6XGM0g1OLC4MZ5/JN0X5ZTq7VMt6N
	m5sLAVxkCMi+mNYYpaogGjoCjVElbmw+k6YXPDTLGOL9I6qC6a6UFlGikJZrYXDWW3/e
	Ky0fwML2EydgBap284JW0YmL8Op/UW0qC/GmWFQ0Ww0Shlcs8sFD1AFjbVC5hbgk3UIu
	D3yw==
X-Gm-Message-State: AOAM532q5/j4NvphmHOAlYa+5kI+FOTvGdhpFU1w9fbqQ4ZWURkn/Uxw
	YwnDw08R+SpiVlm0dgeeuRC8ORKxYuXq3QvHqvgnoz8B7JY=
X-Google-Smtp-Source: ABdhPJxRowg+wkhsp7+fVsQkWpYwVG0UlNxASuiHVPIaVW5iN7GNntOfCNCgYWXQDuVqhwbaXvWJ2nJAzeRMCZXHLJU=
X-Received: by 2002:a05:6a00:148b:b0:4e0:1001:1063 with SMTP id
	v11-20020a056a00148b00b004e010011063mr22797868pfu.15.1646072562244;
	Mon, 28 Feb 2022 10:22:42 -0800 (PST)
MIME-Version: 1.0
References: <CAL=ybPDkuRjbCmdvO8uVoxeYuc6j38XsjSWwPTkgH3KXKxJUBQ@mail.gmail.com>
In-Reply-To: <CAL=ybPDkuRjbCmdvO8uVoxeYuc6j38XsjSWwPTkgH3KXKxJUBQ@mail.gmail.com>
From: Nicholas Geovanis <nickgeovanis@gmail.com>
Date: Mon, 28 Feb 2022 12:22:33 -0600
Message-ID: <CAJmb-YmNfid-AwSkACu8D7pT_27yCPtCLa2wiCnEEZk-xqo2pA@mail.gmail.com>
To: LVM general discussion and development <linux-lvm@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
X-loop: linux-lvm@redhat.com
X-Mailman-Approved-At: Tue, 01 Mar 2022 02:17:28 -0500
Subject: Re: [linux-lvm] Cannot manage FS of thin volume
X-BeenThere: linux-lvm@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
Sender: linux-lvm-bounces@redhat.com
Errors-To: linux-lvm-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="===============8295939668629002718=="

--===============8295939668629002718==
Content-Type: multipart/alternative; boundary="00000000000058dde305d9182205"

--00000000000058dde305d9182205
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 28, 2022, 12:26 AM Viktor Trojanovic <viktor@troja.ch> wrote:

> Hi there,
>
> I seem to have some problems involving my LVM setup and hope I can get
> some advice on this list.
>
> I have a rather simple setup. One PV (on a RAID1-MD-Device), one VG, 3 LV=
s
> and one thin pool that holds my Linux Containers (LXD). These container
> volumes are created directly by LXD.
>
> Yesterday, I noticed that my backups are no longer working. In order to
> backup the containers, I used to do the following:
>
> 1. Make a snapshot of the container using LXD. This creates a LV snapshot=
.
> 2. Mount the snapshot.
> 3. Use the mount for backing up all files
> 4. Unmount, delete snapshot.
>
> I remember this used to work fine. So I tried doing this step by step and
> already failed at the second step. I could not mount the snapshot because
> it never got even created as a device in /dev/mapper.
>

There may be a similar issue mentioned on discuss.linuxcontainers.org.
It seems to be caused by incorrectly specified device size on the "lxc
config device" command. You can use "GB" or "GiB" for size.
But you can't use "G", and you don't find out.

HTH

I thought that maybe something changed in LXD and that I had to forcefully
> activate the snapshot. I then tried something with the -Ky flag but nothi=
ng
> really worked. And after I rebooted the server, all of a sudden all volum=
es
> were inactive.
>
> With the help of a couple of internet guides, in particular this one: LVM
> Transaction ID mismatch and metadata resize error =E2=80=93 Monotok
> <https://blog.monotok.org/lvm-transaction-id-mismatch-and-metadata-resize=
-error/>,
> I managed to get everything working again. So the system is booting fine,
> the containers too. I can even mount the containers fine.
>
> But something is still very wrong. For example, I tried to resize one of
> the thin LVs from 10G to 20G with automatic resizing of the FS. While the
> LV resizing seems to have worked fine, the FSresize did not.
>
> This is how it looks when I try to run resize2fs on one of the containers
>
> # resize2fs /dev/vg0/containers_cont1
> resize2fs 1.44.1 (24-Mar-2018)
> resize2fs: Device or resource busy while trying to open
> /dev/vg0/containers_cont1
> Couldn't find valid filesystem superblock.
>
> Here's the output of running fdisk on the volume
>
> # fdisk /dev/mapper/vg0-containers_cont
>
> Welcome to fdisk (util-linux 2.31.1).
> Changes will remain in memory only, until you decide to write them.
> Be careful before using the write command.
>
> The old ext4 signature will be removed by a write command.
>
> Device does not contain a recognized partition table.
> Created a new DOS disklabel with disk identifier 0x174c0f1c.
>
> It clearly looks like something is wrong. One of the steps I had to take
> when following the guide mentioned above is to backup the vg and change t=
he
> id of the thin pool to another value. Maybe this messed up something else=
.
>
> Though I am confused that things overall seem to work. lsblk -f recognize=
s
> the filesystem in the thin volumes, I can mount them, I can work with the=
m.
> But I cannot resize them and I cannot seem to create snapshots
> successfully. If I do and mount them, they are empty.
>
> Any pointers would be much appreciated.
>
> Thanks,
> Viktor
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://listman.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

--00000000000058dde305d9182205
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D=
"gmail_attr">On Mon, Feb 28, 2022, 12:26 AM Viktor Trojanovic &lt;<a href=
=3D"mailto:viktor@troja.ch">viktor@troja.ch</a>&gt; wrote:<br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc =
solid;padding-left:1ex"><div dir=3D"ltr"><div>Hi there, <br></div><div><br>=
</div><div>I seem to have some problems involving my LVM setup and hope I c=
an get some advice on this list. <br></div><div><br></div><div>I have a rat=
her simple setup. One PV (on a RAID1-MD-Device), one VG, 3 LVs and one thin=
 pool that holds my Linux Containers (LXD). These container volumes are cre=
ated directly by LXD. <br></div><div><br></div><div>Yesterday, I noticed th=
at my backups are no longer working. In order to backup the containers, I u=
sed to do the following: <br></div><div><br></div><div>1. Make a snapshot o=
f the container using LXD. This creates a LV snapshot. <br></div><div>2. Mo=
unt the snapshot. <br></div><div>3. Use the mount for backing up all files<=
/div><div>4. Unmount, delete snapshot. <br></div><div><br></div><div>I reme=
mber this used to work fine. So I tried doing this step by step and already=
 failed at the second step. I could not mount the snapshot because it never=
 got even created as a device in /dev/mapper.</div></div></blockquote></div=
></div><div dir=3D"auto"><br></div><div dir=3D"auto">There may be a similar=
 issue mentioned on <a href=3D"http://discuss.linuxcontainers.org">discuss.=
linuxcontainers.org</a>.</div><div dir=3D"auto">It seems to be caused by in=
correctly specified device size on the &quot;lxc config device&quot; comman=
d. You can use &quot;GB&quot; or &quot;GiB&quot; for size.</div><div dir=3D=
"auto">But you can&#39;t use &quot;G&quot;, and you don&#39;t find out.</di=
v><div dir=3D"auto"><br></div><div dir=3D"auto">HTH</div><div dir=3D"auto">=
<br></div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D=
"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding=
-left:1ex"><div dir=3D"ltr"><div>I thought that maybe something changed in =
LXD and that I had to forcefully activate the snapshot. I then tried someth=
ing with the -Ky flag but nothing really worked. And after I rebooted the s=
erver, all of a sudden all volumes were inactive. <br></div><div><br></div>=
<div>With the help of a couple of internet guides, in particular this one:=
=20

<a href=3D"https://blog.monotok.org/lvm-transaction-id-mismatch-and-metadat=
a-resize-error/" target=3D"_blank" rel=3D"noreferrer">LVM Transaction ID mi=
smatch and metadata resize error =E2=80=93 Monotok</a>, I managed to get ev=
erything working again. So the system is booting fine, the containers too. =
I can even mount the containers fine. <br></div><div><br></div><div>But som=
ething is still very wrong. For example, I tried to resize one of the thin =
LVs from 10G to 20G with automatic resizing of the FS. While the LV resizin=
g seems to have worked fine, the FSresize did not. <br></div><div><br></div=
><div>This is how it looks when I try to run resize2fs on one of the contai=
ners<br></div><div><br></div><div># resize2fs /dev/vg0/containers_cont1<br>=
resize2fs 1.44.1 (24-Mar-2018)<br>resize2fs: Device or resource busy while =
trying to open /dev/vg0/containers_cont1<br>Couldn&#39;t find valid filesys=
tem superblock.</div><div><br></div><div>Here&#39;s the output of running f=
disk on the volume</div><div><br></div><div># fdisk /dev/mapper/vg0-contain=
ers_cont<br><br>Welcome to fdisk (util-linux 2.31.1).<br>Changes will remai=
n in memory only, until you decide to write them.<br>Be careful before usin=
g the write command.<br><br>The old ext4 signature will be removed by a wri=
te command.<br><br>Device does not contain a recognized partition table.<br=
>Created a new DOS disklabel with disk identifier 0x174c0f1c.<br><br></div>=
<div>It clearly looks like something is wrong. One of the steps I had to ta=
ke when following the guide mentioned above is to backup the vg and change =
the id of the thin pool to another value. Maybe this messed up something el=
se. <br></div><div><br></div><div>Though I am confused that things overall =
seem to work. lsblk -f recognizes the filesystem in the thin volumes, I can=
 mount them, I can work with them. But I cannot resize them and I cannot se=
em to create snapshots successfully. If I do and mount them, they are empty=
. <br></div><div><br></div><div>Any pointers would be much appreciated. <br=
></div><div><br></div><div>Thanks, <br></div><div>Viktor<br></div></div>
_______________________________________________<br>
linux-lvm mailing list<br>
<a href=3D"mailto:linux-lvm@redhat.com" target=3D"_blank" rel=3D"noreferrer=
">linux-lvm@redhat.com</a><br>
<a href=3D"https://listman.redhat.com/mailman/listinfo/linux-lvm" rel=3D"no=
referrer noreferrer" target=3D"_blank">https://listman.redhat.com/mailman/l=
istinfo/linux-lvm</a><br>
read the LVM HOW-TO at <a href=3D"http://tldp.org/HOWTO/LVM-HOWTO/" rel=3D"=
noreferrer noreferrer" target=3D"_blank">http://tldp.org/HOWTO/LVM-HOWTO/</=
a></blockquote></div></div></div>

--00000000000058dde305d9182205--

--===============8295939668629002718==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
--===============8295939668629002718==--

