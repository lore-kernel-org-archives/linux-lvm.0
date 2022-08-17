Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC5B9C32792
	for <linux-lvm@archiver.kernel.org>; Tue, 23 Aug 2022 08:28:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1661243314;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=WSzaLsUbEtoM2RVpkapdaAJ+3QlDxPhTzoBz2b8DpxU=;
	b=RV4zX5kAnuKLYg3JZDbdk2tD5hQtF/cTxi6NvYb85Mx/bLWcAFFmoD9mKwsA6W8AJzCcK5
	vVB/uFBQ+iu2FsUbYM9qSuKNSDa3840KiqZZurN9bXEBjS1PNxHrm/3pqIY5nhFSuwSrQ4
	wNVBIvaLoDgNtOql5EEwSnYjfhhQuds=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-489-zTJVF7uLP42NRhJ_HpO13A-1; Tue, 23 Aug 2022 04:28:31 -0400
X-MC-Unique: zTJVF7uLP42NRhJ_HpO13A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CECDE3C0D855;
	Tue, 23 Aug 2022 08:28:26 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 56FB64010D2A;
	Tue, 23 Aug 2022 08:28:24 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 992071946A61;
	Tue, 23 Aug 2022 08:28:22 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 6BE391946A40
 for <linux-lvm@listman.corp.redhat.com>; Wed, 17 Aug 2022 13:41:25 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 45379112131B; Wed, 17 Aug 2022 13:41:25 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3FDEC1121319
 for <linux-lvm@redhat.com>; Wed, 17 Aug 2022 13:41:25 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1E2E93C11042
 for <linux-lvm@redhat.com>; Wed, 17 Aug 2022 13:41:25 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70050.outbound.protection.outlook.com [40.107.7.50]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-528-DemJNjzDN6SEQtdXDTWcsQ-1; Wed, 17 Aug 2022 09:41:21 -0400
