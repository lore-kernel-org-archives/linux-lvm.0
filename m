Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31616CCA48C
	for <linux-lvm@archiver.kernel.org>; Tue, 26 Jul 2022 08:16:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1658823372;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=8zNZCelfzEmtQ+UFUUbAuVbjxrGLIIazP20OO6oHsCc=;
	b=KnB7+MjzZtf0ucm9VfFKAHeM7jvsG96aJ157ySF4Kolw6WcUnsO0D3sRXkWE2ZyMZ2x9oG
	xuTrxLt8acRiEPZnBRBciRHZt578ELygObpKsE3u7CFber5DdPdirAweSfX514abLqVXwz
	d3yyIdQk35VpxB7RF1BZ4vj9sS/6fCE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-91-ArBqW69IOIezDrdzyX3mvw-1; Tue, 26 Jul 2022 04:16:09 -0400
X-MC-Unique: ArBqW69IOIezDrdzyX3mvw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6D7A9185A7A4;
	Tue, 26 Jul 2022 08:16:06 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2819D1121319;
	Tue, 26 Jul 2022 08:16:01 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id C5F1F1945D89;
	Tue, 26 Jul 2022 08:16:00 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 71E511947040
 for <linux-lvm@listman.corp.redhat.com>; Thu, 21 Jul 2022 11:40:48 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 63A01909FF; Thu, 21 Jul 2022 11:40:48 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5E5DC18ECB
 for <linux-lvm@redhat.com>; Thu, 21 Jul 2022 11:40:48 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 392C73C0E20E
 for <linux-lvm@redhat.com>; Thu, 21 Jul 2022 11:40:48 +0000 (UTC)
Received: from mx0b-00154904.pphosted.com (mx0b-00154904.pphosted.com
 [148.163.137.20]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-144-IlSmMMdtMhmRLXUhokDZpw-1; Thu, 21 Jul 2022 07:40:40 -0400
X-MC-Unique: IlSmMMdtMhmRLXUhokDZpw-1
Received: from pps.filterd (m0170394.ppops.net [127.0.0.1])
 by mx0b-00154904.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26L1AmGx019692
 for <linux-lvm@redhat.com>; Thu, 21 Jul 2022 02:52:13 -0400
Received: from mx0b-00154901.pphosted.com (mx0b-00154901.pphosted.com
 [67.231.157.37])
 by mx0b-00154904.pphosted.com (PPS) with ESMTPS id 3hbqw7upje-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linux-lvm@redhat.com>; Thu, 21 Jul 2022 02:52:13 -0400
Received: from pps.filterd (m0144103.ppops.net [127.0.0.1])
 by mx0b-00154901.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26L6TEG1030402
 for <linux-lvm@redhat.com>; Thu, 21 Jul 2022 02:52:12 -0400
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2175.outbound.protection.outlook.com [104.47.55.175])
 by mx0b-00154901.pphosted.com (PPS) with ESMTPS id 3herp7xche-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <linux-lvm@redhat.com>; Thu, 21 Jul 2022 02:52:12 -0400
