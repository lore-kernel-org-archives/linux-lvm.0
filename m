Return-Path: <SRS0=kfxi=LC=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 059B3C47082
	for <linux-lvm@archiver.kernel.org>; Tue,  8 Jun 2021 06:30:03 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 83C2E61246
	for <linux-lvm@archiver.kernel.org>; Tue,  8 Jun 2021 06:30:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 83C2E61246
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=linux-lvm-bounces@redhat.com
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-388-pvl4K9gAPlmIbweNYKXIkw-1; Tue, 08 Jun 2021 02:29:28 -0400
X-MC-Unique: pvl4K9gAPlmIbweNYKXIkw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 985A4801B16;
	Tue,  8 Jun 2021 06:29:23 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EB76F5D6D3;
	Tue,  8 Jun 2021 06:29:19 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8ED8D1804480;
	Tue,  8 Jun 2021 06:29:13 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 157FmfFR013859 for <linux-lvm@listman.util.phx.redhat.com>;
	Mon, 7 Jun 2021 11:48:41 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 164B4112D43D; Mon,  7 Jun 2021 15:48:41 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 11592112D43F
	for <linux-lvm@redhat.com>; Mon,  7 Jun 2021 15:48:38 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D0170101D221
	for <linux-lvm@redhat.com>; Mon,  7 Jun 2021 15:48:38 +0000 (UTC)
