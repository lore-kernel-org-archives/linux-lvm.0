Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7664C433EF
	for <linux-lvm@archiver.kernel.org>; Thu,  2 Jun 2022 06:41:58 +0000 (UTC)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-638-vTealtulPsq9P6icoNzWcw-1; Thu, 02 Jun 2022 02:41:54 -0400
X-MC-Unique: vTealtulPsq9P6icoNzWcw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4C2B8185A794;
	Thu,  2 Jun 2022 06:41:52 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1453E40EC002;
	Thu,  2 Jun 2022 06:41:49 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id B6F431947B87;
	Thu,  2 Jun 2022 06:41:48 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 7EB23194706E
 for <linux-lvm@listman.corp.redhat.com>; Wed,  1 Jun 2022 08:29:01 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 25B3B41047E9; Wed,  1 Jun 2022 08:29:01 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 219FB41047E8
 for <linux-lvm@redhat.com>; Wed,  1 Jun 2022 08:29:01 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 09519296A609
 for <linux-lvm@redhat.com>; Wed,  1 Jun 2022 08:29:01 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-401-h9RWGjjwNo6H9yj2SArKVA-1; Wed, 01 Jun 2022 04:28:18 -0400
X-MC-Unique: h9RWGjjwNo6H9yj2SArKVA-1
Received: by mail-lf1-f42.google.com with SMTP id i10so1566562lfj.0
 for <linux-lvm@redhat.com>; Wed, 01 Jun 2022 01:28:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=gjMOQJ48Q+LBxFZo3pRqStlax9MJem+CMKWN2/Eq49Y=;
 b=Snrc/cCTVq8hET+p60+v3mn92kFydl4uQ64N/jOYi9B8d6GwbHvu2BLn6EYfbpYyqT
 +jMov5RiDkTI2fefc1g3eKjV3LxcKGZ14HxUCsniOTvET90EjgVLi7CYG7q6gNxhgr1U
 LYMNc+6UOww+CGzl1M/OHAxATYjQ52pifmjH3/xBgngmbLjl0rRQ34PxGIgj+rdUVY8g
 tJiYeIBmLyJSE50KVrb+TV+N7IE4vg/AspHtga6Zl0osEhrllf8m2xpg2MZPLqemf/nf
 4V065toVw/tUWat7G/sZE6TbRxzMaLxkI7DJgIayZ1UW3+a7D3W1W6x6vQFuvdnAE1rR
 YjMw==
X-Gm-Message-State: AOAM532kLLdiTxLlMnCLsUNqH9jw+faqeLx0NcyHktP9FiIvBCgvce0X
 I1bH5Wm+Q0IaPJ2em7sVynavFZ+TISxK2a6cwpEmQ9qOIG0=
X-Google-Smtp-Source: ABdhPJwYlChKhXmk9QLwT6xajXWck5MWtkOsptAfwMxnIlEnwSyCBSb1Wlyj9iakm/2fPOllcMhgUWfLYZZMYB6ftj4=
X-Received: by 2002:a05:6512:2827:b0:477:e5ba:a6ae with SMTP id
 cf39-20020a056512282700b00477e5baa6aemr44676386lfb.24.1654072094945; Wed, 01
 Jun 2022 01:28:14 -0700 (PDT)
MIME-Version: 1.0
References: <CAM3OQJGWsYo=boQBHqmLj1HRRtg14p3-Tp3yeu7KMYcKV2_hOA@mail.gmail.com>
 <CAAMCDecMgzcyQOdb2n-zLRwrHhK9wFSicHJDeA_9zhvSQbyPdw@mail.gmail.com>
 <CAM3OQJEEttEn22Ao3GJK=GYKSUj3Sp0brU1mv2_s1dnMeFUg5g@mail.gmail.com>
 <YpcUpGsiSjwK8cG2@itl-email>
In-Reply-To: <YpcUpGsiSjwK8cG2@itl-email>
From: Abhishek Agarwal <mragarwal.developer@gmail.com>
Date: Wed, 1 Jun 2022 13:58:03 +0530
Message-ID: <CAM3OQJHe3GKfAqR4A3QT6Q6TgiG-qpHNBHfnEczD3eH+ruq0VA@mail.gmail.com>
To: LVM general discussion and development <linux-lvm@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
X-Mailman-Approved-At: Thu, 02 Jun 2022 06:41:47 +0000
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
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="===============1183917072054449274=="

--===============1183917072054449274==
Content-Type: multipart/alternative; boundary="000000000000a6f63905e05eabe6"

--000000000000a6f63905e05eabe6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

These are not different LVM processes. The container process is using the
LVM binary that the node itself has. We have achieved this by using scripts
that point to the same lvm binary that is used by the node.

Configmap(~shell script) used for the same has the following contents where
`/host` refers to the root directory of the node:

get_bin_path: |
  #!/bin/sh
  bin_name=3D$1
  if [ -x /host/bin/which ]; then
    echo $(chroot /host /bin/which $bin_name | cut -d ' ' -f 1)
  elif [ -x /host/usr/bin/which ]; then
    echo $(chroot /host /usr/bin/which $bin_name | cut -d ' ' -f 1)
  else
    $(chroot /host which $bin_name | cut -d ' ' -f 1)
  fi

lvcreate: |
  #!/bin/sh
  path=3D$(/sbin/lvm-eg/get_bin_path "lvcreate")
  chroot /host $path "$@"

