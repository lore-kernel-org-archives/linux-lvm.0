Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FB76C433EF
	for <linux-lvm@archiver.kernel.org>; Tue,  7 Jun 2022 07:17:09 +0000 (UTC)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-312-1QfEiJY7MpWNG7ERmBX-HQ-1; Tue, 07 Jun 2022 03:17:06 -0400
X-MC-Unique: 1QfEiJY7MpWNG7ERmBX-HQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 22E988027EE;
	Tue,  7 Jun 2022 07:17:04 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4B76A492CA3;
	Tue,  7 Jun 2022 07:16:57 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 24B6C19452D8;
	Tue,  7 Jun 2022 07:16:57 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 86FC4194706E
 for <linux-lvm@listman.corp.redhat.com>; Mon,  6 Jun 2022 07:02:35 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 6F7692166B29; Mon,  6 Jun 2022 07:02:35 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6A1E62166B26
 for <linux-lvm@redhat.com>; Mon,  6 Jun 2022 07:02:35 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4B9D838149A9
 for <linux-lvm@redhat.com>; Mon,  6 Jun 2022 07:02:35 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-226-dyHSeAYFNIuh9wWYnv49Ow-1; Mon, 06 Jun 2022 03:02:23 -0400
X-MC-Unique: dyHSeAYFNIuh9wWYnv49Ow-1
Received: by mail-ej1-f44.google.com with SMTP id q1so27094341ejz.9
 for <linux-lvm@redhat.com>; Mon, 06 Jun 2022 00:02:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:thread-topic:thread-index:date
 :message-id:references:in-reply-to:accept-language:content-language
 :mime-version;
 bh=5r5JBsirA+2gHgs34/EAEV7/VsPSwUb085nbOgOuBc4=;
 b=x+GMh23MieyjoUBDmyym7Z8s9w++75/UwZdo6yK59WoL9INu/EUerIQJYCAB93XXb/
 ioj7rf3GLF9HCxfk4yF2SY1bDzGubmbEhc1srC9Nigoow0s97+LcND+r/0M4IFeGMh03
 5oUIN00VvyTsjojz0ENv4RbiYentJcIuNF1Su6xxVQGBriWeg4czUIrjTmqPZNb1Qc4L
 4Mql/9ioUuhOa5WfUZOhTpawUHBGeJOnfIPVcIRItgVhG0P9nOpF5yGhGN6K0LFip5t3
 bXj1AyB32axEQ/ZbvsQJB0U0NP8O+VI1AC/ffylDXPz7HVcbufeSFlhWvdtdoQ9b5h8o
 HVOA==
X-Gm-Message-State: AOAM531qZcm64G8qcp0xpP1G/5EjAyY61MqqMBpY1nMurwrsZiFudQPc
 yeE1mJoI044iWb/hsaBKKbnjz5jPE0MImQ==
X-Google-Smtp-Source: ABdhPJy7fTCVTDuR5B9MwDCFhqFtm6uLqx2v+xLzbnPu+PJ/FXJ7VWVifaOkkQQ/8rBOqc/UQj7T9w==
X-Received: by 2002:a17:906:a858:b0:70e:a4d8:1c45 with SMTP id
 dx24-20020a170906a85800b0070ea4d81c45mr13201742ejb.213.1654498941770; 
 Mon, 06 Jun 2022 00:02:21 -0700 (PDT)
Received: from AM9P193MB1142.EURP193.PROD.OUTLOOK.COM ([2603:1026:c03:6009::5])
 by smtp.gmail.com with ESMTPSA id
 u14-20020aa7d54e000000b0042e21f8c412sm5737879edr.42.2022.06.06.00.02.21
 for <linux-lvm@redhat.com>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 06 Jun 2022 00:02:21 -0700 (PDT)
From: Bernd Eckenfels <ecki@zusammenkunft.net>
To: LVM general discussion and development <linux-lvm@redhat.com>
Thread-Topic: [linux-lvm] lvm commands hanging when run from inside a
 kubernetes pod
