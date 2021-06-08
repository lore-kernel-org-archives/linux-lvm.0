Return-Path: <SRS0=kfxi=LC=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9B47C47082
	for <linux-lvm@archiver.kernel.org>; Tue,  8 Jun 2021 16:44:26 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 69DE8610F8
	for <linux-lvm@archiver.kernel.org>; Tue,  8 Jun 2021 16:44:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 69DE8610F8
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=linux-lvm-bounces@redhat.com
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-308-j1STyR-JPrClh5ZSzOzA8Q-1; Tue, 08 Jun 2021 12:44:23 -0400
X-MC-Unique: j1STyR-JPrClh5ZSzOzA8Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7169B800D62;
	Tue,  8 Jun 2021 16:44:18 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id ADBC119C66;
	Tue,  8 Jun 2021 16:44:17 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A7C5A1800BB4;
	Tue,  8 Jun 2021 16:44:09 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 158EmqCH011104 for <linux-lvm@listman.util.phx.redhat.com>;
	Tue, 8 Jun 2021 10:48:52 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 683F821D4F03; Tue,  8 Jun 2021 14:48:52 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6310A21D4F04
	for <linux-lvm@redhat.com>; Tue,  8 Jun 2021 14:48:49 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 032298564EE
	for <linux-lvm@redhat.com>; Tue,  8 Jun 2021 14:48:49 +0000 (UTC)
