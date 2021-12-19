Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9FB7C433F5
	for <linux-lvm@archiver.kernel.org>; Mon, 20 Dec 2021 06:57:22 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-58-P3roh7PtPcOIBTxxK5Am5A-1; Mon, 20 Dec 2021 01:57:19 -0500
X-MC-Unique: P3roh7PtPcOIBTxxK5Am5A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 97B241023F51;
	Mon, 20 Dec 2021 06:57:14 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D378A84A0F;
	Mon, 20 Dec 2021 06:57:11 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8C8B51809CB9;
	Mon, 20 Dec 2021 06:56:57 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
	[10.11.54.8])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1BJGi3Kx007552 for <linux-lvm@listman.util.phx.redhat.com>;
	Sun, 19 Dec 2021 11:44:03 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id BC9F4C15E74; Sun, 19 Dec 2021 16:44:03 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B810CC15E73
	for <linux-lvm@redhat.com>; Sun, 19 Dec 2021 16:44:03 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9EBE1800B21
	for <linux-lvm@redhat.com>; Sun, 19 Dec 2021 16:44:03 +0000 (UTC)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com
	[209.85.219.173]) by relay.mimecast.com with ESMTP with STARTTLS
	(version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-442-pUxsUjELOQy3z5ntiMTRxg-1; Sun, 19 Dec 2021 11:44:01 -0500
X-MC-Unique: pUxsUjELOQy3z5ntiMTRxg-1
Received: by mail-yb1-f173.google.com with SMTP id v138so21755422ybb.8
	for <linux-lvm@redhat.com>; Sun, 19 Dec 2021 08:44:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=PDCKgvmj7yqC7KJk9TfedF8xhxfmeGkVoNfQ0XKR6oE=;
	b=tm/mbq88uzJxTG9zB/YvL9zgzH17v+/UTkf7L6EzELYHC6eUVTo3f4XNWLfQjL2s6V
	pt649LztQ0/ly6+PA0CYfrlT7CaDkb2p4fagtAgrXulSuVZ7BcmfyCN/L5HTKCZ4JBBM
	dTEXPw59xNv4TUmZnYuNe+mi9DLyJMXnwTRylarDiOfwmuvq4VHMuBrQ5ou/GO9d+8tl
	5Hf0nHnmwJrLLQu1LWOWJgH+z2hO3BRwhtwQYA0+HH2mN4KbvwO7ppVqN48geBZVDB4k
	Bc5T99Rb5hECx9Ly6PY45GTz4AAiD9Mar/8iDFPZPaydV8vy+4oJrr0tHN0n+NECaGvR
	JM3A==
X-Gm-Message-State: AOAM5332GY8HgbiNCsVfo0fxxOeuy8R920/Gte6MwdZ7IlsPHuWVBR+w
	HX6gR2wVYMBUq63IXc5AjiSxQZF2LJ94dk/2OSbA1lxVotU=
X-Google-Smtp-Source: ABdhPJyo8LquF8CEi9R16EhPXzCSyEFo+XzkMO3ZLrIr4uXFdW1w9vN6ysf+ML0x0yG2+UTmWyyYIRRkHZdsOLGnKJE=
X-Received: by 2002:a25:748d:: with SMTP id
	p135mr17543309ybc.169.1639932240814; 
	Sun, 19 Dec 2021 08:44:00 -0800 (PST)
MIME-Version: 1.0
From: =?UTF-8?Q?Tomas_Dalebj=C3=B6rk?= <tomas.dalebjork@gmail.com>
Date: Sun, 19 Dec 2021 17:43:48 +0100
Message-ID: <CACrcyf+2uz_ngeVdq48WjSg6ZaarRpVXs8TZwzpQ4hnW7D7xGg@mail.gmail.com>
To: LVM general discussion and development <linux-lvm@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
X-loop: linux-lvm@redhat.com
X-Mailman-Approved-At: Mon, 20 Dec 2021 01:56:54 -0500
Subject: [linux-lvm] how to convert a disk containing a snapshot to a
	snapshot lv?
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="===============0555752368390693658=="

--===============0555752368390693658==
Content-Type: multipart/alternative; boundary="000000000000ab644705d3827a5e"

--000000000000ab644705d3827a5e
Content-Type: text/plain; charset="UTF-8"

Hi,

I am trying to understand how to convert a disk containing snapshot data.
This is how I tested this:
1. locate the snapshot testlv.211218.232255
root@debian10:/dev/mapper# lvs
  LV                   VG          Attr       LSize   Pool Origin Data%
 Meta%  Move Log Cpy%Sync Convert
  home                 debian10-vg -wi-ao----   1.00g
  root                 debian10-vg -wi-ao----  <3.81g
  swap_1               debian10-vg -wi-ao---- 976.00m
  testlv               debian10-vg owi-aos--- 100.00m
  testlv.211218.232255 debian10-vg swi-a-s--- 104.00m      testlv 1.44
root@debian10:/dev/mapper#

2. copy the lv - cow data to a file
# dd if=/dev/mapper/debian10--vg-testlv.211218.232255-cow of=/tmp/out
bs=1024

3. Setup a loopback disk for the file
# losetup -fP /tmp/out

4. Verify that disk exists
root@debian10:/dev/mapper# losetup -a
/dev/loop0: [65025]:39274 (/tmp/out)
root@debian10:/dev/mapper#

5. Try converting the disk using lvconvert command
# lvconvert -Zn -s debian10-vg/testlv /tmp/out
  "/tmp/out": Invalid path for Logical Volume.

6. Trying creating a softlink in /dev/mapper
# ln -s /tmp/out debian10--vg-loopback

7. verify link
root@debian10:/dev/mapper# ls -la
total 0
drwxr-xr-x  2 root root     240 Dec 19 17:40 .
drwxr-xr-x 18 root root    3820 Dec 19 17:22 ..
crw-------  1 root root 10, 236 Dec 10 19:10 control
lrwxrwxrwx  1 root root       7 Dec 10 19:10 debian10--vg-home -> ../dm-5
lrwxrwxrwx  1 root root       8 Dec 19 17:40 debian10--vg-loopback ->
/tmp/out
lrwxrwxrwx  1 root root       7 Dec 13 22:20 debian10--vg-root -> ../dm-1
lrwxrwxrwx  1 root root       7 Dec 10 19:10 debian10--vg-swap_1 -> ../dm-4
lrwxrwxrwx  1 root root       7 Dec 18 23:23 debian10--vg-testlv -> ../dm-0
lrwxrwxrwx  1 root root       7 Dec 18 23:23
debian10--vg-testlv.211218.232255 -> ../dm-6
lrwxrwxrwx  1 root root       7 Dec 18 23:23
debian10--vg-testlv.211218.232255-cow -> ../dm-3
lrwxrwxrwx  1 root root       7 Dec 18 23:23 debian10--vg-testlv-real ->
../dm-2
root@debian10:/dev/mapper#

8. retrying lvconvert command
root@debian10:/dev/mapper# lvconvert -Zn -s debian10-vg/testlv
/dev/mapper/debian10--vg-loopback
  Failed to find logical volume "debian10-vg/loopback"
root@debian10:/dev/mapper#

Are there more things to be considered, such as recreating pv data on disk?

Regards Tomas

--000000000000ab644705d3827a5e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi,</div><div><br></div><div>I am trying to understan=
d how to convert a disk containing snapshot data.</div><div>This is how I t=
ested this:</div><div>1. locate the snapshot testlv.211218.232255<br></div>=
<div><span style=3D"font-family:monospace">root@debian10:/dev/mapper# lvs<b=
r>=C2=A0 LV =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
VG =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Attr =C2=A0 =C2=A0 =C2=A0 LSize =C2=A0=
 Pool Origin Data% =C2=A0Meta% =C2=A0Move Log Cpy%Sync Convert<br>=C2=A0 ho=
me =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 debian10-vg -wi-=
ao---- =C2=A0 1.00g<br>=C2=A0 root =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 debian10-vg -wi-ao---- =C2=A0&lt;3.81g<br>=C2=A0 swap_1 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 debian10-vg -wi-ao---- 976=
.00m<br>=C2=A0 testlv =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 debi=
an10-vg owi-aos--- 100.00m<br>=C2=A0 <span style=3D"background-color:rgb(25=
5,255,0)">testlv.211218.232255 debian10-vg swi-a-s--- 104.00m =C2=A0 =C2=A0=
 =C2=A0testlv 1.44</span><br>root@debian10:/dev/mapper#</span></div><div><b=
