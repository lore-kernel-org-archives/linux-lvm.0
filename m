Return-Path: <SRS0=kfxi=LC=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C92DAC47082
	for <linux-lvm@archiver.kernel.org>; Tue,  8 Jun 2021 16:44:50 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 624F2610F8
	for <linux-lvm@archiver.kernel.org>; Tue,  8 Jun 2021 16:44:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 624F2610F8
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=linux-lvm-bounces@redhat.com
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-116-KsmpLUMhMZWKDjoeNLWOyg-1; Tue, 08 Jun 2021 12:44:47 -0400
X-MC-Unique: KsmpLUMhMZWKDjoeNLWOyg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 91892800D55;
	Tue,  8 Jun 2021 16:44:42 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 733071899A;
	Tue,  8 Jun 2021 16:44:42 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 19FAD180B651;
	Tue,  8 Jun 2021 16:44:42 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 158G7r5U019204 for <linux-lvm@listman.util.phx.redhat.com>;
	Tue, 8 Jun 2021 12:07:53 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 2153A112D17C; Tue,  8 Jun 2021 16:07:53 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1A8EF101F0A0
	for <linux-lvm@redhat.com>; Tue,  8 Jun 2021 16:07:50 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CA54E101A55F
	for <linux-lvm@redhat.com>; Tue,  8 Jun 2021 16:07:50 +0000 (UTC)