Thread-Index: AUFLcExZ5wV9D2kQlWT28SBLsjSI4Hc5Rnp6Z3NwS3QyOGpzVUFEcFRHd2tOZGpBSG9fcZ4FGnyJ
X-MS-Exchange-MessageSentRepresentingType: 1
Date: Mon, 6 Jun 2022 07:02:20 +0000
Message-ID: <AM9P193MB11423A58DD686FCDA9E8148BFFA29@AM9P193MB1142.EURP193.PROD.OUTLOOK.COM>
References: <CAM3OQJGWsYo=boQBHqmLj1HRRtg14p3-Tp3yeu7KMYcKV2_hOA@mail.gmail.com>
 <CAAMCDecMgzcyQOdb2n-zLRwrHhK9wFSicHJDeA_9zhvSQbyPdw@mail.gmail.com>
 <CAM3OQJEEttEn22Ao3GJK=GYKSUj3Sp0brU1mv2_s1dnMeFUg5g@mail.gmail.com>
 <YpcUpGsiSjwK8cG2@itl-email>
 <CAM3OQJHe3GKfAqR4A3QT6Q6TgiG-qpHNBHfnEczD3eH+ruq0VA@mail.gmail.com>
 <CAAMCDefV+jHCKnrp0gad7BFgJaYDQNOkeQM5z8zkOe4PUz9Dpw@mail.gmail.com>
 <CAM3OQJHdTqOksDPx0dp_LbF2kRHaaoN3b4YEGamHFabHRGxScA@mail.gmail.com>
In-Reply-To: <CAM3OQJHdTqOksDPx0dp_LbF2kRHaaoN3b4YEGamHFabHRGxScA@mail.gmail.com>
Accept-Language: de-DE, en-US
X-MS-Has-Attach: 
X-MS-Exchange-Organization-SCL: -1
X-MS-TNEF-Correlator: 
X-MS-Exchange-Organization-RecordReviewCfmType: 0
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Mailman-Approved-At: Tue, 07 Jun 2022 07:16:56 +0000
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
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: de-DE
Content-Type: multipart/mixed; boundary="===============4335712502147738761=="

--===============4335712502147738761==
Content-Language: de-DE
Content-Type: multipart/alternative;
	boundary="_000_AM9P193MB11423A58DD686FCDA9E8148BFFA29AM9P193MB1142EURP_"

--_000_AM9P193MB11423A58DD686FCDA9E8148BFFA29AM9P193MB1142EURP_
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

Not sure if relevant, but this could be a kernel (hidepid?) hardening or em=
pty mount?


[pid   360] 1654493537.688190 getppid() =3D 355
[pid   360] 1654493537.688437 openat(AT_FDCWD, "/proc/355/cmdline", O_RDONL=
Y) =3D -1 ENOENT (No such file or directory)

Gruss
Bernd


--
http://bernd.eckenfels.net
________________________________
Von: linux-lvm <linux-lvm-bounces@redhat.com> im Auftrag von Abhishek Agarw=
al <mragarwal.developer@gmail.com>
Gesendet: Monday, June 6, 2022 7:49:47 AM
An: LVM general discussion and development <linux-lvm@redhat.com>
Betreff: Re: [linux-lvm] lvm commands hanging when run from inside a kubern=
etes pod

1. Yes, use_lvmetad is 0, and its systemd units for it are stopped/disabled=
.
2. Yes, everything on the host machine i.e(/proc, /sys etc) are getting mou=
nted on the pod.

ubuntu@ip-172-31-89-47:~$ kubectl exec -it openebs-lvm-node-v6jrb -c openeb=
s-lvm-plugin  -n kube-system -- sh

# ls

bin  boot  dev etc  home  host  lib  lib32  lib64  libx32  media  mnt opt  =
plugin  proc  root  run  sbin  srv  sys  tmp  usr var

