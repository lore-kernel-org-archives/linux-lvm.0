Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7403CC43219
	for <linux-lvm@archiver.kernel.org>; Mon, 17 Oct 2022 07:31:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1665991885;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=WzRmF963jHtH/WA/65CJrXNAYpQpvDVyW6rwLCVd5gI=;
	b=i22i6hGfgd+1XudGUfrEy4gn7sIrOSAi2UCdyn3PsuvkAbZxsQPoRFtQIOXrjGYqf1ASqa
	EeoO/EGR0oyBHnra2215tA9KxLhoAfgPpJN5RAqTk6YZhZ4BSqECRr6GJXCUx06L/JwHcI
	qGOET/OJiV6FTL2wdiQcvlRRzPp2rGg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-381-1nz7-MJwOqqOs9rHqm64mw-1; Mon, 17 Oct 2022 03:31:21 -0400
X-MC-Unique: 1nz7-MJwOqqOs9rHqm64mw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F3EDE811E87;
	Mon, 17 Oct 2022 07:31:18 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 117B540F9898;
	Mon, 17 Oct 2022 07:31:06 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id BB1E01946597;
	Mon, 17 Oct 2022 07:31:03 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 136951946586
 for <linux-lvm@listman.corp.redhat.com>; Fri, 14 Oct 2022 19:31:16 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id EA422140215E; Fri, 14 Oct 2022 19:31:15 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E1427140215D
 for <linux-lvm@redhat.com>; Fri, 14 Oct 2022 19:31:15 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BD54B3C0E205
 for <linux-lvm@redhat.com>; Fri, 14 Oct 2022 19:31:15 +0000 (UTC)
Received: from apac01-obe.outbound.protection.outlook.com
 (mail-eastasiaazon11020019.outbound.protection.outlook.com [52.101.128.19])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-158-id0ROegxPRSARmvNprhaWw-1; Fri, 14 Oct 2022 15:31:11 -0400
