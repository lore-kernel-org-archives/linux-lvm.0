Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01F29C433F5
	for <linux-lvm@archiver.kernel.org>; Sat,  7 May 2022 03:40:23 +0000 (UTC)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-608-yA8zU5WNM1y27BXxaBerZQ-1; Fri, 06 May 2022 23:40:21 -0400
X-MC-Unique: yA8zU5WNM1y27BXxaBerZQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D1F398015BA;
	Sat,  7 May 2022 03:40:18 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9BEC11D093;
	Sat,  7 May 2022 03:40:14 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 63A74194705C;
	Sat,  7 May 2022 03:40:14 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 0DB8E1947057
 for <linux-lvm@listman.corp.redhat.com>; Sat,  7 May 2022 03:40:13 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id EBF7A1D0A7; Sat,  7 May 2022 03:40:12 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E31611D093
 for <linux-lvm@redhat.com>; Sat,  7 May 2022 03:40:00 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DE9BD85A5A8
 for <linux-lvm@redhat.com>; Sat,  7 May 2022 03:39:58 +0000 (UTC)
Received: from st43p00im-ztdg10073201.me.com (st43p00im-ztdg10073201.me.com
 [17.58.63.177]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-18-iCfsKu1hN8CiI85bbLrMYA-1; Fri, 06 May 2022 23:39:56 -0400
X-MC-Unique: iCfsKu1hN8CiI85bbLrMYA-1
Received: from [192.168.6.176] (st43p00im-dlb-asmtp-mailmevip.me.com
 [17.42.251.41])
 by st43p00im-ztdg10073201.me.com (Postfix) with ESMTPSA id 22ABF9A0DAD;
 Sat,  7 May 2022 03:33:58 +0000 (UTC)
From: Alex Lieflander <atlief@icloud.com>
Message-Id: <87561BC7-DDA5-4BC9-9F98-17118199E96D@icloud.com>
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.7\))
Date: Fri, 6 May 2022 23:33:56 -0400
In-Reply-To: <25200.21283.981034.416787@quad.stoffel.home>
To: LVM general discussion and development <linux-lvm@redhat.com>
References: <7534073B-7DBD-46B5-9CA5-BFB3C603C75E@icloud.com>
 <25199.10122.376547.499176@quad.stoffel.home>
 <324D8F25-90D3-4165-BE86-11B217DAFDE4@icloud.com>
 <25200.21283.981034.416787@quad.stoffel.home>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486, 18.0.858
 definitions=2022-05-07_01:2022-05-05,
 2022-05-07 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011 mlxscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-2009150000 definitions=main-2205070020
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Subject: Re: [linux-lvm] Bypassing LVM Restrictions - RAID6 With Less Than 5
 Disks
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
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed;
 boundary="Apple-Mail=_A2C12820-8C4C-4B25-A127-51053923D7C7"

--Apple-Mail=_A2C12820-8C4C-4B25-A127-51053923D7C7
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8

John> Can you tell me what you mean by "per-disk host-managed integrity-che=
cking"?  Are you running dm-integrity in your setup?

Yes, that=E2=80=99s what I meant. I know that I could manually use Integrit=
ySetup for each RAID member, but that seems very unappealing.

John> Can you post the output of:
John> lsblk
John> so we understand better what you have?

Please see the attached text files, although it=E2=80=99s a bit convoluted.=
 =E2=80=9CPostulate=E2=80=9D devices are part of the RAID that I=E2=80=99d =
like to transform. If anyone has any recommendations for my setup, I=E2=80=
=99d be interested to hear them. Maybe I=E2=80=99ll switch to LVMCache some=
day. :P

John> But in any case, good luck with getting RAID6 solid and working as a =
pure LVM setup. I don=E2=80=99t think you're going to make it happen any ti=
me soon, and I honestly prefer to have seperate layers for my setup so that=
 each layer does it's own think and does it well.

Thanks. I really don=E2=80=99t want to give up the DM-Integrity management.=
 Less complexity is just a bonus.

Alex


--Apple-Mail=_A2C12820-8C4C-4B25-A127-51053923D7C7
Content-Disposition: attachment;
	filename=lsblk.txt
