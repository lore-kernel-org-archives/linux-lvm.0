Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2076.outbound.protection.outlook.com [40.107.21.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BB725578F
	for <linux-lvm@lists.linux.dev>; Tue, 21 Nov 2023 20:35:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="VZ8xwLBL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mY04c3bl73t4rLiHqu+R9F1QAu1sqxeqWYAhFJ08kupFiVwKM4Y8Oovz5CcaD0xcJ1U9MnfCDHwRjUtbX7jN2gBXAtcWjgU+KrxRG48PPnGBMaEQk+8VyMXn3XgLza3aA0RXle53jyGzkMMDmjhfJYNPbHAx7t7y/CrzntTt+MDbOhf0fw3vX3ub9/z+GGHM+2wSvXO3Fr7MVvmiEDrarPem6/+4IDN8c0PR4SkBZzTOipjLUfL57dRPaO7CwuzpdEWcIzaYAyEzRjXXlph3s5lCcUhDHJtPuuC5GzFDFwzFqDqp8gx3H36pwpf+u4FSAKnk1FHcqpPXu1xBGa2Xzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Eh/DQOViq7ialcH1A6Tn7IKTK49lfpitYO8uS9ijXik=;
 b=aaIEoUOEHZCXMB42WYzN4hHAJ33aGf5cWVuhrby3J6uPS6RkEghCx1/7BGhNQ8fsRZeEyKWUGLkAd8UCtbz4I6Km93pwpME4OTRPbaspxex2YcmDaJTSqVm0b4yI4UUli1IRNZwF4nlr3URuSkyF01zMInuroYbe3Mc8SkzkhA0mLltMEVACrUV6+uFcashgEQkN0SRmWu8K5IjzdFdOGTUL1OYHBDXoUq8pYgh/Z66x5HX+G+vJB1rogDL5riQ33S1EwRWHSLn1DpJ964XwOCbcYGkVbDrczs6hz/Ypqjy7kNt24ZCei7d9VER2GrKbVToQR6BKDd3jJ2k46/7EQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Eh/DQOViq7ialcH1A6Tn7IKTK49lfpitYO8uS9ijXik=;
 b=VZ8xwLBL0soJRNiy1gP0Y8Egd+hWfrGednqpV9CQUQmcI2lqKuw3xb914Fflf9JXdTQDxJfLAWQnn1qctzdtF1n0OF/tzHG7j+fCvvpuL4ESK+RLg2ulq8c8YjQ8BpESbFxWH0y6KTROE2XT1paHQ8MrFSKI6CjZnq0is1KbMlp+a7hfALPghk861vLk8CXtGAVfWCSIEFTl72sZKPtRBrC1T7VcFfI+/FHG4ADEThHhiy5U9unDt4w+1H1XN/Tm3W+IsfJBeQWDkCx/RldTFRc8ASqB89RaVpWdhAkUDGAEVbN18eDx8egTF+wsuXB/rse+LtWLGk4yrx915xmEbQ==
Received: from AM0PR04MB6324.eurprd04.prod.outlook.com (2603:10a6:208:13f::12)
 by AM0PR04MB6851.eurprd04.prod.outlook.com (2603:10a6:208:182::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.13; Tue, 21 Nov
 2023 20:35:01 +0000
Received: from AM0PR04MB6324.eurprd04.prod.outlook.com
 ([fe80::5c82:3111:897d:74ab]) by AM0PR04MB6324.eurprd04.prod.outlook.com
 ([fe80::5c82:3111:897d:74ab%6]) with mapi id 15.20.7025.017; Tue, 21 Nov 2023
 20:35:01 +0000
From: Martin Wilck <martin.wilck@suse.com>
To: "teigland@redhat.com" <teigland@redhat.com>
CC: Heming Zhao <heming.zhao@suse.com>, "zkabelac@redhat.com"
	<zkabelac@redhat.com>, Glass Su <glass.su@suse.com>, "hare@suse.de"
	<hare@suse.de>, "bmarzins@redhat.com" <bmarzins@redhat.com>,
	"linux-lvm@lists.linux.dev" <linux-lvm@lists.linux.dev>
Subject: Re: discuss about commit 3b0f9ce: filter-mpath: get wwids from sysfs
 vpd_pg83
Thread-Topic: discuss about commit 3b0f9ce: filter-mpath: get wwids from sysfs
 vpd_pg83
Thread-Index: AQHaFJ3iDFYd3KQH70a+UW68GS9ZyrCFHu6WgAAIMDCAACQLAA==
Date: Tue, 21 Nov 2023 20:35:00 +0000
Message-ID: <6b7fd83b3f785b18cf77bf01519812db57f6e955.camel@suse.com>
References: <74b83545-abe7-432c-ae19-814b289a6ff0@suse.com>
	 <6c7699678ceebca58c56aaa769c2a7b9a6092883.camel@suse.com>
	 <5a9061d0f7e287993b127641cc11d7a15d442803.camel@suse.com>
	 <ZVzvUR-_zSTC4sOk@redhat.com>
	 <b5629e054b0fa5f124f93def8d0b878eeb96869a.camel@suse.com>
	 <ZVz2LgBbiWrzLSgZ@redhat.com>
In-Reply-To: <ZVz2LgBbiWrzLSgZ@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.50.1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM0PR04MB6324:EE_|AM0PR04MB6851:EE_
x-ms-office365-filtering-correlation-id: d919fca4-ab9c-4281-0aca-08dbead155cb
x-ld-processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 4Bun+4tVZkN7bIstkavCMjov5y4IEfm/qUVgeAnVYpLCExHr3rFrd9CPHoT5Mi/RMfenvyq3gwdlMpmfCKfBJ0G3LrOL92oMu+nhIDxTnaShcnGu09h6rNWMU0UU+aetOwc37cjyAfz5o3oCmlfRjqtousFddD2nNQG0Y+bFc3VaYpa5G+oP0WQ/4276i7MgPe7I6zlDCxB322NnmeKY+idsv+ce4AAP7Cp4FPfyBfpoL5QiMoHRg5aPCM0+fJkcDBu55sz5E/OHRnytof9T2aVAvCLp0zKHfK9yx5oU1aYyZ3zT3kCSwX2OEAdepq+EEmaHX1afoQMHnlJUhwqjlzlQtYosj5zsEkOTok2XMlDr/13l6Hv9Ybqwk90KjsxbvXix/SnwCCARtweAbj/HQaM0B3mJWbzKZEdjl6aFaiVfgLYang0rkg4188/Ek3VD3H06IL+chH5g+wN/KA0tjJ0wakMzomPoW7KzeMs4jD/TRZIhB5r9l/LAArU46Ff6ecgqdpwbDVmIsGjMNpFRpHg43zVA6jmstPBib0hNZHyAMEm1Stu774r+TipkF40Ipn4WA4NZP6qzsJS4Od1C+7M7qqen3LVDXcF3tbMaDPSz4YN25EdKZJFaan4vhKbN
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB6324.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(136003)(396003)(366004)(346002)(376002)(230922051799003)(64100799003)(186009)(451199024)(1800799012)(478600001)(36756003)(122000001)(4001150100001)(38100700002)(5660300002)(6486002)(6506007)(2616005)(26005)(6512007)(8676002)(4326008)(71200400001)(8936002)(41300700001)(2906002)(4744005)(316002)(38070700009)(66946007)(54906003)(66446008)(64756008)(76116006)(66476007)(66556008)(6916009)(86362001)(44832011);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-15?Q?2Of7uogwrDoB+UNf5Kxud5hanmw4d+ZGY0pWwnxnd2b0yfVz2p06454MG?=
 =?iso-8859-15?Q?sT39AeS5mXj10a5xEsaoNrLyAuJm5wAeWOpNeXeRcsWFFYL51BAKktHJE?=
 =?iso-8859-15?Q?r9BxHWJQtJkh+JdXeYlsv0PZSBz2oaD1JUOl/CvRcwXlFiYMkDN5LoXTg?=
 =?iso-8859-15?Q?q5xpWsIwNhP23amj6vN3VmObUAvBLYAOcVHbsKQgMrFt+3gIwLCktQs5x?=
 =?iso-8859-15?Q?K35d6iwbcZlSGDWU8vkVrSeaXs+u3ffdYkKA/qizya6DgltshjAbL7oed?=
 =?iso-8859-15?Q?4TA0/nR5PT7jD5YcMyCu7KizXlrriyrblW8OeRm0ru2vNCI5yHsAcLHl3?=
 =?iso-8859-15?Q?u5ljLskeLzBc8f0vwTpzsw7GScnhcqYYVKhPEkdDmdWop64x3GqoYd2z5?=
 =?iso-8859-15?Q?Yj7SzFeKIKm0e8D+lRMQbFDGofNRtTFT2//ThQg7RZfghev9WUqGCNye8?=
 =?iso-8859-15?Q?f4Ylclm+J2S/ujsJO2MCBkUMrXWrKRgk/TuOXtGj7xh2CJY+xYKoCgQ4u?=
 =?iso-8859-15?Q?r3IbyuhYyIqfaq+twGM5Wz5TsZeTa4HbcpIlHqoXWaTyObpk5IwxAmiJm?=
 =?iso-8859-15?Q?yMBkMh187gyUl6jh6yALHGk6YCOJ4hBMZnYO6HBDa63Lz5Iua8r5TK/TQ?=
 =?iso-8859-15?Q?PIzMGrr12232jHD9X9UR8F1fDyw40u/wkocNQCSgEY0/1SBFa8z4pxr9Y?=
 =?iso-8859-15?Q?3+IXyXPBh0NFQIYqcx0RJ7wGpTyBhxIjhggvE15oOD2xT/R4OZ9ZCx3Ot?=
 =?iso-8859-15?Q?BTzQiGkaooPAJIYH1ft0d/msdOLgBiQ8X6eI8Ny1kZOzPCg+7tfvyMhkQ?=
 =?iso-8859-15?Q?gErBqwH//hYyufqjHHTq6c3oEu2uR/AUBDWf2lVtDvpWzLjkGfn/Yfyuw?=
 =?iso-8859-15?Q?zV0eqzYwuSKWeVRUpLxSf/aLcPwAhgTW2AcYTq9Mr29u8sKyR9URka/uV?=
 =?iso-8859-15?Q?ONL9s0x2Gztgg34Q+zLmMM1zoj8r35GV3RdRc5uJLqP4ZY+8l8Sr4J2Do?=
 =?iso-8859-15?Q?3OMM2NaAARpFP33Sz+uupkLVGXBx1e720zqrn8u0uHABv4pYXgFXileoM?=
 =?iso-8859-15?Q?nipSyaClz8quqXp2rxVY2mnHz1jAU45b64zM5khkuPnH7RAkD7oW6VCuw?=
 =?iso-8859-15?Q?jyeCvF+prKuWsO7rFgzYaC/F6KddbQrry5SJYklCJLS0ChA9O9i+wPiCm?=
 =?iso-8859-15?Q?xtXGPAOIELL80QIgzFF0gSk83F1Lhv8eYFbVx/GiRljgKbhKzbPw65/nY?=
 =?iso-8859-15?Q?J9qITmPp8OzbDlcg7wMO9cft/h1etnfg1sdFkMM6YX1z7xr1KtGnbO/Bn?=
 =?iso-8859-15?Q?2TyX4advb3Hcb/8sWK/stjDedCk23RR0O/QCHj9dQyvCIhrIRHwFsL4mo?=
 =?iso-8859-15?Q?yRVGuR8KLEI+i3nO23BUP2y8nY8wWFM3KtqWXtQ3Ayf2aXWQYmXhn/MN7?=
 =?iso-8859-15?Q?Qt1w3nypeFPBRRXQG6KgMR3aq78HbIjmDLaKXKDCBrCilDWel4D+1e0X1?=
 =?iso-8859-15?Q?iaH6Bof+exGOO6kzbfWaE/g2xkqvgiE1/lmc6TC+Ez8ypkwjRkBefQTLS?=
 =?iso-8859-15?Q?iqnnmIsi2Mew3hMUqz/iJ7Iwvjc3TT6nGI1uqBCN3Egc/q7pdRPzylBhd?=
 =?iso-8859-15?Q?vTsw8A+ppI/fHc0KQaWTHcm6Mkiegn3mcIG55vE5ZKravYYPvZ69hj5eh?=
 =?iso-8859-15?Q?22eE5xFC/kHLb1Umdd3NkGdqPQ=3D=3D?=
Content-Type: text/plain; charset="iso-8859-15"
Content-ID: <20C9967C2A9743479FA038A9F25CCFE9@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB6324.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d919fca4-ab9c-4281-0aca-08dbead155cb
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Nov 2023 20:35:01.0973
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zcw4DasuqzHXwWn4mNEZwMs7z0LDoEIVfh0etqmbWbAvVyLPEJdz0XiGtr6P+Ik1Qd1ErLWQ8aHLQDOxVVosnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6851

On Tue, 2023-11-21 at 12:25 -0600, David Teigland wrote:
> On Tue, Nov 21, 2023 at 06:10:12PM +0000, Martin Wilck wrote:
> > But I wonder if this is required. You could create a script that
> > calls pvscan, and then systemd-run / vgchange with the output of
> > the
> > pvscan command, and execute this script in RUN. That was roughly my
> > idea. That way you wouldn't loose any DEVLINKS added after 69-dm-
> > lvm.rules.
>=20
> I don't see any immediate problem with that idea, although using a
> script
> doesn't sound nice if it can be avoided.=A0 It seems academic since I'm
> not
> seeing a problem with the current method.

It's sort of academic, agreed. It would be easy to construct a case
where the DEVLINKS approach would fail, but that's unlikely to occur in
practice.

Martin