# cd /host

# ls

bin  boot  dev etc  home  lib lib32  lib64  libx32  lost+found  media  mnt =
 opt  proc  root  run  sbin  snap srv  sys  tmp  usr  var

#

3. The detail output of `strace -f -ttt` command: https://pastebin.com/raw/=
VFyXLNaC

On Fri, 3 Jun 2022 at 12:48, Roger Heflin <rogerheflin@gmail.com<mailto:rog=
erheflin@gmail.com>> wrote:
Random thoughts.

Make sure  use_lvmetad is 0, and its systemd units for it are stopped/disab=
led.

Are you mounting /proc and /sys and /dev into the /host chroot?

/run may also be needed.

you might add a "-ttt" to the strace command to give timing data.



On Thu, Jun 2, 2022 at 1:41 AM Abhishek Agarwal <mragarwal.developer@gmail.=
com<mailto:mragarwal.developer@gmail.com>> wrote:
These are not different LVM processes. The container process is using the L=
VM binary that the node itself has. We have achieved this by using scripts =
that point to the same lvm binary that is used by the node.

Configmap(~shell script) used for the same has the following contents where=
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

Also, the above logs in the pastebin link have errors because the vg lock h=
as not been acquired and hence creation commands will fail. Once the lock i=
s acquired, the `strace -f` command gives the following output being stuck.=
 Check out this link for full details -> https://pastebin.com/raw/DwQfdmr8

P.S: We at OpenEBS are trying to provide lvm storage to cloud native worklo=
ads with the help of kubernetes CSI drivers and since all these drivers run=
 as pods and help dynamic provisioning of kubernetes volumes(storage) for t=
he application, the lvm commands needs to be run from inside the pod. Refer=
ence -> https://github.com/openebs/lvm-localpv

Regards

On Wed, 1 Jun 2022 at 13:06, Demi Marie Obenour <demi@invisiblethingslab.co=
m<mailto:demi@invisiblethingslab.com>> wrote:
On Wed, Jun 01, 2022 at 12:20:32AM +0530, Abhishek Agarwal wrote:
> Hi Roger. Thanks for your reply. I have rerun the command with `strace -f=
`
> as you suggested. Here is the pastebin link containing the detailed outpu=
t
> of the command: https://pastebin.com/raw/VRuBbHBc

Even if you can get LVM =93working=94, it is still likely to cause data
corruption at some point, as there is no guarantee that different LVM
processes in different namespaces will see each others=92 locks.

Why do you need to run LVM in a container?  What are you trying to
accomplish?
--
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab
_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com<mailto:linux-lvm@redhat.com>
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com<mailto:linux-lvm@redhat.com>
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com<mailto:linux-lvm@redhat.com>
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

--_000_AM9P193MB11423A58DD686FCDA9E8148BFFA29AM9P193MB1142EURP_
Content-Type: text/html; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
</head>
<body>
<div>
<div>
<div dir=3D"ltr" style=3D"">Not sure if relevant, but this could be a kerne=
l (hidepid?) hardening or empty mount?</div>
<div dir=3D"ltr" style=3D""><br>
</div>
<div dir=3D"ltr" style=3D"">
<pre style=3D"caret-color:rgb(0, 0, 0);white-space:pre-wrap">[pid &nbsp; 36=
0] 1654493537.688190 getppid() =3D 355=0A[pid &nbsp; 360] 1654493537.688437=
 openat(AT_FDCWD, &quot;/proc/355/cmdline&quot;, O_RDONLY) =3D -1 ENOENT (N=
o such file or directory)</pre>
<br>
</div>
<div dir=3D"ltr" style=3D"">Gruss</div>
<div dir=3D"ltr" style=3D"">Bernd</div>
</div>
<div id=3D"ms-outlook-mobile-signature">
<div><br>
</div>
<div><br>
</div>
<div style=3D"direction: ltr;">-- </div>
<div style=3D"direction: ltr;">http://bernd.eckenfels.net</div>
</div>
</div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>Von:</b> linux-lvm &lt;linux-lv=
m-bounces@redhat.com&gt; im Auftrag von Abhishek Agarwal &lt;mragarwal.deve=
loper@gmail.com&gt;<br>
<b>Gesendet:</b> Monday, June 6, 2022 7:49:47 AM<br>
<b>An:</b> LVM general discussion and development &lt;linux-lvm@redhat.com&=
gt;<br>
<b>Betreff:</b> Re: [linux-lvm] lvm commands hanging when run from inside a=
 kubernetes pod</font>