Content-Type: text/plain; x-unix-mode=0644; name=lsblk.txt; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

NAME                                       MAJ:MIN RM   SIZE RO TYPE  MOUNT=
POINT
sda                                          8:0    0   1.8T  0 disk =20
=E2=94=94=E2=94=80sda4                                       8:4    0   1.8=
T  0 part =20
  =E2=94=94=E2=94=80Postulate_Double-1                     254:2    0   3.6=
T  0 lvm  =20
sdb                                          8:16   0   3.6T  0 disk =20
=E2=94=94=E2=94=80sdb4                                       8:20   0   3.6=
T  0 part =20
  =E2=94=9C=E2=94=80Postulate_Outer-Primary_rmeta_0        254:5    0     1=
M  0 lvm  =20
  =E2=94=82 =E2=94=94=E2=94=80Postulate_Outer-Primary              254:25  =
 0   7.2T  0 lvm  =20
  =E2=94=82   =E2=94=94=E2=94=80bcache1                            253:128 =
 0   7.2T  0 disk =20
  =E2=94=82     =E2=94=94=E2=94=80main_crypt_5                     254:26  =
 0   7.2T  0 crypt=20
  =E2=94=82       =E2=94=9C=E2=94=80Postulate_Inner-Primary        254:27  =
 0     5T  0 lvm   /
  =E2=94=82       =E2=94=94=E2=94=80Postulate_Inner-Swap           254:28  =
 0    24G  0 lvm   [SWAP]
  =E2=94=9C=E2=94=80Postulate_Outer-Primary_rimage_0_imeta 254:6    0  29.6=
G  0 lvm  =20
  =E2=94=82 =E2=94=94=E2=94=80Postulate_Outer-Primary_rimage_0     254:10  =
 0   3.6T  0 lvm  =20
  =E2=94=82   =E2=94=94=E2=94=80Postulate_Outer-Primary            254:25  =
 0   7.2T  0 lvm  =20
  =E2=94=82     =E2=94=94=E2=94=80bcache1                          253:128 =
 0   7.2T  0 disk =20
  =E2=94=82       =E2=94=94=E2=94=80main_crypt_5                   254:26  =
 0   7.2T  0 crypt=20
  =E2=94=82         =E2=94=9C=E2=94=80Postulate_Inner-Primary      254:27  =
 0     5T  0 lvm   /
  =E2=94=82         =E2=94=94=E2=94=80Postulate_Inner-Swap         254:28  =
 0    24G  0 lvm   [SWAP]
  =E2=94=94=E2=94=80Postulate_Outer-Primary_rimage_0_iorig 254:9    0   3.6=
T  0 lvm  =20
    =E2=94=94=E2=94=80Postulate_Outer-Primary_rimage_0     254:10   0   3.6=
T  0 lvm  =20
      =E2=94=94=E2=94=80Postulate_Outer-Primary            254:25   0   7.2=
T  0 lvm  =20
        =E2=94=94=E2=94=80bcache1                          253:128  0   7.2=
T  0 disk =20
          =E2=94=94=E2=94=80main_crypt_5                   254:26   0   7.2=
T  0 crypt=20
            =E2=94=9C=E2=94=80Postulate_Inner-Primary      254:27   0     5=
T  0 lvm   /
            =E2=94=94=E2=94=80Postulate_Inner-Swap         254:28   0    24=
G  0 lvm   [SWAP]
sdc                                          8:32   0   3.6T  0 disk =20
=E2=94=9C=E2=94=80sdc1                                       8:33   0    10=
M  0 part =20
=E2=94=9C=E2=94=80sdc2                                       8:34   0   200=
M  0 part =20
=E2=94=9C=E2=94=80sdc3                                       8:35   0   809=
M  0 part =20
=E2=94=94=E2=94=80sdc4                                       8:36   0   3.6=
T  0 part =20
  =E2=94=9C=E2=94=80Postulate_Outer-Primary_rmeta_2        254:20   0     1=
