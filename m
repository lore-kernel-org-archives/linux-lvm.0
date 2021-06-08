Return-Path: <SRS0=kfxi=LC=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F3CAC4743E
	for <linux-lvm@archiver.kernel.org>; Tue,  8 Jun 2021 16:44:28 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D832E6127A
	for <linux-lvm@archiver.kernel.org>; Tue,  8 Jun 2021 16:44:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D832E6127A
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=linux-lvm-bounces@redhat.com
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-19-7YjZUYjcPZSLY0a9mov3CQ-1; Tue, 08 Jun 2021 12:44:25 -0400
X-MC-Unique: 7YjZUYjcPZSLY0a9mov3CQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C1196501E0;
	Tue,  8 Jun 2021 16:44:18 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 161B55D6A8;
	Tue,  8 Jun 2021 16:44:17 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id AA3A744A58;
	Tue,  8 Jun 2021 16:44:09 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 158FdPJW016857 for <linux-lvm@listman.util.phx.redhat.com>;
	Tue, 8 Jun 2021 11:39:25 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 1B16B101F0DF; Tue,  8 Jun 2021 15:39:25 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 165AC1033C65
	for <linux-lvm@redhat.com>; Tue,  8 Jun 2021 15:39:22 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6522C101D22C
	for <linux-lvm@redhat.com>; Tue,  8 Jun 2021 15:39:22 +0000 (UTC)