<div>&nbsp;</div>
</div>
<div>
<div dir=3D"ltr">
<div>1. Yes, use_lvmetad is 0, and its systemd units for it are stopped/dis=
abled.</div>
<div>2. Yes, everything on the host machine i.e(/proc, /sys etc) are gettin=
g mounted on the pod.</div>
<div>
<p style=3D"margin:0px; font-stretch:normal; font-size:11px; line-height:no=
rmal; font-family:Menlo; color:rgb(219,219,219); background-color:rgb(0,0,0=
)">
<span style=3D"font-variant-ligatures:no-common-ligatures; color:rgb(47,180=
,29)"><b>ubuntu@ip-172-31-89-47</b></span><span style=3D"font-variant-ligat=
ures:no-common-ligatures">:</span><span style=3D"font-variant-ligatures:no-=
common-ligatures; color:rgb(64,11,218)"><b>~</b></span><span style=3D"font-=
variant-ligatures:no-common-ligatures">$
 kubectl exec -it openebs-lvm-node-v6jrb -c openebs-lvm-plugin<span class=
=3D"x_gmail-Apple-converted-space">&nbsp;
</span>-n kube-system -- sh</span></p>
<p style=3D"margin:0px; font-stretch:normal; font-size:11px; line-height:no=
rmal; font-family:Menlo; color:rgb(219,219,219); background-color:rgb(0,0,0=
)">
<span style=3D"font-variant-ligatures:no-common-ligatures"># ls<span class=
=3D"x_gmail-Apple-converted-space">&nbsp; &nbsp; &nbsp;</span></span></p>
<p style=3D"margin:0px; font-stretch:normal; font-size:11px; line-height:no=
rmal; font-family:Menlo; color:rgb(219,219,219); background-color:rgb(0,0,0=
)">
<span style=3D"font-variant-ligatures:no-common-ligatures">bin<span class=
=3D"x_gmail-Apple-converted-space">&nbsp;
</span>boot<span class=3D"x_gmail-Apple-converted-space">&nbsp; </span>dev<=
span class=3D"x_gmail-Apple-tab-span" style=3D"white-space:pre">
</span>etc<span class=3D"x_gmail-Apple-converted-space">&nbsp; </span>home<=
span class=3D"x_gmail-Apple-converted-space">&nbsp;
</span>host<span class=3D"x_gmail-Apple-converted-space">&nbsp; </span>lib<=
span class=3D"x_gmail-Apple-converted-space">&nbsp;
</span>lib32<span class=3D"x_gmail-Apple-converted-space">&nbsp; </span>lib=
64<span class=3D"x_gmail-Apple-converted-space">&nbsp;
</span>libx32<span class=3D"x_gmail-Apple-converted-space">&nbsp; </span>me=
dia<span class=3D"x_gmail-Apple-converted-space">&nbsp;
</span>mnt<span class=3D"x_gmail-Apple-tab-span" style=3D"white-space:pre">=
 </span>opt<span class=3D"x_gmail-Apple-converted-space">&nbsp;
