Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45F67C32772
	for <linux-lvm@archiver.kernel.org>; Tue, 23 Aug 2022 08:28:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1661243314;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=IlWj0l1bRNPLaoS5K8BykJvkcWjCW4ZwhH2vP32xWPk=;
	b=RS+F8gJYSXUuSCm8z3awFrAHLdKchP1EpOX0K57FJ9ciqxe7Ii6WTjVwgL0iGNoXrK426/
	VLMwW4T9Pe+QFaZdxZMq1bB2XBoh+4UQw0vwZnuQcEsngNH8d0ZKMW/mWvv6U3qQi9/UsK
	BFbDU3Gui2SU9DFAuqI1SviOk/WaROo=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-493-cfD50O3lOVSK8kJ8nDvv8Q-1; Tue, 23 Aug 2022 04:28:32 -0400
X-MC-Unique: cfD50O3lOVSK8kJ8nDvv8Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 124123C0D84E;
	Tue, 23 Aug 2022 08:28:27 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id ECFF9C15BBA;
	Tue, 23 Aug 2022 08:28:26 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id D5FB1194706A;
	Tue, 23 Aug 2022 08:28:24 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id C06C9194F4B4
 for <linux-lvm@listman.corp.redhat.com>; Thu, 18 Aug 2022 21:13:40 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id A1279945DD; Thu, 18 Aug 2022 21:13:40 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9C93B945D7
 for <linux-lvm@redhat.com>; Thu, 18 Aug 2022 21:13:37 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 51280185A79C
 for <linux-lvm@redhat.com>; Thu, 18 Aug 2022 21:13:37 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60053.outbound.protection.outlook.com [40.107.6.53]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-255-IceZAZoONyKsdqZ4hD6pow-1; Thu, 18 Aug 2022 17:13:35 -0400