M  0 lvm  =20
  =E2=94=82 =E2=94=94=E2=94=80Postulate_Outer-Primary              254:25  =
 0   7.2T  0 lvm  =20
  =E2=94=82   =E2=94=94=E2=94=80bcache1                            253:128 =
 0   7.2T  0 disk =20
  =E2=94=82     =E2=94=94=E2=94=80main_crypt_5                     254:26  =
 0   7.2T  0 crypt=20
  =E2=94=82       =E2=94=9C=E2=94=80Postulate_Inner-Primary        254:27  =
 0     5T  0 lvm   /
  =E2=94=82       =E2=94=94=E2=94=80Postulate_Inner-Swap           254:28  =
 0    24G  0 lvm   [SWAP]
  =E2=94=9C=E2=94=80Postulate_Outer-Primary_rimage_2_imeta 254:21   0  29.6=
G  0 lvm  =20
  =E2=94=82 =E2=94=94=E2=94=80Postulate_Outer-Primary_rimage_2     254:23  =
 0   3.6T  0 lvm  =20
  =E2=94=82   =E2=94=94=E2=94=80Postulate_Outer-Primary            254:25  =
 0   7.2T  0 lvm  =20
  =E2=94=82     =E2=94=94=E2=94=80bcache1                          253:128 =
 0   7.2T  0 disk =20
  =E2=94=82       =E2=94=94=E2=94=80main_crypt_5                   254:26  =
 0   7.2T  0 crypt=20
  =E2=94=82         =E2=94=9C=E2=94=80Postulate_Inner-Primary      254:27  =
 0     5T  0 lvm   /
  =E2=94=82         =E2=94=94=E2=94=80Postulate_Inner-Swap         254:28  =
 0    24G  0 lvm   [SWAP]
  =E2=94=94=E2=94=80Postulate_Outer-Primary_rimage_2_iorig 254:22   0   3.6=
T  0 lvm  =20
    =E2=94=94=E2=94=80Postulate_Outer-Primary_rimage_2     254:23   0   3.6=
T  0 lvm  =20
      =E2=94=94=E2=94=80Postulate_Outer-Primary            254:25   0   7.2=
T  0 lvm  =20
        =E2=94=94=E2=94=80bcache1                          253:128  0   7.2=
T  0 disk =20
          =E2=94=94=E2=94=80main_crypt_5                   254:26   0   7.2=
T  0 crypt=20
            =E2=94=9C=E2=94=80Postulate_Inner-Primary      254:27   0     5=
T  0 lvm   /
            =E2=94=94=E2=94=80Postulate_Inner-Swap         254:28   0    24=
G  0 lvm   [SWAP]
sdd                                          8:48   0   3.6T  0 disk =20
=E2=94=94=E2=94=80sdd4                                       8:52   0   3.6=
T  0 part =20
  =E2=94=9C=E2=94=80Postulate_Outer-Primary_rmeta_1        254:12   0     1=
M  0 lvm  =20
  =E2=94=82 =E2=94=94=E2=94=80Postulate_Outer-Primary              254:25  =
 0   7.2T  0 lvm  =20
  =E2=94=82   =E2=94=94=E2=94=80bcache1                            253:128 =
 0   7.2T  0 disk =20
  =E2=94=82     =E2=94=94=E2=94=80main_crypt_5                     254:26  =
 0   7.2T  0 crypt=20
  =E2=94=82       =E2=94=9C=E2=94=80Postulate_Inner-Primary        254:27  =
 0     5T  0 lvm   /
  =E2=94=82       =E2=94=94=E2=94=80Postulate_Inner-Swap           254:28  =
 0    24G  0 lvm   [SWAP]
  =E2=94=9C=E2=94=80Postulate_Outer-Primary_rimage_1_imeta 254:13   0  29.6=
G  0 lvm  =20
  =E2=94=82 =E2=94=94=E2=94=80Postulate_Outer-Primary_rimage_1     254:15  =
 0   3.6T  0 lvm  =20
  =E2=94=82   =E2=94=94=E2=94=80Postulate_Outer-Primary            254:25  =
 0   7.2T  0 lvm  =20
  =E2=94=82     =E2=94=94=E2=94=80bcache1                          253:128 =
 0   7.2T  0 disk =20
  =E2=94=82       =E2=94=94=E2=94=80main_crypt_5                   254:26  =
 0   7.2T  0 crypt=20
  =E2=94=82         =E2=94=9C=E2=94=80Postulate_Inner-Primary      254:27  =
 0     5T  0 lvm   /
  =E2=94=82         =E2=94=94=E2=94=80Postulate_Inner-Swap         254:28  =
 0    24G  0 lvm   [SWAP]
  =E2=94=94=E2=94=80Postulate_Outer-Primary_rimage_1_iorig 254:14   0   3.6=