Received: from de-smtp-delivery-102.mimecast.com
	(de-smtp-delivery-102.mimecast.com [194.104.109.102]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-29-ajpeKIbSNJOVlMyqt0NBzA-1;
	Tue, 08 Jun 2021 12:07:43 -0400
X-MC-Unique: ajpeKIbSNJOVlMyqt0NBzA-1
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
	(mail-ve1eur01lp2057.outbound.protection.outlook.com [104.47.1.57])
	(Using TLS) by relay.mimecast.com with ESMTP id
	de-mta-29-PQRUYHesNZ-mY4N6ZSc2yA-1; Tue, 08 Jun 2021 18:07:41 +0200
X-MC-Unique: PQRUYHesNZ-mY4N6ZSc2yA-1
Received: from DB8PR04MB6555.eurprd04.prod.outlook.com (2603:10a6:10:103::20)
	by DB6PR0401MB2518.eurprd04.prod.outlook.com (2603:10a6:4:36::17)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.20;
	Tue, 8 Jun 2021 16:07:38 +0000
Received: from DB8PR04MB6555.eurprd04.prod.outlook.com
	([fe80::1061:e932:29cc:2a38]) by
	DB8PR04MB6555.eurprd04.prod.outlook.com
	([fe80::1061:e932:29cc:2a38%7]) with mapi id 15.20.4195.030;
	Tue, 8 Jun 2021 16:07:38 +0000
From: Martin Wilck <martin.wilck@suse.com>
To: "teigland@redhat.com" <teigland@redhat.com>
Thread-Topic: [linux-lvm] Discussion: performance issue on event activation
	mode
Thread-Index: AQHXWptdVb+iQI7pP06gMwUhQri0uKsHLrMAgAEreYCAALkqgIAAt0YAgAB5JoCAAAI+AIAABJAAgAABBgA=
Date: Tue, 8 Jun 2021 16:07:38 +0000
Message-ID: <791a4276d76b52bef1280ae57d18619d332ce07e.camel@suse.com>
References: <a885bfa7-9635-ba73-c16b-13b9ef7a2aa4@suse.com>
	<CAAMCDef6sSy5X2+-WLR3wx5m7dx9bhmN3EKWyPa31SebS=wRGQ@mail.gmail.com>
	<dd395e820a4cf9b5e807e8de1e456786eebd2044.camel@suse.com>
	<20210607213003.GA8181@redhat.com>
	<1760ea9715bc7a16d4efe10dd95105d663a07228.camel@suse.com>
	<20210608153937.GA21355@redhat.com>
	<cbca76c688270279a290568918b70b20c03e48c2.camel@suse.com>
	<20210608160357.GB21355@redhat.com>
In-Reply-To: <20210608160357.GB21355@redhat.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.40.1
x-originating-ip: [2.206.153.60]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fde7fcdf-657b-4ec6-e6fb-08d92a9789a2
x-ms-traffictypediagnostic: DB6PR0401MB2518:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB6PR0401MB25182135B4BC568313B0CE4DFC379@DB6PR0401MB2518.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2958
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0
x-microsoft-antispam-message-info: j51Q3a9kxONgooAIhIB29TuYZh4Wp4WJ+ZFYUTrB8YQNqnb3Fp63QBYL9p4Y/D3WZX6iQSL2GHkvDlM0/oauNV9RKcYOQZtj4fPZ9PL6JZc1M19eWFKGmszYeDJ8zlENkqmjQ54lscmvFgRq2ffxhB6kDUJqV7IQcxnq1vHQRF7P/yDNhMYr9wjlBUSQ0TrbYxs04LbLNIbrfOiwOnwiuNUZHetqwo/OF55+lQhohTpnyE9JKnFaR5f+xUfXqQln5pMaNcQB9kk1s7JYoEbfj09BRDncDAD40tRpb6AR/G7twxpjcmzk2G3++vE7waJU+HkFtaDC3qR9p0g3L1Y4MC+FMK8EhO9L02jV949lwr6nsfbScs3DMwGmFm67qrZTEuUKbtQOdb5Tvrk41tsY11XyJ1BC0K9eQdF7IjmU1eN6qwLlxzPrRaeGDQ3EB0xD6vJt0zb2ulM7bb2rI0U+sm7CIdwHalYGvQeBgSncxqMyIsQ3yGbgJoL2nyr4UJKuzr2FVFbKMwF5oEcBvzmldkiCHzCrJJ/lMUvTT7WImh2dR5HyS/Hj5X8fQA6+1r4EeezHub/a6BwbAYTNbiGM8H1514+GH0JsQYn/3lRjPrE=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:DB8PR04MB6555.eurprd04.prod.outlook.com;
	PTR:; CAT:NONE;
	SFS:(366004)(2616005)(4744005)(86362001)(2906002)(6486002)(26005)(5660300002)(66446008)(66556008)(4326008)(44832011)(66476007)(186003)(6512007)(54906003)(66946007)(38100700002)(36756003)(76116006)(498600001)(91956017)(83380400001)(6916009)(71200400001)(122000001)(6506007)(8676002)(64756008)(8936002);
	DIR:OUT; SFP:1101
x-ms-exchange-antispam-messagedata: =?iso-8859-15?Q?OG4LBtSPq6fQkPettwAqU2X/IRS5WvlSiLNlfl6Emac42NX3a838METi+?=
	=?iso-8859-15?Q?9bdCiB9hr+8cVdwrn9l+PB7oIW15h7QZ1dfMwY8D6rahvGqW5QezvXAwZ?=
	=?iso-8859-15?Q?Vc07Qb5mzCcH1Od4XkSHeM/h1aWyDt0sVf2ACmruAvzdPhne+OtiWEsVL?=
	=?iso-8859-15?Q?MOiPzW897vGKEsqX/9SejqSOB7JNtXEWzuKgRzjpYIREG7J+xNBUP+lSR?=
	=?iso-8859-15?Q?1OkopaipGws9XnT5p4ivnqxaQ/UySwBbxpFzXJzs37XkAHic65WNI2ECb?=
	=?iso-8859-15?Q?d0yCD55O3+Y46NDxs4IpcUj3mA8vqjgbcpftHB74QfRXcsbbKn9qPzbpd?=
	=?iso-8859-15?Q?zNbXWrGADVC8+U4BTI08hVsVsjbYLU0LZ1GkpXRMsD0Toumpj68e5ySy5?=
	=?iso-8859-15?Q?BKTkdznx5xokkMOwKHdVfX2NVbhfhOO+SIWdmIzQ3wojeIo3TFB+gmrLo?=
	=?iso-8859-15?Q?pPA7I+t3BvTwt0IvPuTX4R6vOL8Dly0QgPRAkBli9CWnvQ0dTksqd9JSF?=
	=?iso-8859-15?Q?JkxFcPl+8BEeGNBYjXrTy2tWsmAkiK8+ulWgeGIvcWrfYD/rh0GRkQKeR?=
	=?iso-8859-15?Q?rFNzJqzB1jS45BZeT7CDAuLVsCzRV1WH6fNgRk+p9AqsOCyPkEo4649Me?=
	=?iso-8859-15?Q?uysgKh9KiAdMWCMpOX0cLT0q+eP+71y86BxsOzMrpKqhzn6xMmVmRKcvi?=
	=?iso-8859-15?Q?7yyeQ9+gH59OeBKge5n413YWO1iqCDcEIlV2R6XPVBSlPDRXN+F8OPwp1?=
	=?iso-8859-15?Q?xO5UhHh6vXcYRHT+eaGQZMWl88QWYtdvLke/tUhuF8hKhiACi+rVbd2P5?=
	=?iso-8859-15?Q?LuzU4vUECf749JPV5VhRRbc7y5vwFT9DUCrrGv/ObnndX/wizLTmiyUxz?=
	=?iso-8859-15?Q?BNBkS5aaZ6XSAdzNTcWn/+3vUR+gKVpe3vTA+SL9IzyB5+sQqwLehhoLy?=
	=?iso-8859-15?Q?3apARD/ESwS6zfz9OsINQpgjPCdNRrTUmWBSyFhLL+4NXNr/IBJl3kwZI?=
	=?iso-8859-15?Q?ylswZ83NCBtw7PbN5ek3AaN7DD6+YMa9lyn0ll41fOzBeSf/daZVys8NO?=
	=?iso-8859-15?Q?ak6kCLfZgIFNobdj2s5H8304DHRyKDogtEVj7CDloLj8df1NpsY5BFaLz?=
	=?iso-8859-15?Q?T8NvckoqBw2BgrUxT3QJWqnyD5iCAyOyCPH26V6QgkJpoRZ7ZCrGGAjpQ?=
	=?iso-8859-15?Q?fn/qFuGX2hHxXu0pJp+R6UhwBKNv5hA9QUoSOLI5NcIcTT2QkSI4b9JYf?=
	=?iso-8859-15?Q?Zl3HpILn3RLcjLdvLFIlF33cQYWhFOHu6Jd7Ntxa/pjpmpfu7MX7jpuhl?=
	=?iso-8859-15?Q?b71cnwQM/A0GCFhn8TDAUBPk8cHB2tPpnQvV2I0IT0m9FZHNoDoQn4fSA?=
	=?iso-8859-15?Q?QAbSy9CgtQLt2AZBRuwLBJc62Kfnff410?=
MIME-Version: 1.0
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB6555.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fde7fcdf-657b-4ec6-e6fb-08d92a9789a2
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jun 2021 16:07:38.6539 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: r1tPr7XCVBy4IMoJUUaJDcUCrOb+PKrMeIwxajR/4b4iTtgwjW8N1mrzb1yBdUD8gAtOc2vG7uF1lefV68DG5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0401MB2518
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
	lists01.pubmisc.prod.ext.phx2.redhat.com id 158G7r5U019204
X-loop: linux-lvm@redhat.com
X-Mailman-Approved-At: Tue, 08 Jun 2021 12:44:07 -0400
Cc: "rogerheflin@gmail.com" <rogerheflin@gmail.com>,
	Heming Zhao <heming.zhao@suse.com>,
	"prajnoha@redhat.com" <prajnoha@redhat.com>,
	"linux-lvm@redhat.com" <linux-lvm@redhat.com>,
	"zkabelac@redhat.com" <zkabelac@redhat.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-ID: <E5DB24CE45CCC94C99AAFDA1136A4F62@eurprd04.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Di, 2021-06-08 at 11:03 -0500, David Teigland wrote:
> On Tue, Jun 08, 2021 at 03:47:39PM +0000, Martin Wilck wrote:
> > Hm. You can boot with "multipath=off" which udev would take into
> > account. What would you do in that case? Native mpath detection
> > would
> > probably not figure it out.
> 
> libmpathvalid will still know?

No. You got me :-)
But it would be the right place for implementing this if required.


Martin


_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

