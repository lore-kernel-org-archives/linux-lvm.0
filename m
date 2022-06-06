Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DF1EC43334
	for <linux-lvm@archiver.kernel.org>; Mon,  6 Jun 2022 06:46:35 +0000 (UTC)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-554-aoRs9L1NMX-D8G1UtZkZBw-1; Mon, 06 Jun 2022 02:46:33 -0400
X-MC-Unique: aoRs9L1NMX-D8G1UtZkZBw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4DB44381078B;
	Mon,  6 Jun 2022 06:46:31 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BCDD52026D64;
	Mon,  6 Jun 2022 06:46:26 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 5A041194707A;
	Mon,  6 Jun 2022 06:46:26 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 65111194706E
 for <linux-lvm@listman.corp.redhat.com>; Mon,  6 Jun 2022 05:50:03 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 364BF2026D2D; Mon,  6 Jun 2022 05:50:03 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 31D162026D07
 for <linux-lvm@redhat.com>; Mon,  6 Jun 2022 05:50:03 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 105C81C05151
 for <linux-lvm@redhat.com>; Mon,  6 Jun 2022 05:50:03 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com
 [209.85.208.171]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-572-LapTNJjqMkypkA9V5gaEhA-1; Mon, 06 Jun 2022 01:50:00 -0400
X-MC-Unique: LapTNJjqMkypkA9V5gaEhA-1
Received: by mail-lj1-f171.google.com with SMTP id d19so2161863lji.10
 for <linux-lvm@redhat.com>; Sun, 05 Jun 2022 22:50:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=i+QEV9e7qc+kx259oqdH9D196JfP338umAV3EZUrs8s=;
 b=P7F8DLEGyPyIkF6SU/T5UUdQMIqPPWz3+hfkddjdbqOo4F8DRWhMp0TR31b+9S1rj8
 9yZBgTgRR9t/Y6awu9f3iaVq9lNIXEqawoFqmOgcEli+PtzQFf9b1nw+kVZP+R0XCmPk
 C+LXHo/k3hftYt2d3LjYeKJkGqcgMp+tIhKolbS7CO3mBsBB9G5GF2FlWMeLB9i9P5pp
 dKdm25/TGmVOjdU2/yBKPMtUYPYI4lO0EDvtHIRqpR5rqQL6DJQy+b8g6W8icKaq3tYl
 5QZq6TdkHUuk5tXnDfGdUWzXmHBC2XI5Shv3RocDBA5K1jhO+bPfoRvFT5M7arNw5W1j
 SvTA==
X-Gm-Message-State: AOAM530Su8pwFgkKIjZcY8JfyuAvDhnIwHUC9wbquDCBIYslgbSwMV3K
 2PSiC1pxDLLraQfaCj48IcGkVyrhkrgy7R70h5PThaA3gAU=
X-Google-Smtp-Source: ABdhPJyHbNtuCgf0grEclgRboLZRxauRuW2dfeN33asEkoJDtfBn3MmscYCU53XDr9LdprGenKxzIuZRw8AnxR4YCCU=
X-Received: by 2002:a2e:7203:0:b0:255:56e1:68bc with SMTP id
 n3-20020a2e7203000000b0025556e168bcmr17621691ljc.30.1654494598742; Sun, 05
 Jun 2022 22:49:58 -0700 (PDT)
MIME-Version: 1.0
References: <CAM3OQJGWsYo=boQBHqmLj1HRRtg14p3-Tp3yeu7KMYcKV2_hOA@mail.gmail.com>
 <CAAMCDecMgzcyQOdb2n-zLRwrHhK9wFSicHJDeA_9zhvSQbyPdw@mail.gmail.com>
 <CAM3OQJEEttEn22Ao3GJK=GYKSUj3Sp0brU1mv2_s1dnMeFUg5g@mail.gmail.com>
 <YpcUpGsiSjwK8cG2@itl-email>
 <CAM3OQJHe3GKfAqR4A3QT6Q6TgiG-qpHNBHfnEczD3eH+ruq0VA@mail.gmail.com>
 <CAAMCDefV+jHCKnrp0gad7BFgJaYDQNOkeQM5z8zkOe4PUz9Dpw@mail.gmail.com>