T  0 lvm  =20
    =E2=94=94=E2=94=80Postulate_Outer-Primary_rimage_1     254:15   0   3.6=
T  0 lvm  =20
      =E2=94=94=E2=94=80Postulate_Outer-Primary            254:25   0   7.2=
T  0 lvm  =20
        =E2=94=94=E2=94=80bcache1                          253:128  0   7.2=
T  0 disk =20
          =E2=94=94=E2=94=80main_crypt_5                   254:26   0   7.2=
T  0 crypt=20
            =E2=94=9C=E2=94=80Postulate_Inner-Primary      254:27   0     5=
T  0 lvm   /
            =E2=94=94=E2=94=80Postulate_Inner-Swap         254:28   0    24=
G  0 lvm   [SWAP]
sde                                          8:64   0   4.5T  0 disk =20
=E2=94=94=E2=94=80sde4                                       8:68   0   4.5=
T  0 part =20
  =E2=94=9C=E2=94=80Axiom_Outer-Primary_rmeta_0            254:4    0     4=
M  0 lvm  =20
  =E2=94=82 =E2=94=94=E2=94=80Axiom_Outer-Primary                  254:24  =
 0   4.5T  0 lvm  =20
  =E2=94=82   =E2=94=94=E2=94=80bcache0                            253:0   =
 0   4.5T  0 disk =20
  =E2=94=82     =E2=94=94=E2=94=80main_crypt_2                     254:29  =
 0   4.5T  0 crypt=20
  =E2=94=82       =E2=94=94=E2=94=80Axiom_Inner-New                254:30  =
 0   3.6T  0 lvm  =20
  =E2=94=9C=E2=94=80Axiom_Outer-Primary_rimage_0_imeta     254:7    0  36.8=
G  0 lvm  =20
  =E2=94=82 =E2=94=94=E2=94=80Axiom_Outer-Primary_rimage_0         254:11  =
 0   4.5T  0 lvm  =20
  =E2=94=82   =E2=94=94=E2=94=80Axiom_Outer-Primary                254:24  =
 0   4.5T  0 lvm  =20
  =E2=94=82     =E2=94=94=E2=94=80bcache0                          253:0   =
 0   4.5T  0 disk =20
  =E2=94=82       =E2=94=94=E2=94=80main_crypt_2                   254:29  =
 0   4.5T  0 crypt=20
  =E2=94=82         =E2=94=94=E2=94=80Axiom_Inner-New              254:30  =
 0   3.6T  0 lvm  =20
  =E2=94=94=E2=94=80Axiom_Outer-Primary_rimage_0_iorig     254:8    0   4.5=
T  0 lvm  =20
    =E2=94=94=E2=94=80Axiom_Outer-Primary_rimage_0         254:11   0   4.5=
T  0 lvm  =20
      =E2=94=94=E2=94=80Axiom_Outer-Primary                254:24   0   4.5=
T  0 lvm  =20
        =E2=94=94=E2=94=80bcache0                          253:0    0   4.5=
T  0 disk =20
          =E2=94=94=E2=94=80main_crypt_2                   254:29   0   4.5=
T  0 crypt=20
            =E2=94=94=E2=94=80Axiom_Inner-New              254:30   0   3.6=
T  0 lvm  =20
sdf                                          8:80   0 931.5G  0 disk =20
=E2=94=94=E2=94=80sdf4                                       8:84   0 930.5=
G  0 part =20
sdg                                          8:96   0 931.5G  0 disk =20
=E2=94=94=E2=94=80sdg4                                       8:100  0 930.5=
G  0 part =20
sdh                                          8:112  0   5.5T  0 disk =20
=E2=94=94=E2=94=80sdh4                                       8:116  0   5.5=
T  0 part =20
  =E2=94=9C=E2=94=80Postulate_Backup-Primary               254:0    0     5=
