Return-Path: <SRS0=616c=LD=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,PDS_BAD_THREAD_QP_64,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9032C47095
	for <linux-lvm@archiver.kernel.org>; Wed,  9 Jun 2021 05:42:23 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6A70461278
	for <linux-lvm@archiver.kernel.org>; Wed,  9 Jun 2021 05:42:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6A70461278
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=linux-lvm-bounces@redhat.com
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-521-j10iUuwtPna1YsWrdNEIxw-1; Wed, 09 Jun 2021 01:42:20 -0400
X-MC-Unique: j10iUuwtPna1YsWrdNEIxw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 507505125;
	Wed,  9 Jun 2021 05:42:13 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 903E419C95;
	Wed,  9 Jun 2021 05:42:11 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D17714A717;
	Wed,  9 Jun 2021 05:42:02 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1595bvpn008149 for <linux-lvm@listman.util.phx.redhat.com>;
	Wed, 9 Jun 2021 01:37:57 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 4BC69FED2B; Wed,  9 Jun 2021 05:37:57 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 45FE8100D8E
	for <linux-lvm@redhat.com>; Wed,  9 Jun 2021 05:37:53 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 406431825065
	for <linux-lvm@redhat.com>; Wed,  9 Jun 2021 05:37:53 +0000 (UTC)
