Return-Path: <SRS0=nGmI=NY=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCB89C432BE
	for <linux-lvm@archiver.kernel.org>; Thu,  2 Sep 2021 07:19:02 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 72E7C60FDA
	for <linux-lvm@archiver.kernel.org>; Thu,  2 Sep 2021 07:19:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 72E7C60FDA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=windriver.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=redhat.com
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-42-dWdOY6EbN3CybNlc6zSC0w-1; Thu, 02 Sep 2021 03:18:59 -0400
X-MC-Unique: dWdOY6EbN3CybNlc6zSC0w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4489F1854E21;
	Thu,  2 Sep 2021 07:18:53 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 72DC75D9DC;
	Thu,  2 Sep 2021 07:18:48 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1AB3F4EA62;
	Thu,  2 Sep 2021 07:18:40 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1823dOd4006701 for <linux-lvm@listman.util.phx.redhat.com>;
	Wed, 1 Sep 2021 23:39:24 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 2A3E3112C084; Thu,  2 Sep 2021 03:39:24 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 254FB112C07B
	for <linux-lvm@redhat.com>; Thu,  2 Sep 2021 03:39:21 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 47A6B800963
	for <linux-lvm@redhat.com>; Thu,  2 Sep 2021 03:39:21 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
	[205.220.178.238]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-551-8q7ETZ3qM9upvuWIRz2bjw-1; Wed, 01 Sep 2021 23:39:19 -0400
X-MC-Unique: 8q7ETZ3qM9upvuWIRz2bjw-1
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id
	1823NbNs014815
	for <linux-lvm@redhat.com>; Thu, 2 Sep 2021 03:26:45 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com
	(mail-bn7nam10lp2100.outbound.protection.outlook.com [104.47.70.100])
	by mx0a-0064b401.pphosted.com with ESMTP id 3atdx48bd3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT)
	for <linux-lvm@redhat.com>; Thu, 02 Sep 2021 03:26:45 +0000
Received: from PH0PR11MB5014.namprd11.prod.outlook.com (2603:10b6:510:31::17)
	by PH0PR11MB4774.namprd11.prod.outlook.com (2603:10b6:510:40::9) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.23;
	Thu, 2 Sep 2021 03:26:43 +0000
Received: from PH0PR11MB5014.namprd11.prod.outlook.com
	([fe80::dd24:d36a:f979:58e8]) by
	PH0PR11MB5014.namprd11.prod.outlook.com
	([fe80::dd24:d36a:f979:58e8%8]) with mapi id 15.20.4457.024;
	Thu, 2 Sep 2021 03:26:42 +0000
