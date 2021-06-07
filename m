Return-Path: <SRS0=kfxi=LC=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,PDS_BAD_THREAD_QP_64,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90D9DC4743D
	for <linux-lvm@archiver.kernel.org>; Tue,  8 Jun 2021 06:29:58 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 21819611BD
	for <linux-lvm@archiver.kernel.org>; Tue,  8 Jun 2021 06:29:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 21819611BD
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=linux-lvm-bounces@redhat.com
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-21-3aDHWJF0Mxq5YxU67bTDIQ-1; Tue, 08 Jun 2021 02:29:55 -0400
X-MC-Unique: 3aDHWJF0Mxq5YxU67bTDIQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B924E1854E2A;
	Tue,  8 Jun 2021 06:29:49 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8ADC7100EB3D;
	Tue,  8 Jun 2021 06:29:49 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0192B18033F6;
	Tue,  8 Jun 2021 06:29:49 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 157FjXIo013639 for <linux-lvm@listman.util.phx.redhat.com>;
	Mon, 7 Jun 2021 11:45:33 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 22BF32039D96; Mon,  7 Jun 2021 15:45:33 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1D15E204402C
	for <linux-lvm@redhat.com>; Mon,  7 Jun 2021 15:45:28 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 65F6890DE46
	for <linux-lvm@redhat.com>; Mon,  7 Jun 2021 15:45:28 +0000 (UTC)
