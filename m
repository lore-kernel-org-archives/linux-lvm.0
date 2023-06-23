Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 594D9EB64D9
	for <linux-lvm@archiver.kernel.org>; Mon, 10 Jul 2023 06:47:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1688971657;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=dgY3Adu85D5ORKQzRjuvPyws2ufCz6Zc4WHX+Zrsz3Y=;
	b=Diz6O4Dc839BruvR9jt+TYhf6M7apyq+nPVEhXm2GFXLzq9PHS3k/sVQ7B7hEDGVYHlrac
	k6v/oXmvGWSVX2kH9AJ2if/BDjvp03qIxhyhpFdZaHuZk3+XMi8hbZ/zzUIw4rq4Hivx3Z
	y3brddvF3/nF25ptStVa+4Hh+m3t6XQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-88-dtNs8PNcPYeOYmCorl3VZQ-1; Mon, 10 Jul 2023 02:47:33 -0400
X-MC-Unique: dtNs8PNcPYeOYmCorl3VZQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 40A33101A54E;
	Mon, 10 Jul 2023 06:47:31 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5BD2647FC60;
	Mon, 10 Jul 2023 06:47:28 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id D5B0B19451D6;
	Mon, 10 Jul 2023 06:47:24 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 689431946587
 for <linux-lvm@listman.corp.redhat.com>; Fri, 23 Jun 2023 23:23:09 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 568ABF5AE5; Fri, 23 Jun 2023 23:23:09 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4EF80F5ADA
 for <linux-lvm@redhat.com>; Fri, 23 Jun 2023 23:23:09 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 325F31C0515C
 for <linux-lvm@redhat.com>; Fri, 23 Jun 2023 23:23:09 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
 [209.85.216.41]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-541-BOjoBptLNoKvnJvnJXsd8A-1; Fri, 23 Jun 2023 19:23:06 -0400
X-MC-Unique: BOjoBptLNoKvnJvnJXsd8A-1
Received: by mail-pj1-f41.google.com with SMTP id
 98e67ed59e1d1-25ee8d84b4fso822536a91.0
 for <linux-lvm@redhat.com>; Fri, 23 Jun 2023 16:23:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687562585; x=1690154585;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=HQ2y0TdruFx/KeQ8lPQLOzs+YsEMpw0iFrC3lyvEDNQ=;
 b=QG68n99ZCShfafuqwbRFq7dyFmngVQ3/rZxXd+ZnEwJywAllPmk5xFXmIX97VBFx1l
 Qlz1JKcsdUc8+fG4I2bCvk9ghApp368gPq80LArqi9oCEgjHSSnkKKF22ojHYpkTLaib
 lBj66mbDJUYJrdmIiW6fgPF9hWNBItaXKvLS9b3P7/GtsUupM3xIE35KEmraMF2mwjsw
 dQi4FsT1CrK25qSHAo0Hi4r0vhndt0Lb30HgRjGtZAnnv2HDQ1euVtf8L3I/FtveDNj0
 ynrmcuyp9gmR8+9MkqOelxI08NivYGZNpCVPBiHGygsrWLRTB7IBccXKYcfoo8BTsab5
 3WzQ==
X-Gm-Message-State: AC+VfDyy0cs2qUuKWxQnK3KMsNdDrZrTLTOQVkd9kekF0lnXdtU9GRNj
 QeghgJx5mNw7nn/4lTZYPXyj2IvpvefJ/HLDfVC8wIcYlYUSOOuG
X-Google-Smtp-Source: ACHHUZ7UI3z3kQnuZMpMfd6uftmo4Y2j2UvC/+XJXTKXJYrxHpBnWWWHVa1Y/iga2Ud1QtUJ/WQYkDvzcqP+yv6tYCo=
X-Received: by 2002:a17:90a:414c:b0:25e:c00b:f639 with SMTP id
 m12-20020a17090a414c00b0025ec00bf639mr20623816pjg.30.1687562585115; Fri, 23
 Jun 2023 16:23:05 -0700 (PDT)
MIME-Version: 1.0
From: Anton Kulshenko <shallriseagain@gmail.com>
Date: Sat, 24 Jun 2023 02:22:52 +0300
Message-ID: <CAA3xStJ7bRT5iiUy3fY3fkbiHDChbGw5RjMksSQuhPYUXijBCA@mail.gmail.com>
To: linux-lvm@redhat.com
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mailman-Approved-At: Mon, 10 Jul 2023 06:47:23 +0000
Subject: [linux-lvm] ThinPool performance problem with NVMe
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: gmail.com
Content-Type: multipart/mixed; boundary="===============6283883575133447725=="

--===============6283883575133447725==
Content-Type: multipart/alternative; boundary="0000000000006c0efb05fed448a3"

--0000000000006c0efb05fed448a3
Content-Type: text/plain; charset="UTF-8"

Hello.