In-Reply-To: <CAAMCDefV+jHCKnrp0gad7BFgJaYDQNOkeQM5z8zkOe4PUz9Dpw@mail.gmail.com>
From: Abhishek Agarwal <mragarwal.developer@gmail.com>
Date: Mon, 6 Jun 2022 11:19:47 +0530
Message-ID: <CAM3OQJHdTqOksDPx0dp_LbF2kRHaaoN3b4YEGamHFabHRGxScA@mail.gmail.com>
To: LVM general discussion and development <linux-lvm@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Mailman-Approved-At: Mon, 06 Jun 2022 06:46:24 +0000
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="===============5106645037678512596=="

--===============5106645037678512596==
Content-Type: multipart/alternative; boundary="000000000000d7455305e0c10aa1"

--000000000000d7455305e0c10aa1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

1. Yes, use_lvmetad is 0, and its systemd units for it are stopped/disabled=
.
2. Yes, everything on the host machine i.e(/proc, /sys etc) are getting
mounted on the pod.

*ubuntu@ip-172-31-89-47*:*~*$ kubectl exec -it openebs-lvm-node-v6jrb -c
openebs-lvm-plugin  -n kube-system -- sh

# ls

bin  boot  dev etc  home  host  lib  lib32  lib64  libx32  media  mnt opt
plugin  proc  root  run  sbin  srv  sys  tmp  usr var

# cd /host

# ls

bin  boot  dev etc  home  lib lib32  lib64  libx32  lost+found  media  mnt
opt  proc  root  run  sbin  snap srv  sys  tmp  usr  var

#
3. The detail output of `strace -f -ttt` command:
https://pastebin.com/raw/VFyXLNaC

On Fri, 3 Jun 2022 at 12:48, Roger Heflin <rogerheflin@gmail.com> wrote:

> Random thoughts.
>
> Make sure  use_lvmetad is 0, and its systemd units for it are
> stopped/disabled.
>
> Are you mounting /proc and /sys and /dev into the /host chroot?
>
> /run may also be needed.
>
> you might add a "-ttt" to the strace command to give timing data.
>
>
>
> On Thu, Jun 2, 2022 at 1:41 AM Abhishek Agarwal <
> mragarwal.developer@gmail.com> wrote:
>
>> These are not different LVM processes. The container process is using th=
e
>> LVM binary that the node itself has. We have achieved this by using scri=
pts
>> that point to the same lvm binary that is used by the node.
>>
>> Configmap(~shell script) used for the same has the following contents
>> where `/host` refers to the root directory of the node:
>>
>> get_bin_path: |
>>   #!/bin/sh
>>   bin_name=3D$1
>>   if [ -x /host/bin/which ]; then
>>     echo $(chroot /host /bin/which $bin_name | cut -d ' ' -f 1)
>>   elif [ -x /host/usr/bin/which ]; then
>>     echo $(chroot /host /usr/bin/which $bin_name | cut -d ' ' -f 1)
>>   else
>>     $(chroot /host which $bin_name | cut -d ' ' -f 1)
>>   fi
>>
>> lvcreate: |
>>   #!/bin/sh
>>   path=3D$(/sbin/lvm-eg/get_bin_path "lvcreate")
>>   chroot /host $path "$@"
>>
>> Also, the above logs in the pastebin link have errors because the vg loc=
k
>> has not been acquired and hence creation commands will fail. Once the lo=
ck
>> is acquired, the `strace -f` command gives the following output being
>> stuck. Check out this link for full details ->
>> https://pastebin.com/raw/DwQfdmr8
>>
>> P.S: We at OpenEBS are trying to provide lvm storage to cloud native
>> workloads with the help of kubernetes CSI drivers and since all these
>> drivers run as pods and help dynamic provisioning of kubernetes
>> volumes(storage) for the application, the lvm commands needs to be run f=
rom
>> inside the pod. Reference -> https://github.com/openebs/lvm-localpv
>>
>> Regards
>>
>> On Wed, 1 Jun 2022 at 13:06, Demi Marie Obenour <
>> demi@invisiblethingslab.com> wrote:
>>
>>> On Wed, Jun 01, 2022 at 12:20:32AM +0530, Abhishek Agarwal wrote:
>>> > Hi Roger. Thanks for your reply. I have rerun the command with `strac=
e
>>> -f`
>>> > as you suggested. Here is the pastebin link containing the detailed
>>> output
>>> > of the command: https://pastebin.com/raw/VRuBbHBc
>>>
>>> Even if you can get LVM =E2=80=9Cworking=E2=80=9D, it is still likely t=
o cause data
>>> corruption at some point, as there is no guarantee that different LVM
>>> processes in different namespaces will see each others=E2=80=99 locks.
>>>
>>> Why do you need to run LVM in a container?  What are you trying to
>>> accomplish?
>>> --
>>> Sincerely,
>>> Demi Marie Obenour (she/her/hers)
>>> Invisible Things Lab
>>> _______________________________________________
>>> linux-lvm mailing list
>>> linux-lvm@redhat.com
>>> https://listman.redhat.com/mailman/listinfo/linux-lvm
>>> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>>>
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

