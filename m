Return-Path: <SRS0=MdXf=LE=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FC5CC47094
	for <linux-lvm@archiver.kernel.org>; Thu, 10 Jun 2021 17:24:20 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B1346613C9
	for <linux-lvm@archiver.kernel.org>; Thu, 10 Jun 2021 17:24:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B1346613C9
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=linux-lvm-bounces@redhat.com
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-242-a_vddJ8VP3O3Pclqb7MaUg-1; Thu, 10 Jun 2021 13:24:15 -0400
X-MC-Unique: a_vddJ8VP3O3Pclqb7MaUg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C0AD2100C619;
	Thu, 10 Jun 2021 17:24:08 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8680A5D9E2;
	Thu, 10 Jun 2021 17:24:06 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E5EF41809CAD;
	Thu, 10 Jun 2021 17:23:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 15AHNoxl024554 for <linux-lvm@listman.util.phx.redhat.com>;
	Thu, 10 Jun 2021 13:23:50 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 406DB20877D4; Thu, 10 Jun 2021 17:23:50 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 321C0208A3A2
	for <linux-lvm@redhat.com>; Thu, 10 Jun 2021 17:23:42 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7B45080D0E9
	for <linux-lvm@redhat.com>; Thu, 10 Jun 2021 17:23:42 +0000 (UTC)