Please help me figure out what my problem is. No matter how I configure the
system, I can't get high performance, especially on writes.

OS: Oracle Linux 8.6, 5.4.17-2136.311.6.el8uek.x86_64
Platform: Gigabyte R282-Z94 with 2x 7702 64cores AMD EPYC and 2 TB of RAM
Disks: NVMe Samsung PM1733 7.68 TB

What I do:
vgcreate vg1 /dev/nvme0n1 /dev/nvme1n1 /dev/nvme2n1 /dev/nvme3n1
/dev/nvme4n1
lvcreate -n thin_pool_1 -L 20T vg1 /dev/nvme0n1 /dev/nvme1n1 /dev/nvme2n1
/dev/nvme3n1 -i 4 -I 4

-i4 for striping between all disks, -I4 strip size. Also I tried 8, 16,
32... In my setup I can't find a big difference.

lvcreate -n pool_meta -L 15G vg1 /dev/nvme4n1
lvconvert --type thin-pool --poolmetadata vg1/pool_meta vg1/thin_pool_1
lvchange -Zn vg1/thin_pool_1
lvcreate -V 15000G --thin -n data vg1/thin_pool_1

After that I create a load using the FIO with parameters:
fio --filename=/dev/mapper/vg1-data --rw=randwrite --bs=4k --name=test
--numjobs=32 --iodepth=32 --random_generator=tausworthe64
--numa_cpu_nodes=0 --direct=1

I only get 40k iops, while one drive at the same load easily gives 130k
iops.
I have tried different block sizes, strip sizes, etc. with no result. When
I look in iostat I see the load on the disk where the metadata is:
80 WMB/s, 12500 wrqm/s, 68 %wrqm

I don't understand what I'm missing when configuring the system.

--0000000000006c0efb05fed448a3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello.=C2=A0<div><br></div><div>Please help me figure out =
what my problem is.=C2=A0No matter how I configure the system, I can&#39;t =
get high performance, especially on writes. <br></div><div><br></div><div><=
span style=3D"color:rgb(35,38,41);font-family:-apple-system,BlinkMacSystemF=
ont,&quot;Segoe UI Adjusted&quot;,&quot;Segoe UI&quot;,&quot;Liberation San=
s&quot;,sans-serif;font-size:15px">OS: Oracle Linux 8.6, 5.4.17-2136.311.6.=
el8uek.x86_64</span><br></div><div><font color=3D"#232629" face=3D"-apple-s=
ystem, BlinkMacSystemFont, Segoe UI Adjusted, Segoe UI, Liberation Sans, sa=
ns-serif"><span style=3D"font-size:15px">Platform:=C2=A0</span></font><span=
 style=3D"color:rgb(35,38,41);font-family:-apple-system,BlinkMacSystemFont,=
&quot;Segoe UI Adjusted&quot;,&quot;Segoe UI&quot;,&quot;Liberation Sans&qu=
ot;,sans-serif;font-size:15px">Gigabyte R282-Z94 with 2x 7702 64cores AMD E=
PYC and 2 TB of RAM</span></div><div><span style=3D"color:rgb(35,38,41);fon=
t-family:-apple-system,BlinkMacSystemFont,&quot;Segoe UI Adjusted&quot;,&qu=
ot;Segoe UI&quot;,&quot;Liberation Sans&quot;,sans-serif;font-size:15px">Di=
sks:</span><span style=3D"color:rgb(35,38,41);font-family:-apple-system,Bli=
nkMacSystemFont,&quot;Segoe UI Adjusted&quot;,&quot;Segoe UI&quot;,&quot;Li=
beration Sans&quot;,sans-serif;font-size:15px">=C2=A0NVMe Samsung PM1733 7.=
68 TB=C2=A0</span></div><div><span style=3D"color:rgb(35,38,41);font-family=
:-apple-system,BlinkMacSystemFont,&quot;Segoe UI Adjusted&quot;,&quot;Segoe=
 UI&quot;,&quot;Liberation Sans&quot;,sans-serif;font-size:15px"><br></span=
></div><div><span style=3D"color:rgb(35,38,41);font-family:-apple-system,Bl=
inkMacSystemFont,&quot;Segoe UI Adjusted&quot;,&quot;Segoe UI&quot;,&quot;L=
iberation Sans&quot;,sans-serif;font-size:15px">What I do:</span><span styl=
e=3D"color:rgb(35,38,41);font-family:-apple-system,BlinkMacSystemFont,&quot=
;Segoe UI Adjusted&quot;,&quot;Segoe UI&quot;,&quot;Liberation Sans&quot;,s=
ans-serif;font-size:15px"><br></span></div>vgcreate vg1 /dev/nvme0n1 /dev/n=
vme1n1 /dev/nvme2n1 /dev/nvme3n1 /dev/nvme4n1<br>lvcreate -n thin_pool_1 -L=
 20T vg1 /dev/nvme0n1 /dev/nvme1n1 /dev/nvme2n1 /dev/nvme3n1 -i 4 -I 4 =C2=