r></div><div>2. copy the lv - cow data to a file</div><div><span style=3D"b=
ackground-color:rgb(255,255,0)"><span style=3D"font-family:monospace"># dd =
if=3D/dev/mapper/debian10--vg-testlv.211218.232255-cow of=3D/tmp/out bs=3D1=
024</span></span></div><div><br></div><div>3. Setup a loopback disk for the=
 file</div><div><span style=3D"background-color:rgb(255,255,0)"># losetup -=
fP /tmp/out</span></div><div><br></div><div>4. Verify that disk exists</div=
><div><span style=3D"font-family:monospace">root@debian10:/dev/mapper# <spa=
n style=3D"background-color:rgb(255,255,0)">losetup -a</span><br><span styl=
e=3D"background-color:rgb(255,255,0)">/dev/loop0: [65025]:39274 (/tmp/out)<=
/span><br>root@debian10:/dev/mapper#</span></div><div><br></div><div>5. Try=
 converting the disk using lvconvert command</div><div><span style=3D"font-=
family:monospace"># lvconvert -Zn -s debian10-vg/testlv /tmp/out</span></di=
v><div><span style=3D"font-family:monospace"><span style=3D"background-colo=
r:rgb(255,0,0)">=C2=A0 &quot;/tmp/out&quot;: Invalid path for Logical Volum=
e.</span></span></div><div><br></div><div>6. Trying creating a softlink in =
/dev/mapper</div><div><span style=3D"background-color:rgb(255,255,0)"><span=
 style=3D"font-family:monospace"># ln -s /tmp/out debian10--vg-loopback</sp=
