Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38635C4332F
	for <linux-lvm@archiver.kernel.org>; Thu, 13 Oct 2022 07:02:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1665644524;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=ws5JdXH3xOAjRw6nxNwAKPuaDi0QJTTs5QGVcSCBw+E=;
	b=K5OtQVTrBB3NxYvWbvHkfJbVvMWO12mAdiLwfR6/3PvNTf3B8e6Sws5CG57qI0zxlmhgOy
	5sao9/sF+lLOzYx4vGhiFyWRFR//YAUMfzPa6vt03dn0beMVT2ss8z1cwSibUCtW+5Qbg6
	p7R4CzrcqMHSpeNdRujpIOQSK0Acv4g=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-336-Q7r6NTQQPwSWpyeaZ7TitQ-1; Thu, 13 Oct 2022 03:01:17 -0400
X-MC-Unique: Q7r6NTQQPwSWpyeaZ7TitQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EAD9D858282;
	Thu, 13 Oct 2022 07:01:14 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9D3FE140EBF3;
	Thu, 13 Oct 2022 07:01:12 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id BE39F19465B9;
	Thu, 13 Oct 2022 07:01:10 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 138ED1946588
 for <linux-lvm@listman.corp.redhat.com>; Thu, 13 Oct 2022 06:53:51 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 04412492B11; Thu, 13 Oct 2022 06:53:51 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F054A492B0F
 for <linux-lvm@redhat.com>; Thu, 13 Oct 2022 06:53:50 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D0FA486F12C
 for <linux-lvm@redhat.com>; Thu, 13 Oct 2022 06:53:50 +0000 (UTC)
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01on2104.outbound.protection.outlook.com [40.107.215.104]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-664-IumOrBKiOb6Eojz2I65dNA-1; Thu, 13 Oct 2022 02:53:45 -0400
X-MC-Unique: IumOrBKiOb6Eojz2I65dNA-1
Received: from PUZP153MB0751.APCP153.PROD.OUTLOOK.COM (2603:1096:301:e0::10)
 by KL1P15301MB0798.APCP153.PROD.OUTLOOK.COM (2603:1096:820:b0::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.6; Thu, 13 Oct
 2022 06:53:40 +0000
Received: from PUZP153MB0751.APCP153.PROD.OUTLOOK.COM
 ([fe80::32c8:f680:5886:1dc1]) by PUZP153MB0751.APCP153.PROD.OUTLOOK.COM
 ([fe80::32c8:f680:5886:1dc1%3]) with mapi id 15.20.5746.001; Thu, 13 Oct 2022
 06:53:40 +0000
From: Pawan Sharma <sharmapawan@microsoft.com>
To: "linux-lvm@redhat.com" <linux-lvm@redhat.com>, "lvm-devel@redhat.com"
 <lvm-devel@redhat.com>
Thread-Topic: LVM2 : performance drop even after deleting the snapshot
Thread-Index: AQHY3lsJie+6cAv+2kGrP2SVVAhuka4L4/wq
Date: Thu, 13 Oct 2022 06:53:40 +0000
Message-ID: <PUZP153MB07512B1B646868F0F8F1D205AC259@PUZP153MB0751.APCP153.PROD.OUTLOOK.COM>
References: <PUZP153MB075126926388815B6F9E1258AC229@PUZP153MB0751.APCP153.PROD.OUTLOOK.COM>
In-Reply-To: <PUZP153MB075126926388815B6F9E1258AC229@PUZP153MB0751.APCP153.PROD.OUTLOOK.COM>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=True;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2022-10-13T06:53:39.000Z;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=General;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ContentBits=0;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Method=Standard
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PUZP153MB0751:EE_|KL1P15301MB0798:EE_
x-ms-office365-filtering-correlation-id: 73dcee09-ecd1-42cc-38d5-08daace7a93c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0
x-microsoft-antispam-message-info: yHqyeT48+emFGC007WIGwIWnCRsMQkYLByOXKlVKwLIY60OIdDtrL328G7e/997UcJe+nJXKYfeHt8PlSKUxHt11QIV/7vHq5qlxqyEoJBfffBZeK3Teb1j7TTuNODocjd9I2ItTCyS/a9eOipVblvtHn+8FfEEEd6BRf5szP3gKbOt2hP39Xx00+nai5vqjHvIAvbFJWFLOkQojHpdsrTXVDPhqvXwD0o3eNva2pdU0ZqeJlsEuejIlBC5rNHiNtoGR0SEnRiHfr+4yFZnKbozPfylVENlOd75a1ivW2vFOGIu6qEyIGVwYZi4soABsfSs76lt3kQWiwn77xEM0DZUdQhryJp+OJ2Mv1qArq+PqwHg40YAwHjFbv4uOFn4WkNSEnTi0mK/kk2a7ulL6CZkGrWygHrUYdjuPHQm4ui3gQvc4BrU+0QZ1N3omH+YIxHBHxJeGO4Ony2rCSfujZN8l+pfwzFUna6c3SGScdfejMgEpkwr643PyH8SaU7K4jlunBh7Zjje/0lb256jI+pMyJ0IzlH7et6vX0jIKdve3uLHDh5BCzMJq13ftrvugD90SGE6idr7Kmo4U0Um5YYfPzYc+ww5cvJL42hNq15g5US8tcIqpehJ6fQ3GEts9eW51PW74dqbwHQ86VHFH7rbOuddVfjYuF/OAQq6fgMlRWEy3xrOXPDY8tAbmzjG/eMDWWMzarCmG/hkzmDMx2/NS43WlW0jAm3XlaHho5zfGilhggHwfKkngqh/x1IetutqDG3PvhcZQ4VuTdldF/1p7NV+Kfx8MyqfpnFPGcY/W8OXyseST5HmUm6yfOYwF
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PUZP153MB0751.APCP153.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(136003)(39860400002)(376002)(346002)(366004)(451199015)(86362001)(33656002)(2906002)(8936002)(38070700005)(5660300002)(52536014)(10290500003)(186003)(83380400001)(478600001)(54906003)(110136005)(7696005)(71200400001)(9686003)(26005)(6506007)(55236004)(53546011)(4326008)(91956017)(450100002)(8676002)(66556008)(66476007)(76116006)(64756008)(122000001)(66946007)(66446008)(82950400001)(82960400001)(107886003)(41300700001)(38100700002)(55016003)(316002)(19627405001)(8990500004);
 DIR:OUT; SFP:1102
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?tUwWVMvSbIS6xHPdsxFjayRnJ1yQimmWYQJ7AsA6jFWrGkNAUvwR/P+s1k+P?=
 =?us-ascii?Q?lhqvJfmKjs94bzFS0fZNYWuA4eZ2zaLb2CoZdF/g/E+RI7LO0MuvNgTo1c8R?=
 =?us-ascii?Q?5NbOZLCn07mwF3LjnLB4L/MY14R/CZyCYCD3x6Q73z4g52cSp/k2Z+OLlfXs?=
 =?us-ascii?Q?7Tl1nTZ4ZpbbXsNIcrxPsxEkpWdx10mVFtEmRWN5k7cWkH3d6MPvboHnuR2O?=
 =?us-ascii?Q?zp7u4MXT4rv+UvNlNNTknSj6YeqINTX1ZNLf2KyokFXDJh11luBdaSDH2rxX?=
 =?us-ascii?Q?+uc+ytiNzQiJUItZ8qQ2x6bC8AO1L/0q+9BIZaYFYNrQv2vWIT91MzSQNFWB?=
 =?us-ascii?Q?XGeVB09ya5UPhP5HepBj7CCcZ2yWNfV98WwTdzQjwhQgHC2TurX8PpCf39t7?=
 =?us-ascii?Q?J8TDCAjkkCAAIS2NTg4oMXFbXdC879eHD6eNshJMadZEECT1zhAg3JPAT1oO?=
 =?us-ascii?Q?AEWVkcTCzVfq2sdC3cU0uPtGo3Ho6Pu66KuOmd4oTlRYVxg+TqX4Nvet1wzU?=
 =?us-ascii?Q?VOOq+CgiGOCoHkKg2ufenwsuWnZWNFHDTuGttK1NiLhHNW9XK53BSDF8py1R?=
 =?us-ascii?Q?f0aYJ4ZkA0kf9l9TDYn4rZ/a9pMs/IeEYyZtcja/EJ6DVc7ZD6GThyKrQnfZ?=
 =?us-ascii?Q?nyHHhPJnRxm7NpoFLb7QNnhQCrnq1XheeTG3ZXNFGuRDWiOlm/IFHTsjX2Ov?=
 =?us-ascii?Q?1EkeUmZke6TaNLGbrXsDunm2m+get8Pe/4nO4myJdSrAXbGlOhryFG8i/GGz?=
 =?us-ascii?Q?IW00W0S95j9RFSYemcJCVjfU19+u4ZhrxfR34839qKuYzJmE0rSKA00BZFCz?=
 =?us-ascii?Q?G+flKSJ06uXWbRMyQHVtqlF10JmEZEXLeCf3q2jgIAvlspPDfznDcdy2E7bs?=
 =?us-ascii?Q?g3QCbaJ4JCFPqxC5Xm0qE5MwIMeghg+E/dt8k7PYA2ciOBMilAsCbxALr8bT?=
 =?us-ascii?Q?g5/5JPjRNSrnvVp66tKdkEz4inG6rGs+lks74j1eqoFd/cfQtI5cQsJ63z7A?=
 =?us-ascii?Q?7xt1p2khXuJxlttuCgzCr1Y40S926ido2suSYkZYbv+58r/Xum7zLhD79nwF?=
 =?us-ascii?Q?yY30zb/9aPQh3g3kKL1fCMRevNk/l2Lz03Gt/NrV9bvhCDff4US5lKO2ORzQ?=
 =?us-ascii?Q?Vq2r0cVzNpXYQsM2jY/VuWeJEhcOPGSXOJCDiW16Mcd9vKq1mzXOiy/8vPIW?=
 =?us-ascii?Q?X1r1dk4aVkavVtPOV70wIQYoccvd2gw9qhW1J/U2Pae754DLf/jEKQ6O2Tsm?=
 =?us-ascii?Q?66Oi3nYlsxfZJYNGjZrKncr84+aRTHiLUU4b8vLECMJxVF75Nyq5WLhCh10I?=
 =?us-ascii?Q?Bn4ntsfNRT1yXK3gXHh2mmvtocf1PeGL1p3I5UBnoKeI1ORZ8/41binV5cdn?=
 =?us-ascii?Q?MgqvbhDueQW3v5+OZT0poBA7U1KnMNqZI2M0tN+cw+Sl0yVWEdh4S9RQPaMM?=
 =?us-ascii?Q?y1Dfq4QBkcg37alvr287o9UDM41pP1bSI9WeqzsHXkkt5G/QuHNJGGA5rHM/?=
 =?us-ascii?Q?QIRbtw0vu1a7PQrSNSbxB0wrBfVQb43I1tX/?=
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PUZP153MB0751.APCP153.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 73dcee09-ecd1-42cc-38d5-08daace7a93c
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Oct 2022 06:53:40.2753 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sddNgIGyDQ5wIW3K0BEpgACp5OAjmftCUxfqtspQXcDH3ueeCwxnbSGstzrs8M3Sk+ej5nBvMT8etXaYh/kMcnwgHWauVD5gKG1OwT5Y1Dk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1P15301MB0798
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mailman-Approved-At: Thu, 13 Oct 2022 07:01:08 +0000
Subject: Re: [linux-lvm] LVM2 : performance drop even after deleting the
 snapshot
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
Cc: Kapil Upadhayay <kupadhayay@microsoft.com>,
 Mitta Sai Chaithanya <mittas@microsoft.com>
Errors-To: linux-lvm-bounces@redhat.com
Sender: "linux-lvm" <linux-lvm-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: multipart/mixed; boundary="===============5814515201894576682=="

--===============5814515201894576682==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_PUZP153MB07512B1B646868F0F8F1D205AC259PUZP153MB0751APCP_"

--_000_PUZP153MB07512B1B646868F0F8F1D205AC259PUZP153MB0751APCP_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

adding this to lvm-devel mailing list also.

Regards,
Pawan
________________________________
From: Pawan Sharma
Sent: Wednesday, October 12, 2022 10:42 PM
To: linux-lvm@redhat.com <linux-lvm@redhat.com>
Cc: Mitta Sai Chaithanya <mittas@microsoft.com>; Kapil Upadhayay <kupadhaya=
y@microsoft.com>
Subject: LVM2 : performance drop even after deleting the snapshot

Hi Everyone,


We are evaluating lvm2 snapshots and doing performance testing on it. This =
is what we are doing :

  1.  dump some data to lvm2 volume (using fio)
  2.  take the snapshot
  3.  delete the snapshot (no IOs anywhere after creating the snapshot)
  4.  run the fio on lvm2 volume

Here as you can see, we are just creating the snapshot and immediately dele=
ting it. There are no IOs to the main volume or anywhere. When we run the f=
io after this (step 4) and we see around 50% drop in performance with refer=
ence to the number we get in step 1.

It is expected to see a performance drop if there is a snapshot because of =
the COW. But here we deleted the snapshot, and it is not referring to any d=
ata also. We should not see any performance drop here.

Could someone please help me understand this behavior. Why are we seeing th=
e performance drop in this case? It seems like we deleted the snapshot but =
still it is not deleted, and we are paying the COW penalty.

System Info:

OS : ubuntu 18.04
Kernel : 5.4.0

# lvm version
  LVM version:     2.02.176(2) (2017-11-03)
  Library version: 1.02.145 (2017-11-03)
  Driver version:  4.41.0

We also tried on latest ubuntu with newer version of LVM. We got the same b=
ehavior.

Any help/pointers would be appreciated. Thanks in advance.

Regards,
Pawan

--_000_PUZP153MB07512B1B646868F0F8F1D205AC259PUZP153MB0751APCP_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
adding this to lvm-devel mailing list also.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
Regards,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
Pawan</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Pawan Sharma<br>
<b>Sent:</b> Wednesday, October 12, 2022 10:42 PM<br>
<b>To:</b> linux-lvm@redhat.com &lt;linux-lvm@redhat.com&gt;<br>
<b>Cc:</b> Mitta Sai Chaithanya &lt;mittas@microsoft.com&gt;; Kapil Upadhay=
ay &lt;kupadhayay@microsoft.com&gt;<br>
<b>Subject:</b> LVM2 : performance drop even after deleting the snapshot</f=
ont>
<div>&nbsp;</div>
</div>
<style type=3D"text/css" style=3D"display:none">
<!--
p
=09{margin-top:0;
=09margin-bottom:0}
-->
</style>
<div dir=3D"ltr">
<div class=3D"x_elementToProof" style=3D"font-family:Calibri,Arial,Helvetic=
a,sans-serif; font-size:12pt; color:rgb(0,0,0)">
Hi Everyone,</div>
<div class=3D"x_elementToProof" style=3D"font-family:Calibri,Arial,Helvetic=
a,sans-serif; font-size:12pt; color:rgb(0,0,0)">
<br>
</div>
<div class=3D"x_elementToProof" style=3D"font-family:Calibri,Arial,Helvetic=
a,sans-serif; font-size:12pt; color:rgb(0,0,0)">
<br>
</div>
<div class=3D"x_elementToProof" style=3D"font-family:Calibri,Arial,Helvetic=
a,sans-serif; font-size:12pt; color:rgb(0,0,0)">
We are evaluating lvm2 snapshots and doing performance testing on it. This =
is what we are doing :</div>
<div class=3D"x_elementToProof" style=3D"font-family:Calibri,Arial,Helvetic=
a,sans-serif; font-size:12pt; color:rgb(0,0,0)">
<ol>
<li><span>dump some data to lvm2 volume (using fio)</span></li><li><span>ta=
ke the snapshot</span></li><li><span>delete the snapshot (no IOs anywhere a=
fter creating the snapshot)</span></li><li><span>run the fio on lvm2 volume=
</span></li></ol>
<div><span>Here as you can see, we are just creating the snapshot and immed=
iately deleting it. There are no IOs to the main volume or anywhere. When w=
e run the fio after this (step 4) and we see around 50% drop in performance=
 with reference to the number we
 get in step 1.</span></div>
<div><span><br>
</span></div>
<div><span>It is expected to see a performance drop if there is a snapshot =
because of the COW. But here we deleted the snapshot, and it is not referri=
ng to any data also. We should not see any performance drop here.</span></d=
iv>
<div><span><br>
</span></div>
<div><span>Could&nbsp;someone please help me understand this behavior. Why =
are we seeing the performance drop in this case? It seems like we deleted t=
he snapshot but still it is not deleted, and we are paying the COW penalty.=
</span></div>
<div><span><br>
</span></div>
<div><span>System Info:</span></div>
<div><span><br>
</span></div>
<div><span>OS : ubuntu 18.04</span></div>
<div><span>Kernel : 5.4.0</span></div>
<div><span><span class=3D"x_ContentPasted0" style=3D"color:rgb(36,36,36); f=
ont-size:14px; background-color:rgb(255,255,255); display:inline!important"=
><br>
</span></span></div>
<div><span><span class=3D"x_ContentPasted0" style=3D"color:rgb(36,36,36); f=
ont-size:14px; background-color:rgb(255,255,255); display:inline!important"=
># lvm version</span><br class=3D"x_ContentPasted0" style=3D"box-sizing:bor=
der-box; color:rgb(36,36,36); font-size:14px; background-color:rgb(255,255,=
255)">
</span></div>
<div><span><span class=3D"x_ContentPasted0" style=3D"box-sizing:border-box;=
 color:rgb(36,36,36); font-size:14px; background-color:rgb(255,255,255)"><s=
pan class=3D"x_ContentPasted0" style=3D"box-sizing:border-box">&nbsp;&nbsp;=
</span>LVM version:<span class=3D"x_ContentPasted0" style=3D"box-sizing:bor=
der-box">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>2.02.176(2)
 (2017-11-03)</span><br class=3D"x_ContentPasted0" style=3D"box-sizing:bord=
er-box; color:rgb(36,36,36); font-size:14px; background-color:rgb(255,255,2=
55)">
<span class=3D"x_ContentPasted0" style=3D"box-sizing:border-box; color:rgb(=
36,36,36); font-size:14px; background-color:rgb(255,255,255)"><span class=
=3D"x_ContentPasted0" style=3D"box-sizing:border-box">&nbsp;&nbsp;</span>Li=
brary version: 1.02.145 (2017-11-03)</span><br class=3D"x_ContentPasted0" s=
tyle=3D"box-sizing:border-box; color:rgb(36,36,36); font-size:14px; backgro=
und-color:rgb(255,255,255)">
<span class=3D"x_ContentPasted0" style=3D"box-sizing:border-box; color:rgb(=
36,36,36); font-size:14px; background-color:rgb(255,255,255)"><span class=
=3D"x_ContentPasted0" style=3D"box-sizing:border-box">&nbsp;&nbsp;</span>Dr=
iver version:<span class=3D"x_ContentPasted0" style=3D"box-sizing:border-bo=
x">&nbsp;&nbsp;</span>4.41.0</span><br>
</span></div>
<div><span><br>
</span></div>
<div><span>We also tried on latest ubuntu with newer version of LVM. We got=
 the same behavior.</span></div>
<div><span><br>
</span></div>
<div><span>Any help/pointers would be appreciated. Thanks in advance.</span=
></div>
<div><span><br>
</span></div>
<div><span>Regards,</span></div>
<div>Pawan</div>
</div>
</div>
</body>
</html>

--_000_PUZP153MB07512B1B646868F0F8F1D205AC259PUZP153MB0751APCP_--

--===============5814515201894576682==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

--===============5814515201894576682==--