T  0 lvm  =20
  =E2=94=82 =E2=94=94=E2=94=80backup_crypt_3                       254:31  =
 0     5T  0 crypt /mnt/bk/3
  =E2=94=94=E2=94=80Postulate_Backup-Old                   254:1    0   128=
G  0 lvm  =20
sdi                                          8:128  0   1.8T  0 disk =20
=E2=94=94=E2=94=80sdi4                                       8:132  0   1.8=
T  0 part =20
  =E2=94=94=E2=94=80Postulate_Double-1                     254:2    0   3.6=
T  0 lvm  =20
sdj                                          8:144  0   4.5T  0 disk =20
=E2=94=94=E2=94=80sdj4                                       8:148  0   4.5=
T  0 part =20
  =E2=94=9C=E2=94=80Axiom_Outer-Primary_rmeta_1            254:16   0     4=
M  0 lvm  =20
  =E2=94=82 =E2=94=94=E2=94=80Axiom_Outer-Primary                  254:24  =
 0   4.5T  0 lvm  =20
  =E2=94=82   =E2=94=94=E2=94=80bcache0                            253:0   =
 0   4.5T  0 disk =20
  =E2=94=82     =E2=94=94=E2=94=80main_crypt_2                     254:29  =
 0   4.5T  0 crypt=20
  =E2=94=82       =E2=94=94=E2=94=80Axiom_Inner-New                254:30  =
 0   3.6T  0 lvm  =20
  =E2=94=9C=E2=94=80Axiom_Outer-Primary_rimage_1_imeta     254:17   0  36.8=
G  0 lvm  =20
  =E2=94=82 =E2=94=94=E2=94=80Axiom_Outer-Primary_rimage_1         254:19  =
 0   4.5T  0 lvm  =20
  =E2=94=82   =E2=94=94=E2=94=80Axiom_Outer-Primary                254:24  =
 0   4.5T  0 lvm  =20
  =E2=94=82     =E2=94=94=E2=94=80bcache0                          253:0   =
 0   4.5T  0 disk =20
  =E2=94=82       =E2=94=94=E2=94=80main_crypt_2                   254:29  =
 0   4.5T  0 crypt=20
  =E2=94=82         =E2=94=94=E2=94=80Axiom_Inner-New              254:30  =
 0   3.6T  0 lvm  =20
  =E2=94=94=E2=94=80Axiom_Outer-Primary_rimage_1_iorig     254:18   0   4.5=
T  0 lvm  =20
    =E2=94=94=E2=94=80Axiom_Outer-Primary_rimage_1         254:19   0   4.5=
T  0 lvm  =20
      =E2=94=94=E2=94=80Axiom_Outer-Primary                254:24   0   4.5=
T  0 lvm  =20
        =E2=94=94=E2=94=80bcache0                          253:0    0   4.5=
T  0 disk =20
          =E2=94=94=E2=94=80main_crypt_2                   254:29   0   4.5=
T  0 crypt=20
            =E2=94=94=E2=94=80Axiom_Inner-New              254:30   0   3.6=
T  0 lvm  =20
sdk                                          8:160  0 223.6G  0 disk =20
=E2=94=94=E2=94=80sdk4                                       8:164  0 189.6=
G  0 part =20
nvme0n1                                    259:0    0 931.5G  0 disk =20
=E2=94=9C=E2=94=80nvme0n1p2                                259:1    0   200=
M  0 part  /boot/efi
=E2=94=9C=E2=94=80nvme0n1p3                                259:2    0   814=
M  0 part  /boot
=E2=94=9C=E2=94=80nvme0n1p4                                259:3    0   832=
G  0 part =20
=E2=94=82 =E2=94=94=E2=94=80Postulate_Outer-Cache                  254:3   =
 0   800G  0 lvm  =20
=E2=94=82   =E2=94=94=E2=94=80bcache1                              253:128 =
 0   7.2T  0 disk =20
=E2=94=82     =E2=94=94=E2=94=80main_crypt_5                       254:26  =
 0   7.2T  0 crypt=20
=E2=94=82       =E2=94=9C=E2=94=80Postulate_Inner-Primary          254:27  =
 0     5T  0 lvm   /