=A0<div><br><div><span style=3D"color:rgb(35,38,41);font-family:-apple-syst=
em,BlinkMacSystemFont,&quot;Segoe UI Adjusted&quot;,&quot;Segoe UI&quot;,&q=
uot;Liberation Sans&quot;,sans-serif;font-size:15px">-i4 for striping betwe=
en all disks, -I4 strip size. Also I tried 8, 16, 32... In my setup I can&#=
39;t find a big difference.</span><span style=3D"color:rgb(35,38,41);font-f=
amily:-apple-system,BlinkMacSystemFont,&quot;Segoe UI Adjusted&quot;,&quot;=
Segoe UI&quot;,&quot;Liberation Sans&quot;,sans-serif;font-size:15px"><br><=
/span></div><div><span style=3D"color:rgb(35,38,41);font-family:-apple-syst=
em,BlinkMacSystemFont,&quot;Segoe UI Adjusted&quot;,&quot;Segoe UI&quot;,&q=
uot;Liberation Sans&quot;,sans-serif;font-size:15px"><br></span></div>lvcre=
ate -n pool_meta -L 15G vg1 /dev/nvme4n1<br>lvconvert --type thin-pool --po=
olmetadata vg1/pool_meta vg1/thin_pool_1<br>lvchange -Zn vg1/thin_pool_1<br=
>lvcreate -V 15000G --thin -n data vg1/thin_pool_1<br><div><br></div><div><=
span style=3D"color:rgb(35,38,41);font-family:-apple-system,BlinkMacSystemF=
ont,&quot;Segoe UI Adjusted&quot;,&quot;Segoe UI&quot;,&quot;Liberation San=
s&quot;,sans-serif;font-size:15px">After that I create a load using the FIO=
 with parameters:</span><br></div></div>fio --filename=3D/dev/mapper/vg1-da=
ta --rw=3Drandwrite --bs=3D4k --name=3Dtest --numjobs=3D32 --iodepth=3D32 -=
-random_generator=3Dtausworthe64 --numa_cpu_nodes=3D0 --direct=3D1<div><br>=
</div><div><span style=3D"color:rgb(35,38,41);font-family:-apple-system,Bli=
nkMacSystemFont,&quot;Segoe UI Adjusted&quot;,&quot;Segoe UI&quot;,&quot;Li=
beration Sans&quot;,sans-serif;font-size:15px">I only get 40k iops, while o=
ne drive at the same load easily gives 130k iops.</span></div><div>I have t=
ried different block sizes, strip sizes, etc. with no result. When I look i=
n iostat I see the load on the disk where the metadata is:<br>80 WMB/s, 125=
00 wrqm/s, 68 %wrqm<span style=3D"color:rgb(35,38,41);font-family:-apple-sy=
stem,BlinkMacSystemFont,&quot;Segoe UI Adjusted&quot;,&quot;Segoe UI&quot;,=
&quot;Liberation Sans&quot;,sans-serif;font-size:15px"><br></span></div><di=
v><br></div><div><span style=3D"color:rgb(35,38,41);font-family:-apple-syst=
em,BlinkMacSystemFont,&quot;Segoe UI Adjusted&quot;,&quot;Segoe UI&quot;,&q=
uot;Liberation Sans&quot;,sans-serif;font-size:15px">I don&#39;t understand=
 what I&#39;m missing when configuring the system.=C2=A0</span><span style=
=3D"color:rgb(35,38,41);font-family:-apple-system,BlinkMacSystemFont,&quot;=
Segoe UI Adjusted&quot;,&quot;Segoe UI&quot;,&quot;Liberation Sans&quot;,sa=
ns-serif;font-size:15px"><br></span></div><div><span style=3D"color:rgb(35,=
38,41);font-family:-apple-system,BlinkMacSystemFont,&quot;Segoe UI Adjusted=
&quot;,&quot;Segoe UI&quot;,&quot;Liberation Sans&quot;,sans-serif;font-siz=
e:15px"><br></span></div><div><font color=3D"#232629" face=3D"-apple-system=
, BlinkMacSystemFont, Segoe UI Adjusted, Segoe UI, Liberation Sans, sans-se=
rif"><span style=3D"font-size:15px"><br></span></font><div><span style=3D"c=
olor:rgb(35,38,41);font-family:ui-monospace,&quot;Cascadia Mono&quot;,&quot=
;Segoe UI Mono&quot;,&quot;Liberation Mono&quot;,Menlo,Monaco,Consolas,mono=
space;font-size:13px;background-color:rgb(227,230,232)"><br></span></div></=
div></div>

--0000000000006c0efb05fed448a3--

--===============6283883575133447725==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

--===============6283883575133447725==--

