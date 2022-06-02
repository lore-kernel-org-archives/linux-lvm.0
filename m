Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A343C43334
	for <linux-lvm@archiver.kernel.org>; Fri,  3 Jun 2022 07:18:16 +0000 (UTC)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-455-BrB8Ql_JPC6_9DcXraXa-A-1; Fri, 03 Jun 2022 03:18:11 -0400
X-MC-Unique: BrB8Ql_JPC6_9DcXraXa-A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F124C803B22;
	Fri,  3 Jun 2022 07:18:08 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1C35E2166B26;
	Fri,  3 Jun 2022 07:18:06 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id E6117194704A;
	Fri,  3 Jun 2022 07:18:05 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id DE65619466DF
 for <linux-lvm@listman.corp.redhat.com>; Thu,  2 Jun 2022 11:04:42 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id B9EDB1731B; Thu,  2 Jun 2022 11:04:42 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B55D58288A
 for <linux-lvm@redhat.com>; Thu,  2 Jun 2022 11:04:42 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 955763C0D873
 for <linux-lvm@redhat.com>; Thu,  2 Jun 2022 11:04:42 +0000 (UTC)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com
 [209.85.222.181]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-625-aV9LzUk-OjOLJwQ30Fvyyw-1; Thu, 02 Jun 2022 07:04:40 -0400
X-MC-Unique: aV9LzUk-OjOLJwQ30Fvyyw-1
Received: by mail-qk1-f181.google.com with SMTP id o68so3341055qkf.13
 for <linux-lvm@redhat.com>; Thu, 02 Jun 2022 04:04:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=ooS6qSi+E7j9qtF0cXby3AfocOFZxtMqCfiX07fRi1Q=;
 b=zcM03F/b6acOSO3zfCFeuEAipabNnurmcqwRLGkygC4/h6VawFt43od+w0e4W4M+gE
 yZlewq1Cry3b+uAOJyXAkSWP/9gX+x2FoqurRlJ9DZ8sp5G97ig82+N+DSJwzQWJlmjr
 vMvnZUyIBu11eGevqeEOxDX2UpLp0NlmL3y7a62zcYuhOfAQTwdR8biezoaJCE66No61
 neSKf1VhDzarsN5X55SLFP6PVg3E9801s5/Bl9IhPaDIjGH9yV3uvPew4VPiB/ttqhmW
 VoyUFhBd/chomn3qYdXi0gLXsy1Nw1l7c1Mo4slL3BiOtDbo0UOq4j4olgxHC2CV4R9k
 6/IQ==
X-Gm-Message-State: AOAM530w94BcjaPVMB8vqrhXRIy5t7jS8+OU2yBVpiMpp9JbdvUgO7/O
 iJib6GXiHRGCQAKrzG+6gfFrDkriohX0xT7LRGDlUYZW
X-Google-Smtp-Source: ABdhPJx1m38jZDbqnNt0zWFYp8HxtfgW73CIMY+1L1c/basIl3NOUrgjBkYYgQ8vAUI+ZYfQJPwlnrGxTuQsuf6URzE=
X-Received: by 2002:a05:620a:2913:b0:6a0:750e:f938 with SMTP id
 m19-20020a05620a291300b006a0750ef938mr2959524qkp.200.1654167879793; Thu, 02
 Jun 2022 04:04:39 -0700 (PDT)
MIME-Version: 1.0
References: <CAM3OQJGWsYo=boQBHqmLj1HRRtg14p3-Tp3yeu7KMYcKV2_hOA@mail.gmail.com>
 <CAAMCDecMgzcyQOdb2n-zLRwrHhK9wFSicHJDeA_9zhvSQbyPdw@mail.gmail.com>
 <CAM3OQJEEttEn22Ao3GJK=GYKSUj3Sp0brU1mv2_s1dnMeFUg5g@mail.gmail.com>
 <YpcUpGsiSjwK8cG2@itl-email>
 <CAM3OQJHe3GKfAqR4A3QT6Q6TgiG-qpHNBHfnEczD3eH+ruq0VA@mail.gmail.com>
