Return-Path: <SRS0=kfxi=LC=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,PDS_BAD_THREAD_QP_64,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D64E2C47082
	for <linux-lvm@archiver.kernel.org>; Tue,  8 Jun 2021 06:29:30 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 674D261246
	for <linux-lvm@archiver.kernel.org>; Tue,  8 Jun 2021 06:29:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 674D261246
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=linux-lvm-bounces@redhat.com
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-388-6G7w2EMQNQGR7SeTRAdDbA-1; Tue, 08 Jun 2021 02:29:28 -0400
X-MC-Unique: 6G7w2EMQNQGR7SeTRAdDbA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A5B22801B18;
	Tue,  8 Jun 2021 06:29:23 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D897A19C66;
	Tue,  8 Jun 2021 06:29:19 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7AA9C18033F6;
	Tue,  8 Jun 2021 06:29:13 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 157ARUD5012366 for <linux-lvm@listman.util.phx.redhat.com>;
	Mon, 7 Jun 2021 06:27:30 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 03E8B200E290; Mon,  7 Jun 2021 10:27:30 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F32E2202E9F6
	for <linux-lvm@redhat.com>; Mon,  7 Jun 2021 10:27:27 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C526485828E
	for <linux-lvm@redhat.com>; Mon,  7 Jun 2021 10:27:27 +0000 (UTC)