X-MC-Unique: id0ROegxPRSARmvNprhaWw-1
Received: from SI2P153MB0444.APCP153.PROD.OUTLOOK.COM (2603:1096:4:e9::7) by
 SI2P153MB0425.APCP153.PROD.OUTLOOK.COM (2603:1096:4:f5::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5746.6; Fri, 14 Oct 2022 19:31:05 +0000
Received: from SI2P153MB0444.APCP153.PROD.OUTLOOK.COM
 ([fe80::a751:a542:4ab9:5f6a]) by SI2P153MB0444.APCP153.PROD.OUTLOOK.COM
 ([fe80::a751:a542:4ab9:5f6a%7]) with mapi id 15.20.5746.011; Fri, 14 Oct 2022
 19:31:04 +0000
From: Mitta Sai Chaithanya <mittas@microsoft.com>
To: Zdenek Kabelac <zdenek.kabelac@gmail.com>, LVM2 development
 <lvm-devel@redhat.com>, Pawan Sharma <sharmapawan@microsoft.com>,
 "linux-lvm@redhat.com" <linux-lvm@redhat.com>
Thread-Topic: [EXTERNAL] Re: LVM2 : performance drop even after deleting the
 snapshot
Thread-Index: AQHY3lsJie+6cAv+2kGrP2SVVAhuka4L4/wqgABCioCAAh1v1Q==
Date: Fri, 14 Oct 2022 19:31:04 +0000
Message-ID: <SI2P153MB0444EE48C7C6E92FB448262ED7249@SI2P153MB0444.APCP153.PROD.OUTLOOK.COM>
References: <PUZP153MB075126926388815B6F9E1258AC229@PUZP153MB0751.APCP153.PROD.OUTLOOK.COM>
 <PUZP153MB07512B1B646868F0F8F1D205AC259@PUZP153MB0751.APCP153.PROD.OUTLOOK.COM>
 <91261aec-d0fd-7884-1f38-a575b4e540e2@gmail.com>
In-Reply-To: <91261aec-d0fd-7884-1f38-a575b4e540e2@gmail.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=True;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2022-10-14T19:08:25.0012997Z;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ContentBits=0;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Method=Standard
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SI2P153MB0444:EE_|SI2P153MB0425:EE_
x-ms-office365-filtering-correlation-id: cdb31597-28ce-4c40-a408-08daae1aa29e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0
x-microsoft-antispam-message-info: wIu9laIQmGF9G5v37QLQoqEMgeQB7fY6eOkpvh8CAOSQ/egqNK7rglZO/3KV4PGnuWPed2Qv84iYZ6I7ptK0FGZZqXN4nEyzx15m2nQ45mA/MTubb7lNzlYmmALqFe7zR6w4gkzVYIWttkTXRWf84a67BrhsWOcPd7EmBE0xhgG0nzok6E+P6BPv4gTc1Jusr/CbzAd+lcxSv5pSh7aX3EUFtv+roOd6oA4BKWMJsWyKzSNvCxgCoFgvDQeLOCervKhdbKMum9BgP2u0DcwjWJjMaMpYpN0mg+TKsmT29thGQenbQ6tiZREK1SgpF9RtJs/+Ylcbr2V/1AvEDDDZB8jOiSuOv5sNqX4H7+vOj7IqqSoatsdrgi1iGwHNV4muUymlJS2rD1ZzC2VOS0RzAZod9MGA7yK2tUDG8ioRR8UgiEp6kcrAZtFtsNlNp/PyeDdhVVPpDVx/NSh/7U2Uhyz0lUyCWVBwCgOY0i5isWX1lddIL3K7BD76yPbsApDyQyhZ0YNbmD87QDdw1vfdb7goRev+HNDPRp2vhNxnmi6H5xikqU5RGZxRvtLdZHYulqAgmzJzbCGctM8HhkoesgSdfvnXYGSIeOWtAOCwhKfSEZx2aMhC2rpxczLwM6pvu5VRaxcRin3rmkeoB+7u2EwnZRHtXaj7vyjkm3rQcSR+r74Eq9bZHr0AkalxRsWDNayrvhKg7RS3hODf4lKKBEl1RiuLCYnGjBrY9tA4qxiCrKYbeVwIdySaenJ27t38AEBjSb2btCE7tXh9q/AbP9Ov6UdEi+q0YDzJ6tiBYozrNXUcIjI2HsHgtmvDV+HYVNq53NSwoS/KtvWvm8uOCQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SI2P153MB0444.APCP153.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(376002)(366004)(39860400002)(346002)(136003)(451199015)(55016003)(33656002)(53546011)(41300700001)(71200400001)(26005)(76116006)(91956017)(6506007)(7696005)(9686003)(478600001)(10290500003)(966005)(66556008)(66476007)(66446008)(64756008)(186003)(8676002)(66946007)(4326008)(8990500004)(82950400001)(166002)(82960400001)(38100700002)(38070700005)(86362001)(52536014)(83380400001)(8936002)(5660300002)(110136005)(107886003)(19627235002)(316002)(2906002)(122000001)(4001150100001);
 DIR:OUT; SFP:1102
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?xWG52qWzYN8lHO7AZi4RhFQm6ScKpjwn2vmV7d5+2Q7uqClHmdggfbgrxAHZ?=
 =?us-ascii?Q?GAH1lzwVZT1P4ZzgDoguyx2IJa048msynU23U5JhULie3kVvKctYlbgPvHIf?=
 =?us-ascii?Q?r3jVCOfYN1VhFThL4ADxpXPROZN1cz+RKfavRPgCTZh1njhbhQ9SAzVkyrAu?=
 =?us-ascii?Q?08OLE4j2ZkNpRdTXnWBj0QUrrhpw8SaLyziCn86CBCct8qj3QQhPW8UgD04U?=
 =?us-ascii?Q?c/BqIueIP0xpC8qmp+nA5Dc7rrS+kI8R0QbW7JS5XNHuSxhZip+p828mduWv?=
 =?us-ascii?Q?ST8PHyyBU6vKMTP7IuINwsYOrnUTkIxCQCpLmMv3fJf9eAIbUK02KadRLZlE?=
 =?us-ascii?Q?gU6c/D1fxRa82cxAIZjPn5YSKToHLrvn8eXIXrD68BJSWu1v5+hiQLF0EKuu?=
 =?us-ascii?Q?SlvgucPR3kV+RekV95qpipQXuBsfOYT9X8F0odhr24tLaqn8vs2ArvEScp94?=
 =?us-ascii?Q?4nZwqT1bDPH0Hgku/Co/C/BOEiKOPhiOhHFBCNduyndSfH/tbLjK5ndRscIr?=
 =?us-ascii?Q?+1LM2yVEMXsOr8uTWRldsN3K2/FiOhPHZ21/z/5Td3Eh5sTtWDWIg528icGI?=
 =?us-ascii?Q?heewL1sGfWScRo/fpj6QNcumyFY1RP1MGEVZAbyjRdGyit41AUEpe3GSyHQl?=
 =?us-ascii?Q?w93w/o4vVJMJtd0oKTlUWoSu/rRDshonn151E+X9JOij4k6g3LCWBpugxsy1?=
 =?us-ascii?Q?uyuRS29osRHxoQC8pn+NovhyEfZBqcL5kAjR1YZ//pYb9QL+RNdatTCpYSpk?=
 =?us-ascii?Q?PLPSK33LaI3ztxC2yGQb4gaFarisObg0c2nbKvcYHlaJZuGww12Lag11CpkS?=
 =?us-ascii?Q?vSPaFh5/HXDsEpHAvNwi3eQIM4K02VwoRGeC7ysJart8i+SWZu6A5tIqxB9A?=
 =?us-ascii?Q?oJvZFu4J5Z9JYjWnZQeKQ0bmU6LVUl47D+faiURZ7KlWUdUY/jcOvsUdHuBp?=
 =?us-ascii?Q?On20xErs9V6eA73yVjJTCeK7CD+irkmhPH8vWDunOT2M25GomKfCz3eifXgz?=
 =?us-ascii?Q?sbTYeWBLLarnRTLtwzNpHjKVkPPnA67uNfqi36lLbdM9qipDmCBrtUlzSMsv?=
 =?us-ascii?Q?U0HNAh4fi9sLOBLMBukou79f8gnTaSZEu5aUemd9a8WP2FwPwcuasRRG72pU?=
 =?us-ascii?Q?ufXHTpcFff/zowutWSRGBmMvkTiD3xt48HP64UcvQO9esqmvNGkQNDRxAk3Q?=
 =?us-ascii?Q?LJTmFqeJmu1slExNGm/CWVZr1dqNko4oQdJlC+qm0GFn1bFy3U6acI5N1Eya?=
 =?us-ascii?Q?r1JWtK4llflDEcpB2Sc5ElJEE84RvCNfIo/mpUd4PLyechml/A04B7oxI1gz?=
 =?us-ascii?Q?3qQszCQ1CTAwNs/T3RCdsq2F5s2/9wZlOllvzn4ajC6/cFuMSVWQ3A/AkW7s?=
 =?us-ascii?Q?K7P/g2n6WM7PeXxqCsHqhb+Pg/kKUAZ1OKxWYmIVgvJrO0jc7gt/5hLutJPy?=
 =?us-ascii?Q?UHWvr7crrt7/vDBQic8kFle3C0X7Os7c1zYqhK9OeMi1vxsnt5fvujvsyBNr?=
 =?us-ascii?Q?nAYgBkKClCEa7A2r1xCT3XrOjuE3mUyJQhTKMKIgVW+Q4sActWgmccytEA?=
 =?us-ascii?Q?=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SI2P153MB0444.APCP153.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: cdb31597-28ce-4c40-a408-08daae1aa29e
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Oct 2022 19:31:04.6722 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SOBuRTaZU8q4qBx61CZAtHtodl/iP+KYFajKJxvtL0EADtPWmSmQs5TqqbfqWAkQ7pNFedyU1y6/De97syDJsw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2P153MB0425
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mailman-Approved-At: Mon, 17 Oct 2022 07:31:03 +0000
Subject: Re: [linux-lvm] [EXTERNAL] Re: LVM2 : performance drop even after
 deleting the snapshot
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
Cc: Kapil Upadhayay <kupadhayay@microsoft.com>
Errors-To: linux-lvm-bounces@redhat.com
Sender: "linux-lvm" <linux-lvm-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: multipart/mixed; boundary="===============2095742423926755150=="

--===============2095742423926755150==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_SI2P153MB0444EE48C7C6E92FB448262ED7249SI2P153MB0444APCP_"

--_000_SI2P153MB0444EE48C7C6E92FB448262ED7249SI2P153MB0444APCP_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Zdenek Kabelac,
          Thanks for your quick reply and suggestions.

We conducted couple of tests on Ubuntu 22.04 and observed similar performan=
ce behavior post thin snapshot deletion without writing any data anywhere.

Commands used to create Thin LVM volume:
- lvcreate  -L 480G --poolmetadataspare n --poolmetadatasize 16G --chunksiz=
e=3D64K --thinpool  ThinDataLV ThinVolGrp
- lvcreate -n ext4.ThinLV -V 100G --thinpool ThinDataLV ThinVolGrp

ThinLV display:
 --- Logical volume ---
  LV Path                /dev/ThinVolGrp/ext4.ThinLV
  LV Name                ext4.ThinLV
  VG Name                ThinVolGrp
  LV UUID                sRcj9L-Ili4-dR3I-MeJI-3KLv-xPUP-VMd1LC
  LV Write Access        read/write
  LV Creation host, time kapil-upstream, 2022-10-14 18:05:22 +0000
  LV Pool name           ThinDataLV
  LV Status              available
  # open                 1
  LV Size                100.00 GiB
  Mapped size            21.51%
  Current LE             25600
  Segments               1
  Allocation             inherit
  Read ahead sectors     auto
  - currently set to     256
  Block device           253:4

dmsetup table output after creation of thin lvm volume:
ThinVolGrp-ThinDataLV: 0 1006632960 linear 253:2 0
ThinVolGrp-ThinDataLV-tpool: 0 1006632960 thin-pool 253:0 253:1 128 0 0
ThinVolGrp-ThinDataLV_tdata: 0 1006632960 linear 8:32 2048
ThinVolGrp-ThinDataLV_tmeta: 0 33161216 linear 8:32 1006635008
ThinVolGrp-ext4.ThinLV: 0 209715200 thin 253:2 1

dmsetup status after creation of thin lvm volume:
     ThinVolGrp-ThinDataLV: 0 1006632960 linear
ThinVolGrp-ThinDataLV-tpool: 0 1006632960 thin-pool 1 4878/4145152 8325/786=
4320 - rw discard_passdown queue_if_no_space - 1024
ThinVolGrp-ThinDataLV_tdata: 0 1006632960 linear
ThinVolGrp-ThinDataLV_tmeta: 0 33161216 linear
ThinVolGrp-ext4.ThinLV: 0 209715200 thin 1065600 209715199

FIO Command to dump some data:
fio --filename=3D/dev/ThinVolGrp/ext4.ThinLV --name=3D<name> --time_based -=
-group_reporting --ioengine=3Dlibaio --direct=3D1 --size=3D20G  --runtime=
=3D120 --rw=3Drandrw --rwmixread=3D50 --bs=3D16K --iodepth=3D8 --numjobs=3D=
3 --randrepeat=3D0  --randseed=3D$(date +%s)

For detailed information of fio and dmsetup results click here<https://gist=
.github.com/mittachaitu/17006a1e3f08ad0c17add7ea007e63b6#file-lvm_snapshot_=
performance>.
Note: All the tests are conducted using thin lvm volume and thin snapshot

Environment details:

        Kernel Version: 5.15.0-1021-azure

        LVM Version:    LVM version:     2.03.11(2) (2021-01-08)
                                 Library version: 1.02.175 (2021-01-08)
                                 Driver version:  4.45.0

        FIO Version:      3.28

Please let us know if you required more information and tests that needs to=
 be run.

Thanks & Regards
mittachaitu (Sai)

From: Zdenek Kabelac<mailto:zdenek.kabelac@gmail.com>
Sent: Thursday, October 13, 2022 4:20 PM
To: LVM2 development<mailto:lvm-devel@redhat.com>; Pawan Sharma<mailto:shar=
mapawan@microsoft.com>; linux-lvm@redhat.com<mailto:linux-lvm@redhat.com>
Cc: Kapil Upadhayay<mailto:kupadhayay@microsoft.com>; Mitta Sai Chaithanya<=
mailto:mittas@microsoft.com>
Subject: [EXTERNAL] Re: LVM2 : performance drop even after deleting the sna=
pshot

[Some people who received this message don't often get email from zdenek.ka=
belac@gmail.com. Learn why this is important at https://aka.ms/LearnAboutSe=
nderIdentification ]

Dne 13. 10. 22 v 8:53 Pawan Sharma napsal(a):
> adding this to lvm-devel mailing list also.
>
> Regards,
> Pawan
> -------------------------------------------------------------------------=
-----
> *From:* Pawan Sharma
> *Sent:* Wednesday, October 12, 2022 10:42 PM
> *To:* linux-lvm@redhat.com <linux-lvm@redhat.com>
> *Cc:* Mitta Sai Chaithanya <mittas@microsoft.com>; Kapil Upadhayay
> <kupadhayay@microsoft.com>
> *Subject:* LVM2 : performance drop even after deleting the snapshot
> Hi Everyone,
>
>
> We are evaluating lvm2 snapshots and doing performance testing on it. Thi=
s is
> what we are doing :
>
>  1. dump some data to lvm2 volume (using fio)
>  2. take the snapshot
>  3. delete the snapshot (no IOs anywhere after creating the snapshot)
>  4. run the fio on lvm2 volume
>
> Here as you can see, we are just creating the snapshot and immediately
> deleting it. There are no IOs to the main volume or anywhere. When we run=
 the
> fio after this (step 4) and we see around 50% drop in performance with
> reference to the number we get in step 1.
>
> It is expected to see a performance drop if there is a snapshot because o=
f the
> COW. But here we deleted the snapshot, and it is not referring to any dat=
a
> also. We should not see any performance drop here.
>
> Could someone please help me understand this behavior. Why are we seeing =
the
> performance drop in this case? It seems like we deleted the snapshot but =
still
> it is not deleted, and we are paying the COW penalty.
>
> System Info:
>
> OS : ubuntu 18.04
> Kernel : 5.4.0
>
> # lvm version
> LVM version:2.02.176(2) (2017-11-03)
> Library version: 1.02.145 (2017-11-03)
> Driver version:4.41.0
>
> We also tried on latest ubuntu with newer version of LVM. We got the same
> behavior.
>
>

Hi

Debugging  5 year old software is likely not going to get lot of attention
from upstream.

So please:

a) reproduce the issue with some recent  kernel & lvm2
b) take   'dmsetup table && dmsetup status'  before you run every 'fio' tes=
t
and present here your result in some form - otherwise we can hardly see wha=
t
is the problem.