From: "Yu, Mingli" <Mingli.Yu@windriver.com>
To: "linux-lvm@redhat.com" <linux-lvm@redhat.com>
Thread-Topic: The size specified by "lvcreate -L" is not accurate
Thread-Index: AQHXn6kuV+SO08DWY0SjQqcj4c0oyw==
Date: Thu, 2 Sep 2021 03:26:42 +0000
Message-ID: <PH0PR11MB501412E2C1081FA98208E545F1CE9@PH0PR11MB5014.namprd11.prod.outlook.com>
Accept-Language: en-US, en-AS, zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 228dfa7d-63be-4ba3-1364-08d96dc17c29
x-ms-traffictypediagnostic: PH0PR11MB4774:
x-microsoft-antispam-prvs: <PH0PR11MB47743B991C1A913F56CA9850F1CE9@PH0PR11MB4774.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0
x-microsoft-antispam-message-info: cFfBIR3RXy6Po7FI7euwU+5xeb2+wGE5zgUzLkTayzGQs7dDsKbqZs0opEE/Sl1NLxlMuYICLlRijanO1LZgFEzAawXALxH07/k7yzqAff6ZQpOFFdYfSgQ+ZymvBopmEDi917Fzi7VXNFr0n4VMoY8Oa/0iAvLpvULGjBj3JsHZZRhebp6KvkWP9cs+iF+m56BM05tjJJFqUiPSzDUfjHgO6gLhTHr/Gn4rti1JiQOQ75nV1ydSjBQIGGUtNxdeOCS8l5NzvBqjjqdZg0oa3EMsBWk1k9eu0yBxx+DUBinYiDgQCyGnPviLyvIsf4GtyJB4XPPDTqoNKIDSxOuWZ29zPSrcfl//2N1YmOzHOEqQM5RhPM3uJrdSB5KxpcH7JmmXMU+jz7OULr4RTX1iGbS6/q5hhSyjAWUmzZucvZH8TBGx1XztPz+1MV+WRMYiT+uE420GdzVsn/sYdZoYzzHtGJWsPRBst12WRTq6/0JS4uA1BNkI2Qyc6Z990nIDm2LBPtyC5nCjAYiD9pAb58qg44PmHCxKG2nmMlHQTE938lLZEM540CPH8MmQhEVy4VJsziYPUtXl67ocEsQPi1aaFOmKrJY63gpBj+HTAlTTAlUnYcELC8TAnSALPVoLlAx658JUtn4KMU3dM4kQkV++f9ydQ9+yy73jyHrsGrta3abC+y4dO7o6aYJj1/wsvmRd1JJeZodG6rf1K1p74xbFMNEKOUN/Z29AzDEzjHXd4TdDyayzA3RZ+15jFpa3bWQEli6a1uE1FJLKnQoX5g==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:PH0PR11MB5014.namprd11.prod.outlook.com;
	PTR:; CAT:NONE;
	SFS:(4636009)(396003)(136003)(39850400004)(346002)(376002)(366004)(186003)(26005)(33656002)(76116006)(64756008)(66946007)(66556008)(66476007)(66446008)(86362001)(6916009)(122000001)(38100700002)(8676002)(966005)(8936002)(52536014)(6506007)(38070700005)(7696005)(5660300002)(166002)(4744005)(316002)(55016002)(71200400001)(19627405001)(83380400001)(9686003)(478600001)(2906002);
	DIR:OUT; SFP:1101
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?on1298o0XEpcJyg4sijIijUXfdRjpIiWNaIOHNItdtQSlccVEZNA2D0Iry?=
	=?iso-8859-1?Q?PfLh7ThiAdgc7rE94eI04D1jyLGIKOkVca9lXo+WULAj4+EBeePSdXzKdh?=
	=?iso-8859-1?Q?UzcPuViMhCqLYHpVOo86xoZeJQnDg2UsI8HHd8JuT9I1bsgw6+EcplT3/2?=
	=?iso-8859-1?Q?Vd5vp7y5lz7yfHRE6y+LLTGtjUnBpS6KsID5DXmYRxgrP2ra8ED6C4+KLw?=
	=?iso-8859-1?Q?V5IGfkuYL4cKCt2k0uzt0CQosHlxTIhbOk8+PYBsjW2ixwU0Id2XkOkyZe?=
	=?iso-8859-1?Q?zG1le24TYReNPX6ZAtxcrgul6ITKQN5GXKeKhdXxeQPMEkQGk1367N71j4?=
	=?iso-8859-1?Q?ehc7KC/keGcIFFLIqWjhnyTBZuqVH3yKigbkdMq5pxDZUSpPO5Y5p4ZDKP?=
	=?iso-8859-1?Q?ghMs1iwVC+NhIw54mO/3AAVQoqnfVcAzwi2sfex4WAQOL5H+QV4zvs4qK0?=
	=?iso-8859-1?Q?cFQf+HMocTVtenxJfDvkCF4Q8dhvu9ElwF6l2eepqcLwbLlfFdvBTSEGEv?=
	=?iso-8859-1?Q?MA8Xj4udyoRd0dyZFgL7r6U7p7ubNRCgxe9g2I9zxIlbZH6YC9rvYY+udu?=
	=?iso-8859-1?Q?G1qOg2JaJvBqeNNf2L2h8vUkDLxfqm0XOwGcBmtIgOX5rgFxJ4CnioTsm8?=
	=?iso-8859-1?Q?C6nkCIHM1EM7MvcSwtNAfHZZ0e8+fZy3okuAgTaP/lopipW0motwmVG8K9?=
	=?iso-8859-1?Q?64iVRxFaRvU7ylQyVNuIAgRhQ2GrLJxHYoMKCHpMJEagmKiBYn0230KTkr?=
	=?iso-8859-1?Q?BxuvQTeGuJSHwQvd4F4tg/dfq+WVJxDCrMxXiTmMOsyfwSfnH0vcm/2eXU?=
	=?iso-8859-1?Q?pGQidW5DsQ+pGqAng+v0pXwUODyOxLBzsgxuFAPGv7VcWn4X7TcX7JSQ8/?=
	=?iso-8859-1?Q?dB+9i7YgKUOQgSqzDOxYukXXUPjAApOz07MjzKY1rKytwCV25wYZL+b2Op?=
	=?iso-8859-1?Q?HZIqsNnLxF+bhIx7a2GcLewRqBmHgo2BDoaxjKOWTpKaGVmqXoI2J8OEsk?=
	=?iso-8859-1?Q?xju9IRPF+Vnn7V0Z0jyVjrKCIPl71eQI43em3iBpU5CBD4EsV1UreUmUYM?=
	=?iso-8859-1?Q?/6skYWOlTqAHJc87MO3wJaigjfpvJBJTDt2c1TWrq6Ty2f1AOn3704VegP?=
	=?iso-8859-1?Q?sczinBbsDmxqDFf0H/T0OpN7lsHIbRRpsQEdb5ZU31/XWppvI0cCz0xYv9?=
	=?iso-8859-1?Q?wm+pIBDq0AUGlisUx9Sw6tQJ46binPcUoTNkbpZ9XXtYmE3sbYafu1L3C8?=
	=?iso-8859-1?Q?uI1frI8jNGA6v/Ry6QW9+EDwrJj0+Lzqd3sEgUxN+/RLntadw9p3jGOmPV?=
	=?iso-8859-1?Q?BBjQYfQT2/OG4TdUGp5PIqlVwliozTmQIiUwpcJ7E1Ktpqk=3D?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5014.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 228dfa7d-63be-4ba3-1364-08d96dc17c29
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Sep 2021 03:26:42.6976 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pohd+LIjx4B1aQbVpQbL66f2ArRUWqTSvjzcW6f1YP80hCHVQ8hqWTWCrUNtzmxIr7vxRpexrsfTYWDXNH+URw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4774
X-Proofpoint-GUID: rnKjYTizYIjouqW68AtWQw4_Apyrzp0F
X-Proofpoint-ORIG-GUID: rnKjYTizYIjouqW68AtWQw4_Apyrzp0F
X-Proofpoint-Virus-Version: vendor=baseguard
	engine=ICAP:2.0.182.1, Aquarius:18.0.790, Hydra:6.0.391,
	FMLib:17.0.607.475
	definitions=2021-09-01_05,2021-09-01_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	mlxscore=0 suspectscore=0
	priorityscore=1501 mlxlogscore=669 lowpriorityscore=0 impostorscore=0
	bulkscore=0 phishscore=0 spamscore=0 adultscore=0 clxscore=1011
	malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.12.0-2108310000 definitions=main-2109020019
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: linux-lvm@redhat.com
X-Mailman-Approved-At: Thu, 02 Sep 2021 03:11:19 -0400
Subject: [linux-lvm] The size specified by "lvcreate -L" is not accurate
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: multipart/mixed; boundary="===============0569140295310316891=="