Received: from de-smtp-delivery-102.mimecast.com
	(de-smtp-delivery-102.mimecast.com [194.104.111.102]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-561-XiNXfw-PNMGkR673oT7DTw-1;
	Wed, 09 Jun 2021 01:37:51 -0400
X-MC-Unique: XiNXfw-PNMGkR673oT7DTw-1
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
	(mail-db8eur05lp2105.outbound.protection.outlook.com [104.47.17.105])
	(Using TLS) by relay.mimecast.com with ESMTP id
	de-mta-28-JYUeHWbQMC6vkpO2nMLMLg-2; Wed, 09 Jun 2021 07:37:49 +0200
X-MC-Unique: JYUeHWbQMC6vkpO2nMLMLg-2
Received: from DB7PR04MB4666.eurprd04.prod.outlook.com (2603:10a6:5:2b::14) by
	DB7PR04MB4668.eurprd04.prod.outlook.com (2603:10a6:5:3a::18) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.4195.25; Wed, 9 Jun 2021 05:37:47 +0000
Received: from DB7PR04MB4666.eurprd04.prod.outlook.com
	([fe80::2c69:3d93:4901:ecfc]) by
	DB7PR04MB4666.eurprd04.prod.outlook.com
	([fe80::2c69:3d93:4901:ecfc%3]) with mapi id 15.20.4195.030;
	Wed, 9 Jun 2021 05:37:47 +0000
From: Heming Zhao <heming.zhao@suse.com>
To: David Teigland <teigland@redhat.com>, Martin Wilck <martin.wilck@suse.com>
Thread-Topic: [linux-lvm] Discussion: performance issue on event activation
	mode
Thread-Index: AQHXW4ezbkT82++l3EyIhKWPyVxcHKsJEX6AgAE7OYCAAMSGAIAAngLA
Date: Wed, 9 Jun 2021 05:37:47 +0000
Message-ID: <DB7PR04MB466643E4216F9F89A2B2EF1F97369@DB7PR04MB4666.eurprd04.prod.outlook.com>
References: <a885bfa7-9635-ba73-c16b-13b9ef7a2aa4@suse.com>
	<CAAMCDef6sSy5X2+-WLR3wx5m7dx9bhmN3EKWyPa31SebS=wRGQ@mail.gmail.com>
	<dd395e820a4cf9b5e807e8de1e456786eebd2044.camel@suse.com>
	<20210607213003.GA8181@redhat.com>
	<0b83d419-8569-2ba0-5f5b-2c3df4e2eb21@suse.com>,
	<d349b4b1-194a-7ed5-d5e3-d06785b3664c@suse.com>
In-Reply-To: <d349b4b1-194a-7ed5-d5e3-d06785b3664c@suse.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [123.123.133.78]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d779d26c-225d-400c-e312-08d92b08b68c
x-ms-traffictypediagnostic: DB7PR04MB4668:
x-ld-processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB7PR04MB4668C38D7ECDD517C849E12E97369@DB7PR04MB4668.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0
x-microsoft-antispam-message-info: vQGu0aBnuacOaydMkczb9fljOILrRuWtMVE3Ep88kFrnNObYdeC6sg+hPm3OYkdLM8Xps/Dg1wA1s6/xFcPcxUHsMhzUmelvS+m0aonebfX+/37hGQHi9mGrj7hKS+l9lL3UIJMLcR2hY9EayizYXx1CGiLyIlGKISnp1hwFa3l939+kdQh7tvVmkSttjicy3EboaB2wiJRcI3hCIRaUYf/VlJKYzX4QnGCxCOwOPjtZJrlU46G0ZFwPmMpzfriCGXy6Vif5dIm7wo1d1G+gbf4AQnODTI+sL7f1LGMvSYrc1mbiVL2RCZYzqwAL4zba+LCPqPi2le2K38U96Nrzx5CZ2kKwXG3DVgWhCl9/tlLc9GhD5DrN6hI3FEnBtckw4XtfHxuc3lf6J0V/A47zBq/FknRKx0sN3NK8knLF0r6HE/GcNqBhsNTLmgfpJRbppcsp1+L5GG1TGICOdSFB9Zktc0ZSxgDI2DmF6Oddm5cv+TR4KvjwDcbsyQavfooUmTJHC8+OhvrpVhKYHqK2LcPQND+LYuxieRYv1ji0tWilivnn2UY1paOkSiUlUnIwwG5jbL6gB8wDzLX3OPjMEHMIS0uPNCv17QoSzga5fKZCrR4jjDRH8fHbUSD73bvwvWnd+HAA/6wR7Tgymw7CkQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:DB7PR04MB4666.eurprd04.prod.outlook.com;
	PTR:; CAT:NONE;
	SFS:(39860400002)(136003)(366004)(396003)(376002)(346002)(9686003)(55016002)(83380400001)(4326008)(122000001)(8936002)(86362001)(186003)(6506007)(53546011)(38100700002)(71200400001)(316002)(26005)(8676002)(6636002)(478600001)(5660300002)(44832011)(66476007)(66556008)(64756008)(66946007)(52536014)(66446008)(7696005)(54906003)(91956017)(2906002)(76116006)(110136005)(33656002)(9126006);
	DIR:OUT; SFP:1101
x-ms-exchange-antispam-messagedata: =?iso-8859-1?Q?orNcb3/1jt/4KoSgyLaeQUUv/fwXo77e20/m/5VE+C5GWe79dFdrF2u+U0?=
	=?iso-8859-1?Q?hf25slpw75dAnocoF2GLzKEWDFoPdc9y3uCIuvweWBA+24fLuMblZsPoxd?=
	=?iso-8859-1?Q?Bzx6VLV2jXfEPw0kk3VkTPh3qh5Cut/nWG4dGWIQUB79b5wioJSN5lNvlr?=
	=?iso-8859-1?Q?7k23EdbYQMKhzfYZ3Auea+A13PND35FYLQaU35dt/ToKQdjwXmDGeOQLSj?=
	=?iso-8859-1?Q?UAAR7lUsc/5uCuFFG2ETACofN9E8aX/3k658qI5TAnUV2o3OrJDXsOvuzz?=
	=?iso-8859-1?Q?urYYBvCBU/FLeP7HKCny41yVLSAWWZ4MdDejRS+Orinw3jSRM47eP0MC6J?=
	=?iso-8859-1?Q?IzPCoucgHUBmPaBbyPbJA76zsK9rCOd3VaLYVBlvNYSRAX23bUSU7DS9BX?=
	=?iso-8859-1?Q?yxnwbMBE62fh86fc7slpol9YjasOGFnjY5FQqTpvmehbwSmSQJ/BM6rP3Q?=
	=?iso-8859-1?Q?VJTlufDJKwLgnRnU1G/vkg3J2Sgr6xNNUg9FmFZGqMEOwJKKzAUxplYGye?=
	=?iso-8859-1?Q?goa6F+oBWFi4TaV+LDjgsqLcycSTK70GZg7B9zVcmH0eG8WpHTxk6h+4sM?=
	=?iso-8859-1?Q?BfC2ZMvHY3yO0KpPAkNyyG+/8u9IjoQ+ckOO8Odg3hBY6W/8G2gEP+KCbX?=
	=?iso-8859-1?Q?jCYvKPvuqytq4ZqM4+HWD3Yf8Ncrtkl/jgwRCIM3RYgbYtpXwNUXpPJMpS?=
	=?iso-8859-1?Q?DYIFsa9yti8fLks4v8kZbkw/cE3wbt6bP1qlqb1mfGg4RcU8V5bX05//mK?=
	=?iso-8859-1?Q?tCPhCihH5i/RF2tFkdT7EaUsSVDEy2fLg/gEwGoWZF/4gh2Y68ARme/b8K?=
	=?iso-8859-1?Q?9AdPmT+ws5vSnXKjOZUnIjXpRx1mOFJidikQchdc+898kBik/VktXE7WPa?=
	=?iso-8859-1?Q?ym8DCkDJtb32g0daImoI00UbIWH70Qjdwc8FoKeMjyX1DMyBgy4jJmMUEF?=
	=?iso-8859-1?Q?/49bxeojIdLJ1I/DSZsTqYVe/pf4v4zk0v7LENcnb+nyfo4JkLDh+aAE9O?=
	=?iso-8859-1?Q?iprXWSQ4KkqhdKxQsIOZVn/zTtnLNr3X2k4ifKqrsSD+d9xPO2lG+W7cg7?=
	=?iso-8859-1?Q?hqByHLcZO5jqRQ9l2u3s0PN4rjF+OkFPq6BthNZLMkn+khFGg/77qaC77z?=
	=?iso-8859-1?Q?Jq8Zg8LSibOZeKKAZs9sFow0zmSs4I9bPRkYOtS9IdadD5dnDONRhuGRbR?=
	=?iso-8859-1?Q?lKlHyAppA1Zgl271DHKu309qFwpNlJlhHzBU21JLsD9Tx6r8rNR0guHC9R?=
	=?iso-8859-1?Q?RWQ7hAUxG2upbwWRO+J64SYuXi1cXpp6A3ucqqAQlV7Rd1rkslA/R1V2pM?=
	=?iso-8859-1?Q?As61Uh6RD44zIlRaxh/EkYJB/qltzjIOOWS7xeyL8+vQPjo=3D?=
MIME-Version: 1.0
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB4666.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d779d26c-225d-400c-e312-08d92b08b68c
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jun 2021 05:37:47.1085 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YgqB8s6D4EEI2+9drGEoAaAdk0f5+dzVfUFSfCa2nD+HRx4n6PFdBPkxqChmBCfbzMZzOdbN0yZnfda03Uf+pw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4668
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 1595bvpn008149
X-loop: linux-lvm@redhat.com
Cc: "rogerheflin@gmail.com" <rogerheflin@gmail.com>,
	"zkabelac@redhat.com" <zkabelac@redhat.com>,
	"linux-lvm@redhat.com" <linux-lvm@redhat.com>
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Either my mailbox or lvm mail list is broken, I can't see my last two mails=
 appear in the mail list.

This mail I will mention another issue about lvm2-pvscan@.service.
both event activation and direct activation have same issue:
the shutdown take much time.

the code logic in=A0pvscan_cache_cmd() only takes effect on activation job:
```
=A0 =A0 if (do_activate &&
=A0 =A0 =A0 =A0 !find_config_tree_bool(cmd, global_event_activation_CFG, NU=
LL)) {
=A0 =A0 =A0 =A0 log_verbose("Ignoring pvscan --cache -aay because event_act=
ivation is disabled.");
=A0 =A0 =A0 =A0 return ECMD_PROCESSED;
=A0 =A0 }
```

and I have a question about the script  lvm2-pvscan@.service:
why there also does a scan job when stopping? could we remove/modify this l=
ine?
  ```
  ExecStop=3D@SBINDIR@/lvm pvscan --cache %i
  ```

Regards
heming

On 6/9/21 12:18 AM, heming.zhao@suse.com wrote:
> On 6/8/21 5:30 AM, David Teigland wrote:
>> On Mon, Jun 07, 2021 at 10:27:20AM +0000, Martin Wilck wrote:
>>> Most importantly, this was about LVM2 scanning of physical volumes. The
>>> number of udev workers has very little influence on=A0PV scanning,
>>> because the udev rules only activate systemd service. The actual
>>> scanning takes place in lvm2-pvscan@.service. And unlike udev, there's
>>> no limit for the number of instances of a given systemd service
>>> template that can run at any given time.
>>
>> Excessive device scanning has been the historical problem in this area,
>> but Heming mentioned dev_cache_scan() specifically as a problem.=A0 That=
 was
>> surprising to me since it doesn't scan/read devices, it just creates a
>> list of device names on the system (either readdir in /dev or udev
>> listing.)=A0 If there are still problems with excessive scannning/readin=
g,
>> we'll need some more diagnosis of what's happening, there could be some
>> cases we've missed.
>>
>=20
> the dev_cache_scan doesn't have direct disk IOs, but libudev will scan/re=
ad
> udev db which issue real disk IOs (location is /run/udev/data).
> we can see with combination "obtain_device_list_from_udev=3D0 &
> event_activation=3D1" could largely reduce booting time from 2min6s to 40=
s.
> the key is dev_cache_scan() does the scan device by itself (scaning "/dev=
").
>=20
> I am not very familiar with systemd-udev, below shows a little more info
> about libudev path. the top function is _insert_udev_dir, this function:
> 1. scans/reads /sys/class/block/. O(n)
> 2. scans/reads udev db (/run/udev/data). may O(n)
>=A0 =A0 udev will call device_read_db =3D> handle_db_line to handle every
>=A0 =A0 line of a db file.
> 3. does qsort & deduplication the devices list.=A0 O(n) + O(n)
> 4. has lots of "memory alloc" & "string copy" actions during working.
>=A0 =A0 it takes too much memory, from the host side, use 'top' can see:
>=A0 =A0 - direct activation only used 2G memory during boot
>=A0 =A0 - event activation cost ~20G memory.
>=20
> I didn't test the related udev code, and guess the <2> takes too much tim=
e.
> And there are thousand scanning job parallel in /run/udev/data, meanwhile
> there are many devices need to generate udev db file in the same dir. I a=
m
> not sure if the filesystem can perfect handle this scenario.
> the another code path, obtain_device_list_from_udev=3D0, which triggers t=
o
> scan/read "/dev", this dir has less write IOs than /run/udev/data.
>=20
> Regards
> heming



_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