</span>plugin<span class=3D"x_gmail-Apple-converted-space">&nbsp; </span>pr=
oc<span class=3D"x_gmail-Apple-converted-space">&nbsp;
</span>root<span class=3D"x_gmail-Apple-converted-space">&nbsp; </span>run<=
span class=3D"x_gmail-Apple-converted-space">&nbsp;
</span>sbin<span class=3D"x_gmail-Apple-converted-space">&nbsp; </span>srv<=
span class=3D"x_gmail-Apple-converted-space">&nbsp;
</span>sys<span class=3D"x_gmail-Apple-converted-space">&nbsp; </span>tmp<s=
pan class=3D"x_gmail-Apple-converted-space">&nbsp;
</span>usr<span class=3D"x_gmail-Apple-tab-span" style=3D"white-space:pre">=
 </span>var</span></p>
<p style=3D"margin:0px; font-stretch:normal; font-size:11px; line-height:no=
rmal; font-family:Menlo; color:rgb(219,219,219); background-color:rgb(0,0,0=
)">
<span style=3D"font-variant-ligatures:no-common-ligatures"># cd /host</span=
></p>
<p style=3D"margin:0px; font-stretch:normal; font-size:11px; line-height:no=
rmal; font-family:Menlo; color:rgb(219,219,219); background-color:rgb(0,0,0=
)">
<span style=3D"font-variant-ligatures:no-common-ligatures"># ls</span></p>
<p style=3D"margin:0px; font-stretch:normal; font-size:11px; line-height:no=
rmal; font-family:Menlo; color:rgb(219,219,219); background-color:rgb(0,0,0=
)">
<span style=3D"font-variant-ligatures:no-common-ligatures">bin<span class=
=3D"x_gmail-Apple-converted-space">&nbsp;
</span>boot<span class=3D"x_gmail-Apple-converted-space">&nbsp; </span>dev<=
span class=3D"x_gmail-Apple-tab-span" style=3D"white-space:pre">
</span>etc<span class=3D"x_gmail-Apple-converted-space">&nbsp; </span>home<=
span class=3D"x_gmail-Apple-converted-space">&nbsp;
</span>lib<span class=3D"x_gmail-Apple-tab-span" style=3D"white-space:pre">=
 </span>lib32<span class=3D"x_gmail-Apple-converted-space">&nbsp;