an></span></div><div><br></div><div>7. verify link</div><div><span style=3D=
"font-family:monospace">root@debian10:/dev/mapper# ls -la<br>total 0<br>drw=
xr-xr-x =C2=A02 root root =C2=A0 =C2=A0 240 Dec 19 17:40 .<br>drwxr-xr-x 18=
 root root =C2=A0 =C2=A03820 Dec 19 17:22 ..<br>crw------- =C2=A01 root roo=
t 10, 236 Dec 10 19:10 control<br>lrwxrwxrwx =C2=A01 root root =C2=A0 =C2=
=A0 =C2=A0 7 Dec 10 19:10 debian10--vg-home -&gt; ../dm-5<br><span style=3D=
"background-color:rgb(255,255,0)">lrwxrwxrwx =C2=A01 root root =C2=A0 =C2=
=A0 =C2=A0 8 Dec 19 17:40 debian10--vg-loopback -&gt; /tmp/out</span><br>lr=
wxrwxrwx =C2=A01 root root =C2=A0 =C2=A0 =C2=A0 7 Dec 13 22:20 debian10--vg=
-root -&gt; ../dm-1<br>lrwxrwxrwx =C2=A01 root root =C2=A0 =C2=A0 =C2=A0 7 =
Dec 10 19:10 debian10--vg-swap_1 -&gt; ../dm-4<br>lrwxrwxrwx =C2=A01 root r=
oot =C2=A0 =C2=A0 =C2=A0 7 Dec 18 23:23 debian10--vg-testlv -&gt; ../dm-0<b=
r>lrwxrwxrwx =C2=A01 root root =C2=A0 =C2=A0 =C2=A0 7 Dec 18 23:23 debian10=
--vg-testlv.211218.232255 -&gt; ../dm-6<br>lrwxrwxrwx =C2=A01 root root =C2=
=A0 =C2=A0 =C2=A0 7 Dec 18 23:23 debian10--vg-testlv.211218.232255-cow -&gt=
; ../dm-3<br>lrwxrwxrwx =C2=A01 root root =C2=A0 =C2=A0 =C2=A0 7 Dec 18 23:=
23 debian10--vg-testlv-real -&gt; ../dm-2<br>root@debian10:/dev/mapper#</sp=
an></div><div><br></div><div>8. retrying lvconvert command</div><div><span =
style=3D"font-family:monospace">root@debian10:/dev/mapper# l<span style=3D"=
background-color:rgb(255,255,0)">vconvert -Zn -s debian10-vg/testlv /dev/ma=
pper/debian10--vg-loopback</span><br><span style=3D"background-color:rgb(25=
5,0,0)">=C2=A0 Failed to find logical volume &quot;debian10-vg/loopback&quo=
t;</span><br>root@debian10:/dev/mapper#</span></div><div><br></div><div>Are=
 there more things to be considered, such as recreating pv data on disk?</d=
iv><div><br></div><div>Regards Tomas<br></div><div><br></div></div>

--000000000000ab644705d3827a5e--

--===============0555752368390693658==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
--===============0555752368390693658==--