In-Reply-To: <CAM3OQJHe3GKfAqR4A3QT6Q6TgiG-qpHNBHfnEczD3eH+ruq0VA@mail.gmail.com>
From: Roger Heflin <rogerheflin@gmail.com>
Date: Thu, 2 Jun 2022 06:04:28 -0500
Message-ID: <CAAMCDefV+jHCKnrp0gad7BFgJaYDQNOkeQM5z8zkOe4PUz9Dpw@mail.gmail.com>
To: LVM general discussion and development <linux-lvm@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Mailman-Approved-At: Fri, 03 Jun 2022 07:18:04 +0000
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="===============6758013024366020605=="

--===============6758013024366020605==
Content-Type: multipart/alternative; boundary="000000000000dfbe8705e074f86d"

--000000000000dfbe8705e074f86d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Random thoughts.

Make sure  use_lvmetad is 0, and its systemd units for it are
stopped/disabled.

Are you mounting /proc and /sys and /dev into the /host chroot?

/run may also be needed.

you might add a "-ttt" to the strace command to give timing data.



On Thu, Jun 2, 2022 at 1:41 AM Abhishek Agarwal <
mragarwal.developer@gmail.com> wrote:

> These are not different LVM processes. The container process is using the
> LVM binary that the node itself has. We have achieved this by using scrip=
ts
> that point to the same lvm binary that is used by the node.
>
> Configmap(~shell script) used for the same has the following contents
> where `/host` refers to the root directory of the node:
>
> get_bin_path: |
>   #!/bin/sh
>   bin_name=3D$1
>   if [ -x /host/bin/which ]; then
>     echo $(chroot /host /bin/which $bin_name | cut -d ' ' -f 1)
>   elif [ -x /host/usr/bin/which ]; then
>     echo $(chroot /host /usr/bin/which $bin_name | cut -d ' ' -f 1)
>   else
>     $(chroot /host which $bin_name | cut -d ' ' -f 1)
>   fi
>
> lvcreate: |
>   #!/bin/sh
>   path=3D$(/sbin/lvm-eg/get_bin_path "lvcreate")
>   chroot /host $path "$@"
>
> Also, the above logs in the pastebin link have errors because the vg lock
> has not been acquired and hence creation commands will fail. Once the loc=
k
> is acquired, the `strace -f` command gives the following output being
> stuck. Check out this link for full details ->
> https://pastebin.com/raw/DwQfdmr8
>
> P.S: We at OpenEBS are trying to provide lvm storage to cloud native
> workloads with the help of kubernetes CSI drivers and since all these
> drivers run as pods and help dynamic provisioning of kubernetes
> volumes(storage) for the application, the lvm commands needs to be run fr=
om
> inside the pod. Reference -> https://github.com/openebs/lvm-localpv
>
> Regards
>
> On Wed, 1 Jun 2022 at 13:06, Demi Marie Obenour <
> demi@invisiblethingslab.com> wrote:
>
>> On Wed, Jun 01, 2022 at 12:20:32AM +0530, Abhishek Agarwal wrote:
>> > Hi Roger. Thanks for your reply. I have rerun the command with `strace
>> -f`
>> > as you suggested. Here is the pastebin link containing the detailed
>> output
>> > of the command: https://pastebin.com/raw/VRuBbHBc
>>
>> Even if you can get LVM =E2=80=9Cworking=E2=80=9D, it is still likely to=
 cause data
>> corruption at some point, as there is no guarantee that different LVM
>> processes in different namespaces will see each others=E2=80=99 locks.
>>
>> Why do you need to run LVM in a container?  What are you trying to
>> accomplish?
>> --
>> Sincerely,
>> Demi Marie Obenour (she/her/hers)
>> Invisible Things Lab
>> _______________________________________________
>> linux-lvm mailing list
>> linux-lvm@redhat.com
>> https://listman.redhat.com/mailman/listinfo/linux-lvm
>> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://listman.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>

