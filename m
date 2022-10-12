Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D30ADC4332F
	for <linux-lvm@archiver.kernel.org>; Thu, 13 Oct 2022 07:01:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1665644481;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=ggfDqz+g3tifO4SmpgPkKaZtpweQe17Xox0DPGfL8o8=;
	b=VBUKDoMdB4qbf7dDZdmN6ly3R25ACMRfkZNFODf02/ZrhICY7HD+9kat95Q3AwnzbraZVt
	VPzdYfbYiB4Gc+92IurpZrUw7KCXuIti0hz+UTWh9dw5KjBop20Hjzdo6+k8y023xSIS5d
	+dP+jINawbftRB8IXyuuB1VtWU7g+oA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-516-iDfi2rD3OoOx-zCmox_H_A-1; Thu, 13 Oct 2022 03:01:17 -0400
X-MC-Unique: iDfi2rD3OoOx-zCmox_H_A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EAE07101A52A;
	Thu, 13 Oct 2022 07:01:14 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A85832166BA3;
	Thu, 13 Oct 2022 07:01:10 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 7F4CA194658F;
	Thu, 13 Oct 2022 07:01:10 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id B7CBD1946588
 for <linux-lvm@listman.corp.redhat.com>; Wed, 12 Oct 2022 17:12:33 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 9948C9E70; Wed, 12 Oct 2022 17:12:33 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9101E7AE5
 for <linux-lvm@redhat.com>; Wed, 12 Oct 2022 17:12:33 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6D5D1185A794
 for <linux-lvm@redhat.com>; Wed, 12 Oct 2022 17:12:33 +0000 (UTC)