Received: from de-smtp-delivery-102.mimecast.com
	(de-smtp-delivery-102.mimecast.com [194.104.111.102]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-352-t83-Zu3sNIK25jRVjNizSg-1;
	Tue, 08 Jun 2021 11:39:20 -0400
X-MC-Unique: t83-Zu3sNIK25jRVjNizSg-1
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
	(mail-he1eur01lp2050.outbound.protection.outlook.com [104.47.0.50])
	(Using TLS) by relay.mimecast.com with ESMTP id
	de-mta-38-IGwc79t5OnKdVr1uXqKZ2A-1; Tue, 08 Jun 2021 17:39:17 +0200
X-MC-Unique: IGwc79t5OnKdVr1uXqKZ2A-1
Received: from DB8PR04MB6555.eurprd04.prod.outlook.com (2603:10a6:10:103::20)
	by DBAPR04MB7301.eurprd04.prod.outlook.com (2603:10a6:10:1a7::9) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.20;
	Tue, 8 Jun 2021 15:39:16 +0000
Received: from DB8PR04MB6555.eurprd04.prod.outlook.com
	([fe80::1061:e932:29cc:2a38]) by
	DB8PR04MB6555.eurprd04.prod.outlook.com
	([fe80::1061:e932:29cc:2a38%7]) with mapi id 15.20.4195.030;
	Tue, 8 Jun 2021 15:39:16 +0000
From: Martin Wilck <martin.wilck@suse.com>
To: "prajnoha@redhat.com" <prajnoha@redhat.com>
Thread-Topic: [linux-lvm] Discussion: performance issue on event activation
	mode
Thread-Index: AQHXWptdVb+iQI7pP06gMwUhQri0uKsIs+kAgABkm4CAAPX+gIAADzyAgAAFD4CAAAFuAIAAAs+AgAAOfYCAAAifAIAABYKA
Date: Tue, 8 Jun 2021 15:39:16 +0000
Message-ID: <ca38a6b0a7c245c21d98713c4a6637b30c16b235.camel@suse.com>
References: <a885bfa7-9635-ba73-c16b-13b9ef7a2aa4@suse.com>
	<d1d35f7dba3d0e887e7eac06a06ff2414a84c924.camel@suse.com>
	<20210607214835.GB8181@redhat.com>
	<20210608122901.o7nw3v56kt756acu@alatyr-rpi.brq.redhat.com>
	<f6b8c5b6c01ecef842eb711748a765f81b7f04e7.camel@suse.com>
	<20210608134139.iocq5if2hbodrns7@alatyr-rpi.brq.redhat.com>
	<fa7d4756-e084-8811-da40-de95e95a1ae1@redhat.com>
	<20210608135648.gr5xfwma2f3jschr@alatyr-rpi.brq.redhat.com>
	<be2c97261639e35096a990aabeb2422f16472bd0.camel@suse.com>
	<20210608151931.npwffccjw3owsk6b@alatyr-rpi.brq.redhat.com>
In-Reply-To: <20210608151931.npwffccjw3owsk6b@alatyr-rpi.brq.redhat.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.40.1
x-originating-ip: [2.206.153.60]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0330bb0f-462d-4632-1841-08d92a9392d3
x-ms-traffictypediagnostic: DBAPR04MB7301:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DBAPR04MB730179AC91273E05279A8F0FFC379@DBAPR04MB7301.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0
x-microsoft-antispam-message-info: 8fVJOBevRN3vCpX98exWdm0CWFmYV52nLDyjP3dY1kSzTIX65rQCdi69x/jzR6RShzeXy8C+2B2rmbskJpeev8Qwq4lrOMLlI4c1wN9U+Ji+r6UFCpCCbdnl+rt3qIELGxw/sY0luXjbOMWO/l78LBIXJpUnsOZ8VQECyjPMmj3uS3/5mJMUtO3/NdTUlUqAuSmV6B6xx1gbrLjkpwmPUZmYqGC/jOBvLP138ASRKzQiKjtYG6IsGYBv/8jEh7YZe3ig2QjFqxQC/jcafj7ZZk99W7aBYwErxelFgf0iR1K69kNU7C/8qmlRchEgOAwLNbux5fL6BqY7IgCjgu2qw+XT++6iv+6W//TsEz2UO6ZK8JvX06H0seSOQDZNq6h68OBoDuduS8+Dyp8Vkx+UE4SmuE6YCnf1pdAH4MzZSgCz+nYM9CqS0amS31rqiDoh3bIVH7R85az7QCtbPlUvJGZmfI8BBin0D538ykqBhw0figXpgscrcydxLUo55hjYIZvw1iVocbrTVS9ROWoZILIILdqUFGFpmx3escCHYg4IiMV/EOBXL/ctTa4076ttvxJHa4khNCb9DstO7tzEU5uANjIeRjtT1dtvrXtW13Y=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:DB8PR04MB6555.eurprd04.prod.outlook.com;
	PTR:; CAT:NONE;
	SFS:(366004)(136003)(376002)(346002)(39850400004)(396003)(316002)(83380400001)(6512007)(91956017)(76116006)(38100700002)(86362001)(186003)(4326008)(66946007)(122000001)(64756008)(5660300002)(2616005)(71200400001)(36756003)(54906003)(8936002)(6916009)(6506007)(44832011)(8676002)(6486002)(2906002)(26005)(450100002)(66556008)(66476007)(478600001)(66446008)(4744005);
	DIR:OUT; SFP:1101
x-ms-exchange-antispam-messagedata: =?iso-8859-15?Q?8f+xJZ9ZjDpvilTvqcKl4RE0iWYtpfPIJunr8xxwbYthy2XWXkbvauQSA?=
	=?iso-8859-15?Q?YYU9mh3AYOO7MZBqGD9cAvc/DXuAr5algQWXmtRTd8BvYHj6wox1II1Jd?=
	=?iso-8859-15?Q?1IunVROiluXOuGbHbK9UwRPTIJn7I5dVgVAhVHxJiuKw1s66guEj13bgm?=
	=?iso-8859-15?Q?wf6noPkEd01u35qtIf2nEwupfiicWT0Gpr+vaI8VP57JtOCN4P3noW9Cj?=
	=?iso-8859-15?Q?Jn0me8M4UIvN4GfWNzgJAUdRBxBTS3cbI+6A4YPOwfp4DHE5dvP4ClWu7?=
	=?iso-8859-15?Q?3CFHExNRzDZ7m8gE5Yq6bUNZK7qWaklXfKBqPCyPkvEliyVJwFgdwOllr?=
	=?iso-8859-15?Q?VIyzRurxM2UGvljpjI4fCIlCZN87YAe9Oeh6K9FJznI3Bx9w/o3fWffBe?=
	=?iso-8859-15?Q?VaBTOTPTT6b0Sfd5C20JxZ+wgG6CZs5ThJDDFfZpdglD3hM8rgtbFKkAC?=
	=?iso-8859-15?Q?k1YnEM40gq1z1i6zVU0rBzHhoglZV7sLOTXmsOg2qWCJBhF9pzQ0oSiNx?=
	=?iso-8859-15?Q?lMhwIu7mn1NtebDN9AE1vtfvqOB7bc6Xe18or+aoqXHkL0MDQ7rWGv9l8?=
	=?iso-8859-15?Q?SqW3KG7ghEJ/mG21nDdookeWXbMk1bhzEustI5uJcS/o3Adu53YgLj3o/?=
	=?iso-8859-15?Q?OCfIxf83V7XHlHGejbJzj3fAyPNhi6CuJi/WatXUplJFUZRrj3FZBgxP5?=
	=?iso-8859-15?Q?744mqCNF3ghhTpqYGfPW/WUqbGJ44rRm9qrJ2HMJhSfFMVpVfYZE5Fu6R?=
	=?iso-8859-15?Q?xj9WtOl5jOTKkisoTky9Nf2Ew6mrAJ/sQKznScxU/JfGTTBtIlS6b9SrX?=
	=?iso-8859-15?Q?gxbmWsPXOUlsRmnz5/1MU+X1lb4uWvZa6NlIp5QyO9szIEkFuNVqfQTPz?=
	=?iso-8859-15?Q?CxlskphwAtogkbeFcE5t5rPI9jHG29ScB01pMnBmkuzFzdCzzkC5Mth1v?=
	=?iso-8859-15?Q?MfV9me1jzZWKCYpT4Ppq5uL4oTMIIXKrtPt0GhqYzSFbEmD8mWSGbDq+6?=
	=?iso-8859-15?Q?KcJGZrbxZVPZ1l39tnPkvNZb9V3qTXgTYviEpNbZQcbfzii/o7zCBqr0B?=
	=?iso-8859-15?Q?E/uBxKaD6oHGPBT5buBDyctm9qLEBMDN2QMLgu/Dtciv6T5eqDtpuphTY?=
	=?iso-8859-15?Q?6oI4jHEv2QnjwdrvYzo2TCHHR2hOzoXML7Ij1PynJx7Vqz5LopO+3sTCb?=
	=?iso-8859-15?Q?2r/wAfXiNvBxXnqZ81hsfcaJNQsIAbHA2Vgdbi7Gg0WxYGNt4NKzLAPQy?=
	=?iso-8859-15?Q?Re7Tek0cClJ0OiaVv4EGdbOstgm3cueBrE49gmO5ome/e2BTu4rp9KUcC?=
	=?iso-8859-15?Q?syeACkPCK+XpVN6Jgv7dNTirlZh4MwSAe+DUR/4lE4dHove09fEgyoHTk?=
	=?iso-8859-15?Q?iTeP/ejQJpNKfPwlk6sn42b17aCszoD1w?=
MIME-Version: 1.0
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB6555.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0330bb0f-462d-4632-1841-08d92a9392d3
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jun 2021 15:39:16.0863 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +68/DJcMfWuKlsLuv3/uUp9KqtKrp/pxJsGtP47hN9ui4Hf2c6PXcU+cc8FRB/CqoyDCt6Pj24huKa8FLfPbFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7301
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
	lists01.pubmisc.prod.ext.phx2.redhat.com id 158FdPJW016857
X-loop: linux-lvm@redhat.com
X-Mailman-Approved-At: Tue, 08 Jun 2021 12:44:07 -0400
Cc: "bmarzins@redhat.com" <bmarzins@redhat.com>,
	"zkabelac@redhat.com" <zkabelac@redhat.com>,
	"teigland@redhat.com" <teigland@redhat.com>,
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-ID: <A1EF12CB4B062D408A8FCEB38786FB62@eurprd04.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Di, 2021-06-08 at 17:19 +0200, Peter Rajnoha wrote:
> On Tue 08 Jun 2021 14:48, Martin Wilck wrote:
> > 
> > Recent multipath-tools ships the "libmpathvalid" library that
> > could be used for this purpose, to make the logic comply with what
> > multipathd itself uses. It could be used as an alternative to
> > libudev
> > for this part of the equation.
> 
> Ah, yes, sure! Still, we have the MD in play...

That's easier than multipath, because you can check for RAID meta data.

> Out of curiosity - if you disable mpath and MD component detection in
> lvm.conf, can you still hit the issue? (Of course, if you're not
> using
> any of the two in your stack.)

The performance issue, you mean? Heming would need to answer that.

Thanks,
Martin


_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