X-MC-Unique: IceZAZoONyKsdqZ4hD6pow-1
Received: from AM8PR04MB8036.eurprd04.prod.outlook.com (2603:10a6:20b:242::13)
 by AM6PR04MB4119.eurprd04.prod.outlook.com (2603:10a6:209:4e::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.28; Thu, 18 Aug
 2022 21:13:29 +0000
Received: from AM8PR04MB8036.eurprd04.prod.outlook.com
 ([fe80::650e:243b:14d5:4593]) by AM8PR04MB8036.eurprd04.prod.outlook.com
 ([fe80::650e:243b:14d5:4593%7]) with mapi id 15.20.5525.011; Thu, 18 Aug 2022
 21:13:29 +0000
From: Martin Wilck <martin.wilck@suse.com>
To: Heming Zhao <heming.zhao@suse.com>, "zdenek.kabelac@gmail.com"
 <zdenek.kabelac@gmail.com>
Thread-Topic: lvmpolld causes high cpu load issue
Thread-Index: AQHYsVgWNV1O3wjOPkulMZVFmhWK/Q==
Date: Thu, 18 Aug 2022 21:13:29 +0000
Message-ID: <2672df967c1c8085aa16ced6a54667055f2d02c7.camel@suse.com>
References: <20220816092820.6xbab36dcmxq5hfm@c73>
 <be332c6b-4b65-6462-c570-ee6d0e81b985@gmail.com>
 <20220816100802.yy3xqvynil4pcspb@c73>
 <204c332e-2a30-b17a-ecc1-58025454eb00@gmail.com>
 <20220817020225.gf6ooxobdf5xhpxe@c73>
 <6fa27852-e898-659f-76a5-52f50f0de898@gmail.com>
 <20220817084343.33la7o6fdh5txul4@c73>
 <27cd8fd6-1058-fe18-dab6-847d41bf894d@gmail.com>
 <20220817104732.jhu3ug6ahep3rnpq@c73>
 <b36cd2879a9ccaf25d0bb0389291e331adcc68c6.camel@suse.com>
In-Reply-To: <b36cd2879a9ccaf25d0bb0389291e331adcc68c6.camel@suse.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 72bc18c3-f9ad-47dc-a874-08da815e7f89
x-ms-traffictypediagnostic: AM6PR04MB4119:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0
x-microsoft-antispam-message-info: 8TsMXsGC1kJIyOEPyoqxtFPp5IGu/hmVcs1akFcnNiPO9VxD0XrWOCDwOqe6IbwMjFeKxE7vJricM5ts5Oz6nsIhzoB1ZGchPYKTNOqfeQUQZ4iJBRs/lPaGHLQU4h7mh4FuIyoWNputmGTfkJjmKJL4b4qFBeyWC6qOvM0tkJ9Nd6xZa2Xe6PW0oHKqie/BfEdVz1qODvz0nNZlsmgaGSQq9JWjeQzl7qSwDXX+j7Q5YRBtU6BOTvAZBDMbAHnjThRbH3v/ASm35BDr85jbi5F+xg5uj+zNK81x2MeSSurE/VF2DMA4fuZR8nFOQMTjWK3tPaRRRalJZwHWbFCIhUg8M2VbM7mIRO1kW3uN9y43fFfPXvuab9L8VjX3i99SoDFdXYtwlHdgemv8N//nF22QGjJ8dtC6BJLlnU+HRtV2F6WbVBxPDQVo8FSkJxzQvC714qVJYNCuGwroH7EU3Fi30taPhvrrZw4hPSvoZetV+LdMwlhYZU7fry4FYiMI6EYVyOV2QL/AmJkcF8guBlrtL/VB6P37fspbIE9JliXAbkmrrPXdo5SywTon/0z4xK4HJx7S0vzqun5OM8QWGAD/Cb5P/vRzeI23C3+kcLCgZFeotYe0GJA+YMiEUpSzTASoz2GAnrofNiNBsIYewwk/N4U/7pU+H2i46gamMf2ltcZxQI3VjjO928pDOMDQGF1B58RvapjasI8DL7ns2hRP4k/YiY9bCZ/KYtsdtsCBZ5KpkqDUjK76aegIovigAhVWR642Wqsv1z47XX8LBQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM8PR04MB8036.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(346002)(376002)(396003)(136003)(366004)(39860400002)(4744005)(110136005)(2906002)(8676002)(66446008)(76116006)(4326008)(41300700001)(86362001)(54906003)(71200400001)(122000001)(5660300002)(478600001)(66946007)(316002)(66476007)(6486002)(64756008)(44832011)(66556008)(91956017)(38070700005)(83380400001)(186003)(8936002)(6506007)(26005)(38100700002)(2616005)(36756003)(6512007);
 DIR:OUT; SFP:1101
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-15?Q?C6zcFiTUYCtTTr78uuSq6IyoUKCZmgih0d7l83mkvXEV8XUHdE5JKfVkt?=
 =?iso-8859-15?Q?bwn5unEU+jdn7Ek3F62IeYMXFSIUCY86zzvSBmmq7YwAlVKywNHMOm20a?=
 =?iso-8859-15?Q?4Km2wM7jONgWGMcs5nIfaz4Oldq2cfM9sYbGBtBIYBpBCrvolWlw+/WNs?=
 =?iso-8859-15?Q?qmOyyZLT/OFYFB+ZOLCoRMUpVI0N8uCjashZEy9HipHPoO7q2hd6rytL1?=
 =?iso-8859-15?Q?FgJjTNg8eYKf2Bu09bPgfpGCFic7v7Vr8XR3lXMVaUnVPkc+x2reSwrk1?=
 =?iso-8859-15?Q?AF7M4KnlSRIDrYiiYjD+6hx8B5tg9b+2L/exNIwczOfMO1PQZ94SZf1cV?=
 =?iso-8859-15?Q?DeZLKUOhfOx3xv1Ul8J1DBkLXlp3jhGlzCMDuRP+/Y1dbFFloniXIOddy?=
 =?iso-8859-15?Q?smAEym9yNsl2usmMvmrcn6b11w9x03ZC/IIYX0GiMGYHGcZii3UO22TqD?=
 =?iso-8859-15?Q?b7S7UYCxqF1GfhBSbtS819PuZY75N8CumR2q1PqpKFAGWYjYaK+8kUHcf?=
 =?iso-8859-15?Q?/FIlr3UivoaTvGxZHocCwnlHPnFsmLrYgqaVpgUkFJTCTUCGNUZClKoZG?=
 =?iso-8859-15?Q?82zTFzGl5GkVqdMNZXlfAiKOATWvMNWAHABRHnFnr+cXU8rQgXiZaeH5G?=
 =?iso-8859-15?Q?s+BADgQcFfhXcvMV1qcsF5UHBe1znA3/ueGk8YbsCKzQNwDYQfArdY4im?=
 =?iso-8859-15?Q?9Mr9050+JN3S9W8oMS218mo/Au51eU688+YGSbgsb0noEqbo2tORSyhdt?=
 =?iso-8859-15?Q?olvNBoJo6w/IwSuXJTSN7/4XQtmYBo6hiPrdxI5i8C8tceXJ9Mp71sNAR?=
 =?iso-8859-15?Q?4HtXyPTRR8PDLsR4Xh5BXmphPXXz+q9ID1+8ajMuZaDt3yD/1jwg/gM6m?=
 =?iso-8859-15?Q?KZQdDnKpbP8yg3SsRHDv08Qnueml7iCcVE6KU8NrDuK+ZKaV9p31atwLF?=
 =?iso-8859-15?Q?Orp+m1l88f2Kt1d5ZSde+uB94cICq0XKBw2nIrjZPNNvNX2JqoMwinYZU?=
 =?iso-8859-15?Q?tN1G6WM4k1+RYrjvWahEBTLL8YjyewB0Fyf/NCk3bKxkNrmBIRVKQN0xf?=
 =?iso-8859-15?Q?mil4mMbBe8vhMlYrjRRXzMSvezF74Z3BAUiJQildU0dX8f0pT77k+b+ZQ?=
 =?iso-8859-15?Q?kja0kqDP3RrthbFW32hlRRmRUkb2lharE9pRoRX/d/xWACEvwtXfsp7YL?=
 =?iso-8859-15?Q?zu8YRugY+Q6cozleHvrHFw99AUXQCeEATIYzT/31h0jOMAwKJU39/R8/S?=
 =?iso-8859-15?Q?gU0Wna/iNxgHdKMskheOhnBHrV3nKfOCmw0Qy8E1Fgc2Kh38q70n3rzyi?=
 =?iso-8859-15?Q?4UXYmhkR9zrZeQzeJAVcxXcFg8whahNhirjMMJg1EjSaAAUM6HNagl/mb?=
 =?iso-8859-15?Q?GmBcE30OwGxOy9fc1gJTGQ8qvMorAJl1Nr6levM72vI4PMRsgIWj8j3sh?=
 =?iso-8859-15?Q?LPbt8/oaDGotaJgI5KpSAC8OEWYS6c/81ssW0fBNOF60BiG/NA8E73PY5?=
 =?iso-8859-15?Q?g9fvjCS2xXoi4/cIe3znCuEoyiW7+Pxc3v0wTdz+RplluMeR3hFlpKiDx?=
 =?iso-8859-15?Q?TQJbN6qi6JPTlgBclNjo2R28RMbuFS9PJ7qC7VG7y61Rh1GPWFXqqgJOZ?=
 =?iso-8859-15?Q?kqVwH9MYyo7JaXXWfPk4Ogw9GrWtOVCfjMG1C1662ZLOi0TkqBwZeu2Yj?=
 =?iso-8859-15?Q?8zjfpoCdT9KD8v7leq1V2Gpkcg=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB8036.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72bc18c3-f9ad-47dc-a874-08da815e7f89
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Aug 2022 21:13:29.2827 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uezcoqO1g5k9iymbf2EDU+g76tP73oQSgI2rV487DQat+pnnrZtgbcVTFgxeppfdNFzKHQg/bVBQB2lfp8dKvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4119
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Mailman-Approved-At: Tue, 23 Aug 2022 08:28:22 +0000
Subject: Re: [linux-lvm] lvmpolld causes high cpu load issue
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
Cc: "teigland@redhat.com" <teigland@redhat.com>,
 "linux-lvm@redhat.com" <linux-lvm@redhat.com>
Errors-To: linux-lvm-bounces@redhat.com
Sender: "linux-lvm" <linux-lvm-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-ID: <F7892CF4BDCE814A84C1D6CA1A89D8DC@eurprd04.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, 2022-08-17 at 14:39 +0200, Martin Wilck wrote:



> "multipath -U" is
> already quite well optimized, but it needs to do some I/O to complete
> it's work, thus it takes a few milliseconds to run.
> 
> IOW, it would be misleading to point at multipath. 

This is what I thought. I had another look today, and I found that the
case of a very large "multipath.conf" file is indeed not well
optimized. I just sent a patch set to dm-devel ("multipath:
optimizations for large mptable") which should the issue discussed in
this thread on the multipath side.

The pvmove / watch problem could still deserve some attention, but the
urgency should be much  lower.

Martin


_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