=E2=94=82       =E2=94=94=E2=94=80Postulate_Inner-Swap             254:28  =
 0    24G  0 lvm   [SWAP]
=E2=94=94=E2=94=80nvme0n1p8                                259:4    0    54=
G  0 part =20
  =E2=94=94=E2=94=80recovery_crypt                         254:32   0    54=
G  0 crypt /mnt/recovery

--Apple-Mail=_A2C12820-8C4C-4B25-A127-51053923D7C7
Content-Disposition: attachment;
	filename=lsblk_m.txt
Content-Type: text/plain; x-unix-mode=0644; name=lsblk_m.txt; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

             NAME                                       MAJ:MIN RM   SIZE R=
O TYPE  MOUNTPOINT
             sda                                          8:0    0   1.8T  =
0 disk =20
         =E2=94=8C=E2=94=88=E2=96=B6 =E2=94=94=E2=94=80sda4                =
                       8:4    0   1.8T  0 part =20
         =E2=94=86   sdb                                          8:16   0 =
  3.6T  0 disk =20
         =E2=94=86   =E2=94=94=E2=94=80sdb4                                =
       8:20   0   3.6T  0 part =20
      =E2=94=8C=E2=94=88=E2=96=B6=E2=94=86     =E2=94=9C=E2=94=80Postulate_=
Outer-Primary_rmeta_0        254:5    0     1M  0 lvm  =20
   =E2=94=8C=E2=94=88=E2=96=B6=E2=94=86  =E2=94=86     =E2=94=9C=E2=94=80Po=
stulate_Outer-Primary_rimage_0_imeta 254:6    0  29.6G  0 lvm  =20
   =E2=94=94=E2=94=AC=E2=96=B6=E2=94=86  =E2=94=86     =E2=94=94=E2=94=80Po=
stulate_Outer-Primary_rimage_0_iorig 254:9    0   3.6T  0 lvm  =20
    =E2=94=94=E2=94=88=E2=94=9C=E2=94=88=E2=96=B6=E2=94=86=E2=94=88=E2=94=
=88=E2=94=88Postulate_Outer-Primary_rimage_0           254:10   0   3.6T  0=
 lvm  =20
      =E2=94=86  =E2=94=86   sdc                                          8=
:32   0   3.6T  0 disk =20
      =E2=94=86  =E2=94=86   =E2=94=9C=E2=94=80sdc1                        =
               8:33   0    10M  0 part =20
      =E2=94=86  =E2=94=86   =E2=94=9C=E2=94=80sdc2                        =
               8:34   0   200M  0 part =20
      =E2=94=86  =E2=94=86   =E2=94=9C=E2=94=80sdc3                        =
               8:35   0   809M  0 part =20
      =E2=94=86  =E2=94=86   =E2=94=94=E2=94=80sdc4                        =
               8:36   0   3.6T  0 part =20
      =E2=94=9C=E2=94=88=E2=96=B6=E2=94=86     =E2=94=9C=E2=94=80Postulate_=
Outer-Primary_rmeta_2        254:20   0     1M  0 lvm  =20
   =E2=94=8C=E2=94=88=E2=96=B6=E2=94=86  =E2=94=86     =E2=94=9C=E2=94=80Po=
stulate_Outer-Primary_rimage_2_imeta 254:21   0  29.6G  0 lvm  =20
   =E2=94=94=E2=94=AC=E2=96=B6=E2=94=86  =E2=94=86     =E2=94=94=E2=94=80Po=
stulate_Outer-Primary_rimage_2_iorig 254:22   0   3.6T  0 lvm  =20
    =E2=94=94=E2=94=88=E2=94=9C=E2=94=88=E2=96=B6=E2=94=86=E2=94=88=E2=94=
=88=E2=94=88Postulate_Outer-Primary_rimage_2           254:23   0   3.6T  0=
 lvm  =20
      =E2=94=86  =E2=94=86   sdd                                          8=
:48   0   3.6T  0 disk =20
      =E2=94=86  =E2=94=86   =E2=94=94=E2=94=80sdd4                        =
               8:52   0   3.6T  0 part =20
      =E2=94=9C=E2=94=88=E2=96=B6=E2=94=86     =E2=94=9C=E2=94=80Postulate_=