Received: from APC01-TYZ-obe.outbound.protection.outlook.com
 (mail-tyzapc01on2091.outbound.protection.outlook.com [40.107.117.91]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-616-s4h33s9CP-yHX29G8kyLew-1; Wed, 12 Oct 2022 13:12:31 -0400
X-MC-Unique: s4h33s9CP-yHX29G8kyLew-1
Received: from PUZP153MB0751.APCP153.PROD.OUTLOOK.COM (2603:1096:301:e0::10)
 by KL1P15301MB0433.APCP153.PROD.OUTLOOK.COM (2603:1096:820:2e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.6; Wed, 12 Oct
 2022 17:12:25 +0000
Received: from PUZP153MB0751.APCP153.PROD.OUTLOOK.COM
 ([fe80::32c8:f680:5886:1dc1]) by PUZP153MB0751.APCP153.PROD.OUTLOOK.COM
 ([fe80::32c8:f680:5886:1dc1%3]) with mapi id 15.20.5746.001; Wed, 12 Oct 2022
 17:12:24 +0000
From: Pawan Sharma <sharmapawan@microsoft.com>
To: "linux-lvm@redhat.com" <linux-lvm@redhat.com>
Thread-Topic: LVM2 : performance drop even after deleting the snapshot
Thread-Index: AQHY3lsJie+6cAv+2kGrP2SVVAhukQ==
Date: Wed, 12 Oct 2022 17:12:24 +0000
Message-ID: <PUZP153MB075126926388815B6F9E1258AC229@PUZP153MB0751.APCP153.PROD.OUTLOOK.COM>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=True;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2022-10-12T17:12:23.888Z;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=General;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ContentBits=0;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Method=Standard
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PUZP153MB0751:EE_|KL1P15301MB0433:EE_
x-ms-office365-filtering-correlation-id: 3a0052a9-ba76-40e5-459e-08daac74eea0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0
x-microsoft-antispam-message-info: h6OCF4zK1tiqRlq+D5/fTU3y/GKqnGbR6mReSj8pd++Ng04F9o8jiIAfw/COwFkgT0E2reOqD+6ZQO04mwvM1Wt+VjjV3CxzHP8rlObuaGfbHx+yUUrDg/GQKN4IkZMKka249bWXf+5T+Jygk2FJrPzlS3a5WydZCxIOfFRS30vMtvSMymgEuugedCnytvRsEzWjPKk45Xjqw9dOr5vQXd50jBuDH9hqwwDvQEg4WUGGwlDCWeEgZVJVUwVJ61kB4XtxKH6FiCMhKjRQJEchRcuI8GVQLl42uXeuRQ3aVxIMGV5TYsJ1pkdP20eAzNzWqmDD+Hg1mLzPrl8cHdhhbXkSg2VOsJWV66oIlarAXpc7eRiBSIBAyVUP8vcdVNT/lRZhDJN0r8sXu0k/cVzPP2iPx/ZEZ7WuDbO72OgAYQsDAYbNRQJKT0Xnj9RDsY0YluXPpGXgO+QJrzwhzJ7YvQ4942YGR3TrLSEtoWFnMcYhS5d7OgHxkPdQia/9Om16nt9sXtNUNVrS4F7X4zUY4RNVIDisXbfdINCqGeGkedB44VA4kjPMFQU+jKmGyVOUIjvn/hYqXGgAMug7ZIFvAWTz5AwquawKbugzNAVUSSKeHvwzsJfqomFunc/tWKdpSWpy8ORKxGqkJx30e38QBiT4JkkclMa5nOGiCuI0pVE36AW0MAQO0/dNfYJf77BF2KlAue5gKk0rFjN8mrATuqnNvpHTRZi7X6p3gZ5r2y2Y6orvwusRps+hNyasCHgoJFxR29p4/lKLrbQxtxqBaJkSKqlKR4uOtswNxH7Gl4aGtSf+vQ0Rfp83HAI01qmP
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PUZP153MB0751.APCP153.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(396003)(346002)(376002)(39860400002)(366004)(451199015)(19627405001)(8990500004)(52536014)(8936002)(55236004)(478600001)(66446008)(38070700005)(4326008)(33656002)(8676002)(91956017)(64756008)(66476007)(66946007)(76116006)(54906003)(66556008)(6916009)(10290500003)(2906002)(86362001)(41300700001)(38100700002)(71200400001)(316002)(5660300002)(107886003)(82950400001)(82960400001)(186003)(122000001)(55016003)(83380400001)(9686003)(26005)(7696005)(6506007);
 DIR:OUT; SFP:1102
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?Gcl+Wvrh/gVpKK2POOIkjJy5AeHhgx6LsrCMe8CefABPQMThP4H0O1IBS6?=
 =?iso-8859-1?Q?J39ZExXwNm4EjCwMT+nxadsJt8VAL7Nj6l7wdWowlwt9QGCff7ne7lR4ME?=
 =?iso-8859-1?Q?E7fZ5sjBhbJ3aaWOc0ApEYLY9mmZWh7N44cQm4BvyrbYwJG7EG6spOs8Se?=
 =?iso-8859-1?Q?4Ila4NMOuO6z/mY9D1Qd5ipe2su+Adzc8wGIUDUebKd0x8yUdN5UZDOEb6?=
 =?iso-8859-1?Q?lCI+4S+TDBTN8Lws0uSEmQ2Yu6mcPkSP7YSjYRn/tqwMJp1URYSbVD6DTk?=
 =?iso-8859-1?Q?TuvAMwr1fbv2/rHph/4ksXBEnLC2ay5ac3KtTJgTItNJk5Zq2yXM8NJOgd?=
 =?iso-8859-1?Q?zyuBWTVyKZDVFnl7tmDHoTTg39/FyrmMahS4UU8OBXlqSKcX8y8aakDGYU?=
 =?iso-8859-1?Q?L9MVUUaiCxt12JChu9njf4C4xuGp0jaC21PdJtmJExqBqEtRNAeC7suJ41?=
 =?iso-8859-1?Q?o2OdlVAJB0Hkd43t03RfuntSatr8Wz1jL0HoRaH5b7Jld5gWmkYx511qrJ?=
 =?iso-8859-1?Q?0yCxt0FtVi1/bAs7Qxp8KJ8NEZMNmTRucATqk8iJyqbxT9rMlu1vMigiX1?=
 =?iso-8859-1?Q?hfsp2080OtYvJ/HUj5LctbiCePiaBdK8qS28MkO5xxhVrd0lW799S8nhxQ?=
 =?iso-8859-1?Q?Ew0dKP5JM+v/sfYFM3QaLYt9mA5F565kGA+FSMidLZJWPoj8v4hhclrPBB?=
 =?iso-8859-1?Q?nj8Pfm5ZgT1PZ766W4BCzW9EyIZ0GoydK8+fgT0zAkRp+ueC8YDmDxDxI7?=
 =?iso-8859-1?Q?AeydVuJl6KOJM98H/o0F/pmF+P3vn+TF9UCHIM9ztfGVHiJpn50V5wZzKa?=
 =?iso-8859-1?Q?jqK7aOIALPJ6tSLiBjFxeT19F8XmSzDiSOTBC7Iy6kYbTWoWsrMv9TuV3k?=
 =?iso-8859-1?Q?uinRIUX9AAI7Yh5hSoN31FOOvQkC7ZBj4ufyL9mtF200zbATM0V8cINUJt?=
 =?iso-8859-1?Q?Li7kuDOvqO0stH+50wvZUSD3G5et8nLQ8JjUK9o4WkllN06jxhX8wYzlWL?=
 =?iso-8859-1?Q?eIb/c9VPAFTOLipO9Y70hHDau2/iSo8wdQzT0flTAiyivuMUS9xK0XWhcM?=
 =?iso-8859-1?Q?/Gt4KCtNu/U/qES2NhW+CU/zcdptdJSctiiXYzzJAfIcsG+bm8ZD9IB8ww?=
 =?iso-8859-1?Q?EVfPNA6cTD4t/u2r5rvnEi4+AXtFk69zbuk6PaS6TEAW+mu0UG3DtsOkAd?=
 =?iso-8859-1?Q?Yso/taTt8WZJ8tq1dJC0k8KYLCldP209bmhxMWmYWhmRkIuYfmrF1vGvYN?=
 =?iso-8859-1?Q?kZ0xlPcVZ7f3eY70RD5ONaD7+P9wAksV5DuCeRNeRN1REFKfcOAT5Yqdbd?=
 =?iso-8859-1?Q?lgs1ZuQvQhzGI6BgPfLWOYUxxr/rSz4shF7qd/Eb/mBXY/jxj2Son905bI?=
 =?iso-8859-1?Q?zme9G7ZaR7dk3/mIIvfUGaVDow7juq86ZOdIuNtrqtryFbH3nzZd7+jlnH?=
 =?iso-8859-1?Q?fQMWq9F8kudECGMrMEV0ywswqPymQGop0WSUMQ4H6or7/8nQk9NiIOrbo9?=
 =?iso-8859-1?Q?6G7AFxsB8Kz17fswGG+bEsBrTXXd50TJJfqbJ4f4hJ4hd5Fwpi9xBTw5S+?=
 =?iso-8859-1?Q?h4MJPoHi1ag3YEl3jE2fw8lvgW2c?=
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PUZP153MB0751.APCP153.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a0052a9-ba76-40e5-459e-08daac74eea0
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Oct 2022 17:12:24.5386 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: erfBvd2CniuVr1KdbVuZc7x1rz3EQNXBKk/TIbI87295Ci7UGjmsIJy4WIXQ46MtcpaDhpG7dDbFkGBYzDv42+QHAjTQROW0loxg9nyHozw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1P15301MB0433
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mailman-Approved-At: Thu, 13 Oct 2022 07:01:08 +0000
Subject: [linux-lvm] LVM2 : performance drop even after deleting the snapshot
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
Content-Type: multipart/mixed; boundary="===============1581826126861241330=="

--===============1581826126861241330==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_PUZP153MB075126926388815B6F9E1258AC229PUZP153MB0751APCP_"

--_000_PUZP153MB075126926388815B6F9E1258AC229PUZP153MB0751APCP_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

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

--_000_PUZP153MB075126926388815B6F9E1258AC229PUZP153MB0751APCP_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
Hi Everyone,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
We are evaluating lvm2 snapshots and doing performance testing on it. This =
is what we are doing :</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
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
<div><span><span style=3D"color:rgb(36, 36, 36);font-family:-apple-system, =
BlinkMacSystemFont, &quot;Segoe UI&quot;, system-ui, &quot;Apple Color Emoj=
i&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Web&quot;, sans-serif;f=
ont-size:14px;background-color:rgb(255, 255, 255);display:inline !important=
" class=3D"ContentPasted0"><br>
</span></span></div>
<div><span><span style=3D"color:rgb(36, 36, 36);font-family:-apple-system, =
BlinkMacSystemFont, &quot;Segoe UI&quot;, system-ui, &quot;Apple Color Emoj=
i&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Web&quot;, sans-serif;f=
ont-size:14px;background-color:rgb(255, 255, 255);display:inline !important=
" class=3D"ContentPasted0">#
 lvm version</span><br style=3D"box-sizing:border-box;color:rgb(36, 36, 36)=
;font-family:-apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, syste=
m-ui, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Sego=
e UI Web&quot;, sans-serif;font-size:14px;background-color:rgb(255, 255, 25=
5)" class=3D"ContentPasted0">
</span></div>
<div><span><span style=3D"box-sizing:border-box;color:rgb(36, 36, 36);font-=
family:-apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, system-ui, =
&quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI W=
eb&quot;, sans-serif;font-size:14px;background-color:rgb(255, 255, 255)" cl=
ass=3D"ContentPasted0"><span style=3D"box-sizing:border-box" class=3D"Conte=
ntPasted0">&nbsp;&nbsp;</span>LVM
 version:<span style=3D"box-sizing:border-box" class=3D"ContentPasted0">&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;</span>2.02.176(2) (2017-11-03)</span><br style=
=3D"box-sizing:border-box;color:rgb(36, 36, 36);font-family:-apple-system, =
BlinkMacSystemFont, &quot;Segoe UI&quot;, system-ui, &quot;Apple Color Emoj=
i&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Web&quot;, sans-serif;f=
ont-size:14px;background-color:rgb(255, 255, 255)" class=3D"ContentPasted0"=
>
<span style=3D"box-sizing:border-box;color:rgb(36, 36, 36);font-family:-app=
le-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, system-ui, &quot;Apple=
 Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Web&quot;, s=
ans-serif;font-size:14px;background-color:rgb(255, 255, 255)" class=3D"Cont=
entPasted0"><span style=3D"box-sizing:border-box" class=3D"ContentPasted0">=
&nbsp;&nbsp;</span>Library
 version: 1.02.145 (2017-11-03)</span><br style=3D"box-sizing:border-box;co=
lor:rgb(36, 36, 36);font-family:-apple-system, BlinkMacSystemFont, &quot;Se=
goe UI&quot;, system-ui, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoj=
i&quot;, &quot;Segoe UI Web&quot;, sans-serif;font-size:14px;background-col=
or:rgb(255, 255, 255)" class=3D"ContentPasted0">
<span style=3D"box-sizing:border-box;color:rgb(36, 36, 36);font-family:-app=
le-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, system-ui, &quot;Apple=
 Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Web&quot;, s=
ans-serif;font-size:14px;background-color:rgb(255, 255, 255)" class=3D"Cont=
entPasted0"><span style=3D"box-sizing:border-box" class=3D"ContentPasted0">=
&nbsp;&nbsp;</span>Driver
 version:<span style=3D"box-sizing:border-box" class=3D"ContentPasted0">&nb=
sp;&nbsp;</span>4.41.0</span><br>
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
</body>
</html>

--_000_PUZP153MB075126926388815B6F9E1258AC229PUZP153MB0751APCP_--

--===============1581826126861241330==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

--===============1581826126861241330==--