--000000000000d7455305e0c10aa1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>1. Yes, use_lvmetad is 0, and its systemd units for i=
t are stopped/disabled.</div><div>2. Yes, everything on the host machine i.=
e(/proc, /sys etc) are getting mounted on the pod.</div><div><p style=3D"ma=
rgin:0px;font-stretch:normal;font-size:11px;line-height:normal;font-family:=
Menlo;color:rgb(219,219,219);background-color:rgb(0,0,0)"><span style=3D"fo=
nt-variant-ligatures:no-common-ligatures;color:rgb(47,180,29)"><b>ubuntu@ip=
-172-31-89-47</b></span><span style=3D"font-variant-ligatures:no-common-lig=
atures">:</span><span style=3D"font-variant-ligatures:no-common-ligatures;c=
olor:rgb(64,11,218)"><b>~</b></span><span style=3D"font-variant-ligatures:n=
o-common-ligatures">$ kubectl exec -it openebs-lvm-node-v6jrb -c openebs-lv=
m-plugin<span class=3D"gmail-Apple-converted-space">=C2=A0 </span>-n kube-s=
ystem -- sh</span></p>
<p style=3D"margin:0px;font-stretch:normal;font-size:11px;line-height:norma=
l;font-family:Menlo;color:rgb(219,219,219);background-color:rgb(0,0,0)"><sp=
an style=3D"font-variant-ligatures:no-common-ligatures"># ls<span class=3D"=
gmail-Apple-converted-space">=C2=A0 =C2=A0 =C2=A0</span></span></p>
<p style=3D"margin:0px;font-stretch:normal;font-size:11px;line-height:norma=
l;font-family:Menlo;color:rgb(219,219,219);background-color:rgb(0,0,0)"><sp=
an style=3D"font-variant-ligatures:no-common-ligatures">bin<span class=3D"g=
mail-Apple-converted-space">=C2=A0 </span>boot<span class=3D"gmail-Apple-co=
nverted-space">=C2=A0 </span>dev<span class=3D"gmail-Apple-tab-span" style=
=3D"white-space:pre">=09</span>etc<span class=3D"gmail-Apple-converted-spac=
e">=C2=A0 </span>home<span class=3D"gmail-Apple-converted-space">=C2=A0 </s=
pan>host<span class=3D"gmail-Apple-converted-space">=C2=A0 </span>lib<span =
class=3D"gmail-Apple-converted-space">=C2=A0 </span>lib32<span class=3D"gma=
il-Apple-converted-space">=C2=A0 </span>lib64<span class=3D"gmail-Apple-con=
verted-space">=C2=A0 </span>libx32<span class=3D"gmail-Apple-converted-spac=
e">=C2=A0 </span>media<span class=3D"gmail-Apple-converted-space">=C2=A0 </=
span>mnt<span class=3D"gmail-Apple-tab-span" style=3D"white-space:pre">=09<=
/span>opt<span class=3D"gmail-Apple-converted-space">=C2=A0 </span>plugin<s=
pan class=3D"gmail-Apple-converted-space">=C2=A0 </span>proc<span class=3D"=
gmail-Apple-converted-space">=C2=A0 </span>root<span class=3D"gmail-Apple-c=
onverted-space">=C2=A0 </span>run<span class=3D"gmail-Apple-converted-space=
">=C2=A0 </span>sbin<span class=3D"gmail-Apple-converted-space">=C2=A0 </sp=
an>srv<span class=3D"gmail-Apple-converted-space">=C2=A0 </span>sys<span cl=
ass=3D"gmail-Apple-converted-space">=C2=A0 </span>tmp<span class=3D"gmail-A=
pple-converted-space">=C2=A0 </span>usr<span class=3D"gmail-Apple-tab-span"=
 style=3D"white-space:pre">=09</span>var</span></p>