X-MC-Unique: DemJNjzDN6SEQtdXDTWcsQ-1
Received: from AM8PR04MB8036.eurprd04.prod.outlook.com (2603:10a6:20b:242::13)
 by DU2PR04MB8535.eurprd04.prod.outlook.com (2603:10a6:10:2d6::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.11; Wed, 17 Aug
 2022 13:41:17 +0000
Received: from AM8PR04MB8036.eurprd04.prod.outlook.com
 ([fe80::650e:243b:14d5:4593]) by AM8PR04MB8036.eurprd04.prod.outlook.com
 ([fe80::650e:243b:14d5:4593%7]) with mapi id 15.20.5525.011; Wed, 17 Aug 2022
 13:41:17 +0000
From: Martin Wilck <martin.wilck@suse.com>
To: Heming Zhao <heming.zhao@suse.com>, "zdenek.kabelac@gmail.com"
 <zdenek.kabelac@gmail.com>
Thread-Topic: lvmpolld causes high cpu load issue
Thread-Index: AQHYsVgWNV1O3wjOPkulMZVFmhWK/a2xUrWAgAEFrQCAAGV3gIAACmCAgAARegCAABEeAIAAI5IwgAAM+YA=
Date: Wed, 17 Aug 2022 13:41:17 +0000
Message-ID: <4e0551e18a28ff602fae6e419dc746145e5962d3.camel@suse.com>
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
 <727dcd28-99a2-739b-debd-a921e477e0d3@gmail.com>
In-Reply-To: <727dcd28-99a2-739b-debd-a921e477e0d3@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0f0baffe-7690-4926-88b4-08da8056294d
x-ms-traffictypediagnostic: DU2PR04MB8535:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0
x-microsoft-antispam-message-info: 8hB1cHfgSLWHeBOeoR0F7efozxsl4wO/GWpQpvy27CSTAJBK6+9Lsjz/VpArBWe/rnmYoEGAI1NTnqnVj6HoCXqUmiOPTjEEhFWF0b7oac1iFZnwtGv5g4InDTiK7zhMk/816OPagwinhdG6bR9/IvF2u0ID9hQkf2a/ux/83XlHmCZRRnL9FLEOPfWUFdPDks9V+SJZ8Qr2AA9SuzZKhI85ZnRmWqV9vF8q303766GeD5GwPtEv/+QsnLt7EAJSR1A0S9h0KkPKdLltpfuIAEygwD/MQoiTXh9xBw1oNp8YPeYyurAHu91jcE2E6vFXraLRFyCwMQiZMw+he+55Ab/J1ST05bej7RI9dQZpcABNW4dN+VBLaYd+Xs+HF1ahdSZ8sf2oKC44WHFDuAdmOzLkGG1yI9zzJsuSiAeHX7d5uKOiRPtIt5ima1ZNMMkhTG15CGreaUZTOoUZIG4Vboz8Dxu8LDKXUArkwtrm0KEeugWkr5Ev9wWt+Z8ziAEyIe//qsRmj4Qv6pAvGkqB4h1lAgjfvlh2FeXsNEl4ScpjAw3PHvoh586unhIrd0pq4tSZ0otqpJBsXkB/vbFEIFjxoPryzujZ9yKbOxq3D1EwxPevBUrJUewicWAimSayuq+oSCZoHPY5Ica54JD76HPvFDOj6BfZswDzoL4rgd98DuJ7kQCRCpUr3WS1zTypXWvHJjRON92tD+Z5f8ONX+Mck4RGAfqupIkzj3iR5em+2wV/WgFB+8iLwGF4sBQssLBX0bNFcUuFoUYGJOvXVzlCLZ0PfhIHJIfruudDjmIN2+0ZjGShlPNN/3EMhyZ2
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM8PR04MB8036.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(396003)(366004)(346002)(376002)(136003)(39860400002)(2906002)(76116006)(5660300002)(66946007)(4326008)(54906003)(66476007)(64756008)(66446008)(8676002)(110136005)(8936002)(44832011)(91956017)(38100700002)(316002)(122000001)(66556008)(26005)(186003)(41300700001)(38070700005)(478600001)(6506007)(36756003)(83380400001)(86362001)(71200400001)(6486002)(2616005)(6512007);
 DIR:OUT; SFP:1101
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-15?Q?KR7vJP/q1N5T4NR9q0WnAdaNS09LS+zxaka5Xw+1QMDmfm8fj36SPQ1ca?=
 =?iso-8859-15?Q?lCGBVUZyqGAL43nwLS40hm+sd9cEc8akGm+BtCQtWR4xBipPqnwlOPSQ0?=
 =?iso-8859-15?Q?EKReXZW4c+R/v65Q8qUtSHNHZKcXFiHR6xc+rl7f1DiYFdxbSWRyDrWpB?=
 =?iso-8859-15?Q?ljQREHHcehkVj4++aFlsSXRFgVKSDq68CUZhhA47GTHlbCBNz1+9pXiIj?=
 =?iso-8859-15?Q?FId4aLSznHnE9E6pifusF/jQCiHQdmEe/KDSNVx2fD2XTsZ1qKT6r4VkA?=
 =?iso-8859-15?Q?jTirCFB3X9TxlYAg2M9Lrdjvf64lOC6rfbvvN6XD/yKTRfZT1Z0JmDbfa?=
 =?iso-8859-15?Q?rwsIBzz67Bnw7ukePB8wVKB6VQy1OasE2WPSXGSx4Ss57Q6sIey/knav7?=
 =?iso-8859-15?Q?ymguK0V+djDcCbk4nJGPEU2EOPSMx4hMhIe7ZG4RbotXVzpKdFzOFwBGn?=
 =?iso-8859-15?Q?8ZRWEGcU/36lnFn6nvmTYOhzz7rVPzQWSK7QQSKGKQJSZlTaxmP8KpJ5J?=
 =?iso-8859-15?Q?4vupDfCJsyQABXHo7A7MdY1E4EC9kiAXaBVhhQMnaimMboztBkBrBHnD2?=
 =?iso-8859-15?Q?mtTBQOKlcVOhtKs11YvTzYRjw+cscoD94U7Z2XlwQbIwQouyFU+pf2I8Q?=
 =?iso-8859-15?Q?LKg5NbnqroQBCyHQStT9HEJ8ED6J3ks/deZJpPtfCjaM8gO1/6hcftSWN?=
 =?iso-8859-15?Q?w3d4H2piVItQJ1HnNESDFRITID+528OG+YIwc7cbv0oKyi1UUs166AGer?=
 =?iso-8859-15?Q?jkNCx0lBwNWj8Ko+jNCHtmyZC5Fge00f2A9btKjyqWPM7tB9SmcOs8AqB?=
 =?iso-8859-15?Q?t/3Q8Sw/DYD2CJT283ARZm027NxPIK2oZSpvV0jpreMlnC/ZcGFVfdu+n?=
 =?iso-8859-15?Q?SE/rY9VZXDOeTmj005DGk4jXKX4bO0DLpJEuECnWfEB3RrZnfYyNqGBeN?=
 =?iso-8859-15?Q?KVBJgn/9s7GbJPil7VBvjTon0FVGAtDOBlzwolfsTQLt0lQ2vuVGHc43H?=
 =?iso-8859-15?Q?Xxr3GoaQY8dvawBxTkekhKEfrRXtDWpiJWdj+y6BCs7r2ZyZjsJmXJwOR?=
 =?iso-8859-15?Q?NbBnLwqKMDjwh3HzBjgGlfKIdWWQJbZp7oYWEeau/tb2hgIR0VD2/gsLk?=
 =?iso-8859-15?Q?6QKEQ5soWzfFRXUlFWRXx38dlrzZp8Fx7TklphXrbft0dI9vnthbuZvvZ?=
 =?iso-8859-15?Q?XsjtW1ukeEpF/pLYazSBgiFn4dgPoEpHSEcBI6ckwZ9r9uI/VjYQV95Ig?=
 =?iso-8859-15?Q?De1BsOkswfaDCX5F4O14eEp6fUCNdgmQTTdULLic2jdDO1h89IZBlgucq?=
 =?iso-8859-15?Q?+HuMZOWLkX/vnaA/ypSNj8DZOLvTz4HOah/S0oNIjZ3hiOiUKhFj3936z?=
 =?iso-8859-15?Q?bzw+bY8HhRynxSni2snyNL7ttk+0ItlEGOfBw3mz4r0+iqHw4oWorjzZE?=
 =?iso-8859-15?Q?o16oh1JGV6GumxNdnWTlFFlKmAfKzHy0zDW259MzrXyaskl3qp+5sNCau?=
 =?iso-8859-15?Q?h9agMVmIMPo3GqmX7tVVdxTr+fE10h3QJbnBsd3X6XWUadK+zWNvFdbn+?=
 =?iso-8859-15?Q?gqX+lZBIrpQN68KOHRa7CrDX+LZu8u7y/16ejDhGNu21QijQxZ+scS0Mn?=
 =?iso-8859-15?Q?5jfHhT7qDlERfAA6O7nwOdoEcpw+09WB382nbJLjOfcRCnc+auo508uk6?=
 =?iso-8859-15?Q?uUCnA1z2rriojFOB4eFs+FvqAg=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB8036.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f0baffe-7690-4926-88b4-08da8056294d
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Aug 2022 13:41:17.4211 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ERyFYVdowzWUWbRR7wgoyNZk8v9mchAnUGhx3lXLmR7OGaCi/iyQtHmIIO3xHK7kF3ea0MPsVvJwJ8kyeQoviw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8535
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
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
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-ID: <5E68B2394B52234B82103BD4E0FC070C@eurprd04.prod.outlook.com>
Content-Type: text/plain; charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable

On Wed, 2022-08-17 at 14:54 +0200, Zdenek Kabelac wrote:
> Dne 17. 08. 22 v 14:39 Martin Wilck napsal(a):
>=20
>=20
> Let's make clear we are very well aware of all the constrains
> associated with=20
> udev rule logic=A0 (and we tried quite hard to minimize impact -
> however udevd=20
> developers kind of 'misunderstood'=A0 how badly they will be impacting
> system's=20
> performance with the existing watch rule logic - and the story kind
> of=20
> 'continues' with=A0 'systemd's' & dBus services unfortunatelly...

I dimly remember you dislike udev ;-)

I like the general idea of the udev watch. It is the magic that causes
newly created partitions to magically appear in the system, which is
very convenient for users and wouldn't work otherwise. I can see that
it might be inappropriate for LVM PVs. We can discuss changing the
rules such that the watch is disabled for LVM devices (both PV and LV).
I don't claim to overlook all possible side effects, but it might be
worth a try. It would mean that newly created LVs, LV size changes etc.
would not be visible in the system immediately. I suppose you could
work around that in the LVM tools by triggering change events after
operations like lvcreate.

> However let's focus on 'pvmove' as it is potentially very lengthy
> operation -=20
> so it's not feasible to keep the=A0 VG locked/blocked=A0 across an
> operation which=20
> might take even days with slower storage and big moved sizes (write=20
> access/lock disables all readers...)

So these close-after-write operations are caused by locking/unlocking
the PVs?

Note: We were observing that watch events were triggered every 30s, for
every PV, simultaneously. (@Heming correct me if I'mn wrong here).

> So the lvm2 does try to minimize locking time. We will re validate
> whether=20
> just necessary=A0 'vg updating' operation are using 'write' access -
> since=20
> occasionally due to some unrelated code changes it might eventually
> result=20
> sometimes in unwanted 'write' VG open - but we can't keep the
> operation=20
> blocking=A0 a whole VG because of slow udev rule processing.

> In normal circumstances udev rule should be processed very fast -
> unless there=20
> is something mis-designe causing a CPU overloading.
>=20

IIRC there is no evidence that the udev rules are really processed
"slowly". udev isn't efficient, a run time in the order 10 ms is
expected for a worker. We tried different tracing approaches, but we
never saw "multipath -U" hanging on a lock or a resource shortage. It
seems be the sheer amount of events and processes that is causing
trouble. The customer had a very lengthy "multipath.conf" file (~50k
lines), which needs to be parsed by every new multipath instance; that
was slowing things down somewhat. Still the runtime of "multipath -U"
would be no more than 100ms, AFAICT.

Martin

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