What should be expected - if you use old/thick snapshots - when you 'drop'
snapshot - you have your original intact LV - so results should mostly matc=
h
results before you take the snapshot - but you clearly have to take into
account if you use some 'SSD/NVMe' discarding and other things - so always =
run
series of tests and average your results.

If you use  thin snapshot - that you can get various results depending on y=
our
settings of thin chunks, discard usage.

Also maybe try your benchmark with different filesystems...

Regards

Zdenek


--_000_SI2P153MB0444EE48C7C6E92FB448262ED7249SI2P153MB0444APCP_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" xmlns:w=3D"urn:sc=
hemas-microsoft-com:office:word" xmlns:m=3D"http://schemas.microsoft.com/of=
fice/2004/12/omml" xmlns=3D"http://www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
=09{font-family:"Cambria Math";
=09panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
=09{font-family:Calibri;
=09panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
=09{font-family:"Segoe UI";
=09panose-1:2 11 5 2 4 2 4 2 2 3;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
=09{margin:0in;
=09font-size:11.0pt;
=09font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
=09{mso-style-priority:99;
=09color:blue;
=09text-decoration:underline;}
.MsoChpDefault
=09{mso-style-type:export-only;}
@page WordSection1
=09{size:8.5in 11.0in;
=09margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
=09{page:WordSection1;}
--></style>
</head>
<body lang=3D"EN-US" link=3D"blue" vlink=3D"#954F72" style=3D"word-wrap:bre=
ak-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hi Zdenek Kabelac,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Thanks for your quic=
k reply and suggestions.<br>
<br>
</p>
<p class=3D"MsoNormal">We conducted couple of tests on Ubuntu 22.04 and obs=
erved similar performance behavior post thin snapshot deletion without writ=
ing any data anywhere.</p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><b>Commands used to create Thin LVM volume</b>:<br>
<span style=3D"font-size:10.5pt;font-family:&quot;Segoe UI&quot;,sans-serif=
;color:#242424;background:white">- lvcreate&nbsp;&nbsp;-L 480G --poolmetada=
taspare n --poolmetadatasize 16G --chunksize=3D64K --thinpool&nbsp;&nbsp;Th=
inDataLV ThinVolGrp</span><span style=3D"font-size:10.5pt;font-family:&quot=
;Segoe UI&quot;,sans-serif;color:#242424"><br>
<span style=3D"background:white">- lvcreate -n ext4.ThinLV -V 100G --thinpo=
ol ThinDataLV ThinVolGrp<o:p></o:p></span></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;font-family:&quot;Se=
goe UI&quot;,sans-serif;color:#242424;background:white"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><b><span style=3D"font-size:10.5pt;font-family:&quot=
;Segoe UI&quot;,sans-serif;color:#242424;background:white">ThinLV display</=
span></b><span style=3D"font-size:10.5pt;font-family:&quot;Segoe UI&quot;,s=
ans-serif;color:#242424;background:white">:<br>
&nbsp;--- Logical volume ---</span><span style=3D"font-size:10.5pt;font-fam=
ily:&quot;Segoe UI&quot;,sans-serif;color:#242424"><br>
<span style=3D"background:white">&nbsp;&nbsp;LV Path&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/d=
ev/ThinVolGrp/ext4.ThinLV</span><br>
<span style=3D"background:white">&nbsp;&nbsp;LV Name&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ex=
t4.ThinLV</span><br>
<span style=3D"background:white">&nbsp;&nbsp;VG Name&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Th=
inVolGrp</span><br>
<span style=3D"background:white">&nbsp;&nbsp;LV UUID&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;sR=
cj9L-Ili4-dR3I-MeJI-3KLv-xPUP-VMd1LC</span><br>
<span style=3D"background:white">&nbsp;&nbsp;LV Write Access&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;read/write</span><br>
<span style=3D"background:white">&nbsp;&nbsp;LV Creation host, time kapil-u=
pstream, 2022-10-14 18:05:22 +0000</span><br>
<span style=3D"background:white">&nbsp;&nbsp;LV Pool name&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ThinDataLV</span><br>
<span style=3D"background:white">&nbsp;&nbsp;LV Status&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;available</s=
pan><br>
<span style=3D"background:white">&nbsp;&nbsp;# open&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;1</span><br>
<span style=3D"background:white">&nbsp;&nbsp;LV Size&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;10=
0.00 GiB</span><br>
<span style=3D"background:white">&nbsp;&nbsp;Mapped size&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;21.51%</span><br>
<span style=3D"background:white">&nbsp;&nbsp;Current LE&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;25600</span><br>
<span style=3D"background:white">&nbsp;&nbsp;Segments&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1</span=
><br>
<span style=3D"background:white">&nbsp;&nbsp;Allocation&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;inherit</span><br=
>
<span style=3D"background:white">&nbsp;&nbsp;Read ahead sectors&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;auto</span><br>
<span style=3D"background:white">&nbsp;&nbsp;- currently set to&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;256</span><br>
<span style=3D"background:white">&nbsp;&nbsp;Block device&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;253:4<o:p></o:p></span></sp=
an></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;font-family:&quot;Se=
goe UI&quot;,sans-serif;color:#242424;background:white"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><b><span style=3D"font-size:10.5pt;font-family:&quot=
;Segoe UI&quot;,sans-serif;color:#242424;background:white">dmsetup table ou=
tput after creation of thin lvm volume</span></b><span style=3D"font-size:1=
0.5pt;font-family:&quot;Segoe UI&quot;,sans-serif;color:#242424;background:=
white">:<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"text-indent:.5in"><span style=3D"font-size:=
10.5pt;font-family:&quot;Segoe UI&quot;,sans-serif;color:#242424;background=
:white">ThinVolGrp-ThinDataLV: 0 1006632960 linear 253:2 0<o:p></o:p></span=
></p>
<p class=3D"MsoNormal" style=3D"text-indent:.5in"><span style=3D"font-size:=
10.5pt;font-family:&quot;Segoe UI&quot;,sans-serif;color:#242424;background=
:white">ThinVolGrp-ThinDataLV-tpool: 0 1006632960 thin-pool 253:0 253:1 128=
 0 0
<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"text-indent:.5in"><span style=3D"font-size:=
10.5pt;font-family:&quot;Segoe UI&quot;,sans-serif;color:#242424;background=
:white">ThinVolGrp-ThinDataLV_tdata: 0 1006632960 linear 8:32 2048<o:p></o:=
p></span></p>
<p class=3D"MsoNormal" style=3D"text-indent:.5in"><span style=3D"font-size:=
10.5pt;font-family:&quot;Segoe UI&quot;,sans-serif;color:#242424;background=
:white">ThinVolGrp-ThinDataLV_tmeta: 0 33161216 linear 8:32 1006635008<o:p>=
</o:p></span></p>
<p class=3D"MsoNormal" style=3D"text-indent:.5in"><span style=3D"font-size:=
10.5pt;font-family:&quot;Segoe UI&quot;,sans-serif;color:#242424;background=
:white">ThinVolGrp-ext4.ThinLV: 0 209715200 thin 253:2 1<o:p></o:p></span><=
/p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;font-family:&quot;Se=
goe UI&quot;,sans-serif;color:#242424;background:white"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><b><span style=3D"font-size:10.5pt;font-family:&quot=
;Segoe UI&quot;,sans-serif;color:#242424;background:white">dmsetup status a=
fter creation of thin lvm volume</span></b><span style=3D"font-size:10.5pt;=
font-family:&quot;Segoe UI&quot;,sans-serif;color:#242424;background:white"=
>:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;font-family:&quot;Se=
goe UI&quot;,sans-serif;color:#242424;background:white">&nbsp;&nbsp;&nbsp;&=
nbsp; ThinVolGrp-ThinDataLV: 0 1006632960 linear
<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"text-indent:.5in"><span style=3D"font-size:=
10.5pt;font-family:&quot;Segoe UI&quot;,sans-serif;color:#242424;background=
:white">ThinVolGrp-ThinDataLV-tpool: 0 1006632960 thin-pool 1 4878/4145152 =
8325/7864320 - rw discard_passdown queue_if_no_space
 - 1024 <o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"text-indent:.5in"><span style=3D"font-size:=
10.5pt;font-family:&quot;Segoe UI&quot;,sans-serif;color:#242424;background=
:white">ThinVolGrp-ThinDataLV_tdata: 0 1006632960 linear
<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"text-indent:.5in"><span style=3D"font-size:=
10.5pt;font-family:&quot;Segoe UI&quot;,sans-serif;color:#242424;background=
:white">ThinVolGrp-ThinDataLV_tmeta: 0 33161216 linear
<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"text-indent:.5in"><span style=3D"font-size:=
10.5pt;font-family:&quot;Segoe UI&quot;,sans-serif;color:#242424;background=
:white">ThinVolGrp-ext4.ThinLV: 0 209715200 thin 1065600 209715199&nbsp;&nb=
sp;
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><b>FIO Command to dump some data</b>:</p>
<p class=3D"MsoNormal" style=3D"text-indent:.5in"><i><span style=3D"font-si=
ze:10.5pt;font-family:&quot;Segoe UI&quot;,sans-serif;color:#242424;backgro=
und:white">fio --filename=3D/dev/ThinVolGrp/ext4.ThinLV --name=3D&lt;name&g=
t; --time_based --group_reporting --ioengine=3Dlibaio --direct=3D1
 --size=3D20G&nbsp;&nbsp;--runtime=3D120 --rw=3Drandrw --rwmixread=3D50 --b=
s=3D16K --iodepth=3D8 --numjobs=3D3 --randrepeat=3D0&nbsp;&nbsp;--randseed=
=3D$(date +%s)</span></i>
</p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">For detailed information of fio and dmsetup results =
click <a href=3D"https://gist.github.com/mittachaitu/17006a1e3f08ad0c17add7=
ea007e63b6#file-lvm_snapshot_performance">
here</a>.</p>
<p class=3D"MsoNormal"><b>Note</b>: All the tests are conducted using <i>th=
in lvm volume</i> and
<i>thin snapshot</i></p>
<p class=3D"MsoNormal"><br>
<b>Environment details</b>:</p>
<div>
<p style=3D"margin:0in">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Ker=
nel Version: <span style=3D"font-size:10.5pt;font-family:&quot;Segoe UI&quo=
t;,sans-serif">
5.15.0-1021-azure<o:p></o:p></span></p>
<p style=3D"margin:0in"><span style=3D"font-size:10.5pt;font-family:&quot;S=
egoe UI&quot;,sans-serif">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; LVM Ve=
rsion:&nbsp;
</span><span style=3D"font-size:10.5pt;font-family:&quot;Segoe UI&quot;,san=
s-serif;color:#242424;background:white">&nbsp;&nbsp;LVM version:&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;2.03.11(2) (2021-01-08)</span><span style=3D"font-size:1=
0.5pt;font-family:&quot;Segoe UI&quot;,sans-serif;color:#242424"><br>
<span style=3D"background:white">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 Library version: 1.02.175 (2021-01-08)</span><br>
<span style=3D"background:white">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 Driver version:&nbsp;&nbsp;4.45.0<o:p></o:p></span></span></p>
<p style=3D"margin:0in"><span style=3D"font-size:10.5pt;font-family:&quot;S=
egoe UI&quot;,sans-serif;color:#242424;background:white">&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; FIO Version:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 3.28</s=
pan><span style=3D"font-size:10.5pt;font-family:&quot;Segoe UI&quot;,sans-s=
erif"><o:p></o:p></span></p>
<p>Please let us know if you required more information and tests that needs=
 to be run.</p>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks &amp; Regards<br>
mittachaitu (Sai)</p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div style=3D"mso-element:para-border-div;border:none;border-top:solid #E1E=
1E1 1.0pt;padding:3.0pt 0in 0in 0in">
<p class=3D"MsoNormal" style=3D"border:none;padding:0in"><b>From: </b><a hr=
ef=3D"mailto:zdenek.kabelac@gmail.com">Zdenek Kabelac</a><br>
<b>Sent: </b>Thursday, October 13, 2022 4:20 PM<br>
<b>To: </b><a href=3D"mailto:lvm-devel@redhat.com">LVM2 development</a>; <a=
 href=3D"mailto:sharmapawan@microsoft.com">
Pawan Sharma</a>; <a href=3D"mailto:linux-lvm@redhat.com">linux-lvm@redhat.=
com</a><br>
<b>Cc: </b><a href=3D"mailto:kupadhayay@microsoft.com">Kapil Upadhayay</a>;=
 <a href=3D"mailto:mittas@microsoft.com">
Mitta Sai Chaithanya</a><br>
<b>Subject: </b>[EXTERNAL] Re: LVM2 : performance drop even after deleting =
the snapshot</p>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt">[Some people who rece=
ived this message don't often get email from zdenek.kabelac@gmail.com. Lear=
n why this is important at
<a href=3D"https://aka.ms/LearnAboutSenderIdentification">https://aka.ms/Le=
arnAboutSenderIdentification</a> ]<br>
<br>
Dne 13. 10. 22 v 8:53 Pawan Sharma napsal(a):<br>
&gt; adding this to lvm-devel mailing list also.<br>
&gt;<br>
&gt; Regards,<br>
&gt; Pawan<br>
&gt; ----------------------------------------------------------------------=
--------<br>
&gt; *From:* Pawan Sharma<br>
&gt; *Sent:* Wednesday, October 12, 2022 10:42 PM<br>
&gt; *To:* linux-lvm@redhat.com &lt;linux-lvm@redhat.com&gt;<br>
&gt; *Cc:* Mitta Sai Chaithanya &lt;mittas@microsoft.com&gt;; Kapil Upadhay=
ay<br>
&gt; &lt;kupadhayay@microsoft.com&gt;<br>
&gt; *Subject:* LVM2 : performance drop even after deleting the snapshot<br=
>
&gt; Hi Everyone,<br>
&gt;<br>
&gt;<br>
&gt; We are evaluating lvm2 snapshots and doing performance testing on it. =
This is<br>
&gt; what we are doing :<br>
&gt;<br>
&gt;&nbsp; 1. dump some data to lvm2 volume (using fio)<br>
&gt;&nbsp; 2. take the snapshot<br>
&gt;&nbsp; 3. delete the snapshot (no IOs anywhere after creating the snaps=
hot)<br>
&gt;&nbsp; 4. run the fio on lvm2 volume<br>
&gt;<br>
&gt; Here as you can see, we are just creating the snapshot and immediately=
<br>
&gt; deleting it. There are no IOs to the main volume or anywhere. When we =
run the<br>
&gt; fio after this (step 4) and we see around 50% drop in performance with=
<br>
&gt; reference to the number we get in step 1.<br>
&gt;<br>
&gt; It is expected to see a performance drop if there is a snapshot becaus=
e of the<br>
&gt; COW. But here we deleted the snapshot, and it is not referring to any =
data<br>
&gt; also. We should not see any performance drop here.<br>
&gt;<br>
&gt; Could someone please help me understand this behavior. Why are we seei=
ng the<br>
&gt; performance drop in this case? It seems like we deleted the snapshot b=
ut still<br>
&gt; it is not deleted, and we are paying the COW penalty.<br>
&gt;<br>
&gt; System Info:<br>
&gt;<br>
&gt; OS : ubuntu 18.04<br>
&gt; Kernel : 5.4.0<br>
&gt;<br>
&gt; # lvm version<br>
&gt; LVM version:2.02.176(2) (2017-11-03)<br>
&gt; Library version: 1.02.145 (2017-11-03)<br>
&gt; Driver version:4.41.0<br>
&gt;<br>
&gt; We also tried on latest ubuntu with newer version of LVM. We got the s=
ame<br>
&gt; behavior.<br>
&gt;<br>
&gt;<br>
<br>
Hi<br>
<br>
Debugging&nbsp; 5 year old software is likely not going to get lot of atten=
tion<br>
from upstream.<br>
<br>
So please:<br>
<br>
a) reproduce the issue with some recent&nbsp; kernel &amp; lvm2<br>
b) take&nbsp;&nbsp; 'dmsetup table &amp;&amp; dmsetup status'&nbsp; before =
you run every 'fio' test<br>
and present here your result in some form - otherwise we can hardly see wha=
t<br>
is the problem.<br>
<br>
<br>
What should be expected - if you use old/thick snapshots - when you 'drop'<=
br>
snapshot - you have your original intact LV - so results should mostly matc=
h<br>
results before you take the snapshot - but you clearly have to take into<br=
>
account if you use some 'SSD/NVMe' discarding and other things - so always =
run<br>
series of tests and average your results.<br>
<br>
If you use&nbsp; thin snapshot - that you can get various results depending=
 on your<br>
settings of thin chunks, discard usage.<br>
<br>
Also maybe try your benchmark with different filesystems...<br>
<br>
Regards<br>
<br>
Zdenek<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_SI2P153MB0444EE48C7C6E92FB448262ED7249SI2P153MB0444APCP_--

--===============2095742423926755150==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

--===============2095742423926755150==--