--===============0569140295310316891==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_PH0PR11MB501412E2C1081FA98208E545F1CE9PH0PR11MB5014namp_"

--_000_PH0PR11MB501412E2C1081FA98208E545F1CE9PH0PR11MB5014namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Per https://git.kernel.org/pub/scm/fs/ext2/e2fsprogs.git/tree/doc/RelNotes/=
v1.46.4.txt, after e2fsprogs upgrades to 1.46.4, the defaults for mke2fs no=
w call for 256 byte inodes for all file systems (with the exception of file=
 systems for the GNU Hurd, which only supports 128 byte inodes) and use "lv=
create -L 50 -n lv_test1 vg_test && mke2fs /dev/vg_test/lv_test1" and then =
continue to check the partiontion as below.(use lvm2 2.03.11 for the test)
# df -h | grep dev/mapper/vg_test-lv_test1
/dev/mapper/vg_test-lv_test1   48M   14K   46M   1% /mnt/lv-test

Though claim 50M as above, but it turns out to be only 48M.

Thanks,

--_000_PH0PR11MB501412E2C1081FA98208E545F1CE9PH0PR11MB5014namp_
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
: 12pt; color: rgb(0, 0, 0);">
Per <a href=3D"https://git.kernel.org/pub/scm/fs/ext2/e2fsprogs.git/tree/do=
c/RelNotes/v1.46.4.txt" id=3D"LPlnk534373">
https://git.kernel.org/pub/scm/fs/ext2/e2fsprogs.git/tree/doc/RelNotes/v1.4=
6.4.txt</a>, after e2fsprogs upgrades to 1.46.4, the defaults for mke2fs no=
w call for 256 byte inodes for all file systems (with the exception of file=
 systems for the GNU Hurd, which
 only supports 128 byte inodes) and use &quot;lvcreate -L 50 -n lv_test1 vg=
_test &amp;&amp; mke2fs /dev/vg_test/lv_test1&quot; and then continue to ch=
eck the partiontion as below.(use lvm2 2.03.11 for the test)</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
# df -h | grep dev/mapper/vg_test-lv_test1<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
/dev/mapper/vg_test-lv_test1 &nbsp; 48M &nbsp; 14K &nbsp; 46M &nbsp; 1% /mn=
t/lv-test</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Though claim 50M as above, but it turns out to be only 48M.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Thanks,<br>
</div>
</body>
</html>

--_000_PH0PR11MB501412E2C1081FA98208E545F1CE9PH0PR11MB5014namp_--

--===============0569140295310316891==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
--===============0569140295310316891==--

