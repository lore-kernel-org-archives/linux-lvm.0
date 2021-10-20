Return-Path: <SRS0=7RWj=PJ=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E798DC433EF
	for <linux-lvm@archiver.kernel.org>; Thu, 21 Oct 2021 06:06:52 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5D0D36109F
	for <linux-lvm@archiver.kernel.org>; Thu, 21 Oct 2021 06:06:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5D0D36109F
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=redhat.com
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-453-6wgf_J8vOAOHZ0TKo2LPPA-1; Thu, 21 Oct 2021 02:06:47 -0400
X-MC-Unique: 6wgf_J8vOAOHZ0TKo2LPPA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 704CC8030A0;
	Thu, 21 Oct 2021 06:06:42 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1290719D9B;
	Thu, 21 Oct 2021 06:06:41 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D47B71806D04;
	Thu, 21 Oct 2021 06:06:28 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
	[10.11.54.2])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 19KEeVwN028796 for <linux-lvm@listman.util.phx.redhat.com>;
	Wed, 20 Oct 2021 10:40:31 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 88F77401A992; Wed, 20 Oct 2021 14:40:31 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 83958400F3C5
	for <linux-lvm@redhat.com>; Wed, 20 Oct 2021 14:40:31 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6B0F08027FB
	for <linux-lvm@redhat.com>; Wed, 20 Oct 2021 14:40:31 +0000 (UTC)