Outer-Primary_rmeta_1        254:12   0     1M  0 lvm  =20
   =E2=94=8C=E2=94=88=E2=96=B6=E2=94=86  =E2=94=86     =E2=94=9C=E2=94=80Po=
stulate_Outer-Primary_rimage_1_imeta 254:13   0  29.6G  0 lvm  =20
   =E2=94=94=E2=94=AC=E2=96=B6=E2=94=86  =E2=94=86     =E2=94=94=E2=94=80Po=
stulate_Outer-Primary_rimage_1_iorig 254:14   0   3.6T  0 lvm  =20
    =E2=94=94=E2=94=88=E2=94=94=E2=94=AC=E2=96=B6=E2=94=86=E2=94=88=E2=94=
=88=E2=94=88Postulate_Outer-Primary_rimage_1           254:15   0   3.6T  0=
 lvm  =20
   =E2=94=8C=E2=94=88=E2=96=B6 =E2=94=94=E2=94=88=E2=94=86=E2=94=88=E2=94=
=88=E2=94=88Postulate_Outer-Primary                    254:25   0   7.2T  0=
 lvm  =20
   =E2=94=86     =E2=94=86   sde                                          8=
:64   0   4.5T  0 disk =20
   =E2=94=86     =E2=94=86   =E2=94=94=E2=94=80sde4                        =
               8:68   0   4.5T  0 part =20
   =E2=94=86  =E2=94=8C=E2=94=88=E2=96=B6=E2=94=86     =E2=94=9C=E2=94=80Ax=
iom_Outer-Primary_rmeta_0            254:4    0     4M  0 lvm  =20
=E2=94=8C=E2=94=88=E2=96=B6=E2=94=86  =E2=94=86  =E2=94=86     =E2=94=9C=E2=
=94=80Axiom_Outer-Primary_rimage_0_imeta     254:7    0  36.8G  0 lvm  =20
=E2=94=94=E2=94=AC=E2=96=B6=E2=94=86  =E2=94=86  =E2=94=86     =E2=94=94=E2=
=94=80Axiom_Outer-Primary_rimage_0_iorig     254:8    0   4.5T  0 lvm  =20
 =E2=94=94=E2=94=88=E2=94=86=E2=94=88=E2=94=88=E2=94=9C=E2=94=88=E2=96=B6=
=E2=94=86=E2=94=88=E2=94=88=E2=94=88Axiom_Outer-Primary_rimage_0           =
    254:11   0   4.5T  0 lvm  =20
   =E2=94=86  =E2=94=86  =E2=94=86   sdf                                   =
       8:80   0 931.5G  0 disk =20
   =E2=94=86  =E2=94=86  =E2=94=86   =E2=94=94=E2=94=80sdf4                =
                       8:84   0 930.5G  0 part =20
   =E2=94=86  =E2=94=86  =E2=94=86   sdg                                   =
       8:96   0 931.5G  0 disk =20
   =E2=94=86  =E2=94=86  =E2=94=86   =E2=94=94=E2=94=80sdg4                =
                       8:100  0 930.5G  0 part =20
   =E2=94=86  =E2=94=86  =E2=94=86   sdh                                   =
       8:112  0   5.5T  0 disk =20
   =E2=94=86  =E2=94=86  =E2=94=86   =E2=94=94=E2=94=80sdh4                =
                       8:116  0   5.5T  0 part =20
   =E2=94=86  =E2=94=86  =E2=94=86     =E2=94=9C=E2=94=80Postulate_Backup-P=
rimary               254:0    0     5T  0 lvm  =20
   =E2=94=86  =E2=94=86  =E2=94=86     =E2=94=82 =E2=94=94=E2=94=80backup_c=
rypt_3                       254:31   0     5T  0 crypt /mnt/bk/3
   =E2=94=86  =E2=94=86  =E2=94=86     =E2=94=94=E2=94=80Postulate_Backup-O=