Received: from de-smtp-delivery-102.mimecast.com
	(de-smtp-delivery-102.mimecast.com [194.104.109.102]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-317-q_gcJ-NENyad0CYg1pedOA-1;
	Thu, 10 Jun 2021 13:23:40 -0400
X-MC-Unique: q_gcJ-NENyad0CYg1pedOA-1
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
	(mail-am6eur05lp2113.outbound.protection.outlook.com [104.47.18.113])
	(Using TLS) by relay.mimecast.com with ESMTP id
	de-mta-11-2TyZgbcZPXqQdKqzZ8Hzsw-1; Thu, 10 Jun 2021 19:23:38 +0200
X-MC-Unique: 2TyZgbcZPXqQdKqzZ8Hzsw-1
Received: from DB7PR04MB4666.eurprd04.prod.outlook.com (2603:10a6:5:2b::14) by
	DB6PR04MB3030.eurprd04.prod.outlook.com (2603:10a6:6:b::26) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.4195.25; Thu, 10 Jun 2021 17:23:35 +0000
Received: from DB7PR04MB4666.eurprd04.prod.outlook.com
	([fe80::2c69:3d93:4901:ecfc]) by
	DB7PR04MB4666.eurprd04.prod.outlook.com
	([fe80::2c69:3d93:4901:ecfc%3]) with mapi id 15.20.4219.023;
	Thu, 10 Jun 2021 17:23:35 +0000
To: David Teigland <teigland@redhat.com>
References: <a885bfa7-9635-ba73-c16b-13b9ef7a2aa4@suse.com>
	<CAAMCDef6sSy5X2+-WLR3wx5m7dx9bhmN3EKWyPa31SebS=wRGQ@mail.gmail.com>
	<dd395e820a4cf9b5e807e8de1e456786eebd2044.camel@suse.com>
	<20210607213003.GA8181@redhat.com>
	<0b83d419-8569-2ba0-5f5b-2c3df4e2eb21@suse.com>
	<d349b4b1-194a-7ed5-d5e3-d06785b3664c@suse.com>
	<DB7PR04MB466643E4216F9F89A2B2EF1F97369@DB7PR04MB4666.eurprd04.prod.outlook.com>
	<20210609185929.GB8576@redhat.com>
From: "heming.zhao@suse.com" <heming.zhao@suse.com>
Message-ID: <32ed356f-d1f4-c211-2161-8b5ee468b397@suse.com>
Date: Fri, 11 Jun 2021 01:23:26 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
	Thunderbird/78.10.0
In-Reply-To: <20210609185929.GB8576@redhat.com>
X-Originating-IP: [123.123.133.78]
X-ClientProxiedBy: HK2PR0302CA0015.apcprd03.prod.outlook.com
	(2603:1096:202::25) To DB7PR04MB4666.eurprd04.prod.outlook.com
	(2603:10a6:5:2b::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from c73.home (123.123.133.78) by
	HK2PR0302CA0015.apcprd03.prod.outlook.com (2603:1096:202::25)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.9
	via Frontend Transport; Thu, 10 Jun 2021 17:23:33 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6ca8f498-b71f-474b-362a-08d92c347a47
X-MS-TrafficTypeDiagnostic: DB6PR04MB3030:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB6PR04MB3030349C82F0233E2A36C9F797359@DB6PR04MB3030.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0
X-Microsoft-Antispam-Message-Info: s8d2yJ9BOstKbCyGol9X9fewymWsMOQE45XwuAU3XQ2OB6kR4x00z4jU0zD5wVzi1MQhvnTBzleXs8hof9PliNGnfFT0N1osu8wdrcx2/BoIbXEZDXXejC+E5o+1HOSyws2yxjf01pIyfl1eno7d7vKkZ57a9S+PRM3r2WCKbreLmOrs2PkkjHVo/SpBURIH4Rue8D61OUlKDvuO3Ek+CWg3hJ58c1s+ytTRoDcAMf8wksvRO+aO5QCddAHNbAf8LktVU/MUJXoKxJlxl1y6n71E5viiou4KoJ5hp7qIC3UOClIAVfYRVMHKTcaedeSNITaRhkTjzRbq8M5KVH+mUkvtPzQwYBhP30JaizGnWbzAF8wzwXF/sDiWlxTcKwLKnPmO9Cbz4qX5XQnld8LZiTYzVLU2gpjFZjCIwySl5EDzeufyCCyfYjf1zx9ELa9FzQrgOyxq8AuCh2WEMvuAMLz9ZL0iOhfxlgyjHUw77QCaIgcS8tzFS+iYfEfpKV8FKYGKaFNiB26Yx80VVvvhtBjXiaF9WCdUlU+HmpTvCti0CG8BC8Kn4aAu0yeW2cMFx1uT73PXqXFAgqVIFYGIwJ2F6YoF9DUgeWNLQWFe8jrSfDGf21j+yXvYXHlpFlrly6lSJjwifH/khAoeCHKOm6ETu0JMT5B4683/Td0m3LLYZixB2maKWL7qD2kPomg7ys26ROW/aUHg1NytxO1RtQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:DB7PR04MB4666.eurprd04.prod.outlook.com;
	PTR:; CAT:NONE;
	SFS:(346002)(39850400004)(376002)(366004)(136003)(396003)(66556008)(66476007)(8676002)(5660300002)(66946007)(86362001)(956004)(8936002)(6916009)(8886007)(26005)(6506007)(54906003)(38100700002)(53546011)(2906002)(6666004)(316002)(16526019)(186003)(478600001)(31696002)(6512007)(31686004)(36756003)(2616005)(83380400001)(6486002)(4326008)(9126006)(45980500001)(43740500002);
	DIR:OUT; SFP:1101
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?4TWmgy9qDDmHzyBtcuFJfxjubgliuAW2k9rYA6v90vLxfgys+XdBRSePHIh0?=
	=?us-ascii?Q?/FIqS9zl2q4gzqh+yH1wZyvVoVeF7QzkK9vqwSoHFIHovIyTTxq/ZcHAjFGz?=
	=?us-ascii?Q?DTkgyRvMQJjEDeZJPa3yZPSCiECprfhUY38Unz6+LieNUQ8MFlhbQhA8oPBr?=
	=?us-ascii?Q?KCH9TIAmj6DSCrg1VhSv/5P8dBgAmoxvxfS/sZbU3LWg8PBp+tiyeg25JJ+Z?=
	=?us-ascii?Q?bGAgEvwe+XRu12Yy46TFBXjRvM9FzEx5pGdQ43ufcK9LCvUrYWkdOdqrucPx?=
	=?us-ascii?Q?aMJU/OlE/VXvepU+n/OcF+oBEeIo1MwzUBxbuPQ+N73U2fH+f4Q/kEGmNita?=
	=?us-ascii?Q?AAJdDXG1vvpkOVSeQOYJfwWbTY4H0Sit9nGW7onXsb0eLVztEWDQygptyv5G?=
	=?us-ascii?Q?sjVDDLzAtuu2l4zloSivsPEgYAILbqR0wsTm8zIDMpi9XXNTubo6E2dAzWYe?=
	=?us-ascii?Q?P1Gn+eeXXUVD+8yW+VJoUw1Xtv1sb0/bup894KMrKnjyBlVFAcOYpxliR7L4?=
	=?us-ascii?Q?1iGBdOCXv8X1uM8rldxQIWcvtUJfvbisqVBnZ/VJMtRr4CHquoN94hkNGUmR?=
	=?us-ascii?Q?Kg/m86iv0zVQj4wRuLnp/ni8LX6PNgx1L9xYrnxhFC1srMcBgt6PrEuttq7L?=
	=?us-ascii?Q?KZg7g/pD7/aoYS9j9H/vqU8AHjXNv9BUXygqVjNbbCREaOn/kIXfRuy/245V?=
	=?us-ascii?Q?RcTu0Nxy9RNQxrK+b1lMMTjNg9PjYenjSMxXkHxjA06LtlkFIMjoujyIJsIk?=
	=?us-ascii?Q?9pxyaL04k04SFZ+dXsXC3KWyNpjbQxOmZXsbGU7emJ7W+qOyv08GOJbJli+t?=
	=?us-ascii?Q?lKWkVRSoFDDs2xchKaxz87xtDCdrd6eFAVi+eSzNxUcdtmgCK+i1mYXSQRmQ?=
	=?us-ascii?Q?u6gT/9HFIGIQ0334S39lRYxpMeTKP67wvswdH5pVjCZAa0z7DUYTO7hWGCk0?=
	=?us-ascii?Q?eUk+kNM3vDpit24kUkmzC6ORe2WiTE+GshevPjIZ0AtnrUQDVQjR58zo0gyQ?=
	=?us-ascii?Q?09zmx0CB4PTFw9Kd/ErrrOdNTRoqRd/noa/EXr9AzFiQc+Zw5IGsNYqifw2g?=
	=?us-ascii?Q?iPMnX0v7DaS0cRV4zxSn4OIsIjGsRz+erRMWMXqrKaJAv9CbKN4LtNW8vD/i?=
	=?us-ascii?Q?j1zAJmfrESK5ljwF7wvEJKr29Qwj1z5D3ZF02vCEb91zG291cgMDCMy0lXFO?=
	=?us-ascii?Q?GXPghtZv1cumAlYwuz4XQjAN3W436Kz2OTD6/Fthj4SvMuCzwknGA7KCcqMj?=
	=?us-ascii?Q?d+LOSz7NJQtPz9RK0ETiAigc4uxLUmfJ3kd3NOWGlhnT+HTNywz2+Vvzx3mW?=
	=?us-ascii?Q?Pyy8eWfLHynD8bxgcY8CPmbZ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ca8f498-b71f-474b-362a-08d92c347a47
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB4666.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2021 17:23:35.4382 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EbQCgAislW7A60KgkQOIniyg40QFksOCo8Ih/kgPYYd29VISjCqKM04UImDJd/b1byHnMlH6tc6g/T4eUoL7ow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR04MB3030
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
	lists01.pubmisc.prod.ext.phx2.redhat.com id 15AHNoxl024554
X-loop: linux-lvm@redhat.com
Cc: "zkabelac@redhat.com" <zkabelac@redhat.com>,
	"rogerheflin@gmail.com" <rogerheflin@gmail.com>,
	"linux-lvm@redhat.com" <linux-lvm@redhat.com>,
	Martin Wilck <martin.wilck@suse.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"

T24gNi8xMC8yMSAyOjU5IEFNLCBEYXZpZCBUZWlnbGFuZCB3cm90ZToKPiBPbiBXZWQsIEp1biAw
OSwgMjAyMSBhdCAwNTozNzo0N0FNICswMDAwLCBIZW1pbmcgWmhhbyB3cm90ZToKPj4gVGhpcyBt
YWlsIEkgd2lsbCBtZW50aW9uIGFub3RoZXIgaXNzdWUgYWJvdXQgbHZtMi1wdnNjYW5ALnNlcnZp
Y2UuCj4+IGJvdGggZXZlbnQgYWN0aXZhdGlvbiBhbmQgZGlyZWN0IGFjdGl2YXRpb24gaGF2ZSBz
YW1lIGlzc3VlOgo+PiB0aGUgc2h1dGRvd24gdGFrZSBtdWNoIHRpbWUuCj4+Cj4+IHRoZSBjb2Rl
IGxvZ2ljIGluwqBwdnNjYW5fY2FjaGVfY21kKCkgb25seSB0YWtlcyBlZmZlY3Qgb24gYWN0aXZh
dGlvbiBqb2I6Cj4+IGBgYAo+PiAgwqAgwqAgaWYgKGRvX2FjdGl2YXRlICYmCj4+ICDCoCDCoCDC
oCDCoCAhZmluZF9jb25maWdfdHJlZV9ib29sKGNtZCwgZ2xvYmFsX2V2ZW50X2FjdGl2YXRpb25f
Q0ZHLCBOVUxMKSkgewo+PiAgwqAgwqAgwqAgwqAgbG9nX3ZlcmJvc2UoIklnbm9yaW5nIHB2c2Nh
biAtLWNhY2hlIC1hYXkgYmVjYXVzZSBldmVudF9hY3RpdmF0aW9uIGlzIGRpc2FibGVkLiIpOwo+
PiAgwqAgwqAgwqAgwqAgcmV0dXJuIEVDTURfUFJPQ0VTU0VEOwo+PiAgwqAgwqAgfQo+PiBgYGAK
PiAKPiBHb29kIHBvaW50LCBldmVudF9hY3RpdmF0aW9uPTAgc2hvdWxkIGFsc28gYXBwbHkgdG8g
cHZzY2FuIG9uIGRldmljZQo+IHJlbW92YWwuCj4gCj4+IGFuZCBJIGhhdmUgYSBxdWVzdGlvbiBh
Ym91dCB0aGUgc2NyaXB0ICBsdm0yLXB2c2NhbkAuc2VydmljZToKPj4gd2h5IHRoZXJlIGFsc28g
ZG9lcyBhIHNjYW4gam9iIHdoZW4gc3RvcHBpbmc/IGNvdWxkIHdlIHJlbW92ZS9tb2RpZnkgdGhp
cyBsaW5lPwo+PiAgICBgYGAKPj4gICAgRXhlY1N0b3A9QFNCSU5ESVJAL2x2bSBwdnNjYW4gLS1j
YWNoZSAlaQo+PiAgICBgYGAKPiAKPiBUaGlzIHJlbW92ZXMgdGhlIC9ydW4vbHZtL3B2c19vbmxp
bmUvIGZpbGUgZm9yIHRoZSBkZXZpY2UuICBJZiB0aGUgUFZzIGZvcgo+IHRoZSBWRyBhcmUgYWxs
IHJlbW92ZWQsIGFuZCB0aGVuIHRoZXkgYXJlIGFsbCByZWF0dGFjaGVkLCBwdnNjYW4gd2lsbAo+
IGF1dG9hY3RpdmF0ZSB0aGUgVkcgYWdhaW4uICBUaGlzIHJlYWN0aXZhdGlvbiBpc24ndCBhIGNv
cmUgY2FwYWJpbGl0eSwgb3IKPiBvbmUgdGhhdCB3ZSd2ZSBleHBsaWNpdGx5IG1lbnRpb25lZCBv
ciBzdXBwb3J0ZWQsIGJ1dCBpdCdzIHRoZXJlLiAgSSBjYW4KPiBpbWFnaW5lIHRoYXQgcmVhY3Rp
dmF0aW9uIG1heSBiZSB1bmRlc2lyYWJsZSBpbiBtYW55IGNhc2VzLCBhbmQgaXQncwo+IGNlcnRh
aW5seSByZWFzb25hYmxlIHRvIHJlbW92ZSB0aGUgRXhlY1N0b3AgYXMgbmVlZGVkLiAgU29tZSB0
aW1lIGFnbyBJCj4gc3VnZ2VzdGVkIHRoYXQgd2Ugc3RvcCBkb2luZyByZXBlYXRlZCBhdXRvYWN0
aXZhdGlvbiBlbnRpcmVseSwgd2hpY2ggd291bGQKPiBsZXQgdXMgcmVtb3ZlIHRoZSBFeGVjU3Rv
cC4gIEJ1dCB3ZSBkb24ndCBrbm93IHRoZSBleHRlbnQgdG8gd2hpY2ggdXNlcnMKPiBkZXBlbmQg
b24gdGhpcyBiZWhhdmlvciwgc28gd2UgaGF2ZW4ndCBjb25zaWRlcmVkIGl0IGZ1cnRoZXIuICBQ
ZXJoYXBzCj4gcHZzY2FuIGNvdWxkIGRldGVjdCBzeXN0ZW0gc2h1dGRvd24gYW5kIGV4aXQgZGly
ZWN0bHkgd2l0aG91dCBkb2luZwo+IGFueXRoaW5nPwo+IAo+IEZvciB0aGUgZnV0dXJlLCB0aGUg
bmV3IHVkZXYgcnVsZSBJIG1lbnRpb25lZCBpbiBhbiBlYXJsaWVyIG1lc3NhZ2Ugbm8KPiBsb25n
ZXIgZG9lcyB0aGlzIGFuZCByZW1vdmVzIHRoZSBsdm0yLXB2c2NhbiBzZXJ2aWNlLgo+IAo+IERh
dmUKPiAKClRoYW5rIHlvdSBmb3IgeW91ciBleHBsYWluYXRpb24uIEkgYW0gcmVhZGluZyB5b3Vy
IGNvZGUgaW4gZGV2LW5leHQgYnJhbmNoLgoKSGVtaW5nCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtbHZtIG1haWxpbmcgbGlzdApsaW51eC1s
dm1AcmVkaGF0LmNvbQpodHRwczovL2xpc3RtYW4ucmVkaGF0LmNvbS9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LWx2bQpyZWFkIHRoZSBMVk0gSE9XLVRPIGF0IGh0dHA6Ly90bGRwLm9yZy9IT1dUTy9M
Vk0tSE9XVE8v