Received: from de-smtp-delivery-102.mimecast.com
	(de-smtp-delivery-102.mimecast.com [194.104.111.102]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-65-WA7UXfYWMpikOlY98R4X2A-1;
	Tue, 08 Jun 2021 10:48:47 -0400
X-MC-Unique: WA7UXfYWMpikOlY98R4X2A-1
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
	(mail-he1eur02lp2058.outbound.protection.outlook.com [104.47.5.58])
	(Using TLS) by relay.mimecast.com with ESMTP id
	de-mta-34-U33XkHU4Ooa59UJZn7Je5w-1; Tue, 08 Jun 2021 16:48:44 +0200
X-MC-Unique: U33XkHU4Ooa59UJZn7Je5w-1
Received: from DB8PR04MB6555.eurprd04.prod.outlook.com (2603:10a6:10:103::20)
	by DB3PR0402MB3643.eurprd04.prod.outlook.com (2603:10a6:8:5::25) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.24;
	Tue, 8 Jun 2021 14:48:42 +0000
Received: from DB8PR04MB6555.eurprd04.prod.outlook.com
	([fe80::1061:e932:29cc:2a38]) by
	DB8PR04MB6555.eurprd04.prod.outlook.com
	([fe80::1061:e932:29cc:2a38%7]) with mapi id 15.20.4195.030;
	Tue, 8 Jun 2021 14:48:41 +0000
From: Martin Wilck <martin.wilck@suse.com>
To: "zkabelac@redhat.com" <zkabelac@redhat.com>, "prajnoha@redhat.com"
	<prajnoha@redhat.com>
Thread-Topic: [linux-lvm] Discussion: performance issue on event activation
	mode
Thread-Index: AQHXWptdVb+iQI7pP06gMwUhQri0uKsIs+kAgABkm4CAAPX+gIAADzyAgAAFD4CAAAFuAIAAAs+AgAAOfYA=
Date: Tue, 8 Jun 2021 14:48:41 +0000
Message-ID: <be2c97261639e35096a990aabeb2422f16472bd0.camel@suse.com>
References: <a885bfa7-9635-ba73-c16b-13b9ef7a2aa4@suse.com>
	<d1d35f7dba3d0e887e7eac06a06ff2414a84c924.camel@suse.com>
	<20210607214835.GB8181@redhat.com>
	<20210608122901.o7nw3v56kt756acu@alatyr-rpi.brq.redhat.com>
	<f6b8c5b6c01ecef842eb711748a765f81b7f04e7.camel@suse.com>
	<20210608134139.iocq5if2hbodrns7@alatyr-rpi.brq.redhat.com>
	<fa7d4756-e084-8811-da40-de95e95a1ae1@redhat.com>
	<20210608135648.gr5xfwma2f3jschr@alatyr-rpi.brq.redhat.com>
In-Reply-To: <20210608135648.gr5xfwma2f3jschr@alatyr-rpi.brq.redhat.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.40.1
x-originating-ip: [2.206.153.60]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: df47e15d-4050-43f8-0eab-08d92a8c823d
x-ms-traffictypediagnostic: DB3PR0402MB3643:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB3PR0402MB364353F5F6D0D5512A3FECE6FC379@DB3PR0402MB3643.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0
x-microsoft-antispam-message-info: J3kP819gS+DZUYEzNDIxu9n0yEsaKliXcEZQHGOBLWr34YZ6nOsDH45IC2BFJQqydE+aR0tHxtoQVlPc07hn1mCiruClq+2y6iPD4nn0IK+dbx/jg9+LcEV9zgfKm7sPu3WB1vpEDGh7WiNnRM6GA3bui2Y2oSCUDmJgRHSbgiKKh3ZOIEsjMDTdeKm73o/f6mOIUyvrE1O9Ejm1xqLEQ4dDOGGCfyTukfWlsNZ1b/OA8MWb6iiHQKOZUM507wBsNAyIT7x7dAZ2v6Dsyyw89n5vZXLAHBVxg7CMAPRNGJAhr4Fsk0nZ9uLNWikMVGUgLf8XT9Cuswsf3srR8HxCWqPmdJymIc4duM9IER1Id5hxbBHxc35ziV89TfvZh07hhNAah2l4Lo3jQq9s19fo5GRBW5zoHG63I95CFsAd2NRgEnHGPlwsltVNAJo7sSqc2UuUHYoO3RMcTBtdQgcg/YhbksWXQXEQoVCCDzuf7WLn64cI3cPsXR25FsQOlReFP8GsQG4PyjEOqu5GJ95jUb6larBWBjZRgjTL6XPTVeMahTulsZDcYh1sa+KRVU6EoHBl+jBgYdn9FhZ7bk9MNFxbMmKldB7WHAGwQZznDys=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:DB8PR04MB6555.eurprd04.prod.outlook.com;
	PTR:; CAT:NONE;
	SFS:(376002)(366004)(39860400002)(346002)(396003)(136003)(4326008)(91956017)(38100700002)(6512007)(54906003)(76116006)(8936002)(122000001)(36756003)(66556008)(66476007)(66446008)(64756008)(71200400001)(66946007)(450100002)(4744005)(26005)(8676002)(2616005)(478600001)(44832011)(5660300002)(2906002)(6506007)(83380400001)(86362001)(316002)(6486002)(110136005)(186003);
	DIR:OUT; SFP:1101
x-ms-exchange-antispam-messagedata: =?iso-8859-15?Q?zHZpUVK7kWe5o01z2VQ6F4LgqCAzwmjqlb9wF/OfzhAOwXtUxar3VZTPm?=
	=?iso-8859-15?Q?Mbt3NnjaBNq8gpW+zkvvNEb0b/Tq/O0ilqsz7CpQYJ1e0/wgCPEHDienA?=
	=?iso-8859-15?Q?162zxy5ZmHNDc5WmrwKFJtFu80t02OFCQ7FBRkSCXh9e8+U9eboLInW+N?=
	=?iso-8859-15?Q?rjNbFp1cef0vHnjIk8d+CDsP3ebbfvqS/YJ7wDm0s3s8sHVXKH++HAwBj?=
	=?iso-8859-15?Q?Zm/dJtYRNuRa0ZKKDSbHqWwzJ6Zza/j5skme7bVpOTfwn/gUuHEYAkoOB?=
	=?iso-8859-15?Q?uHKzStpzj3z3J6FwU7FrY/VCLX8HGw2v2DZWVaoJuX4yZtqnDnesfYZRv?=
	=?iso-8859-15?Q?UVQy7LX0hnDHFnEFzYuWuvBnJ5L6gNQkON+Daqz4QprZehYLzfDiD40c+?=
	=?iso-8859-15?Q?V78bN8G+6mPXahbJjT/nc2iSeGk5lVHtPgcl97bfjkaO5GkL1kAZRY41Y?=
	=?iso-8859-15?Q?2NO9RuuJhw3monaHmrjjdq6fiEzLnqNz7N4kXYL039Qkrc7wY7hxZrOzX?=
	=?iso-8859-15?Q?Epi7MT3sbIwig2D0Gazfok3UX1lWKXrZ2ClioftcLX4iGHeGi6ugdf1sz?=
	=?iso-8859-15?Q?fYfsgwcyT283VhXGcSL6+69a0/7bTh2kT5SVNm0aCdIeZUnvW+PwWMyXj?=
	=?iso-8859-15?Q?I5HK27ZiWrfpXetYOe06JCPimIexMMtrSa9RfRnlK0wm17MWaCiuYVB6y?=
	=?iso-8859-15?Q?W+Xw+ZO10LnSOo745gWaJT2r1SPwRAusH2XbzqUi5Z4RGoMBBy4Gqs3M1?=
	=?iso-8859-15?Q?Am2JVR25f6K3D1fQ9wKhY01CyE9ahHzS3Tc6EZulw8nGzCMon3K5GgoEn?=
	=?iso-8859-15?Q?6AOIBwjAUItTKjRrVIvy00oZ+o2ol6/k0jGShkPi15SJpZCdnUU141/X0?=
	=?iso-8859-15?Q?YjylF7+j0cHNNgcC5+TvMUVBvG5KYjYSeur9KvpXM3nbt3GHyhNhYiWbU?=
	=?iso-8859-15?Q?FhmzQ1jCAC3H03lAcbqpyHIdf9DNWduuAT5wGF2gbrhsICCWTlczjGRs8?=
	=?iso-8859-15?Q?F/lmYtgI6nTS85yXwPE3UvqPAZYqxjDwJMiYjD4EpqIKnlXooinwAhdBP?=
	=?iso-8859-15?Q?Et/C0fU+mLLMj1ORe8+wMwdjIyBq4603R2Vup8NkuUksopfkHwhu32eR3?=
	=?iso-8859-15?Q?dPqcqcHLje0N/p2jx2oZP8qj2aAgqMXyj9woCwo+FRZ6QmvodH+OOKceu?=
	=?iso-8859-15?Q?a5K7TlDCUhoOOE8M3X9U0pkYcVpLfONvA5iNjR0ebdHhwDz07YDKuWfLY?=
	=?iso-8859-15?Q?uv6XMLAoPpcl5MEgUzZbdJasidlx3l7UTMJDZ3/FtXABLkkoMZN4/MgX5?=
	=?iso-8859-15?Q?gQzokfU3U2HU0V8w5rHBWZgUuLs08zYWD0FrYC3v9rJtLmXRQZhRk+uRg?=
	=?iso-8859-15?Q?nEd1u9hElnYIgLM7355HWgrqlv1Gd2Zcb?=
MIME-Version: 1.0
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB6555.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df47e15d-4050-43f8-0eab-08d92a8c823d
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jun 2021 14:48:41.7603 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: reD7x61mJiKjDoHdD1NW79SBHFyuqzPyW43Kjj2QwR14Z7prYopXYXEPhfcLCkokGiJqMGY61yvC0Gb5ILi1OQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0402MB3643
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 158EmqCH011104
X-loop: linux-lvm@redhat.com
X-Mailman-Approved-At: Tue, 08 Jun 2021 12:44:07 -0400
Cc: "bmarzins@redhat.com" <bmarzins@redhat.com>,
	"linux-lvm@redhat.com" <linux-lvm@redhat.com>,
	"teigland@redhat.com" <teigland@redhat.com>,
	Heming Zhao <heming.zhao@suse.com>
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-ID: <446EA377466A3840BD260FC86F765F5A@eurprd04.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Di, 2021-06-08 at 15:56 +0200, Peter Rajnoha wrote:
> 
> The issue is that we're relying now on udev db records that contain
> info about mpath and MD components - without this, the detection (and
> hence filtering) could fail in certain cases. So if go without
> checking
> udev db, that'll be a step back. As an alternative, we'd need to call
> out mpath and MD directly from LVM2 if we really wanted to avoid
> checking udev db (but then, we're checking the same thing that is
> already checked by udev means).

Recent multipath-tools ships the "libmpathvalid" library that
could be used for this purpose, to make the logic comply with what
multipathd itself uses. It could be used as an alternative to libudev
for this part of the equation.

Martin


_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