</span>lib64<span class=3D"x_gmail-Apple-converted-space">&nbsp; </span>lib=
x32<span class=3D"x_gmail-Apple-converted-space">&nbsp;
</span>lost+found<span class=3D"x_gmail-Apple-converted-space">&nbsp; </spa=
n>media<span class=3D"x_gmail-Apple-converted-space">&nbsp;
</span>mnt<span class=3D"x_gmail-Apple-converted-space">&nbsp; </span>opt<s=
pan class=3D"x_gmail-Apple-converted-space">&nbsp;
</span>proc<span class=3D"x_gmail-Apple-converted-space">&nbsp; </span>root=
<span class=3D"x_gmail-Apple-converted-space">&nbsp;
</span>run<span class=3D"x_gmail-Apple-converted-space">&nbsp; </span>sbin<=
span class=3D"x_gmail-Apple-converted-space">&nbsp;
</span>snap<span class=3D"x_gmail-Apple-tab-span" style=3D"white-space:pre"=
> </span>srv<span class=3D"x_gmail-Apple-converted-space">&nbsp;
</span>sys<span class=3D"x_gmail-Apple-converted-space">&nbsp; </span>tmp<s=
pan class=3D"x_gmail-Apple-converted-space">&nbsp;
</span>usr<span class=3D"x_gmail-Apple-converted-space">&nbsp; </span>var</=
span></p>
<p style=3D"margin:0px; font-stretch:normal; font-size:11px; line-height:no=
rmal; font-family:Menlo; color:rgb(219,219,219); background-color:rgb(0,0,0=
)">
<span style=3D"font-variant-ligatures:no-common-ligatures">#</span></p>
</div>
3. The detail output of `strace -f -ttt` command:&nbsp;<a href=3D"https://p=
astebin.com/raw/VFyXLNaC">https://pastebin.com/raw/VFyXLNaC</a></div>
<br>
<div class=3D"x_gmail_quote">
<div dir=3D"ltr" class=3D"x_gmail_attr">On Fri, 3 Jun 2022 at 12:48, Roger =
Heflin &lt;<a href=3D"mailto:rogerheflin@gmail.com">rogerheflin@gmail.com</=
a>&gt; wrote:<br>
</div>
<blockquote class=3D"x_gmail_quote" style=3D"margin:0px 0px 0px 0.8ex; bord=
er-left-width:1px; border-left-style:solid; border-left-color:rgb(204,204,2=
04); padding-left:1ex">
<div dir=3D"ltr">
<div>Random thoughts.</div>
<div><br>
</div>
<div>Make sure&nbsp; use_lvmetad is 0, and its systemd units for it are sto=
pped/disabled.</div>
<div><br>
</div>
<div>Are you mounting /proc and /sys and /dev into the /host chroot?</div>
<div><br>
</div>
<div>/run may also be needed.</div>
<div><br>
</div>
<div>you might add a &quot;-ttt&quot; to the strace command to give timing =
data.</div>
<div><br>
</div>
<div><br>
</div>
</div>
<br>
<div class=3D"x_gmail_quote">
<div dir=3D"ltr" class=3D"x_gmail_attr">On Thu, Jun 2, 2022 at 1:41 AM Abhi=
shek Agarwal &lt;<a href=3D"mailto:mragarwal.developer@gmail.com" target=3D=
"_blank">mragarwal.developer@gmail.com</a>&gt; wrote:<br>
</div>
<blockquote class=3D"x_gmail_quote" style=3D"margin:0px 0px 0px 0.8ex; bord=
er-left-width:1px; border-left-style:solid; border-left-color:rgb(204,204,2=
04); padding-left:1ex">
<div dir=3D"ltr">These are not different LVM processes. The container proce=
ss is using the LVM binary that the node itself has. We have achieved this =
by using scripts that point to the same lvm binary that is used by the node=
.
<div><br>
</div>
<div>Configmap(~shell script) used for the same has the following contents =
where `/host` refers to the root directory of the node:</div>
<div>
<pre style=3D"background-color:rgb(43,43,43); color:rgb(169,183,198); font-=
family:&quot;JetBrains Mono&quot;,monospace; font-size:9.8pt"><span style=
=3D"color:rgb(204,120,50)">get_bin_path</span>: |<br>  #!/bin/sh<br>  bin_n=
ame=3D$1<br>  if [ -x /host/bin/which ]; then<br>    echo $(chroot /host /b=
in/which $bin_name | cut -d ' ' -f 1)<br>  elif [ -x /host/usr/bin/which ];=
 then<br>    echo $(chroot /host /usr/bin/which $bin_name | cut -d ' ' -f 1=
)<br>  else<br>    $(chroot /host which $bin_name | cut -d ' ' -f 1)<br>  f=
i</pre>
</div>
<div>
<pre style=3D"background-color:rgb(43,43,43); color:rgb(169,183,198); font-=
family:&quot;JetBrains Mono&quot;,monospace; font-size:9.8pt"><span style=
=3D"color:rgb(204,120,50)">lvcreate</span>: |<br>  #!/bin/sh<br>  path=3D$(=
/sbin/lvm-eg/get_bin_path &quot;lvcreate&quot;)<br>  chroot /host $path &qu=
ot;$@&quot;</pre>
</div>
<div>Also, the above logs in the pastebin link have errors because the vg l=
ock has not been acquired and hence creation commands will fail. Once the l=
ock is acquired, the `strace -f` command gives the following&nbsp;output be=
ing stuck. Check out this link for full
 details -&gt;&nbsp;<a href=3D"https://pastebin.com/raw/DwQfdmr8" target=3D=