<p style=3D"margin:0px;font-stretch:normal;font-size:11px;line-height:norma=
l;font-family:Menlo;color:rgb(219,219,219);background-color:rgb(0,0,0)"><sp=
an style=3D"font-variant-ligatures:no-common-ligatures"># cd /host</span></=
p>
<p style=3D"margin:0px;font-stretch:normal;font-size:11px;line-height:norma=
l;font-family:Menlo;color:rgb(219,219,219);background-color:rgb(0,0,0)"><sp=
an style=3D"font-variant-ligatures:no-common-ligatures"># ls</span></p>
<p style=3D"margin:0px;font-stretch:normal;font-size:11px;line-height:norma=
l;font-family:Menlo;color:rgb(219,219,219);background-color:rgb(0,0,0)"><sp=
an style=3D"font-variant-ligatures:no-common-ligatures">bin<span class=3D"g=
mail-Apple-converted-space">=C2=A0 </span>boot<span class=3D"gmail-Apple-co=
nverted-space">=C2=A0 </span>dev<span class=3D"gmail-Apple-tab-span" style=
=3D"white-space:pre">=09</span>etc<span class=3D"gmail-Apple-converted-spac=
e">=C2=A0 </span>home<span class=3D"gmail-Apple-converted-space">=C2=A0 </s=
pan>lib<span class=3D"gmail-Apple-tab-span" style=3D"white-space:pre">=09</=
span>lib32<span class=3D"gmail-Apple-converted-space">=C2=A0 </span>lib64<s=
pan class=3D"gmail-Apple-converted-space">=C2=A0 </span>libx32<span class=
=3D"gmail-Apple-converted-space">=C2=A0 </span>lost+found<span class=3D"gma=
il-Apple-converted-space">=C2=A0 </span>media<span class=3D"gmail-Apple-con=
verted-space">=C2=A0 </span>mnt<span class=3D"gmail-Apple-converted-space">=
=C2=A0 </span>opt<span class=3D"gmail-Apple-converted-space">=C2=A0 </span>=
proc<span class=3D"gmail-Apple-converted-space">=C2=A0 </span>root<span cla=
ss=3D"gmail-Apple-converted-space">=C2=A0 </span>run<span class=3D"gmail-Ap=
ple-converted-space">=C2=A0 </span>sbin<span class=3D"gmail-Apple-converted=
-space">=C2=A0 </span>snap<span class=3D"gmail-Apple-tab-span" style=3D"whi=
te-space:pre">=09</span>srv<span class=3D"gmail-Apple-converted-space">=C2=
=A0 </span>sys<span class=3D"gmail-Apple-converted-space">=C2=A0 </span>tmp=
<span class=3D"gmail-Apple-converted-space">=C2=A0 </span>usr<span class=3D=
"gmail-Apple-converted-space">=C2=A0 </span>var</span></p>
<p style=3D"margin:0px;font-stretch:normal;font-size:11px;line-height:norma=
l;font-family:Menlo;color:rgb(219,219,219);background-color:rgb(0,0,0)"><sp=
an style=3D"font-variant-ligatures:no-common-ligatures">#</span></p></div>3=
. The detail output of `strace -f -ttt` command:=C2=A0<a href=3D"https://pa=
stebin.com/raw/VFyXLNaC">https://pastebin.com/raw/VFyXLNaC</a></div><br><di=
v class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, 3 Jun=
 2022 at 12:48, Roger Heflin &lt;<a href=3D"mailto:rogerheflin@gmail.com">r=