Received: from DM6PR19MB2491.namprd19.prod.outlook.com (2603:10b6:5:189::11)
 by DM6PR19MB4107.namprd19.prod.outlook.com (2603:10b6:5:246::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.19; Thu, 21 Jul
 2022 06:52:10 +0000
Received: from DM6PR19MB2491.namprd19.prod.outlook.com
 ([fe80::3dff:7d1d:910b:c37e]) by DM6PR19MB2491.namprd19.prod.outlook.com
 ([fe80::3dff:7d1d:910b:c37e%6]) with mapi id 15.20.5458.019; Thu, 21 Jul 2022
 06:52:10 +0000
From: "Marappan, Gopinath" <Gopinath.Marappan@dell.com>
To: "linux-lvm@redhat.com" <linux-lvm@redhat.com>
Thread-Topic: Fix for Bug 2109351 - multipath_component_detection = 0 in
 lvm.conf does not have any effect
Thread-Index: Adicypyy/9MRvKNxS2ywvkLxoLBNNg==
Date: Thu, 21 Jul 2022 06:52:09 +0000
Message-ID: <DM6PR19MB249191C1C763815BDDFE998588919@DM6PR19MB2491.namprd19.prod.outlook.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_73dd1fcc-24d7-4f55-9dc2-c1518f171327_Enabled=true;
 MSIP_Label_73dd1fcc-24d7-4f55-9dc2-c1518f171327_SetDate=2022-07-21T06:52:08Z; 
 MSIP_Label_73dd1fcc-24d7-4f55-9dc2-c1518f171327_Method=Standard;
 MSIP_Label_73dd1fcc-24d7-4f55-9dc2-c1518f171327_Name=No Protection (Label
 Only) - Internal Use;
 MSIP_Label_73dd1fcc-24d7-4f55-9dc2-c1518f171327_SiteId=945c199a-83a2-4e80-9f8c-5a91be5752dd;
 MSIP_Label_73dd1fcc-24d7-4f55-9dc2-c1518f171327_ActionId=f3420115-3118-4313-b210-70113e47feb9;
 MSIP_Label_73dd1fcc-24d7-4f55-9dc2-c1518f171327_ContentBits=2
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a7d20790-eb4c-432b-16c4-08da6ae5889d
x-ms-traffictypediagnostic: DM6PR19MB4107:EE_
x-exotenant: 2khUwGVqB6N9v58KS13ncyUmMJd8q4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0
x-microsoft-antispam-message-info: TR74duRzqjVua4benMF8nSFZ864Ftg6mKWpJWGHaiMg42tS88+2cCm6ThZ6VJKJ04wSe6k8NlD2BNgVAGAnItxMJSudgi3LahQdcSWlFvwKf+R9ud0I5x7QHfmfRQ6HTzzXeOJQv+vmPEsR7QIby3vBeQaY0GfJdzHuH+KHuxVy7j5fGjyR5m/djHgG5ZWj1cIfEDmg6kUrf7T2VuHt11pC3+fz35x+TtnbAaQYFkqTgD6fC22vNMlWCnYPtEHgr/4p2rdq13qSqTgtaI9QiWHWoOTe5rFLTWvJtL29c0VPL1Tn74QJWoc7JJUBNrREAfDG4p8xmpaWOZ1LYgCbgRvWlzyeHEb1sY5PW+CLvt9C6+yhaaM0mfsjYQ1unREA7L4oEsCGwjivzbTChdthOfKlv/BTGFnp47nXglmv5Jw8Qlzs6+IWeUcg8doJRc1lZI5r04Bc9wrCIB6tctsFvL04KpHFNg6mbsGSh0ojxFlDtM36aM4XMw/74LyojfFYQQHfZlOxZlhE5wgFGF0yZuRxfTOLSpfLafkKdq6eg73Pi07i6lCKf6ekma8+9Qhn/D5uzBW8Z59TMfWcec9pUyqsbhTEuKDRUuAqiEZc//CXlilRrBHF2unQns/rouOyOINhQqCFz3q+KMFVvnlbVj6FfHMC8zy5voz1SBn97oJSscw4yKuYpToOZWbKKLPCqlqGZEI7NFJWTkbAM2bqptTXdpUaF22IWk+Z3gDW8KSLqH3nd/ge2mRB6Z5wPRuGe93s9bhfP2Ryo75B+MydJfXny3lh4TKW1udbGN86VlhNjpKHBf10Pi/TnRIEHkygwrGUwAWhGNMx5lt+r8Ik65g==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR19MB2491.namprd19.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(376002)(39860400002)(366004)(396003)(346002)(136003)(478600001)(71200400001)(86362001)(6506007)(7696005)(55236004)(26005)(9686003)(966005)(786003)(41300700001)(122000001)(38100700002)(316002)(55016003)(54906003)(6916009)(38070700005)(166002)(82960400001)(186003)(107886003)(83380400001)(8676002)(64756008)(66446008)(4326008)(5660300002)(8936002)(66946007)(2906002)(52536014)(33656002)(66476007)(66556008)(76116006);
 DIR:OUT; SFP:1101
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?YUbPhs436vpE3j+hgELnARWezqtHwC/RD0DMbZiom1E1NZGHYlocJh3AkzxR?=
 =?us-ascii?Q?xqmkLWaIO0t2jvhlzWsXYZHNSQY4g2Iu57A+4Fi6DKQ2rzlF8UvaErM8eJ+R?=
 =?us-ascii?Q?Cc2OuV02ZLeO1jbk9hd3fHH8BY1POThE5dqVy2wyr6gLCG6mC56YSQP0YyCs?=
 =?us-ascii?Q?uRnD9daPBx+GjWI4IPGfwpdDVwmv/Brzl44opq9viIeQDqOf+HgxINW/tXY/?=
 =?us-ascii?Q?sOmG/KBqsbyh/Nbq2nOX08+077YqtuADlvuBXxbuxyEQbREnB65FXPNJrKSE?=
 =?us-ascii?Q?7+QBn6jy9AoOUcTBPH5+fjsGTr6CG23lEtY05VBLrrmoNKJTVEFeIVHL1F7S?=
 =?us-ascii?Q?CghKfCLmerifDU90t3Dui444WqJUxi8HI113t84ownWtNV3Ig2r4bGaejk3X?=
 =?us-ascii?Q?2enW/UvgqqPv+O0++vExXT6Ozf/wuU1Bn0kNkTl88yY6PI4VU97Ez9kX/gH6?=
 =?us-ascii?Q?DbmSmS2oyMfhpQ8nwH5XLOFgSxMUCrssnTS4cg0DdF1yNnd3UPYjZfx+399L?=
 =?us-ascii?Q?irxedg4yNSvsAnXgG0f/KGtUkTmt5Kuv69vopdcKAGK3pFRjF4tvdi02d5gY?=
 =?us-ascii?Q?2S+XZHyeFVnw6FHPgjiBXtKwVp0S4nUy5o28i60WmfIw5t/2McpHa3VkV0K4?=
 =?us-ascii?Q?KbBZx7SM7wd2kW3NwmuWlWlE/mUcRhwmobanPGumncE7olecq8hayTjpmJVT?=
 =?us-ascii?Q?vht31Mp/RCOgIOg4sZCVR9FxZa6gATexktJRNMhp+BlvhxoH6GEgaSs/G+G1?=
 =?us-ascii?Q?OObotH7U91nh0j1wvTSakQ0a5HASnsg6aiFrPvD5Mw83KB5I2ucLCZ5zyr9x?=
 =?us-ascii?Q?LopryE9d33r7LZW1Cflz73Md7ah55uP29YHhDhkKUsD51VoyrHeYjc3GNk4U?=
 =?us-ascii?Q?FJhIm3Q18AH2Whd4i8e/+5tHbH/QeA3OmSrfZRG+oRAijfmpsfq3NcLOyV94?=
 =?us-ascii?Q?dLF3BDSFWhdwLs4Wf2K7HRDX6KD+Uw6gYPu7TEEPk4Z0izP+g3Ug15Iv7Bog?=
 =?us-ascii?Q?VEA5pTWKGblnO9vOsNIngDOyTng5ziSZcN1aRjZ5RLY150gZ9uhOf6EeR9hb?=
 =?us-ascii?Q?KZQVs++al+bi3E7d5P7OSTjPMbEOif+edD71w4iUlVzWlQg6/zz1Wd4fS8Hm?=
 =?us-ascii?Q?z8xsBbsFNj+EueQnjUFXwlCAuvWi4U6k7X44VkMufPJVasQJ5QJZM7YNaTXo?=
 =?us-ascii?Q?kOmuUn4EQZe9n/Ygej7VvRAEh3jsNioobqvq8FCT+wbQwdNWesDAd34YQckX?=
 =?us-ascii?Q?MXRnhGibUQWLT6K/w4DcrtN1gwRVThkqR81M6PF+QQQb0RRoJZn4DAuX5SfZ?=
 =?us-ascii?Q?8PWy5CAfD6m3Rmcb75DDyKM4pI7rlau2izSI93NAm+Y5wB0bK+9OsNXgHCw7?=
 =?us-ascii?Q?FPIVKFkOxgBeV9s+UnWqXO2voAAcCoznSCmSfw8jhPRe+oPAS6oODNTDmNhO?=
 =?us-ascii?Q?uQLBCrc8RfsV0dfxLRlEquUfPSeM6KJBozXaAhExpUo3h4VAIwbIoEQ9HjId?=
 =?us-ascii?Q?T4JYgWCLNwXIOfUYBmyAS73pjN2OHdbb0k+zHS2M11RPSkgq6SO7oAx/G0ln?=
 =?us-ascii?Q?jUCal/lrdRrIq0AauIqzBV1gE+hclpfwK5j43VuF?=
MIME-Version: 1.0
X-OriginatorOrg: Dell.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR19MB2491.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7d20790-eb4c-432b-16c4-08da6ae5889d
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jul 2022 06:52:09.7772 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 945c199a-83a2-4e80-9f8c-5a91be5752dd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /N/wZBo31Jsvm/VAF9oMpYL2vqMuDpUcMebg1ZmBsJPvbRFB3x7FbLvoyfvAhPc49nH6geU8OV9SoDOWxvJwmFFHIPPwh47r20twE+6Ej74=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR19MB4107
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-20_12,2022-07-20_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 adultscore=0
 lowpriorityscore=0 mlxscore=0 spamscore=0 bulkscore=0 phishscore=0
 priorityscore=1501 mlxlogscore=999 impostorscore=0 malwarescore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207210026
X-Proofpoint-GUID: CYM2m3Qa51mdK0gyHg8mj42kQPOS3IBv
X-Proofpoint-ORIG-GUID: CYM2m3Qa51mdK0gyHg8mj42kQPOS3IBv
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 mlxlogscore=999
 malwarescore=0 bulkscore=0 spamscore=0 suspectscore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207210026
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Mailman-Approved-At: Tue, 26 Jul 2022 08:15:59 +0000
Subject: [linux-lvm] Fix for Bug 2109351 - multipath_component_detection = 0
 in lvm.conf does not have any effect
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
Cc: "parakunnath, remesh" <Remesh.Parakunnath@dell.com>, "Rajappa,
 Ajaykumar" <Ajaykumar.Rajappa@Dell.com>, "Tarikere,
 Madhu" <Madhu.Tarikere@dell.com>
Errors-To: linux-lvm-bounces@redhat.com
Sender: "linux-lvm" <linux-lvm-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: multipart/mixed; boundary="===============7366507079129999195=="

--===============7366507079129999195==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_DM6PR19MB249191C1C763815BDDFE998588919DM6PR19MB2491namp_"

--_000_DM6PR19MB249191C1C763815BDDFE998588919DM6PR19MB2491namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Regarding a fix for this bug -  https://bugzilla.redhat.com/show_bug.cgi?id=
=3D2109351

multipath_component_detection parameter is not considered when lvm scans fo=
r PVs.

This patch should fix that issue.  It ensures that the multipath_component_=
detction parameter
from lvm.conf is considered before checking for duplicated PVIDs and ignori=
ng them if they are
multipath components.

I have built the patch and verified that it works.

diff --git a/lib/cache/lvmcache.c b/lib/cache/lvmcache.c
index 22edcfd84..892636aa7 100644
--- a/lib/cache/lvmcache.c
+++ b/lib/cache/lvmcache.c
@@ -898,7 +898,8 @@ next:
        /*
         * Get rid of multipath components based on matching wwids.
         */
-       if (_all_multipath_components(cmd, info, pvid, &altdevs, &dev_mpath=
)) {
+        if ( find_config_tree_bool(cmd, devices_multipath_component_detect=
ion_CFG, NULL) &&
+             _all_multipath_components(cmd, info, pvid, &altdevs, &dev_mpa=
th) ){
                if (info && dev_mpath && (info->dev !=3D dev_mpath)) {
                        /*
                         * info should be dropped from lvmcache and info->d=
ev

I tried to create a pull request on https://github.com/lvmteam/lvm2, but I =
couldn't as I don't have access.

If I am granted access to the lvm2 github repo, I can create a PR for this =
patch.

Kindly let me know how to proceed with this.

Thanks,
Gopi



Internal Use - Confidential

--_000_DM6PR19MB249191C1C763815BDDFE998588919DM6PR19MB2491namp_
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
=09{font-family:DengXian;
=09panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
=09{font-family:Calibri;
=09panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
=09{font-family:"\@DengXian";
=09panose-1:2 1 6 0 3 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
=09{margin:0in;
=09font-size:11.0pt;
=09font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
=09{mso-style-priority:99;
=09color:#0563C1;
=09text-decoration:underline;}
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
<p class=3D"MsoNormal">Regarding a fix for this bug -&nbsp; <a href=3D"http=
s://bugzilla.redhat.com/show_bug.cgi?id=3D2109351">
https://bugzilla.redhat.com/show_bug.cgi?id=3D2109351</a><o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">multipath_component_detection parameter is not consi=
dered when lvm scans for PVs.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">This patch should fix that issue.&nbsp; It ensures t=
hat the multipath_component_detction parameter<o:p></o:p></p>
<p class=3D"MsoNormal">from lvm.conf is considered before checking for dupl=
icated PVIDs and ignoring them if they are<o:p></o:p></p>
<p class=3D"MsoNormal">multipath components.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I have built the patch and verified that it works.<o=
:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in"><span style=3D"font-famil=
y:&quot;Courier New&quot;">diff --git a/lib/cache/lvmcache.c b/lib/cache/lv=
mcache.c<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in"><span style=3D"font-famil=
y:&quot;Courier New&quot;">index 22edcfd84..892636aa7 100644<o:p></o:p></sp=
an></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in"><span style=3D"font-famil=
y:&quot;Courier New&quot;">--- a/lib/cache/lvmcache.c<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in"><span style=3D"font-famil=
y:&quot;Courier New&quot;">+++ b/lib/cache/lvmcache.c<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in"><span style=3D"font-famil=
y:&quot;Courier New&quot;">@@ -898,7 +898,8 @@ next:<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in"><span style=3D"font-famil=
y:&quot;Courier New&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /*<o:=
p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in"><span style=3D"font-famil=
y:&quot;Courier New&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 * Get rid of multipath components based on matching wwids.<o:p></o:p></spa=
n></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in"><span style=3D"font-famil=
y:&quot;Courier New&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 */<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in"><span style=3D"font-famil=
y:&quot;Courier New&quot;">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (_all_m=
ultipath_components(cmd, info, pvid, &amp;altdevs, &amp;dev_mpath)) {<o:p><=
/o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in"><span style=3D"font-famil=
y:&quot;Courier New&quot;">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (=
 find_config_tree_bool(cmd, devices_multipath_component_detection_CFG, NULL=
) &amp;&amp;<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in"><span style=3D"font-famil=
y:&quot;Courier New&quot;">+&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;_all_multipath_components(cmd, info, pvid, &amp;a=
ltdevs, &amp;dev_mpath) ){<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in"><span style=3D"font-famil=
y:&quot;Courier New&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (info &amp;&amp; dev_mpath &a=
mp;&amp; (info-&gt;dev !=3D dev_mpath)) {<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in"><span style=3D"font-famil=
y:&quot;Courier New&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; /*<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in"><span style=3D"font-famil=
y:&quot;Courier New&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; * info should be dropped from lvmcache and info-&gt;d=
ev</span><o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I tried to create a pull request on <a href=3D"https=
://github.com/lvmteam/lvm2">
https://github.com/lvmteam/lvm2</a>, but I couldn&#8217;t as I don&#8217;t =
have access.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">If I am granted access to the lvm2 github repo, I ca=
n create a PR for this patch.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Kindly let me know how to proceed with this.<o:p></o=
:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks,<o:p></o:p></p>
<p class=3D"MsoNormal">Gopi<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<br>
<p class=3D"msipfooter90245289" align=3D"Left" style=3D"margin:0"><span sty=
le=3D"font-size:7.0pt;font-family:Calibri;color:#737373">Internal Use - Con=
fidential</span></p>
</div>
</body>
</html>

--_000_DM6PR19MB249191C1C763815BDDFE998588919DM6PR19MB2491namp_--

--===============7366507079129999195==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

--===============7366507079129999195==--