Received: from de-smtp-delivery-102.mimecast.com
	(de-smtp-delivery-102.mimecast.com [194.104.109.102]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-104-jM2z5xpVNPCbkhaMo2Y38w-1;
	Mon, 07 Jun 2021 11:48:34 -0400
X-MC-Unique: jM2z5xpVNPCbkhaMo2Y38w-1
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
	(mail-am5eur02lp2057.outbound.protection.outlook.com [104.47.4.57])
	(Using TLS) by relay.mimecast.com with ESMTP id
	de-mta-33-6UowCtRkO4-YYXDUfHsfrw-1; Mon, 07 Jun 2021 17:48:32 +0200
X-MC-Unique: 6UowCtRkO4-YYXDUfHsfrw-1
Received: from DB8PR04MB6555.eurprd04.prod.outlook.com (2603:10a6:10:103::20)
	by DBAPR04MB7317.eurprd04.prod.outlook.com (2603:10a6:10:1b3::15)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.23;
	Mon, 7 Jun 2021 15:48:30 +0000
Received: from DB8PR04MB6555.eurprd04.prod.outlook.com
	([fe80::1061:e932:29cc:2a38]) by
	DB8PR04MB6555.eurprd04.prod.outlook.com
	([fe80::1061:e932:29cc:2a38%7]) with mapi id 15.20.4195.030;
	Mon, 7 Jun 2021 15:48:30 +0000
From: Martin Wilck <martin.wilck@suse.com>
To: Heming Zhao <heming.zhao@suse.com>, "zkabelac@redhat.com"
	<zkabelac@redhat.com>, "teigland@redhat.com" <teigland@redhat.com>,
	"linux-lvm@redhat.com" <linux-lvm@redhat.com>
Thread-Topic: Discussion: performance issue on event activation mode
Thread-Index: AQHXWptdVb+iQI7pP06gMwUhQri0uKsIs+kA
Date: Mon, 7 Jun 2021 15:48:30 +0000
Message-ID: <d1d35f7dba3d0e887e7eac06a06ff2414a84c924.camel@suse.com>
References: <a885bfa7-9635-ba73-c16b-13b9ef7a2aa4@suse.com>
In-Reply-To: <a885bfa7-9635-ba73-c16b-13b9ef7a2aa4@suse.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.40.1
x-originating-ip: [2.206.153.60]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0c730ab9-be77-40c6-2fe7-08d929cbb300
x-ms-traffictypediagnostic: DBAPR04MB7317:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DBAPR04MB73174746CC73FAD717E94383FC389@DBAPR04MB7317.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0
x-microsoft-antispam-message-info: 0pGAIM6jF7qxx4IUoG2inQQRnG2Gk0sgK2z1cxlj6fh3GhEw+BbZVVje7g3g5J5cNTyF9na8eXi1/KnFI0KymNBR/ZT6q7JI70baKEFRCMnmhkq0YXxy3lsJ+5Z8/7ogEzuQTSvjtR0by4AzIEA63bK+wKaqS99IFp3XaMMvRX6JpfE3Ec2FOtPAyVq/9MkT/LclSmbi/8dyp0AE/HvTSO3SLD1kiJ8pMGpYN4HeURlKYSqmyXJnOYLbfp4uWtNyS2s46XdLdCCnyWE/JyOBRscogHc5C50RwWznvSrbZJs7r7iHv6hxeQ20Xyv5ftHu/D0McUQmZ+7ZCawg7KFFofO2PLHBcXu3pdPtD1/Zdn1zty+a8a0E/wM8R6XxIUb6Gn00LwrlsX/97a9Rirycnau7NWvSy2TffXlg780052BedqrdMmNBaAIUwkZbj4Wpbla1s4TZeF1/7ZZuxvc0YFTo52AubfTnoALHQqNkVg+0YZYczO74ZUpZwvO1Ddcu9s8Znaii4AbZ+n7JGUb9kY3PmaNYzigX2YdePO8PV0e7GkWNlR0/CymTahiwLdViB7l7d/bJ43VKcgA2jD2r8rsYftMr3bD1mGwZsqV4REg=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:DB8PR04MB6555.eurprd04.prod.outlook.com;
	PTR:; CAT:NONE;
	SFS:(136003)(376002)(346002)(396003)(39860400002)(366004)(71200400001)(2906002)(36756003)(5660300002)(4744005)(186003)(26005)(44832011)(6512007)(6486002)(86362001)(110136005)(8676002)(83380400001)(6506007)(122000001)(66946007)(66556008)(66446008)(64756008)(91956017)(76116006)(450100002)(66476007)(38100700002)(478600001)(8936002)(316002)(2616005);
	DIR:OUT; SFP:1101
x-ms-exchange-antispam-messagedata: =?iso-8859-15?Q?INd8SDxDfpWJUOj4/uLjOLeEHy/bGuo9w9/hJYuAi9StWWPTeD7uDrwpT?=
	=?iso-8859-15?Q?Ro7C7gzrkPk2t7JYQzCS2kOICGBQxaijotyX1CDagTmqQgEnggK5wfySr?=
	=?iso-8859-15?Q?W7EzPb5Pwl6evJgv4hot04F4Z7YDFCuY6j5fGvsLGhm5K93kC34eGGBDS?=
	=?iso-8859-15?Q?6gN+tvLCG3GLzcJb4RGbz54gP5oKN6fhNWGGYuYpdbht/dKkW2KKc7bI4?=
	=?iso-8859-15?Q?LXS/aeDYKAMNWPp8SZ8NSwMBNUgN4pJQ1EaygcK9+5X49HtqvQXEUuqri?=
	=?iso-8859-15?Q?3nTa/mqqM7j28ZHYwdwOrJGiXTmy4chdM2jsXfzqZRZyE2SiWWEAQAoLi?=
	=?iso-8859-15?Q?vWqMFpjtnkSxi3f1yIN3Bk03uqLXy4gZYp3xRb+pyioMCqd9hfUEttv3N?=
	=?iso-8859-15?Q?LgMIfkeAN1Z/v0UgI9MfctiqIOTOCYMIjq6qGGmAzC7TTWkLqpUegeUyv?=
	=?iso-8859-15?Q?ls6gUM893IMnTUPLBwJVf8mCCd4pfTRdRE9L8wlZ6FfT2X9uKPYEOP3qc?=
	=?iso-8859-15?Q?2LnSDZjemLIuIuxh8L6F9xVrlSwLqVsJgVhE2XJd45yQDfDin9oaN4/Sv?=
	=?iso-8859-15?Q?9995Psm1esNltV7vXFx1upxjdB58Y7wBkQxOY1u0HtYpqxRVEIsD4r+dq?=
	=?iso-8859-15?Q?uOBJGm3sY9eV6RHvEgNs9J2zt0PZrUOVPJeCjgfg/oKZDNtkd9X9HqrOZ?=
	=?iso-8859-15?Q?YfLLbqSizZwQrUnYUXZBrMisdLpCAN+XuJXdN8WZTAWNHxJvxaZWNW5S9?=
	=?iso-8859-15?Q?JQPJYnSLUG5L6cf/KWPa2UiThr8PxXu6l4rTb+NwlHxUWPrh2d+MkkrMY?=
	=?iso-8859-15?Q?vI7hXta0uRDRGnzn65ee+G2eUmxgKlYd/HZgCg72MkZg5IyvimbYARIQN?=
	=?iso-8859-15?Q?XDW9AJq+UNwVQY14VJUKOETEsoNQ/0xzxeOycw8mEBCoVkDPJ3ujbjO9v?=
	=?iso-8859-15?Q?MekU99SQry5AK5DCkEWIn86wwGzakqPy4qi00b5YStgE1PyR0AjwDE19u?=
	=?iso-8859-15?Q?/IM4TvdnTXXUbCx32ckxjhIXsxK761z+PFmor2ke88QJys9kfOrBjY++V?=
	=?iso-8859-15?Q?kDbZnDi/9P9qt706GL596sdZfxx3ptZK3Bzo/vrbFYcoLEflSQjMO/Ere?=
	=?iso-8859-15?Q?938MhfJba2cqtA9NCLhy1NYJEW7YwA8IHCp8brcBRjXZfbgQ6EMoovHsR?=
	=?iso-8859-15?Q?bG/EPP1Vuqpt8pPU3Z3udnNw7AZP13jqKsooCAy0cZptpyL5qQeOJAJD7?=
	=?iso-8859-15?Q?DP53Qb2zG1qFZnCZb/ZWbE988p0JxaXYNZ3RXGLh5YpTpsqVG/ZW24N1J?=
	=?iso-8859-15?Q?6aYdgEIqgojIwfsxgvC78+b60koRMkhSLIuL9nM8lAMWmsaWoArnh7FBN?=
	=?iso-8859-15?Q?1fJWOtdj1Ch2jrOQ2gLOqRN02glfTW8Jp?=
MIME-Version: 1.0
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB6555.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c730ab9-be77-40c6-2fe7-08d929cbb300
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jun 2021 15:48:30.7040 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: u9KYkv2L7BSGoTK44MZ+ugdDXRc+9tzMtseAgwsQKn9euJcmdtUY7DXOu5CpQjh5t5e/Qjw/e+gBfcfxylSPlg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7317
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 157FmfFR013859
X-loop: linux-lvm@redhat.com
X-Mailman-Approved-At: Tue, 08 Jun 2021 02:29:10 -0400
Subject: Re: [linux-lvm] Discussion: performance issue on event activation
	mode
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-ID: <57D75FE320E98F43954FB112DBD7D064@eurprd04.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On So, 2021-06-06 at 14:15 +0800, heming.zhao@suse.com wrote:
> 
> 1. During boot phase, lvm2 automatically swithes to direct activation
> mode
> ("event_activation = 0"). After booted, switch back to the event
> activation mode.
> 
> Booting phase is a speical stage. *During boot*, we could "pretend"
> that direct
> activation (event_activation=0) is set, and rely on lvm2-activation-
> *.service
> for PV detection. Once lvm2-activation-net.service has finished, we
> could
> "switch on" event activation.

I like this idea. Alternatively, we could discuss disabling event
activation only in the "coldplug" phase after switching root (i.e.
between start of systemd-udev-trigger.service and lvm2-
activation.service), because that's the critical time span during which
1000s of events can happen simultaneously.

Regards
Martin



_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