ogerheflin@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-sty=
le:solid;border-left-color:rgb(204,204,204);padding-left:1ex"><div dir=3D"l=
tr"><div>Random thoughts.</div><div><br></div><div>Make sure=C2=A0 use_lvme=
tad is 0, and its systemd units for it are stopped/disabled.</div><div><br>=
</div><div>Are you mounting /proc and /sys and /dev into the /host chroot?<=
/div><div><br></div><div>/run may also be needed.</div><div><br></div><div>=
you might add a &quot;-ttt&quot; to the strace command to give timing data.=
</div><div><br></div><div><br></div></div><br><div class=3D"gmail_quote"><d=
iv dir=3D"ltr" class=3D"gmail_attr">On Thu, Jun 2, 2022 at 1:41 AM Abhishek=
 Agarwal &lt;<a href=3D"mailto:mragarwal.developer@gmail.com" target=3D"_bl=
ank">mragarwal.developer@gmail.com</a>&gt; wrote:<br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;b=
order-left-style:solid;border-left-color:rgb(204,204,204);padding-left:1ex"=
><div dir=3D"ltr">These are not different LVM processes. The container proc=
ess is using the LVM binary that the node itself has. We have achieved this=
 by using scripts that point to the same lvm binary that is used by the nod=
e.<div><br></div><div>Configmap(~shell script) used for the same has the fo=
llowing contents where `/host` refers to the root directory of the node:</d=
iv><div><pre style=3D"background-color:rgb(43,43,43);color:rgb(169,183,198)=
;font-family:&quot;JetBrains Mono&quot;,monospace;font-size:9.8pt"><span st=
yle=3D"color:rgb(204,120,50)">get_bin_path</span>: |<br>  #!/bin/sh<br>  bi=
n_name=3D$1<br>  if [ -x /host/bin/which ]; then<br>    echo $(chroot /host=
 /bin/which $bin_name | cut -d &#39; &#39; -f 1)<br>  elif [ -x /host/usr/b=
in/which ]; then<br>    echo $(chroot /host /usr/bin/which $bin_name | cut =
-d &#39; &#39; -f 1)<br>  else<br>    $(chroot /host which $bin_name | cut =
-d &#39; &#39; -f 1)<br>  fi</pre></div><div><pre style=3D"background-color=
:rgb(43,43,43);color:rgb(169,183,198);font-family:&quot;JetBrains Mono&quot=
;,monospace;font-size:9.8pt"><span style=3D"color:rgb(204,120,50)">lvcreate=
</span>: |<br>  #!/bin/sh<br>  path=3D$(/sbin/lvm-eg/get_bin_path &quot;lvc=
reate&quot;)<br>  chroot /host $path &quot;$@&quot;</pre></div><div>Also, t=
he above logs in the pastebin link have errors because the vg lock has not =
been acquired and hence creation commands will fail. Once the lock is acqui=
red, the `strace -f` command gives the following=C2=A0output being stuck. C=
heck out this link for full details -&gt;=C2=A0<a href=3D"https://pastebin.=
com/raw/DwQfdmr8" target=3D"_blank">https://pastebin.com/raw/DwQfdmr8</a></=
div><div><br></div><div>P.S: We at OpenEBS are trying to provide lvm storag=
e to cloud native workloads with the help of kubernetes CSI drivers and sin=
ce all these drivers run as pods and help dynamic provisioning of kubernete=
s volumes(storage) for the application, the lvm commands needs to be run fr=
om inside the pod. Reference -&gt;=C2=A0<a href=3D"https://github.com/opene=
bs/lvm-localpv" target=3D"_blank">https://github.com/openebs/lvm-localpv</a=
></div><div><br></div><div>Regards</div></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, 1 Jun 2022 at 13:06, Demi M=
arie Obenour &lt;<a href=3D"mailto:demi@invisiblethingslab.com" target=3D"_=
blank">demi@invisiblethingslab.com</a>&gt; wrote:<br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;b=
order-left-style:solid;border-left-color:rgb(204,204,204);padding-left:1ex"=
>On Wed, Jun 01, 2022 at 12:20:32AM +0530, Abhishek Agarwal wrote:<br>
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

--000000000000d7455305e0c10aa1--

--===============5106645037678512596==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

--===============5106645037678512596==--

