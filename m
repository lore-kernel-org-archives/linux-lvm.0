Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55215C433F5
	for <linux-lvm@archiver.kernel.org>; Mon,  7 Mar 2022 14:14:19 +0000 (UTC)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-91-BjS-ZmguPpCaf7XwHODMFA-1; Mon, 07 Mar 2022 09:14:14 -0500
X-MC-Unique: BjS-ZmguPpCaf7XwHODMFA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 352171C05AE8;
	Mon,  7 Mar 2022 14:14:12 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A8A36400E123;
	Mon,  7 Mar 2022 14:14:06 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 6B3AF19305A0;
	Mon,  7 Mar 2022 14:14:05 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id AA92A1931BE9
 for <linux-lvm@listman.corp.redhat.com>; Mon,  7 Mar 2022 12:54:13 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 6FBEA112132D; Mon,  7 Mar 2022 12:54:13 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5D41E1121339
 for <linux-lvm@redhat.com>; Mon,  7 Mar 2022 12:53:54 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0661A19705B4
 for <linux-lvm@redhat.com>; Mon,  7 Mar 2022 12:53:54 +0000 (UTC)
Received: from mx0b-00154904.pphosted.com (mx0b-00154904.pphosted.com
 [148.163.137.20]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-656-65cSM_mrOHKEUL07kL2D1A-1; Mon, 07 Mar 2022 07:53:51 -0500
X-MC-Unique: 65cSM_mrOHKEUL07kL2D1A-1
Received: from pps.filterd (m0170394.ppops.net [127.0.0.1])
 by mx0b-00154904.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 2276T03w014900
 for <linux-lvm@redhat.com>; Mon, 7 Mar 2022 06:09:41 -0500
Received: from mx0a-00154901.pphosted.com (mx0a-00154901.pphosted.com
 [67.231.149.39])
 by mx0b-00154904.pphosted.com (PPS) with ESMTPS id 3em3a9cqn6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linux-lvm@redhat.com>; Mon, 07 Mar 2022 06:09:41 -0500
Received: from pps.filterd (m0142693.ppops.net [127.0.0.1])
 by mx0a-00154901.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 227B7a01052228
 for <linux-lvm@redhat.com>; Mon, 7 Mar 2022 06:09:40 -0500
Received: from nam02-sn1-obe.outbound.protection.outlook.com
 (mail-sn1anam02lp2049.outbound.protection.outlook.com [104.47.57.49])
 by mx0a-00154901.pphosted.com with ESMTP id 3emnpq1hky-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <linux-lvm@redhat.com>; Mon, 07 Mar 2022 06:09:40 -0500
Received: from DM6PR19MB2490.namprd19.prod.outlook.com (2603:10b6:5:181::20)
 by BLAPR19MB4548.namprd19.prod.outlook.com (2603:10b6:208:287::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.15; Mon, 7 Mar
 2022 11:09:38 +0000
Received: from DM6PR19MB2490.namprd19.prod.outlook.com
 ([fe80::40b:a9c2:a25c:47d1]) by DM6PR19MB2490.namprd19.prod.outlook.com
 ([fe80::40b:a9c2:a25c:47d1%7]) with mapi id 15.20.5038.026; Mon, 7 Mar 2022
 11:09:38 +0000
From: "Gaikwad, Hemant" <H.Gaikwad@dell.com>
To: "linux-lvm@redhat.com" <linux-lvm@redhat.com>
Thread-Topic: Need inputs: Performance issues with LVM snapshots
Thread-Index: AdgyE9RdTKl4JFF7SIOhv4yxvBam1Q==
Date: Mon, 7 Mar 2022 11:09:38 +0000
Message-ID: <DM6PR19MB2490CE0E86DFA205D3DE99ABF5089@DM6PR19MB2490.namprd19.prod.outlook.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_73dd1fcc-24d7-4f55-9dc2-c1518f171327_Enabled=true;
 MSIP_Label_73dd1fcc-24d7-4f55-9dc2-c1518f171327_SetDate=2022-03-07T11:09:35Z; 
 MSIP_Label_73dd1fcc-24d7-4f55-9dc2-c1518f171327_Method=Standard;
 MSIP_Label_73dd1fcc-24d7-4f55-9dc2-c1518f171327_Name=No Protection (Label
 Only) - Internal Use;
 MSIP_Label_73dd1fcc-24d7-4f55-9dc2-c1518f171327_SiteId=945c199a-83a2-4e80-9f8c-5a91be5752dd;
 MSIP_Label_73dd1fcc-24d7-4f55-9dc2-c1518f171327_ActionId=f9f786d2-b33c-435c-8b9f-bfb31a17d615;
 MSIP_Label_73dd1fcc-24d7-4f55-9dc2-c1518f171327_ContentBits=2
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8352a9be-4059-4940-5273-08da002af85e
x-ms-traffictypediagnostic: BLAPR19MB4548:EE_
x-microsoft-antispam-prvs: <BLAPR19MB4548937566F73DA5B514F8D0F5089@BLAPR19MB4548.namprd19.prod.outlook.com>
x-exotenant: 2khUwGVqB6N9v58KS13ncyUmMJd8q4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0
x-microsoft-antispam-message-info: SOWNTB+RVCoeSZlp1lXzPiKf1OSHSoSWTNt/h6lWBkK+wzec+hFE7SXzyrN4ZZtEubmgxQ2ywKr5CyB53g1eTS2q4PijwEerQFlsS7Iz1r0dN+PUxOiqLuVG73EpjoJpSC5SgjBj0mOq2WrzGaks4RsrckfAIL+MQBKqUfX6XDCw4C1c3TDBl8mabVe6oAHzpPgi5HdHYyAAKOTb3ceM45vwhHWjsZFkByZ8WeqefJCXiH+/zC9bJOFRJ3E5QjqH4VIEhJ6nuNVQx16kD4F34kdJDnUjQMqhtUji0ggNubXRQxvoivW+mFDbQ3WW6u2et2jNe+XPvi/pPty6xf9I86fBFByr99yeVelNr63/vsbBkSWJZKQiaFRnGTTZCZBP928yGUzB/bSajdRkONxUeQCJRHyo0+hEzmVrpw3dpcXxvLyCaG1AqlgxEbrBm3fYgn0xlO+znnl36rTwDSxhv6KhuSJn4yrJMUVC3rdrBawtQ8hGbCHJDesK+B9MDitL0OMwzHe66EeaFgEXtyFxS6Jw9pId1mW/YQEL+l42i4rs5fF36Bqh8p8zA0xI7lFQZa9wRUPcOLZN3nhuR9G1Jynr1bvhnA45vvhJ8MprT5OH4YPvWU7RhoRzosDT9x1+YhsmO37HuZuYb3EPsIefyMz4FhY82y4r3IhOFWKSvJ1tboxRgT4rly2ytHjhYssrrFTcxcHQa2Ik5QjUP1EDxw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR19MB2490.namprd19.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6916009)(82960400001)(786003)(38100700002)(316002)(9326002)(71200400001)(33656002)(26005)(9686003)(186003)(508600001)(6506007)(7696005)(5660300002)(8936002)(122000001)(2906002)(55016003)(64756008)(66476007)(66556008)(66446008)(8676002)(76116006)(4744005)(66946007)(52536014)(86362001)(38070700005);
 DIR:OUT; SFP:1101
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?i5S5U3WXwKEJ1AOjLbYSOD1JtMQMTla5XhLKuxvmQzIRgiY5MgVs7MhX3qld?=
 =?us-ascii?Q?ktWbGt0xX7SCbn1cLykZUBK1VIFR7Cti5K4Pt+hhKNpaoVRRgOTJC3Ea4Hc7?=
 =?us-ascii?Q?gUqUwBmyWsvI2T00ijbLuhZl2T7zU2QEyKR5iHaMmB+4wwjY53TAtxl/4XSc?=
 =?us-ascii?Q?GwGVV9D/ujWwDW7jjBZe4oHxL4kRZ6J1CryDyVdl15jZpr6hAQx85Dwz4CJN?=
 =?us-ascii?Q?0MGR2JlA7WOmjhSaih5/LCRFvuiNyi3iPGZpCa3szI6nf0S5a7XVry1k+MKz?=
 =?us-ascii?Q?HqAW01Db3boyaF6/xxiHrsja7R+8BsvFnqQMLgcE5uTUTlA60+SnwN/1rbfI?=
 =?us-ascii?Q?GfLEXbcAO2OMlo1vEFT3ZfKPKSxt436VqVYENNmhHRkSfEEb1AFxpk5EPmWJ?=
 =?us-ascii?Q?18PMuehFVvcf6MV5Sy7+Zu7+1g/rNXahtPx+rKF3z6XThQaDMSUY6/CurGfl?=
 =?us-ascii?Q?saeQlEIUiEe4gp16OCbvmaKSLxgdAY0E+KgP4j4d+z/Ybky1/14s+bpGWjFP?=
 =?us-ascii?Q?Fk2mORsECKEmGgwJEq03OjvuA9+I4GOhoFw9+rNLHE9PreNtUgkei330rwfx?=
 =?us-ascii?Q?/iD5fdhNCQUoRrFdTSk4NlYIPhSyD6FZB8hCYbITHG2uRZ5/FVCWDronfQFA?=
 =?us-ascii?Q?7Vp1UFmKV6cp//PD8YTGMalalmC2NsJtP42TS/tdfnItKzcMFTBM3LgWvpzF?=
 =?us-ascii?Q?yi7k+n28eCvijm7HzoSBZteXgMtvSlGL1PNfuLpnRaMIqEGKD2kMJTde221Z?=
 =?us-ascii?Q?f4OISoO3gkNfRFZO0+XFVwlRmqhfrDiJNV4SbDbfZc+I3queJwxI1GOf41KX?=
 =?us-ascii?Q?EXmx2NKOa20KqUkeu2qz3lt1RCVtUcYo7rHE9H3IPgoohApUIRZfVWeBVRv7?=
 =?us-ascii?Q?aubYkk5W+pp61pyKRCsopvKSLJkTupw+CBby/XHGp/M6QFz8nZpCMwHshtZR?=
 =?us-ascii?Q?2OLrXNO1PPMEmhyBJMPqQkPza3+hHFcLKpvyzOdWdBRAVd7QCoh0eDw21EQY?=
 =?us-ascii?Q?PYpK9colhth28XpXDSIgqQ/tSYTBy3e6fEIgOfOcaTQjTfbeqWcMf+YBiw9z?=
 =?us-ascii?Q?9v2zQJtRDs+pSTtqUipk+olPQOluTNacxr4SijfMSG3yHP1UUnxwIsw6TDTW?=
 =?us-ascii?Q?tSJXxXQ3Yvu8ap827NMCqakA3pLiud7GUTDZtd79XBA+xTbwoCmcQo0S18Zf?=
 =?us-ascii?Q?Nj/uf0rT5lgZgK4uBf8rGf3Igzp80WZnMVsv54bZDxUbBsy61OOhDgxNNDMU?=
 =?us-ascii?Q?dSwLPtw2WdB7ghg+/H/8G3WBPT0jmtztXvY4Uwx/NbT2TdI3vr7OK1ex9TWs?=
 =?us-ascii?Q?Sy40y2tV04rjcK8dPZqR1k5r/8ZLksrRKttmX44bm2rg06TGc1BlxYRMo8YT?=
 =?us-ascii?Q?OHdnZlBO6WAdpq0kXKx6OYjUtpGrY/sKXgVr5fSJ6Dfo2OBUBkUhVPYzRvBg?=
 =?us-ascii?Q?RE5wdnIAMx1JnGxv8/jPoKC5kP+7P4ddQq/Jfkj1+DTxZdFWaUCputSnQSQH?=
 =?us-ascii?Q?eF0Jn0IZ6Mktv3xl9PAYWfqwBzpyp6ENDjHhyi8/JGwnEAUg0cR6wPZQVv1w?=
 =?us-ascii?Q?O2i36t0K703WEv9+ZXP5mscZwtA/uTgFU27QOPZ5j5tF8wUZ/grNfmo+7fxd?=
 =?us-ascii?Q?Aw=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: Dell.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR19MB2490.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8352a9be-4059-4940-5273-08da002af85e
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Mar 2022 11:09:38.0810 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 945c199a-83a2-4e80-9f8c-5a91be5752dd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sSwOWYKJWcXvwvxDTRS+Dk91uj+mzX64i0x1OtcUmGjAKdYnHuQKAt3aqyHeO08dztcEJ0KQHAMkIEnfNqhi4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR19MB4548
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.425, 18.0.816
 definitions=2022-03-07_04:2022-03-03,
 2022-03-07 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0
 lowpriorityscore=0 mlxlogscore=381 phishscore=0 priorityscore=1501
 spamscore=0 suspectscore=0 adultscore=0 impostorscore=0 clxscore=1011
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203070064
X-Proofpoint-ORIG-GUID: 26GKT6OQG_-1SGBWll0bnbHfe1MR5rqW
X-Proofpoint-GUID: 26GKT6OQG_-1SGBWll0bnbHfe1MR5rqW
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 spamscore=0 mlxlogscore=528
 adultscore=0 phishscore=0 malwarescore=0 mlxscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2203070065
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Mailman-Approved-At: Mon, 07 Mar 2022 14:14:04 +0000
Subject: [linux-lvm] Need inputs: Performance issues with LVM snapshots
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
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: multipart/mixed; boundary="===============7566562463451006939=="

--===============7566562463451006939==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_DM6PR19MB2490CE0E86DFA205D3DE99ABF5089DM6PR19MB2490namp_"

--_000_DM6PR19MB2490CE0E86DFA205D3DE99ABF5089DM6PR19MB2490namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,
We have been looking at LVM as an option for long term backup using the LVM=
 snapshots. After looking at the various forums and also looking at a few L=
VM defects, realized that LVM could be a very good option for short term ba=
ckup, but might result in performance issues if the snapshots are retained =
for a long time. Also read we should restrict the number of snapshots. We a=
re thinking of keeping it to 3, but do you think that could also be a perfo=
rmance bottleneck. A few forum posts also suggest memory issues with using =
LVM snapshots. Can you please help with some data on that too. Thanks in ad=
vance for making our decision easier. Thanks

Regards,
Hemant Gaikwad


Internal Use - Confidential

--_000_DM6PR19MB2490CE0E86DFA205D3DE99ABF5089DM6PR19MB2490namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
=09{font-family:"Cambria Math";
=09panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
=09{font-family:Calibri;
=09panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
=09{margin:0in;
=09font-size:11.0pt;
=09font-family:"Calibri",sans-serif;}
span.EmailStyle17
=09{mso-style-type:personal-compose;
=09font-family:"Calibri",sans-serif;
=09color:windowtext;}
.MsoChpDefault
=09{mso-style-type:export-only;
=09font-family:"Calibri",sans-serif;}
@page WordSection1
=09{size:8.5in 11.0in;
=09margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
=09{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hi,<o:p></o:p></p>
<p class=3D"MsoNormal">We have been looking at LVM as an option for long te=
rm backup using the LVM snapshots. After looking at the various forums and =
also looking at a few LVM defects, realized that LVM could be a very good o=
ption for short term backup, but might
 result in performance issues if the snapshots are retained for a long time=
. Also read we should restrict the number of snapshots. We are thinking of =
keeping it to 3, but do you think that could also be a performance bottlene=
ck. A few forum posts also suggest
 memory issues with using LVM snapshots. Can you please help with some data=
 on that too. Thanks in advance for making our decision easier. Thanks<o:p>=
</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Regards,<o:p></o:p></p>
<p class=3D"MsoNormal">Hemant Gaikwad<o:p></o:p></p>
<br>
<p class=3D"msipfooter90245289" align=3D"Left" style=3D"margin:0"><span sty=
le=3D"font-size:7.0pt;font-family:Calibri;color:#737373">Internal Use - Con=
fidential</span></p>
</div>
</body>
</html>

--_000_DM6PR19MB2490CE0E86DFA205D3DE99ABF5089DM6PR19MB2490namp_--

--===============7566562463451006939==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

--===============7566562463451006939==--