ld                   254:1    0   128G  0 lvm  =20
   =E2=94=86  =E2=94=86  =E2=94=86   sdi                                   =
       8:128  0   1.8T  0 disk =20
   =E2=94=86  =E2=94=86  =E2=94=94=E2=94=AC=E2=96=B6 =E2=94=94=E2=94=80sdi4=
                                       8:132  0   1.8T  0 part =20
   =E2=94=86  =E2=94=86   =E2=94=94=E2=94=88=E2=94=88Postulate_Double-1    =
                     254:2    0   3.6T  0 lvm  =20
   =E2=94=86  =E2=94=86      sdj                                          8=
:144  0   4.5T  0 disk =20
   =E2=94=86  =E2=94=86      =E2=94=94=E2=94=80sdj4                        =
               8:148  0   4.5T  0 part =20
   =E2=94=86  =E2=94=9C=E2=94=88=E2=96=B6      =E2=94=9C=E2=94=80Axiom_Oute=
r-Primary_rmeta_1            254:16   0     4M  0 lvm  =20
   =E2=94=86  =E2=94=86  =E2=94=8C=E2=94=88=E2=96=B6   =E2=94=9C=E2=94=80Ax=
iom_Outer-Primary_rimage_1_imeta     254:17   0  36.8G  0 lvm  =20
   =E2=94=86  =E2=94=86  =E2=94=94=E2=94=AC=E2=96=B6   =E2=94=94=E2=94=80Ax=
iom_Outer-Primary_rimage_1_iorig     254:18   0   4.5T  0 lvm  =20
   =E2=94=86  =E2=94=94=E2=94=AC=E2=96=B6 =E2=94=94=E2=94=88=E2=94=88Axiom_=
Outer-Primary_rimage_1               254:19   0   4.5T  0 lvm  =20
   =E2=94=86   =E2=94=94=E2=94=88=E2=94=88=E2=94=88=E2=94=88=E2=94=88Axiom_=
Outer-Primary                        254:24   0   4.5T  0 lvm  =20
   =E2=94=86         =E2=94=94=E2=94=80bcache0                             =
     253:0    0   4.5T  0 disk =20
   =E2=94=86           =E2=94=94=E2=94=80main_crypt_2                      =
     254:29   0   4.5T  0 crypt=20
   =E2=94=86             =E2=94=94=E2=94=80Axiom_Inner-New                 =
     254:30   0   3.6T  0 lvm  =20
   =E2=94=86         sdk                                          8:160  0 =
223.6G  0 disk =20
   =E2=94=86         =E2=94=94=E2=94=80sdk4                                =
       8:164  0 189.6G  0 part =20
   =E2=94=86         nvme0n1                                    259:0    0 =
931.5G  0 disk =20
   =E2=94=86         =E2=94=9C=E2=94=80nvme0n1p2                           =
     259:1    0   200M  0 part  /boot/efi
   =E2=94=86         =E2=94=9C=E2=94=80nvme0n1p3                           =
     259:2    0   814M  0 part  /boot
   =E2=94=86         =E2=94=9C=E2=94=80nvme0n1p4                           =
     259:3    0   832G  0 part =20
   =E2=94=94=E2=94=AC=E2=96=B6       =E2=94=82 =E2=94=94=E2=94=80Postulate_=
Outer-Cache                  254:3    0   800G  0 lvm  =20
    =E2=94=86        =E2=94=94=E2=94=80nvme0n1p8                           =
     259:4    0    54G  0 part =20
    =E2=94=86          =E2=94=94=E2=94=80recovery_crypt                    =
     254:32   0    54G  0 crypt /mnt/recovery
    =E2=94=94=E2=94=88=E2=94=88=E2=94=88=E2=94=88=E2=94=88=E2=94=88=E2=94=
=88=E2=94=88bcache1                                    253:128  0   7.2T  0=
 disk =20
             =E2=94=94=E2=94=80main_crypt_5                             254=
:26   0   7.2T  0 crypt=20
               =E2=94=9C=E2=94=80Postulate_Inner-Primary                254=
:27   0     5T  0 lvm   /
               =E2=94=94=E2=94=80Postulate_Inner-Swap                   254=
:28   0    24G  0 lvm   [SWAP]

--Apple-Mail=_A2C12820-8C4C-4B25-A127-51053923D7C7
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

--Apple-Mail=_A2C12820-8C4C-4B25-A127-51053923D7C7--