--000000000000dfbe8705e074f86d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Random thoughts.</div><div><br></div><div>Make sure=
=C2=A0 use_lvmetad is 0, and its systemd units for it are stopped/disabled.=
</div><div><br></div><div>Are you mounting /proc and /sys and /dev into the=
 /host chroot?</div><div><br></div><div>/run may also be needed.</div><div>=
<br></div><div>you might add a &quot;-ttt&quot; to the strace command to gi=
ve timing data.</div><div><br></div><div><br></div></div><br><div class=3D"=
gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jun 2, 2022 at 1=
:41 AM Abhishek Agarwal &lt;<a href=3D"mailto:mragarwal.developer@gmail.com=
">mragarwal.developer@gmail.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex"><div dir=3D"ltr">These are not different L=
VM processes. The container process is using the LVM binary that the node i=
tself has. We have achieved this by using scripts that point to the same lv=
m binary that is used by the node.<div><br></div><div>Configmap(~shell scri=
pt) used for the same has the following contents where `/host` refers to th=
e root directory of the node:</div><div><pre style=3D"background-color:rgb(=
43,43,43);color:rgb(169,183,198);font-family:&quot;JetBrains Mono&quot;,mon=
ospace;font-size:9.8pt"><span style=3D"color:rgb(204,120,50)">get_bin_path<=
/span>: |<br>  #!/bin/sh<br>  bin_name=3D$1<br>  if [ -x /host/bin/which ];=
 then<br>    echo $(chroot /host /bin/which $bin_name | cut -d &#39; &#39; =
-f 1)<br>  elif [ -x /host/usr/bin/which ]; then<br>    echo $(chroot /host=
 /usr/bin/which $bin_name | cut -d &#39; &#39; -f 1)<br>  else<br>    $(chr=
oot /host which $bin_name | cut -d &#39; &#39; -f 1)<br>  fi</pre></div><di=
v><pre style=3D"background-color:rgb(43,43,43);color:rgb(169,183,198);font-=
family:&quot;JetBrains Mono&quot;,monospace;font-size:9.8pt"><span style=3D=
"color:rgb(204,120,50)">lvcreate</span>: |<br>  #!/bin/sh<br>  path=3D$(/sb=
in/lvm-eg/get_bin_path &quot;lvcreate&quot;)<br>  chroot /host $path &quot;=
$@&quot;</pre></div><div>Also, the above logs in the pastebin link have err=
ors because the vg lock has not been acquired and hence creation commands w=
ill fail. Once the lock is acquired, the `strace -f` command gives the foll=
owing=C2=A0output being stuck. Check out this link for full details -&gt;=
=C2=A0<a href=3D"https://pastebin.com/raw/DwQfdmr8" target=3D"_blank">https=
://pastebin.com/raw/DwQfdmr8</a></div><div><br></div><div>P.S: We at OpenEB=
S are trying to provide lvm storage to cloud native workloads with the help=
 of kubernetes CSI drivers and since all these drivers run as pods and help=
 dynamic provisioning of kubernetes volumes(storage) for the application, t=
he lvm commands needs to be run from inside the pod. Reference -&gt;=C2=A0<=
a href=3D"https://github.com/openebs/lvm-localpv" target=3D"_blank">https:/=
/github.com/openebs/lvm-localpv</a></div><div><br></div><div>Regards</div><=
/div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">O=
n Wed, 1 Jun 2022 at 13:06, Demi Marie Obenour &lt;<a href=3D"mailto:demi@i=
nvisiblethingslab.com" target=3D"_blank">demi@invisiblethingslab.com</a>&gt=
; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Wed,=
 Jun 01, 2022 at 12:20:32AM +0530, Abhishek Agarwal wrote:<br>
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

--000000000000dfbe8705e074f86d--

--===============6758013024366020605==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

--===============6758013024366020605==--