Received: from de-smtp-delivery-102.mimecast.com
	(de-smtp-delivery-102.mimecast.com [194.104.111.102]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-121-OJlkpY39NpGXrcMBt1Ug0g-1;
	Wed, 20 Oct 2021 10:40:29 -0400
X-MC-Unique: OJlkpY39NpGXrcMBt1Ug0g-1
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
	(mail-db5eur01lp2050.outbound.protection.outlook.com [104.47.2.50])
	(Using TLS) by relay.mimecast.com with ESMTP id
	de-mta-36-PrDDu9zkMS6LAE4CzSfsPw-1; Wed, 20 Oct 2021 16:40:27 +0200
X-MC-Unique: PrDDu9zkMS6LAE4CzSfsPw-1
Received: from DB8PR04MB6555.eurprd04.prod.outlook.com (2603:10a6:10:103::20)
	by DB8PR04MB6476.eurprd04.prod.outlook.com (2603:10a6:10:104::32)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.17;
	Wed, 20 Oct 2021 14:40:25 +0000
Received: from DB8PR04MB6555.eurprd04.prod.outlook.com
	([fe80::6075:6202:39bc:3258]) by
	DB8PR04MB6555.eurprd04.prod.outlook.com
	([fe80::6075:6202:39bc:3258%6]) with mapi id 15.20.4608.018;
	Wed, 20 Oct 2021 14:40:25 +0000
From: Martin Wilck <martin.wilck@suse.com>
To: "teigland@redhat.com" <teigland@redhat.com>
Thread-Topic: [linux-lvm] Discussion: performance issue on event activation
	mode
Thread-Index: AQHXWptdVb+iQI7pP06gMwUhQri0uKsIs+kAgABkm4CAAPX+gIAADzyAgJKTMYCAG6beAIAAXmQAgAOJqgCAATIsAIABBvEAgBs0qQCAAx39AA==
Date: Wed, 20 Oct 2021 14:40:25 +0000
Message-ID: <ec784347cc8cf3530533701fd85c0e7825fd8a93.camel@suse.com>
References: <d1d35f7dba3d0e887e7eac06a06ff2414a84c924.camel@suse.com>
	<20210607214835.GB8181@redhat.com>
	<20210608122901.o7nw3v56kt756acu@alatyr-rpi.brq.redhat.com>
	<f6b8c5b6c01ecef842eb711748a765f81b7f04e7.camel@suse.com>
	<20210909194417.GC19437@redhat.com>
	<20210927100032.xczilyd5263b4ohk@alatyr-rpi.brq.redhat.com>
	<20210927153822.GA4779@redhat.com>
	<20210929213952.ws2qpmedaajs5wlx@alatyr-rpi.brq.redhat.com>
	<20210930155542.GB32174@redhat.com>
	<418b2bd497a3a4cd76840b3cceb1955ba7e9ba01.camel@suse.com>
	<20211018150418.GA3917@redhat.com>
In-Reply-To: <20211018150418.GA3917@redhat.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.42.0
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: df5d4dd7-f471-4475-59b1-08d993d78da8
x-ms-traffictypediagnostic: DB8PR04MB6476:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB8PR04MB64762E89B54E80067897CC4DFCBE9@DB8PR04MB6476.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0
x-microsoft-antispam-message-info: mCe5jMMVinDJkpS28CBjBCAxLD+dO8sEm56DJF4DbqAdQR/bTtElaVTscxbB+oxQlL/O68ViiXV+qh5wgDZmBLPD9tpo/XlmrrsxKWCpasm2NE/RmYl7t96eGYLcBIpY7p8fb2dXLh4o5frZafdLc28lDW2UZDjsZoqVEIt5BP1OG1BWZJp4JoL7zlrAYkWt0t/mZRjT1j1cGK4ZBjoxHjqvcgmw7/EznD3wLH+sEGNSlyI78ppBQOT6G8hHAFwQTZMRBs35JR3afdxbavnQOBhi89Zyx5wUBUAAD9dNBNj/Q22UwmLUJa4aEkipkZzGFt9/hDXyWLwaVdGM2FG+4So+UdLLCni+bn7LLqvoBzS95mFuqNwnUHKYHc/TXNOSyxC0khZi1CpLGm1ccBgiZWYG+I2HVnsVRpPkSnwjarllYdilX9QGUklxlohZpKL/1UDYMoD0njEOVDStT5YvWqKepmOrxaSsMkWCgZALNDec16LRRGt5rlzEiYWGcbLSUr1w/yzhS0gxfgJm34P7yUSzIt3pi3bSUgD4yWA1/X6z/GqENXkfyPVj3CltprqNfRaJCWxUuQw+y1JVljI5Eh+1g8tA1tiZLtbzN/5WVR3mraKpyOJv/0KupEBShhxwL9CGuiqW53XJnimwpE+mwv8dVkpjnHgoVxuAvWchCKO7wO56ecieavIXXI1ZVEBd71qs1lubVIR5HhbPysojcQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:DB8PR04MB6555.eurprd04.prod.outlook.com;
	PTR:; CAT:NONE;
	SFS:(366004)(4744005)(76116006)(91956017)(36756003)(5660300002)(6512007)(450100002)(86362001)(66476007)(26005)(8936002)(38100700002)(122000001)(6916009)(54906003)(8676002)(6486002)(66556008)(66946007)(4326008)(2906002)(38070700005)(71200400001)(508600001)(316002)(4001150100001)(64756008)(186003)(2616005)(44832011)(6506007)(66446008);
	DIR:OUT; SFP:1101
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-15?Q?l1+JkvCbvsdFk1aBgXjyWHhr2WZkKe+Jy4hv+3DKlqGueeyADpCeqdbIR?=
	=?iso-8859-15?Q?OubtX5N7XGUpqNOut1tqE8x6UYGupvzDDl2fvYU/mFyVydrQ9eHFii3HY?=
	=?iso-8859-15?Q?+tnlCXl+kuniyWEbSkFznlnc/tNX+PistyDpBmv7BW5pFzJW54Sp37lB7?=
	=?iso-8859-15?Q?mm2nHudYaS7htlcXHKYunvoYd5EPanYGxkkIww/2GuNGcRnj8TLMMxUNS?=
	=?iso-8859-15?Q?6MMfTD1gsd9bnsKz2fPHcl80JEDIdw8qG36JYMTU1H5pmUTbqWaHBTQlD?=
	=?iso-8859-15?Q?CVJ+y79vXUJfmz7k88rUVi+78g4yjZdrrrnPPJhf8MFkncpe/uqq34yZ7?=
	=?iso-8859-15?Q?TuOhQUHCVLzgWNnnvPP6kRgala48n385s4Vc7QhVdQLC3O4Q5/MBqE0RC?=
	=?iso-8859-15?Q?mBGnzc3dvGp+2qEnMcSyJDlIpwn5/DGGSoEE2oI89idLcV2ewGDsbd3AU?=
	=?iso-8859-15?Q?gvY7bg+lp2zikn8dYRf49bPNYfzyrys346Xo3q2ps5TrE5W7u2Hl8knM0?=
	=?iso-8859-15?Q?xCjEgn1A+dSbXUFNQ9gmw+jqv7tTbCE6qQ9U/bPSi4BFt6KjFIAQZMekf?=
	=?iso-8859-15?Q?oup6q+Q0oPpeZ2sEeI5SG11/pCPbYV9deCDvk1t+RcgZfBoBbeI+1IGXh?=
	=?iso-8859-15?Q?vqMKUudIJ6L9eONdOwylTpP6YDIGUqx7hIhVQVxO1920eNrnm5yd4F/FC?=
	=?iso-8859-15?Q?iNSQgGwdNIB7F8YfWNxxQbDf/IT69fRb/qPbCtIcYnijrWr+lwgxsrot5?=
	=?iso-8859-15?Q?mlBPIBf4TgNL4y/oMGxvIFl3dCGL11SUt5ecab4hrdo3Q2GbSIuzae0A8?=
	=?iso-8859-15?Q?KFpZWk+qEj6J+4JCU7x9dA+uuw92GCLOVGSaxmRsbcYz37tqFJwhTaNWC?=
	=?iso-8859-15?Q?esLfgSnE7EY46d1GPVDqCwWdph+L3cuQkzlrN+iZlwIpisprFDHs5cy0Q?=
	=?iso-8859-15?Q?9MGcW56b8G3SH6Gf8wiB+maQe5fCgCp7Wp3aSxSEUJ/7gtpwgtYosSV4p?=
	=?iso-8859-15?Q?2yEmQlJfyi1f6bQXdY5z4gTQAe46bCwVVee4opqOEWvJ6DrfGSQN0mHvL?=
	=?iso-8859-15?Q?DYdBc+vNt+FXVWlXoNMt9Dg+ktaUGUp+i8XzDfeYqWCLQ9sQQTOXAsUMP?=
	=?iso-8859-15?Q?+5OKZ42PPg2tAy4S2J6soep9WWNZi+ihYR0jopk5rfqC//74+JkA2sWUa?=
	=?iso-8859-15?Q?VAWLCMnbCILz+OjiDpYx8MWfLVi3LJEw4J/OMYNcbAYSMSj5E1diCdJlC?=
	=?iso-8859-15?Q?PkY7QW1PF3WMFWFyAkbbfMMUb0CmbjOSr5VhBQohjcSE1MczvLkSuovY8?=
	=?iso-8859-15?Q?oHghSa1TFkg3/JfIgfrSgGEzNdgB42pKo3FpcUpCqIfjqoIxI3cPP0ipj?=
	=?iso-8859-15?Q?V1iwK9KtEmmozDMaPfXDu/Vw5+ElCywkK?=
MIME-Version: 1.0
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB6555.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df5d4dd7-f471-4475-59b1-08d993d78da8
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Oct 2021 14:40:25.3138 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: martin.wilck@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6476
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 19KEeVwN028796
X-loop: linux-lvm@redhat.com
X-Mailman-Approved-At: Thu, 21 Oct 2021 02:06:26 -0400
Cc: "bmarzins@redhat.com" <bmarzins@redhat.com>,
	"zkabelac@redhat.com" <zkabelac@redhat.com>,
	"prajnoha@redhat.com" <prajnoha@redhat.com>,
	"linux-lvm@redhat.com" <linux-lvm@redhat.com>,
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
Content-ID: <5B0964EC1017A24CBA5E0DBEE9E52B2E@eurprd04.prod.outlook.com>
Content-Type: text/plain; charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable

On Mon, 2021-10-18 at 10:04 -0500, David Teigland wrote:


>
> I began trying to use RUN several
> months ago and I think I gave up trying to find a way to pass values
> from
> the RUN program back into the udev rule (possibly by writing values
> to a
> temp file and then doing IMPORT{file}).=A0

That can't work, because RUN is executed *after* all rules have been
processed. That's documented in the man page. I don't quite understand
what you're trying to achieve.


Martin


_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