Received: from de-smtp-delivery-102.mimecast.com
	(de-smtp-delivery-102.mimecast.com [194.104.109.102]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-377-mDMknP03PQ-uzyA9gVpVyg-1;
	Mon, 07 Jun 2021 11:45:26 -0400
X-MC-Unique: mDMknP03PQ-uzyA9gVpVyg-1
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
	(mail-vi1eur05lp2176.outbound.protection.outlook.com [104.47.17.176])
	(Using TLS) by relay.mimecast.com with ESMTP id
	de-mta-11-dd9HYBrlNBaLCvWdFJI8qQ-1; Mon, 07 Jun 2021 17:45:24 +0200
X-MC-Unique: dd9HYBrlNBaLCvWdFJI8qQ-1
Received: from DB8PR04MB6555.eurprd04.prod.outlook.com (2603:10a6:10:103::20)
	by DBBPR04MB7577.eurprd04.prod.outlook.com (2603:10a6:10:206::10)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.24;
	Mon, 7 Jun 2021 15:45:21 +0000
Received: from DB8PR04MB6555.eurprd04.prod.outlook.com
	([fe80::1061:e932:29cc:2a38]) by
	DB8PR04MB6555.eurprd04.prod.outlook.com
	([fe80::1061:e932:29cc:2a38%7]) with mapi id 15.20.4195.030;
	Mon, 7 Jun 2021 15:45:21 +0000
From: Martin Wilck <martin.wilck@suse.com>
To: Heming Zhao <heming.zhao@suse.com>, "linux-lvm@redhat.com"
	<linux-lvm@redhat.com>, "rogerheflin@gmail.com" <rogerheflin@gmail.com>
Thread-Topic: [linux-lvm] Discussion: performance issue on event activation
	mode
Thread-Index: AQHXWptdVb+iQI7pP06gMwUhQri0uKsHLrMAgAEreYCAAFSvgIAABC2A
Date: Mon, 7 Jun 2021 15:45:21 +0000
Message-ID: <db88e87318ac6709766bec877c5ccc35ea155881.camel@suse.com>
References: <a885bfa7-9635-ba73-c16b-13b9ef7a2aa4@suse.com>
	<CAAMCDef6sSy5X2+-WLR3wx5m7dx9bhmN3EKWyPa31SebS=wRGQ@mail.gmail.com>
	<dd395e820a4cf9b5e807e8de1e456786eebd2044.camel@suse.com>
	<7522886d-bfba-6dd6-882a-703d5776e71f@suse.com>
In-Reply-To: <7522886d-bfba-6dd6-882a-703d5776e71f@suse.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.40.1
x-originating-ip: [2.206.153.60]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5ce61785-af60-4899-ae93-08d929cb4262
x-ms-traffictypediagnostic: DBBPR04MB7577:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DBBPR04MB757713D70672BE6289C4B165FC389@DBBPR04MB7577.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0
x-microsoft-antispam-message-info: d6aFfRNnMxJN3vd1C8JfEa2IS7t2LZp6ol9uvynpDBcgh0zOx6PifflC8Buo9u7OoJHj7XmTwaJ27jqJs4nEaj2mE7TNHzurRLFPeWV7W84F3/dCwAGZfxbwZ/zgLEEK1rXZItR9A32D4ucGztOclujsLK2uQ1p9WTXzzyJ+Vk7mF07ynaUTDrXraF4+dv+jHY3RMMbqKpoqS/fk2jhYApuXJYm5DIMAtbARNj6WdPGO6GOZev7EZPSdY/UczMz+28PIpH2VyTpc20XRzxKJL0w8OtQtL+LHm4Wis88pg2Ut0YkpTvtVzK2axPdcghN/pQ7Bys88eZwev8PFGJlSuGih4AknODQTS8H6vY9IMUJZZ60z9qkJqiC284mQXT5oyVMKdsQAJEbIgNIBNTabTuSvPbKkigOsxHNCzRt41ulazws+U12KVK8yGMTdtQ92DRozJd+ngAp9NK8ZfR6rm9AIfuHXy4rOo+BQENIfPHaB9qw10JlYq1HfzjnJaeWYXfsezuAo+JHg2sAPQgYikUm0QMn9FUeF63CN42cdXcTtM0S2CJ98qFsTy0dsiY2pK4EORU8cB+W/l2ywAAum1sAZp6SkO+ayDz7d8M1CxMs=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:DB8PR04MB6555.eurprd04.prod.outlook.com;
	PTR:; CAT:NONE;
	SFS:(39860400002)(346002)(376002)(396003)(136003)(366004)(8676002)(2616005)(44832011)(110136005)(53546011)(4326008)(8936002)(316002)(54906003)(91956017)(66556008)(186003)(26005)(478600001)(64756008)(66446008)(66476007)(66946007)(6486002)(71200400001)(86362001)(6512007)(36756003)(38100700002)(122000001)(76116006)(5660300002)(83380400001)(6506007)(2906002);
	DIR:OUT; SFP:1101
x-ms-exchange-antispam-messagedata: =?iso-8859-15?Q?fXJsht+5YuHKIzyAiWtNBlsaod4Lwe5qQR5oY1qU2RqARa6SIOrFSJ6nx?=
	=?iso-8859-15?Q?vnwLns0J7bfpt7ZJau4Dt1sELjdhd+IT5d6SN1vCdipZqDdKgKuo9hZP0?=
	=?iso-8859-15?Q?PxNc3CNk5k9aoIt981FeQJBSY7hKG86OB9at4spJt0ZeeI9tPFh4i3q78?=
	=?iso-8859-15?Q?AldtVcNSWp7JEDDbItCB9pjgX/HK/PxC8FmrOkaplGtJ/kumFk9BpgpPQ?=
	=?iso-8859-15?Q?CnXoYuVmkbj4vbIfESfJP/2ygeaIOzgkV9VjXW2KVqBhTBkcHPwvbNlIA?=
	=?iso-8859-15?Q?mChMyVeRFAisKS6gDzByvGAImurknhqieTLhjfQ38qQA5TloWhWnvLhnD?=
	=?iso-8859-15?Q?CA7F4PqdqvbLWqkPsRfWiEWfVnjHSwDDmLxGK1MNvTPpOymrM15rfmkfc?=
	=?iso-8859-15?Q?ujpkwtmnCE5haw8Pvn4hnoJ6fecOksOrUHSuQ3CyU79Y3fbDpVqT3JdeM?=
	=?iso-8859-15?Q?JGMbqSD7I8/6/cYk0wAHKQEs2wX/mmedVtZeIvnAsjqGUQSl0XQxD/vRN?=
	=?iso-8859-15?Q?+gY3Yjcm81dzkY02iRXgar1f9R8ucJwGYFH8Z5HGVPGjDsYr0TfB5deyn?=
	=?iso-8859-15?Q?GBw/6bBVFQzK57SmkGYGERH1vZookPg60ZkrcfIl0TIZMG3ITHSuCVoof?=
	=?iso-8859-15?Q?ZXN8YAGtbBPJOGeymd02UdOJRpMvRmFlA1LS2mkh3hR2UN/lssobMu/XN?=
	=?iso-8859-15?Q?2Jn90J3eoYgweKjwbj+dJJe/HefIsWW1ktCxNsrKpEkN2TwYRV41qPKHG?=
	=?iso-8859-15?Q?rb/Gl+2+55askVETPIMu7d96dcMLwvjeQJ4U1W8SkcJT7T7r85noTvAyu?=
	=?iso-8859-15?Q?E8V7qIAnIE/zhNnUq+bmUEhcE+hUBnfBHRmDZl2NVTfO0vWDhXaqnnV+J?=
	=?iso-8859-15?Q?ITBl1dhXcfBBvH7iaD5FCBoZjoi7ITnQi4fFJAFpDHIuHeqpaiZpGsmM6?=
	=?iso-8859-15?Q?UD8tsabHZoKavTvEZMeZxx6A9ElAy6+WKZGmpyImQJF0Q8pMRj9XJdGqn?=
	=?iso-8859-15?Q?8wNTfWYAGBPJ0TB1487QqPlZCKMKI/HGkv48AR4P8+s+6X8/MDe9Kple3?=
	=?iso-8859-15?Q?2Rl6ccprJGXgqqtbnXhcXhY29aRqfUCjbzsKuW9SjnlB3Tylf8bSMgzS/?=
	=?iso-8859-15?Q?5thEOxTS8lA9UhJDAryDDSYoMeNnIgn6yY+URm2fOCrEv8zhU5v1QVQYT?=
	=?iso-8859-15?Q?X1b95ao6pTYym9UQh2qMRAOkhDqNcdDsl9LkOy/Zd8uvTocRfusG2HtCW?=
	=?iso-8859-15?Q?V1mwYaj1kmosdtCL0Kj/sUizkX6b+nfzrDlRdx7WdCHLtYaKVN86/o8G4?=
	=?iso-8859-15?Q?uabYKhYGpue1kMOyavWiC3BqxmHMpI2t17jF61GI+j6lKCVJB0ir2Yy3Y?=
	=?iso-8859-15?Q?F8JWu1W3OZ8EAZP0jfhLsAvd15nlnEu3Q?=
MIME-Version: 1.0
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB6555.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ce61785-af60-4899-ae93-08d929cb4262
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jun 2021 15:45:21.7929 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0E4LR0lCP8l1NlovJRE7hPME/TzzXLRXQKvc6VzRlbZ74sJL58TlYwF5MfDMDrlsJGKyHcecZxvS77wEpG2MTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7577
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
	lists01.pubmisc.prod.ext.phx2.redhat.com id 157FjXIo013639
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-ID: <CA35FA4D1CEC214AAACA4CDD652E95E6@eurprd04.prod.outlook.com>
Content-Type: text/plain; charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable

On Mo, 2021-06-07 at 23:30 +0800, heming.zhao@suse.com wrote:
> On 6/7/21 6:27 PM, Martin Wilck wrote:
> > On So, 2021-06-06 at 11:35 -0500, Roger Heflin wrote:
> > > This might be a simpler way to control the number of threads at
> > > the
> > > same time.
> > >=20
> > > On large machines (cpu wise, memory wise and disk wise).=A0=A0 I have
> > > only seen lvm timeout when udev_children is set to default. =A0 The
> > > default seems to be set wrong, and the default seemed to be tuned
> > > for
> > > a case where a large number of the disks on the machine were
> > > going to
> > > be timing out (or otherwise really really slow), so to support
> > > this
> > > case a huge number of threads was required..=A0 =A0 I found that with
> > > it
> > > set to default on a close to 100 core machine that udev got about
> > > 87
> > > minutes of time during the boot up (about 2 minutes).=A0 Changing
> > > the
> > > number of children to =3D4 resulted in udev getting around 2-3
> > > minutes
> > > in the same window, and actually resulted in a much faster boot
> > > up
> > > and a much more reliable boot up (no timeouts).
> >=20
> > Wow, setting the number of children to 4 is pretty radical. We
> > decrease
> > this parameter often on large machines, but we never went all the
> > way
> > down to a single-digit number. If that's really necessary under
> > whatever circumstances, it's clear evidence of udev's deficiencies.
> >=20
> > I am not sure if it's better than Heming's suggestion though. It
> > would
> > affect every device in the system. It wouldn't even be possible to
> > process more than 4 totally different events at the same time.
> >=20
>=20
> hello
>=20
> I tested udev.children_max with value 1, 2 & 4. The results showed it
> didn't take effect, and the booting time even longer than before.
> This solution may suite for some special cases.

Thanks, good to know. There may be other scenarios where Roger's
suggestion might help. But it should be clear that no distribution will
ever use such low limits, because it'd slow down booting on other
systems unnecessarily.

Thanks,
Martin


_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