Received: from de-smtp-delivery-102.mimecast.com
	(de-smtp-delivery-102.mimecast.com [194.104.109.102]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-544-fI0kpVNEOJakDwbUk2V7Tg-1;
	Mon, 07 Jun 2021 06:27:25 -0400
X-MC-Unique: fI0kpVNEOJakDwbUk2V7Tg-1
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
	(mail-am5eur03lp2055.outbound.protection.outlook.com [104.47.8.55])
	(Using TLS) by relay.mimecast.com with ESMTP id
	de-mta-21-xDFZe1vuMuKs-1jvMRazvg-1; Mon, 07 Jun 2021 12:27:22 +0200
X-MC-Unique: xDFZe1vuMuKs-1jvMRazvg-1
Received: from DB8PR04MB6555.eurprd04.prod.outlook.com (2603:10a6:10:103::20)
	by DB7PR04MB5068.eurprd04.prod.outlook.com (2603:10a6:10:14::30) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.20;
	Mon, 7 Jun 2021 10:27:20 +0000
Received: from DB8PR04MB6555.eurprd04.prod.outlook.com
	([fe80::1061:e932:29cc:2a38]) by
	DB8PR04MB6555.eurprd04.prod.outlook.com
	([fe80::1061:e932:29cc:2a38%7]) with mapi id 15.20.4195.030;
	Mon, 7 Jun 2021 10:27:20 +0000
From: Martin Wilck <martin.wilck@suse.com>
To: Heming Zhao <heming.zhao@suse.com>, "linux-lvm@redhat.com"
	<linux-lvm@redhat.com>, "rogerheflin@gmail.com" <rogerheflin@gmail.com>
Thread-Topic: [linux-lvm] Discussion: performance issue on event activation
	mode
Thread-Index: AQHXWptdVb+iQI7pP06gMwUhQri0uKsHLrMAgAEreYA=
Date: Mon, 7 Jun 2021 10:27:20 +0000
Message-ID: <dd395e820a4cf9b5e807e8de1e456786eebd2044.camel@suse.com>
References: <a885bfa7-9635-ba73-c16b-13b9ef7a2aa4@suse.com>
	<CAAMCDef6sSy5X2+-WLR3wx5m7dx9bhmN3EKWyPa31SebS=wRGQ@mail.gmail.com>
In-Reply-To: <CAAMCDef6sSy5X2+-WLR3wx5m7dx9bhmN3EKWyPa31SebS=wRGQ@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.40.1
x-originating-ip: [2.206.153.60]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f02f23d9-2646-400e-50a7-08d9299ed526
x-ms-traffictypediagnostic: DB7PR04MB5068:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB7PR04MB5068F0700E0A14D6868EE71DFC389@DB7PR04MB5068.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0
x-microsoft-antispam-message-info: ebpGlFlinDtUVlZwqnNUn2tSEnti/Na2blFBdbOqOcVrWUlAltFTRTwcxkPmzAVHYulDwXeH24LsB2behma9T/C35U4qFTZP3tbB34NVLL42bdDKeS/c3iBMkmLY6PJovxOtMMjV+WNae2VFM3gUrMuqybj3LCeV0yRYcLNiSG0fsg2tb0uWbW8szqTmURhexGUHQVoZVPbUKyke1WZCz89gLxYBR9oN5VMQIVLGu+GcYhzFOo7QmdL+UmS3odxDE9gmPWVOnu4j+9nODNnivlNkN9ebQxHrh2jF5DH9iHjc1J14qjohvtACtnEBXsVYOhCxKB9ARqB+R2agBPdO/7t9ioaKZzdDZBGvISVcbqC4R5Cz1rWBFMtNgSrCihyJIyu9Xa7Xip9vdgcQRj4XnDGaN/xJSfgtIzVW5+q0138sFdBsRSPBbBMBdB6IANlXzlzxOJElHHTg+oJN1fkuAcc/vNLFhJ3+tvssiKvHl+JrFkDwBonzolkUVo8fHXeArDgfu22MnJq9a8KWTfNDmzWCsnNoJkfxadoHWIX/tg34Ap+XhUp/Zp5+IyQ6dLbQgMOx2nA+VIxugq5htPFyhSrUUqhJcqHQ9eCNg0igmDg=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:DB8PR04MB6555.eurprd04.prod.outlook.com;
	PTR:; CAT:NONE;
	SFS:(366004)(346002)(376002)(39860400002)(396003)(136003)(91956017)(6506007)(110136005)(66946007)(54906003)(86362001)(316002)(76116006)(5660300002)(66476007)(66556008)(186003)(38100700002)(6512007)(71200400001)(36756003)(8676002)(83380400001)(122000001)(8936002)(26005)(4326008)(66446008)(64756008)(44832011)(2906002)(2616005)(478600001)(6486002);
	DIR:OUT; SFP:1101
x-ms-exchange-antispam-messagedata: =?iso-8859-15?Q?BbWS0ISLapzqSFRYU12rF95zCn3p6JMsQ70BXBoY737zcPjP45CS1+zB9?=
	=?iso-8859-15?Q?GuJsbhl8wTxM3hreUpqDIsmF6gD+VA2QPT0fsEPzJUNza4A3ts2xsvDSI?=
	=?iso-8859-15?Q?SAJFmk81+Fb9GDT1XYSefDlu7j3SqmyEDPTgM7e5ukHC4YBTbxEZSj8Xi?=
	=?iso-8859-15?Q?4k+3guhFAPHh1shRWZNwmC7twvmkpCS91ERzupDvl2u+wkrRvoklcqBMu?=
	=?iso-8859-15?Q?QylGzSkjUyHoHOPr+EbD9668RqVfpQ/3LqWzHj1O1GM3oGFUi94vFe0jo?=
	=?iso-8859-15?Q?BRZO7G4CioYbQQXBDBmPp4vylhXm6+at6dCp/7PhYn6Nv4ytSUXl9Qpni?=
	=?iso-8859-15?Q?E69PyRIWc27KpundbytAxW8XPfdmaKtPAU3KvzGP423tegMo2cvSeS22G?=
	=?iso-8859-15?Q?kxPO0ovSEMHf1bAjHeP+IDssY9kzuajuFst4qLb3/Neaz/IQLcbYL7b2/?=
	=?iso-8859-15?Q?w1GYBwMCZh/rhwzzKgAMk5JCBG5kMPQNAjpvYafjE6t0KTLlES7cWQJQY?=
	=?iso-8859-15?Q?FEuz20kllaoZ6uhq3+NiYewab4+xWBSdLqvQdRDb4JW+0OpEHgDIDosEH?=
	=?iso-8859-15?Q?49sCPfwRYom4gkY0u1e7LomF1zdknA6CRxjI0MGNnJhm7fS2pNphXJSVz?=
	=?iso-8859-15?Q?USlAAGfGivm7XNtHmPFNgQ490oW05SKu1ZEGje6zya8GYCw4eeP6r657N?=
	=?iso-8859-15?Q?4Qx/wI6cNCz8AmfIK+DNR+KXEMULA/mgu7VepIQzrXSpwC7EqGvVWSe0t?=
	=?iso-8859-15?Q?sEjE81TmfVgG7/MCIWECPgfVoHadjaK8ki4HnUM2vtIG5xVNBaC70VBGE?=
	=?iso-8859-15?Q?+tplYXNMqi5UP4zpuAgFFuG8ghJQxa+W6UF21ipb+/Z5XFHyxo1qDRi1L?=
	=?iso-8859-15?Q?/cSezIzn3XUDh6p/i46ODoHck9bhpp7MQmRxa6WJSTEXFaY95DYqG279t?=
	=?iso-8859-15?Q?Hd6sMR9xVHReFGM2ER0IAGGDz02uQPSEjVpFyLzoMOCLF4ulaBKp5DI7W?=
	=?iso-8859-15?Q?GYxTpquqB2YYpVKPii54en03QKt1U38s7OcUACmiW9YwocvwoHWJQJj5Q?=
	=?iso-8859-15?Q?o2cIeZBE5U78RsV/c/SCKmYx27s8/zVo6f/QusVeh1qXpFTU0Xzlyr312?=
	=?iso-8859-15?Q?ewfS4hjy6PjtY+B/1sHj/4PnX4vtMTHhW6Tl/8I0EcQaXTWDcwwI0Eli8?=
	=?iso-8859-15?Q?ajcx7JMzafUCfQiqNRSi8A+fZOBlLmUjKrwVYOpGGfqAJsbRxlcIPSPMG?=
	=?iso-8859-15?Q?KV0KHVHBf4ShDU0CGFa3jIdnCXhN2O2zKiwkXymPzIzkwSUBjImBW/06g?=
	=?iso-8859-15?Q?1IELpDhXcPkgLRejzsjXBEcd+35txzps/VLpF0gzhv+TYi7ds98qxpGNk?=
	=?iso-8859-15?Q?wiBQuaH4VJp6m1Zs6/0Ef+3ejnW6ay/10?=
MIME-Version: 1.0
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB6555.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f02f23d9-2646-400e-50a7-08d9299ed526
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jun 2021 10:27:20.6166 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3c+MxzY9YnW1Tfgs6gI3Hks8T4GeZE3fcUsrOrHFRKcnmA/7x2ms6/YYfYYhwVnHb6nAwNe8Zydy63Mq3dT4xw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB5068
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 157ARUD5012366
X-loop: linux-lvm@redhat.com
X-Mailman-Approved-At: Tue, 08 Jun 2021 02:29:10 -0400
Cc: "teigland@redhat.com" <teigland@redhat.com>,
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-ID: <CD69AB0285BC524193B30052914AD457@eurprd04.prod.outlook.com>
Content-Type: text/plain; charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable

On So, 2021-06-06 at 11:35 -0500, Roger Heflin wrote:
> This might be a simpler way to control the number of threads at the
> same time.
>=20
> On large machines (cpu wise, memory wise and disk wise).=A0=A0 I have
> only seen lvm timeout when udev_children is set to default. =A0 The
> default seems to be set wrong, and the default seemed to be tuned for
> a case where a large number of the disks on the machine were going to
> be timing out (or otherwise really really slow), so to support this
> case a huge number of threads was required..=A0 =A0 I found that with it
> set to default on a close to 100 core machine that udev got about 87
> minutes of time during the boot up (about 2 minutes).=A0 Changing the
> number of children to =3D4 resulted in udev getting around 2-3 minutes
> in the same window, and actually resulted in a much faster boot up
> and a much more reliable boot up (no timeouts).

Wow, setting the number of children to 4 is pretty radical. We decrease
this parameter often on large machines, but we never went all the way
down to a single-digit number. If that's really necessary under
whatever circumstances, it's clear evidence of udev's deficiencies.

I am not sure if it's better than Heming's suggestion though. It would
affect every device in the system. It wouldn't even be possible to
process more than 4 totally different events at the same time.

Most importantly, this was about LVM2 scanning of physical volumes. The
number of udev workers has very little influence on=A0PV scanning,
because the udev rules only activate systemd service. The actual
scanning takes place in lvm2-pvscan@.service. And unlike udev, there's
no limit for the number of instances of a given systemd service
template that can run at any given time.

Note that there have been various changes in the way udev calculates
the default number of workers; what udev will use by default depends on
the systemd version and may even be patched by the distribution.

> Below is one case, but I know there are several other similar cases
> for other distributions.=A0=A0=A0 Note the number of default workers =3D =
8 +
> number_of_cpus * 64 which is going to be a disaster as it will result
> in one thread per disk/lun being started at the same time or the
> max_number_of_workers.=A0

What distribution are you using? This is not the default formula for
children-max any more, and hasn't been for a while.

Regards
Martin


_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

