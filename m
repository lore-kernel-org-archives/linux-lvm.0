Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE9F8C4321E
	for <linux-lvm@archiver.kernel.org>; Tue, 18 Oct 2022 07:10:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1666077055;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=O2oLZa38ItK/crdrmkKT67aws7x7v6LrMfqz8ceJ3l4=;
	b=fCvLwmPC9k1VmdjlD8Bovh5aDExkoIbUxdLMMS4JaooCPjOEmm97egtT/P9WiysznjM6k1
	Ty437rUDVF/8fVt7ZbgQv0+YOQfexezVx1V/EsyCG8rJZW8Stj2CuowRfISgMYSZadcf2M
	ekndcorXMOyO4taypeN3ZB0g5aDtpTc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-375-8yayMVl0N12Z20qMIt24Jw-1; Tue, 18 Oct 2022 03:10:53 -0400
X-MC-Unique: 8yayMVl0N12Z20qMIt24Jw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 564053C30511;
	Tue, 18 Oct 2022 07:10:51 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D3827215CDCC;
	Tue, 18 Oct 2022 07:10:47 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id E30A01946A46;
	Tue, 18 Oct 2022 07:10:46 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 2CBDB194658F
 for <linux-lvm@listman.corp.redhat.com>; Tue, 18 Oct 2022 03:33:29 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 159C949BB61; Tue, 18 Oct 2022 03:33:27 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0CEFD409AED
 for <linux-lvm@redhat.com>; Tue, 18 Oct 2022 03:33:26 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B5D2B101A5B3
 for <linux-lvm@redhat.com>; Tue, 18 Oct 2022 03:33:25 +0000 (UTC)
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01on2092.outbound.protection.outlook.com [40.107.215.92]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-613-EmiwjdbSNrKjKl-f-1M5sw-1; Mon, 17 Oct 2022 23:33:13 -0400
X-MC-Unique: EmiwjdbSNrKjKl-f-1M5sw-1
Received: from PUZP153MB0751.APCP153.PROD.OUTLOOK.COM (2603:1096:301:e0::10)
 by SI2P153MB0703.APCP153.PROD.OUTLOOK.COM (2603:1096:4:19e::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5746.6; Tue, 18 Oct 2022 03:33:07 +0000
Received: from PUZP153MB0751.APCP153.PROD.OUTLOOK.COM
 ([fe80::32c8:f680:5886:1dc1]) by PUZP153MB0751.APCP153.PROD.OUTLOOK.COM
 ([fe80::32c8:f680:5886:1dc1%3]) with mapi id 15.20.5746.015; Tue, 18 Oct 2022
 03:33:07 +0000
From: Pawan Sharma <sharmapawan@microsoft.com>
To: Zdenek Kabelac <zdenek.kabelac@gmail.com>, LVM2 development
 <lvm-devel@redhat.com>, "linux-lvm@redhat.com" <linux-lvm@redhat.com>
Thread-Topic: [EXTERNAL] Re: LVM2 : performance drop even after deleting the
 snapshot
Thread-Index: AQHY3lsJie+6cAv+2kGrP2SVVAhuka4L4/wqgABCioCAAh1v1YAEUxEAgADvweo=
Date: Tue, 18 Oct 2022 03:33:07 +0000
Message-ID: <PUZP153MB0751F596ABAFA828502BA50FAC289@PUZP153MB0751.APCP153.PROD.OUTLOOK.COM>
References: <PUZP153MB075126926388815B6F9E1258AC229@PUZP153MB0751.APCP153.PROD.OUTLOOK.COM>
 <PUZP153MB07512B1B646868F0F8F1D205AC259@PUZP153MB0751.APCP153.PROD.OUTLOOK.COM>
 <91261aec-d0fd-7884-1f38-a575b4e540e2@gmail.com>
 <SI2P153MB0444EE48C7C6E92FB448262ED7249@SI2P153MB0444.APCP153.PROD.OUTLOOK.COM>
 <0e032336-8658-5686-3dfb-0e50cdcb7d91@gmail.com>
In-Reply-To: <0e032336-8658-5686-3dfb-0e50cdcb7d91@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=True;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2022-10-18T03:33:05.263Z;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=General;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ContentBits=0;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Method=Standard
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PUZP153MB0751:EE_|SI2P153MB0703:EE_
x-ms-office365-filtering-correlation-id: df8f35f2-4eca-4df6-1016-08dab0b97938
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0
x-microsoft-antispam-message-info: cNHC5EURaW8iakVE0PP3A4nMBkZaTiymAZMUcfPrg8VxA903C9omr4U5YqV+G8iRtydDs5+h8suInRUkHWaQDOsuRq6DBTDq+R89whUNEjA5XbMGL5wOQ01uMo5StN4D/VmeXWMIz4FIs97IuzC4s8Z89j3ZW47w2OxU72/wJb5mzYusmlXa6haA71XtwZG0GOGAO3fZPtb+4eQ9zBP2LTjUPeJjDbwrxtbODVcYncyoSRpI4JMqtHvGOeneBOWVuKhVlbK2nawcb/9l1AzAf/rgZFz0cStzxN/2bf0zAYVJugrJzAcnHBVfIfW0ZznkjmWaVd0xsKFrgmYxpTO5Cdb8nOyAZlNWZb/ff80Yz2QvWbzElmMIJ5iA1ga+hndFdkaVGHgcAR5AjEwX79e6GYNUotg1hQgf2dNEzoETwovOxr3NeX02LQZ4fUCmtzT/PwX7U5LOBW0zym8Znev70D9SCOkgjbzzm0RNeyTSCwbFIoW+sD5HIhbkw06wCN3denL3vwH0TsPYPeqm3LvWTHyM/WHXAF9zYYyJ3+Hf94thG2hfJsTCG+MTDyHWz2ahstz3zn2soXk6oaGRVQ5csYCE4UUhtBDKvgWCDGKxMd25/22BIZsfxyo9aquHpPpRrLj4pNgOdbmPO/aMk4SQ+k+VPC9xTykvh0TRyN/3fU3KFU+VI2EwOoT1qO2dh86Uqb2WMehBFufnWqIdUoUDR224rLcqDocUTIPE6e6meYgVFfic0LSK8pec8RwKLA60yQRqM+aru8z/D4rDn7z6mIGsQy6wDuwYgnitJitwuZRskD8x6TKoQDWR+UhPtlgL
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PUZP153MB0751.APCP153.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(346002)(136003)(366004)(376002)(396003)(451199015)(19627405001)(2906002)(5660300002)(52536014)(8936002)(66946007)(91956017)(54906003)(64756008)(66446008)(66476007)(66556008)(8676002)(7696005)(10290500003)(316002)(122000001)(6506007)(966005)(33656002)(71200400001)(107886003)(478600001)(4326008)(41300700001)(76116006)(8990500004)(55236004)(86362001)(9686003)(53546011)(83380400001)(82960400001)(110136005)(38100700002)(186003)(55016003)(38070700005)(26005)(166002)(82950400001);
 DIR:OUT; SFP:1102
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?wuW4rkT4mfdvFmxKpsuSi6JSGFIj84isgKOVaKim56ETGUNrx4g934YX+m19?=
 =?us-ascii?Q?SmTIbaovgb+zdUadksRIfqP1bDSryQRAaNRLPlqiGJogEkWiOrsv+vs1x5sw?=
 =?us-ascii?Q?nsAgyGmt51GkYyFBC5myBJffLXoAcTypRiYimTSluUgNdWbUrZNdERsu5xIo?=
 =?us-ascii?Q?qFEjs3fIRzTN12UDzOihKGrwOWaHobEyS3L7HWKAa9pWZwK4qnpT7MkXcL45?=
 =?us-ascii?Q?BcQOUaUKsipwSWLNPdcc6yr7qE1+BNqtSFpuiUxvjy90Rtml2i64bK1SgYK/?=
 =?us-ascii?Q?9WGq+7u2deO1KQNWmzDWMXi46W8yqJ2n1JpFNu3xZNlldoZSlEASGFQSdO5T?=
 =?us-ascii?Q?uFiNDKcHWqhqRRaeKf1zPrUTfmyng9a9OdoN0veS2sut2ABF7P3ejxdAjZDX?=
 =?us-ascii?Q?/q7t3U2LVh/Gd/YsJObyHBLo5WeVj/E1uCP2NdHF3waEO7jxhcu9QleAO2Y9?=
 =?us-ascii?Q?lqKbP+fe1pcmBKEqPEmR+SaepJB2P61/wSjPe7wgIoQPIxG7iX1S6QvUm5X+?=
 =?us-ascii?Q?1j03gajP2DvYPTL7EN2p0EKhX190WNKI0hv4/+CTGE12N//F8nUee4eD5v1r?=
 =?us-ascii?Q?8dGN/dF51l2PA0hse9rffpGvPY4ly+baMa9lNVEYQyF1CBuCqyWDf7saY1DA?=
 =?us-ascii?Q?GrTpAlVtK8fVAHvuTThl46HD3PYnrS71UKACXOGUTpsZjETQSmIcWqHofnQM?=
 =?us-ascii?Q?ncpVPDYhPSDsmygX7kT+zkF52v4d6E3LbjH4JcuMspXcuI95bRSBtRXaMvJ7?=
 =?us-ascii?Q?1fVXy6k8WZkIac+LgI+K2wqNmZNBKMnrQRZd3SdMMV8GtO7reNYc3pCSF2nX?=
 =?us-ascii?Q?eF2zS5B0FkeXooaOfTQCsbypJnFXtDtULM3K2jX+56qktVp3FIXVK91JcIJk?=
 =?us-ascii?Q?60vTl26HXNxWpqAm3uSomiuHgfUIeYN81SOkwfIdn7tZW8ru0AsPrPWsWUN4?=
 =?us-ascii?Q?LNEaVcL5Odz12frWW7cG/bXPj3fANPFBd7HCKUij4vAQTrcBw0pI6Kkiri5y?=
 =?us-ascii?Q?gvLlzrCW8O4O3l1yjymhtgxMaHeumHDgr5S02CVCNfG/GRL4MUmZqvuZwpsV?=
 =?us-ascii?Q?7w05n0WJJIVbKmQ82lNAlZ1qJbN8chdwPZlpAy/BXpVl128YZIKKcG7f3NP9?=
 =?us-ascii?Q?i6QPNie0jDybBUxrv0HgPgXsNmnhZtuBVdBZqidzmVzRyjnwSfGpsvotThvY?=
 =?us-ascii?Q?iAtX5x9E59Er4f6YcC2Nc68I+K/siZ+JCAyRtcZstDRsJlxG778NN6VKSlZw?=
 =?us-ascii?Q?uLTfwTY3EOV63SleiFaxKhIQClRpwpBKCjEF2W9uJZTaIwoeJxKgeyH5KcyW?=
 =?us-ascii?Q?dGnp7POEn2BTLVe3UVFg/SH9rbJ1HLZ7At/9q6O3hOkQVjCC7DITSztnB1Gr?=
 =?us-ascii?Q?khmvscN5AQek0mdpWDLGqE3rYfgdI+e10t26e+F2P77Cvg5B3s0v/gI6nz85?=
 =?us-ascii?Q?W4/tIP1U9j2vJzrjYZZNqFDBUHjRLmySqz+3EzQawnGduePU/dlaqZR2oDVO?=
 =?us-ascii?Q?opk8+jhBfv6wiGMlO+WtoaKxPDs7Km+Qeu05?=
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PUZP153MB0751.APCP153.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: df8f35f2-4eca-4df6-1016-08dab0b97938
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Oct 2022 03:33:07.5190 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2b0roWO9RlXHCfqJhg83WM0vwTolDCfr6J2T6/XmxFxoBy10c0AxBlKHKMyvDKrdYnL141wNBzF3aeGb5zyWKKcdBYCte0hljNSHo7tvPyQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2P153MB0703
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mailman-Approved-At: Tue, 18 Oct 2022 07:10:45 +0000
Subject: Re: [linux-lvm] [EXTERNAL] Re: LVM2 : performance drop even after
 deleting the snapshot
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: multipart/mixed; boundary="===============4498561863650927622=="

--===============4498561863650927622==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_PUZP153MB0751F596ABAFA828502BA50FAC289PUZP153MB0751APCP_"

--_000_PUZP153MB0751F596ABAFA828502BA50FAC289PUZP153MB0751APCP_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Zdenek,

I would like to highlight one point here is that we are creating and then d=
eleting the snapshot immediately without writing anything anywhere. In this=
 case, we are expecting the performance to go back to what it was before ta=
king the thin snapshot. Here we are not getting the original performance af=
ter deleting the snapshot. Do you know any reason why that would be happeni=
ng.

Regards,
Pawan
________________________________
From: Zdenek Kabelac <zdenek.kabelac@gmail.com>
Sent: Monday, October 17, 2022 6:40 PM
To: Mitta Sai Chaithanya <mittas@microsoft.com>; LVM2 development <lvm-deve=
l@redhat.com>; Pawan Sharma <sharmapawan@microsoft.com>; linux-lvm@redhat.c=
om <linux-lvm@redhat.com>
Cc: Kapil Upadhayay <kupadhayay@microsoft.com>
Subject: Re: [EXTERNAL] Re: LVM2 : performance drop even after deleting the=
 snapshot

[Some people who received this message don't often get email from zdenek.ka=
belac@gmail.com. Learn why this is important at https://aka.ms/LearnAboutSe=
nderIdentification ]

Dne 14. 10. 22 v 21:31 Mitta Sai Chaithanya napsal(a):
> Hi Zdenek Kabelac,
>            Thanks for your quick reply and suggestions.
>
> We conducted couple of tests on Ubuntu 22.04 and observed similar perform=
ance
> behavior post thin snapshot deletion without writing any data anywhere.
>
> *Commands used to create Thin LVM volume*:
> - lvcreate  -L 480G --poolmetadataspare n --poolmetadatasize 16G
> --chunksize=3D64K --thinpool  ThinDataLV ThinVolGrp
> - lvcreate -n ext4.ThinLV -V 100G --thinpool ThinDataLV ThinVolGrp


Hi

So now it's clear you are talking about thin snapshots - this is a very
different story going on here (as we normally use term "COW" volumes for th=
ick
old snapshots)

I'll consult more with thinp author - however it does look to me you are us=
ing
same device to store  data & metadata.

This is always a highly sub-optimal solution - the metadata device is likel=
y
best to be stored on fast (low latency) devices.

So my wild guess - you are possibly using rotational device backend to stor=
e
your  thin-pools metadata volume and then your setups gets very sensitive o=
n
the metadata fragmentation.

Thin-pool was designed to be used with SSD/NVMe for metadata which is way l=
ess
sensitive on seeking.

So when you 'create' snapshot - metadata gets updated - when you remove thi=
n
snapshot - metadata gets again a lots of changes (especially when your orig=
in
volume is already populated) - and fragmentation is inevitable and you are
getting high penalty of holding metadata device on the same drive as your d=
ata
device.

So while there are some plans to improve some metadata logistic - I'd not
expect miracles on you particular setup - I'd highly recommend to plug-in s=
ome
  SSD/NVMe storage for storing your thinpool metadata - this is the way to =
go
to get better 'benchmarking' numbers here.

For an improvement on your setup - try to seek larger chunk size values whe=
re
your data 'sharing' is still reasonably valuable - this depends on data-typ=
e
usage - but chunk size 256K might be possibly a good compromise (with disab=
led
zeroing - if you hunt for the best performance).


Regards

Zdenek

PS: later mails suggest you are using some 'MS Azure' devices?? - so please
redo your testing with your local hardware/storage - where you have precise
guarantees of storage drive performance - testing in the Cloud is random by
design....


--_000_PUZP153MB0751F596ABAFA828502BA50FAC289PUZP153MB0751APCP_
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
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
Hi&nbsp;<span style=3D"color:rgb(36, 36, 36);font-family:&quot;Segoe UI&quo=
t;, &quot;Segoe UI Web (West European)&quot;, &quot;Segoe UI&quot;, -apple-=
system, BlinkMacSystemFont, Roboto, &quot;Helvetica Neue&quot;, sans-serif;=
font-size:14.6667px;background-color:rgb(255, 255, 255);display:inline !imp=
ortant" class=3D"ContentPasted0">Zdenek,</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
<span style=3D"color:rgb(36, 36, 36);font-family:&quot;Segoe UI&quot;, &quo=
t;Segoe UI Web (West European)&quot;, &quot;Segoe UI&quot;, -apple-system, =
BlinkMacSystemFont, Roboto, &quot;Helvetica Neue&quot;, sans-serif;font-siz=
e:14.6667px;background-color:rgb(255, 255, 255);display:inline !important" =
class=3D"ContentPasted0"><br>
</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
<span style=3D"color:rgb(36, 36, 36);font-family:&quot;Segoe UI&quot;, &quo=
t;Segoe UI Web (West European)&quot;, &quot;Segoe UI&quot;, -apple-system, =
BlinkMacSystemFont, Roboto, &quot;Helvetica Neue&quot;, sans-serif;font-siz=
e:14.6667px;background-color:rgb(255, 255, 255);display:inline !important" =
class=3D"ContentPasted0">I
 would like to highlight one point here is that we are creating and then de=
leting the snapshot immediately without writing anything anywhere. In this =
case, we are expecting the performance to go back to what it was before tak=
ing the thin snapshot. Here we are
 not getting the original performance after deleting the snapshot. Do you k=
now any reason why that would be happening.</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
<span style=3D"color:rgb(36, 36, 36);font-family:&quot;Segoe UI&quot;, &quo=
t;Segoe UI Web (West European)&quot;, &quot;Segoe UI&quot;, -apple-system, =
BlinkMacSystemFont, Roboto, &quot;Helvetica Neue&quot;, sans-serif;font-siz=
e:14.6667px;background-color:rgb(255, 255, 255);display:inline !important" =
class=3D"ContentPasted0"><br>
</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
<span style=3D"color:rgb(36, 36, 36);font-family:&quot;Segoe UI&quot;, &quo=
t;Segoe UI Web (West European)&quot;, &quot;Segoe UI&quot;, -apple-system, =
BlinkMacSystemFont, Roboto, &quot;Helvetica Neue&quot;, sans-serif;font-siz=
e:14.6667px;background-color:rgb(255, 255, 255);display:inline !important" =
class=3D"ContentPasted0">Regards,</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
<span style=3D"color:rgb(36, 36, 36);font-family:&quot;Segoe UI&quot;, &quo=
t;Segoe UI Web (West European)&quot;, &quot;Segoe UI&quot;, -apple-system, =
BlinkMacSystemFont, Roboto, &quot;Helvetica Neue&quot;, sans-serif;font-siz=
e:14.6667px;background-color:rgb(255, 255, 255);display:inline !important" =
class=3D"ContentPasted0">Pawan&nbsp;</span></div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Zdenek Kabelac &lt;zd=
enek.kabelac@gmail.com&gt;<br>
<b>Sent:</b> Monday, October 17, 2022 6:40 PM<br>
<b>To:</b> Mitta Sai Chaithanya &lt;mittas@microsoft.com&gt;; LVM2 developm=
ent &lt;lvm-devel@redhat.com&gt;; Pawan Sharma &lt;sharmapawan@microsoft.co=
m&gt;; linux-lvm@redhat.com &lt;linux-lvm@redhat.com&gt;<br>
<b>Cc:</b> Kapil Upadhayay &lt;kupadhayay@microsoft.com&gt;<br>
<b>Subject:</b> Re: [EXTERNAL] Re: LVM2 : performance drop even after delet=
ing the snapshot</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">[Some people who received this message don't often=
 get email from zdenek.kabelac@gmail.com. Learn why this is important at
<a href=3D"https://aka.ms/LearnAboutSenderIdentification">https://aka.ms/Le=
arnAboutSenderIdentification</a> ]<br>
<br>
Dne 14. 10. 22 v 21:31 Mitta Sai Chaithanya napsal(a):<br>
&gt; Hi Zdenek Kabelac,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Than=
ks for your quick reply and suggestions.<br>
&gt;<br>
&gt; We conducted couple of tests on Ubuntu 22.04 and observed similar perf=
ormance<br>
&gt; behavior post thin snapshot deletion without writing any data anywhere=
.<br>
&gt;<br>
&gt; *Commands used to create Thin LVM volume*:<br>
&gt; - lvcreate&nbsp; -L 480G --poolmetadataspare n --poolmetadatasize 16G<=
br>
&gt; --chunksize=3D64K --thinpool&nbsp; ThinDataLV ThinVolGrp<br>
&gt; - lvcreate -n ext4.ThinLV -V 100G --thinpool ThinDataLV ThinVolGrp<br>
<br>
<br>
Hi<br>
<br>
So now it's clear you are talking about thin snapshots - this is a very<br>
different story going on here (as we normally use term &quot;COW&quot; volu=
mes for thick<br>
old snapshots)<br>
<br>
I'll consult more with thinp author - however it does look to me you are us=
ing<br>
same device to store&nbsp; data &amp; metadata.<br>
<br>
This is always a highly sub-optimal solution - the metadata device is likel=
y<br>
best to be stored on fast (low latency) devices.<br>
<br>
So my wild guess - you are possibly using rotational device backend to stor=
e<br>
your&nbsp; thin-pools metadata volume and then your setups gets very sensit=
ive on<br>
the metadata fragmentation.<br>
<br>
Thin-pool was designed to be used with SSD/NVMe for metadata which is way l=
ess<br>
sensitive on seeking.<br>
<br>
So when you 'create' snapshot - metadata gets updated - when you remove thi=
n<br>
snapshot - metadata gets again a lots of changes (especially when your orig=
in<br>
volume is already populated) - and fragmentation is inevitable and you are<=
br>
getting high penalty of holding metadata device on the same drive as your d=
ata<br>
device.<br>
<br>
So while there are some plans to improve some metadata logistic - I'd not<b=
r>
expect miracles on you particular setup - I'd highly recommend to plug-in s=
ome<br>
&nbsp; SSD/NVMe storage for storing your thinpool metadata - this is the wa=
y to go<br>
to get better 'benchmarking' numbers here.<br>
<br>
For an improvement on your setup - try to seek larger chunk size values whe=
re<br>
your data 'sharing' is still reasonably valuable - this depends on data-typ=
e<br>
usage - but chunk size 256K might be possibly a good compromise (with disab=
led<br>
zeroing - if you hunt for the best performance).<br>
<br>
<br>
Regards<br>
<br>
Zdenek<br>
<br>
PS: later mails suggest you are using some 'MS Azure' devices?? - so please=
<br>
redo your testing with your local hardware/storage - where you have precise=
<br>
guarantees of storage drive performance - testing in the Cloud is random by=
<br>
design....<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_PUZP153MB0751F596ABAFA828502BA50FAC289PUZP153MB0751APCP_--

--===============4498561863650927622==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

--===============4498561863650927622==--