Also, the above logs in the pastebin link have errors because the vg lock
has not been acquired and hence creation commands will fail. Once the lock
is acquired, the `strace -f` command gives the following output being
stuck. Check out this link for full details ->
https://pastebin.com/raw/DwQfdmr8

P.S: We at OpenEBS are trying to provide lvm storage to cloud native
workloads with the help of kubernetes CSI drivers and since all these
drivers run as pods and help dynamic provisioning of kubernetes
volumes(storage) for the application, the lvm commands needs to be run from
inside the pod. Reference -> https://github.com/openebs/lvm-localpv

Regards

On Wed, 1 Jun 2022 at 13:06, Demi Marie Obenour <demi@invisiblethingslab.co=
m>
wrote:

> On Wed, Jun 01, 2022 at 12:20:32AM +0530, Abhishek Agarwal wrote:
> > Hi Roger. Thanks for your reply. I have rerun the command with `strace
> -f`
> > as you suggested. Here is the pastebin link containing the detailed
> output
> > of the command: https://pastebin.com/raw/VRuBbHBc
>
> Even if you can get LVM =E2=80=9Cworking=E2=80=9D, it is still likely to =
cause data
> corruption at some point, as there is no guarantee that different LVM
> processes in different namespaces will see each others=E2=80=99 locks.
>
> Why do you need to run LVM in a container?  What are you trying to
> accomplish?
> --
> Sincerely,
> Demi Marie Obenour (she/her/hers)
> Invisible Things Lab
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://listman.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>

--000000000000a6f63905e05eabe6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">These are not different LVM processes. The container proce=
ss is using the LVM binary that the node itself has. We have achieved this =
by using scripts that point to the same lvm binary that is used by the node=
.<div><br></div><div>Configmap(~shell script) used for the same has the fol=
lowing contents where `/host` refers to the root directory of the node:</di=
v><div><pre style=3D"background-color:rgb(43,43,43);color:rgb(169,183,198);=
font-family:&quot;JetBrains Mono&quot;,monospace;font-size:9.8pt"><span sty=
le=3D"color:rgb(204,120,50)">get_bin_path</span>: |<br>  #!/bin/sh<br>  bin=
_name=3D$1<br>  if [ -x /host/bin/which ]; then<br>    echo $(chroot /host =
/bin/which $bin_name | cut -d &#39; &#39; -f 1)<br>  elif [ -x /host/usr/bi=
n/which ]; then<br>    echo $(chroot /host /usr/bin/which $bin_name | cut -=
d &#39; &#39; -f 1)<br>  else<br>    $(chroot /host which $bin_name | cut -=
d &#39; &#39; -f 1)<br>  fi</pre></div><div><pre style=3D"background-color:=
rgb(43,43,43);color:rgb(169,183,198);font-family:&quot;JetBrains Mono&quot;=
,monospace;font-size:9.8pt"><span style=3D"color:rgb(204,120,50)">lvcreate<=
/span>: |<br>  #!/bin/sh<br>  path=3D$(/sbin/lvm-eg/get_bin_path &quot;lvcr=
eate&quot;)<br>  chroot /host $path &quot;$@&quot;</pre></div><div>Also, th=
e above logs in the pastebin link have errors because the vg lock has not b=
een acquired and hence creation commands will fail. Once the lock is acquir=
ed, the `strace -f` command gives the following=C2=A0output being stuck. Ch=
eck out this link for full details -&gt;=C2=A0<a href=3D"https://pastebin.c=
om/raw/DwQfdmr8">https://pastebin.com/raw/DwQfdmr8</a></div><div><br></div>=
<div>P.S: We at OpenEBS are trying to provide lvm storage to cloud native w=
orkloads with the help of kubernetes CSI drivers and since all these driver=
s run as pods and help dynamic provisioning of kubernetes volumes(storage) =
for the application, the lvm commands needs to be run from inside the pod. =
Reference -&gt;=C2=A0<a href=3D"https://github.com/openebs/lvm-localpv">htt=
ps://github.com/openebs/lvm-localpv</a></div><div><br></div><div>Regards</d=
iv></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_att=
r">On Wed, 1 Jun 2022 at 13:06, Demi Marie Obenour &lt;<a href=3D"mailto:de=
mi@invisiblethingslab.com">demi@invisiblethingslab.com</a>&gt; wrote:<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left-width:1px;border-left-style:solid;border-left-color:rgb(204,204,20=
4);padding-left:1ex">On Wed, Jun 01, 2022 at 12:20:32AM +0530, Abhishek Aga=
rwal wrote:<br>
&gt; Hi Roger. Thanks for your reply. I have rerun the command with `strace=
 -f`<br>
&gt; as you suggested. Here is the pastebin link containing the detailed ou=
tput<br>
&gt; of the command: <a href=3D"https://pastebin.com/raw/VRuBbHBc" rel=3D"n=
oreferrer" target=3D"_blank">https://pastebin.com/raw/VRuBbHBc</a><br>
<br>
Even if you can get LVM =E2=80=9Cworking=E2=80=9D, it is still likely to ca=
use data<br>
corruption at some point, as there is no guarantee that different LVM<br>
processes in different namespaces will see each others=E2=80=99 locks.<br>
<br>
Why do you need to run LVM in a container?=C2=A0 What are you trying to<br>
accomplish?<br>
-- <br>
Sincerely,<br>
Demi Marie Obenour (she/her/hers)<br>
Invisible Things Lab<br>
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

--000000000000a6f63905e05eabe6--

--===============1183917072054449274==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

--===============1183917072054449274==--