"_blank">https://pastebin.com/raw/DwQfdmr8</a></div>
<div><br>
</div>
<div>P.S: We at OpenEBS are trying to provide lvm storage to cloud native w=
orkloads with the help of kubernetes CSI drivers and since all these driver=
s run as pods and help dynamic provisioning of kubernetes volumes(storage) =
for the application, the lvm commands
 needs to be run from inside the pod. Reference -&gt;&nbsp;<a href=3D"https=
://github.com/openebs/lvm-localpv" target=3D"_blank">https://github.com/ope=
nebs/lvm-localpv</a></div>
<div><br>
</div>
<div>Regards</div>
</div>
<br>
<div class=3D"x_gmail_quote">
<div dir=3D"ltr" class=3D"x_gmail_attr">On Wed, 1 Jun 2022 at 13:06, Demi M=
arie Obenour &lt;<a href=3D"mailto:demi@invisiblethingslab.com" target=3D"_=
blank">demi@invisiblethingslab.com</a>&gt; wrote:<br>
</div>
<blockquote class=3D"x_gmail_quote" style=3D"margin:0px 0px 0px 0.8ex; bord=
er-left-width:1px; border-left-style:solid; border-left-color:rgb(204,204,2=
04); padding-left:1ex">
On Wed, Jun 01, 2022 at 12:20:32AM +0530, Abhishek Agarwal wrote:<br>
&gt; Hi Roger. Thanks for your reply. I have rerun the command with `strace=
 -f`<br>
&gt; as you suggested. Here is the pastebin link containing the detailed ou=
tput<br>
&gt; of the command: <a href=3D"https://pastebin.com/raw/VRuBbHBc" rel=3D"n=
oreferrer" target=3D"_blank">
https://pastebin.com/raw/VRuBbHBc</a><br>
<br>
Even if you can get LVM =93working=94, it is still likely to cause data<br>
corruption at some point, as there is no guarantee that different LVM<br>
processes in different namespaces will see each others=92 locks.<br>
<br>
Why do you need to run LVM in a container?&nbsp; What are you trying to<br>
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
noreferrer" target=3D"_blank">
http://tldp.org/HOWTO/LVM-HOWTO/</a><br>
</blockquote>
</div>
_______________________________________________<br>
linux-lvm mailing list<br>
<a href=3D"mailto:linux-lvm@redhat.com" target=3D"_blank">linux-lvm@redhat.=
com</a><br>
<a href=3D"https://listman.redhat.com/mailman/listinfo/linux-lvm" rel=3D"no=
referrer" target=3D"_blank">https://listman.redhat.com/mailman/listinfo/lin=
ux-lvm</a><br>
read the LVM HOW-TO at <a href=3D"http://tldp.org/HOWTO/LVM-HOWTO/" rel=3D"=
noreferrer" target=3D"_blank">
http://tldp.org/HOWTO/LVM-HOWTO/</a><br>
</blockquote>
</div>
_______________________________________________<br>
linux-lvm mailing list<br>
<a href=3D"mailto:linux-lvm@redhat.com" target=3D"_blank">linux-lvm@redhat.=
com</a><br>
<a href=3D"https://listman.redhat.com/mailman/listinfo/linux-lvm" rel=3D"no=
referrer" target=3D"_blank">https://listman.redhat.com/mailman/listinfo/lin=
ux-lvm</a><br>
read the LVM HOW-TO at <a href=3D"http://tldp.org/HOWTO/LVM-HOWTO/" rel=3D"=
noreferrer" target=3D"_blank">
http://tldp.org/HOWTO/LVM-HOWTO/</a><br>
</blockquote>
</div>
</div>
</body>
</html>

--_000_AM9P193MB11423A58DD686FCDA9E8148BFFA29AM9P193MB1142EURP_--

--===============4335712502147738761==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

--===============4335712502147738761==--

