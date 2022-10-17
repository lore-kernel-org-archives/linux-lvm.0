Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D70A4C4332F
	for <linux-lvm@archiver.kernel.org>; Mon, 17 Oct 2022 07:31:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1665991882;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=5MvF9rS7eqQlDRfiNvysH5y4ISr3iUgqw89aNGOsYso=;
	b=f/IPVqN/SzQoAmMcyOMyUuyT1Tewl761bcO68LuRSMSdD1Ii2j/Da0esTaNi+il1ywxi56
	P5cfA4XwLWDlQjWVQ0IOB7Snrn837Aw7HW3hOfnjZrzizFnqd+eRlIWfhCs/n+t8uwqm3v
	6mjcZ0U1jslzpn4rLPdxXNKa8a8uZ6Q=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-556-zzm3_9K1O7ChdzJJmEARGw-1; Mon, 17 Oct 2022 03:31:19 -0400
X-MC-Unique: zzm3_9K1O7ChdzJJmEARGw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BAC4F1021E04;
	Mon, 17 Oct 2022 07:31:16 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 657BD409AE9;
	Mon, 17 Oct 2022 07:31:16 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 2F1231946A4B;
	Mon, 17 Oct 2022 07:31:05 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id E1887194658C
 for <linux-lvm@listman.corp.redhat.com>; Mon, 17 Oct 2022 05:01:38 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id D0D4D409AEC; Mon, 17 Oct 2022 05:01:38 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C8C7A409AE4
 for <linux-lvm@redhat.com>; Mon, 17 Oct 2022 05:01:38 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A4C5D857F8F
 for <linux-lvm@redhat.com>; Mon, 17 Oct 2022 05:01:38 +0000 (UTC)
Received: from apac01-obe.outbound.protection.outlook.com
 (mail-eastasiaazon11020026.outbound.protection.outlook.com [52.101.128.26])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-349-GAASeZufP82rgiesrxr_QQ-1; Mon, 17 Oct 2022 01:01:33 -0400
X-MC-Unique: GAASeZufP82rgiesrxr_QQ-1
Received: from HK0P153MB0324.APCP153.PROD.OUTLOOK.COM (2603:1096:203:b2::13)
 by KL1P15301MB0498.APCP153.PROD.OUTLOOK.COM (2603:1096:820:57::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.0; Mon, 17 Oct
 2022 05:01:28 +0000
Received: from HK0P153MB0324.APCP153.PROD.OUTLOOK.COM
 ([fe80::f794:c63b:f3d5:44e]) by HK0P153MB0324.APCP153.PROD.OUTLOOK.COM
 ([fe80::f794:c63b:f3d5:44e%6]) with mapi id 15.20.5746.015; Mon, 17 Oct 2022
 05:01:27 +0000
From: Kapil Upadhayay <kupadhayay@microsoft.com>
To: Roberto Fastec <roberto.fastec@gmail.com>, LVM general discussion and
 development <linux-lvm@redhat.com>
Thread-Topic: Re: [linux-lvm] LVM2 : performance drop even after deleting the
 snapshot
Thread-Index: AQHY4AuMxGZRZQRC1EeDhnC5sBfzRq4QpaNg
Date: Mon, 17 Oct 2022 05:01:27 +0000
Message-ID: <HK0P153MB03244D79ED10AEAC52F60EF6C2299@HK0P153MB0324.APCP153.PROD.OUTLOOK.COM>
References: <PUZP153MB075126926388815B6F9E1258AC229@PUZP153MB0751.APCP153.PROD.OUTLOOK.COM>
 <PUZP153MB07512B1B646868F0F8F1D205AC259@PUZP153MB0751.APCP153.PROD.OUTLOOK.COM>
 <CAAMCDefYPozC32AdCqw-c1nOZNiEK0j0pG7n+zcu_bRwTfCagg@mail.gmail.com>
 <2e6bad30-2ebf-4162-b62d-092c3ad14003@gmail.com>
In-Reply-To: <2e6bad30-2ebf-4162-b62d-092c3ad14003@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ActionId=d10ce97f-dfd3-47ae-a61d-e4edcfbc2874;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ContentBits=0;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=true;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Method=Standard;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=Internal;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2022-10-16T07:42:38Z;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: HK0P153MB0324:EE_|KL1P15301MB0498:EE_
x-ms-office365-filtering-correlation-id: 109aa4ee-5eb8-4269-e5a1-08daaffca5fa
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0
x-microsoft-antispam-message-info: WaijXPOnp/LV2XWZnHN5hhbqht+ey1d5bJMjc3dJ3dnGiHm+2X5gR1Icewu/a2mvhKplZevxRRpfGRFoHmQ0R781r5lMBTQYcL2z3SPnpvzVjImRVyesFBMzBe3GB3Y4ESEcks4gypDx+08LYwr9EgEOZHGg9PqkjR9LOVwufto5lzbkZ+8+IiBFBKXDL5WDKHXbaxIaQDwFK0hkWtUsd+IC/kDo2NZEBH4VpVMshepugMEIV6jWFIkGfvf+N/gxruDVWTqGIYIefEAEvV/6jgGyowf0UKx7eOJWgfXdNgyMt74N1F+aaHfBO2zpBj1QqZHR7KM8tgvCSXD6re1edP94RGqFfQiOAW5DSvPs7GcXePPWpSPDZpI/nP30ur+BYdTbE4jBNoyyTXkH/iLLvt2Egi0fmKNRh4KjHObjPzdnxkP37DupQziC8TpbcMPNH+Br5oBR9nfOUqGLsC5XPQYNNqYATcP60BU0jDgECs7cUEr0s/o3btmOYHuuB4dlcXNM2uuyroxqHY/aNIPTJZVPVmbC+P1VW+ehtb8txJNp2+GLFmQ9vWF9BbWMaw8huhWXo6FhFcVsqJewwQSQQgnEz4B1lkyzrbHcdyOrayk+PgVTUG+xiXbsLP6xzSudpQ6Z1gzG6WmPMW5b70eFudCQ2LWj2dPIYJfquvvsJgxLvJvfpipWBEHUR+u5DFPcMe8Hyk5WPAOSt6gQ8Z7URDfA9i3pLDcxBF84A2QCFsZj50boLTdn3fn6nfroMKSDDd/q5YZvQm2ndBihZu1YUP76igXpWm0POfsbG0UZfutwEoutTB3sTTjvSa6tkAD7w1ApM9hvUvybs3Qf397Eeg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0P153MB0324.APCP153.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(376002)(346002)(396003)(366004)(39860400002)(451199015)(33656002)(55016003)(76116006)(4326008)(38070700005)(122000001)(54906003)(110136005)(316002)(5660300002)(66946007)(10290500003)(8676002)(64756008)(66446008)(66476007)(66556008)(38100700002)(82950400001)(82960400001)(166002)(86362001)(966005)(478600001)(26005)(9686003)(53546011)(7696005)(6506007)(8936002)(52536014)(8990500004)(2906002)(41300700001)(71200400001)(186003)(83380400001);
 DIR:OUT; SFP:1102
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?m49mIy5sl8c/Xi57hRTRlCMa9joAGdA1fKPIkPLzMcnv+A7eeJ7uXCljc1Ui?=
 =?us-ascii?Q?OuaJOd7UW8YtE1NwmpLg+wgKmdqqOmkS8yGTBxxEshutdNKgZDuP8tS/ujeG?=
 =?us-ascii?Q?EhviKMFiR8f0c7szfv19XFqf55UHB2ddfYVvga1i95pi8dpdpXBujRquurce?=
 =?us-ascii?Q?FV5BXQ84lLL5F5rcar/CMnBasKy/JPMd9hQZdQ0po1JPeAzH2ZPDjWoPIqIY?=
 =?us-ascii?Q?0v41Y8EcNSFa0azrMhfhDdaJL0Qwq+dEFn76m5cvq6r9m1TcAMC9uzGmCBeF?=
 =?us-ascii?Q?U1dpUar9ltH4MlugFQqaCNOnpHQAJOMuvAs3a1Xzk04tEUsp0RRx1LHgeQvj?=
 =?us-ascii?Q?wecMKFeMRYSYVgp4MOxqKaifBsnyL8r8AFdBY4yAuPfEqUBeMs9UuYSGv3bp?=
 =?us-ascii?Q?+8Zi/r3mW+VClotTU2tBDsskKH8Ws/VPNVevdZUflA0KNgormDm1YNVo5bNY?=
 =?us-ascii?Q?SnWE1HxW6Wn0ETT0u8r7Uzmd77X7neWBYaMPIhKGCXS7yPk+hskFNLfrRdIH?=
 =?us-ascii?Q?W6ISZRdk4L+tK/3rrn/S0ZxF0n78vQ23i751tzPpuu/kM47eUbST9GsFb9nQ?=
 =?us-ascii?Q?NtJr4tiOMbEjah8e96VZ+YRIxqCmhFmVyOB4f7Ev2iGpcEFguhewWKLajGTU?=
 =?us-ascii?Q?hd+fhnIMh70uxycwd+8ECxO5rRoxfVXJwR4FBA0y2eHiFfH+FZeqWz3rKz5y?=
 =?us-ascii?Q?yYka8XFaise+HS27P7bTQGYLWfrEvUKzZOhVROQA2aOOV25C3SBfeh0xQPDy?=
 =?us-ascii?Q?blcIwVkZP292zbqlVrN2582MyVDqfMUpVd0JXGV0oKEVWF6gb2qc8A7yML8x?=
 =?us-ascii?Q?PRLbMbfGZ31ZVAOJkzULVrmUWcJIMKmJPcb+aq5/nJbfkQdYpdnRNeubt/hz?=
 =?us-ascii?Q?HqCW2p0zecCqOlPc1WK+/qOLeD1i/iTji4v1AY5sekDYOTEjlH9gGX/6/TIq?=
 =?us-ascii?Q?BwoQRi2xjOmqnoP1ntIGlCXlSX9DDeJyFF3E6kfZtxzYDX+yhTwR8uNlejpd?=
 =?us-ascii?Q?alNFPVxyiYg1dntYTHoYXQaJjmFJEkNJ9JSbAQbRVdvXsf6e30Fuga2nJswl?=
 =?us-ascii?Q?SEdbphSQ+ojhHRFDJExnUa7mhzMTz/tdxCU/+AEGgvYkcUo9qR6OvOTw6iUj?=
 =?us-ascii?Q?0StFWM3f427ZVKCUhmmIVqgEczxi1/AiIEarrxQ+62VCWoqlJvT3sO7nvoQi?=
 =?us-ascii?Q?FFQuAGZ3Me+xb0z7EBIKvMLfmf/57yF197Hp9Hc3azCnS7WX9AisNIZLWSUe?=
 =?us-ascii?Q?Bs5oBO3AyUzJJ/vdRFdzbsQyU3XCju1XDlDt2BDzJsiN/ZEJpunxKYnQa726?=
 =?us-ascii?Q?bfu04zGXE/2j+7RJNf7dM+Rpa9VOU5ANmmW3B2TvMV1tpB9n/V/Q0HTkHq//?=
 =?us-ascii?Q?+1bcloouS747Hhv5FvDfDrw27mWD56i7VV9dyMW8WAmoLH1440EMtnX8+0JG?=
 =?us-ascii?Q?qIV+mYiY/LdtXyhOHrnvKKE2OUjoBLe4VbboSthKLLH8ZXo1/m8h1+jriDyg?=
 =?us-ascii?Q?EltsTMAlH2Rx0mtX13MuPD8tnsv/oLUTbXoo?=
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK0P153MB0324.APCP153.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 109aa4ee-5eb8-4269-e5a1-08daaffca5fa
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Oct 2022 05:01:27.7336 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zy7Qs8pPNOo++uA640nKGTBs3tAK5TPM9lIJ5VTPYitDqyd9hFaVCVE3VwSTsT7ssbU0NtZUVlgvsaUZThIxVVjQpMM44rp5qP4YlCiTZ/0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1P15301MB0498
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mailman-Approved-At: Mon, 17 Oct 2022 07:31:03 +0000
Subject: Re: [linux-lvm] LVM2 : performance drop even after deleting the
 snapshot
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
Cc: "lvm-devel@redhat.com" <lvm-devel@redhat.com>,
 Mitta Sai Chaithanya <mittas@microsoft.com>
Errors-To: linux-lvm-bounces@redhat.com
Sender: "linux-lvm" <linux-lvm-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: multipart/mixed; boundary="===============0296677216401875084=="

--===============0296677216401875084==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_HK0P153MB03244D79ED10AEAC52F60EF6C2299HK0P153MB0324APCP_"

--_000_HK0P153MB03244D79ED10AEAC52F60EF6C2299HK0P153MB0324APCP_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

The thin volume was created on a block disk provided by Microsoft Azure Man=
aged disk provisioned on premium SSD which is ready to be used in productio=
n environment. The disk can provide sustained Max IOPs at 5000.

Thanks,
Kapil Upadhayay.

From: Roberto Fastec <roberto.fastec@gmail.com>
Sent: Saturday, October 15, 2022 1:58 AM
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: Kapil Upadhayay <kupadhayay@microsoft.com>; Mitta Sai Chaithanya <mitta=
s@microsoft.com>; lvm-devel@redhat.com
Subject: [EXTERNAL] Re: [linux-lvm] LVM2 : performance drop even after dele=
ting the snapshot

Some people who received this message don't often get email from roberto.fa=
stec@gmail.com<mailto:roberto.fastec@gmail.com>. Learn why this is importan=
t<https://aka.ms/LearnAboutSenderIdentification>
TIP and HINT
forget SSDs with LVM unless of enterprise level
especially if you are going to use/implement the thin provisioning
How to identify an SSD of enterprise level:
it costs from 1,00 euro per gigabyte up to 1,50 euro per gigabyte
Kind regards
Roberto Gini
Technical Manager @ www.RecuperoDatiRAIDFAsTec.it<https://nam06.safelinks.p=
rotection.outlook.com/?url=3Dhttp%3A%2F%2Fwww.recuperodatiraidfastec.it%2F&=
data=3D05%7C01%7Ckupadhayay%40microsoft.com%7Ccd9e45aadb0c4dd0a03508daae22a=
a91%7C72f988bf86f141af91ab2d7cd011db47%7C1%7C0%7C638013761207553033%7CUnkno=
wn%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVC=
I6Mn0%3D%7C3000%7C%7C%7C&sdata=3D9i73rMTiPlvD6jlcxLti7Pvrku7jE%2BLciLP57ump=
wpA%3D&reserved=3D0>


Ottieni BlueMail per Android<https://nam06.safelinks.protection.outlook.com=
/?url=3Dhttps%3A%2F%2Fbluemail.me%2F&data=3D05%7C01%7Ckupadhayay%40microsof=
t.com%7Ccd9e45aadb0c4dd0a03508daae22aa91%7C72f988bf86f141af91ab2d7cd011db47=
%7C1%7C0%7C638013761207553033%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiL=
CJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3DhGhew=
s%2FSF8d7zCJvRzIOs24CE0xLHH1NqyWjL3IqthI%3D&reserved=3D0>
Il giorno 14 ott 2022, alle ore 21:50, Roger Heflin <rogerheflin@gmail.com<=
mailto:rogerheflin@gmail.com>> ha scritto:

What is the underlying disk hardware you are running this on?
virtual, spinning, ssd, nvme?

On Thu, Oct 13, 2022 at 2:01 AM Pawan Sharma <sharmapawan@microsoft.com<mai=
lto:sharmapawan@microsoft.com>> wrote:

 adding this to lvm-devel mailing list also.

 Regards,
 Pawan

________________________________

 From: Pawan Sharma
 Sent: Wednesday, October 12, 2022 10:42 PM
 To: linux-lvm@redhat.com<mailto:linux-lvm@redhat.com> <linux-lvm@redhat.co=
m<mailto:linux-lvm@redhat.com>>
 Cc: Mitta Sai Chaithanya <mittas@microsoft.com<mailto:mittas@microsoft.com=
>>; Kapil Upadhayay <kupadhayay@microsoft.com<mailto:kupadhayay@microsoft.c=
om>>
 Subject: LVM2 : performance drop even after deleting the snapshot

 Hi Everyone,


 We are evaluating lvm2 snapshots and doing performance testing on it. This=
 is what we are doing :

 dump some data to lvm2 volume (using fio)
 take the snapshot
 delete the snapshot (no IOs anywhere after creating the snapshot)
 run the fio on lvm2 volume

 Here as you can see, we are just creating the snapshot and immediately del=
eting it. There are no IOs to the main volume or anywhere. When we run the =
fio after this (step 4) and we see around 50% drop in performance with refe=
rence to the number we get in step 1.

 It is expected to see a performance drop if there is a snapshot because of=
 the COW. But here we deleted the snapshot, and it is not referring to any =
data also. We should not see any performance drop here.

 Could someone please help me understand this behavior. Why are we seeing t=
he performance drop in this case? It seems like we deleted the snapshot but=
 still it is not deleted, and we are paying the COW penalty.

 System Info:

 OS : ubuntu 18.04
 Kernel : 5.4.0

 # lvm version
   LVM version:     2.02.176(2) (2017-11-03)
   Library version: 1.02.145 (2017-11-03)
   Driver version:  4.41.0

 We also tried on latest ubuntu with newer version of LVM. We got the same =
behavior.

 Any help/pointers would be appreciated. Thanks in advance.

 Regards,
 Pawan

________________________________

 linux-lvm mailing list
 linux-lvm@redhat.com<mailto:linux-lvm@redhat.com>
 https://listman.redhat.com/mailman/listinfo/linux-lvm<https://nam06.safeli=
nks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flistman.redhat.com%2Fmailma=
n%2Flistinfo%2Flinux-lvm&data=3D05%7C01%7Ckupadhayay%40microsoft.com%7Ccd9e=
45aadb0c4dd0a03508daae22aa91%7C72f988bf86f141af91ab2d7cd011db47%7C1%7C0%7C6=
38013761207553033%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luM=
zIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3D2HZwpc4MH0w7bCVwN=
uohJ7jG5naZaCNGdAJHwsIzsZg%3D&reserved=3D0>
 read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO<https://nam06.safel=
inks.protection.outlook.com/?url=3Dhttp%3A%2F%2Ftldp.org%2FHOWTO%2FLVM-HOWT=
O&data=3D05%7C01%7Ckupadhayay%40microsoft.com%7Ccd9e45aadb0c4dd0a03508daae2=
2aa91%7C72f988bf86f141af91ab2d7cd011db47%7C1%7C0%7C638013761207553033%7CUnk=
nown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJX=
VCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3DnMH03VV84Qe%2FkZ5g0hoBsZi53QKOYs%2B9CiTn=
Pb6xu4s%3D&reserved=3D0>/



________________________________

linux-lvm mailing list
linux-lvm@redhat.com<mailto:linux-lvm@redhat.com>
https://listman.redhat.com/mailman/listinfo/linux-lvm<https://nam06.safelin=
ks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flistman.redhat.com%2Fmailman=
%2Flistinfo%2Flinux-lvm&data=3D05%7C01%7Ckupadhayay%40microsoft.com%7Ccd9e4=
5aadb0c4dd0a03508daae22aa91%7C72f988bf86f141af91ab2d7cd011db47%7C1%7C0%7C63=
8013761207553033%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMz=
IiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3D2HZwpc4MH0w7bCVwNu=
ohJ7jG5naZaCNGdAJHwsIzsZg%3D&reserved=3D0>
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO<https://nam06.safeli=
nks.protection.outlook.com/?url=3Dhttp%3A%2F%2Ftldp.org%2FHOWTO%2FLVM-HOWTO=
&data=3D05%7C01%7Ckupadhayay%40microsoft.com%7Ccd9e45aadb0c4dd0a03508daae22=
aa91%7C72f988bf86f141af91ab2d7cd011db47%7C1%7C0%7C638013761207553033%7CUnkn=
own%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXV=
CI6Mn0%3D%7C3000%7C%7C%7C&sdata=3DnMH03VV84Qe%2FkZ5g0hoBsZi53QKOYs%2B9CiTnP=
b6xu4s%3D&reserved=3D0>/

--_000_HK0P153MB03244D79ED10AEAC52F60EF6C2299HK0P153MB0324APCP_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<!--[if !mso]><style>v\:* {behavior:url(#default#VML);}
o\:* {behavior:url(#default#VML);}
w\:* {behavior:url(#default#VML);}
.shape {behavior:url(#default#VML);}
</style><![endif]--><style><!--
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
@font-face
=09{font-family:Consolas;
=09panose-1:2 11 6 9 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
=09{margin:0in;
=09font-size:11.0pt;
=09font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
=09{mso-style-priority:99;
=09color:blue;
=09text-decoration:underline;}
pre
=09{mso-style-priority:99;
=09mso-style-link:"HTML Preformatted Char";
=09margin:0in;
=09margin-bottom:.0001pt;
=09font-size:10.0pt;
=09font-family:"Courier New";}
span.HTMLPreformattedChar
=09{mso-style-name:"HTML Preformatted Char";
=09mso-style-priority:99;
=09mso-style-link:"HTML Preformatted";
=09font-family:Consolas;}
span.EmailStyle20
=09{mso-style-type:personal-reply;
=09font-family:"Calibri",sans-serif;
=09color:windowtext;}
.MsoChpDefault
=09{mso-style-type:export-only;
=09font-size:10.0pt;}
@page WordSection1
=09{size:8.5in 11.0in;
=09margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
=09{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"blue" vlink=3D"purple" style=3D"word-wrap:brea=
k-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">The thin volume was created on a block disk provided=
 by Microsoft Azure Managed disk provisioned on premium SSD which is ready =
to be used in production environment. The disk can provide sustained Max IO=
Ps at 5000.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks,<o:p></o:p></p>
<p class=3D"MsoNormal">Kapil Upadhayay.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div>
<div style=3D"border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal"><b>From:</b> Roberto Fastec &lt;roberto.fastec@gmail=
.com&gt; <br>
<b>Sent:</b> Saturday, October 15, 2022 1:58 AM<br>
<b>To:</b> LVM general discussion and development &lt;linux-lvm@redhat.com&=
gt;<br>
<b>Cc:</b> Kapil Upadhayay &lt;kupadhayay@microsoft.com&gt;; Mitta Sai Chai=
thanya &lt;mittas@microsoft.com&gt;; lvm-devel@redhat.com<br>
<b>Subject:</b> [EXTERNAL] Re: [linux-lvm] LVM2 : performance drop even aft=
er deleting the snapshot<o:p></o:p></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<table class=3D"MsoNormalTable" border=3D"0" cellspacing=3D"0" cellpadding=
=3D"0" align=3D"left" width=3D"100%" style=3D"width:100.0%">
<tbody>
<tr>
<td style=3D"background:#A6A6A6;padding:5.25pt 1.5pt 5.25pt 1.5pt"></td>
<td width=3D"100%" style=3D"width:100.0%;background:#EAEAEA;padding:5.25pt =
3.75pt 5.25pt 11.25pt">
<div>
<p class=3D"MsoNormal" style=3D"mso-element:frame;mso-element-frame-hspace:=
2.25pt;mso-element-wrap:around;mso-element-anchor-vertical:paragraph;mso-el=
ement-anchor-horizontal:column;mso-height-rule:exactly">
<span style=3D"font-size:9.0pt;font-family:&quot;Segoe UI&quot;,sans-serif;=
color:#212121">Some people who received this message don't often get email =
from
</span><span style=3D"color:black"><a href=3D"mailto:roberto.fastec@gmail.c=
om"><span style=3D"font-size:9.0pt;font-family:&quot;Segoe UI&quot;,sans-se=
rif">roberto.fastec@gmail.com</span></a></span><span style=3D"font-size:9.0=
pt;font-family:&quot;Segoe UI&quot;,sans-serif;color:#212121">.
</span><span style=3D"color:black"><a href=3D"https://aka.ms/LearnAboutSend=
erIdentification"><span style=3D"font-size:9.0pt;font-family:&quot;Segoe UI=
&quot;,sans-serif">Learn why this is important</span></a></span><span style=
=3D"font-size:9.0pt;font-family:&quot;Segoe UI&quot;,sans-serif;color:#2121=
21"><o:p></o:p></span></p>
</div>
</td>
<td width=3D"75" style=3D"width:56.25pt;background:#EAEAEA;padding:5.25pt 3=
.75pt 5.25pt 3.75pt;align:left">
</td>
</tr>
</tbody>
</table>
<div>
<div>
<p class=3D"MsoNormal">TIP and HINT<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">forget SSDs with LVM unless of enterprise level <o:p=
></o:p></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt">especially if you are=
 going to use/implement the thin provisioning<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">How to identify an SSD of enterprise level: <o:p></o=
:p></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt">it costs from 1,00 eu=
ro per gigabyte up to 1,50 euro per gigabyte<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">Kind regards<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">Roberto Gini<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt">Technical Manager @ <=
a href=3D"https://nam06.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%=
2Fwww.recuperodatiraidfastec.it%2F&amp;data=3D05%7C01%7Ckupadhayay%40micros=
oft.com%7Ccd9e45aadb0c4dd0a03508daae22aa91%7C72f988bf86f141af91ab2d7cd011db=
47%7C1%7C0%7C638013761207553033%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDA=
iLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=
=3D9i73rMTiPlvD6jlcxLti7Pvrku7jE%2BLciLP57umpwpA%3D&amp;reserved=3D0">
www.RecuperoDatiRAIDFAsTec.it</a> <br>
<br>
<br>
<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">Ottieni <a href=3D"https://nam06.safelinks.protectio=
n.outlook.com/?url=3Dhttps%3A%2F%2Fbluemail.me%2F&amp;data=3D05%7C01%7Ckupa=
dhayay%40microsoft.com%7Ccd9e45aadb0c4dd0a03508daae22aa91%7C72f988bf86f141a=
f91ab2d7cd011db47%7C1%7C0%7C638013761207553033%7CUnknown%7CTWFpbGZsb3d8eyJW=
IjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C=
%7C&amp;sdata=3DhGhews%2FSF8d7zCJvRzIOs24CE0xLHH1NqyWjL3IqthI%3D&amp;reserv=
ed=3D0">
BlueMail per Android</a> <o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">Il giorno 14 ott 2022, alle ore 21:50, Roger Heflin =
&lt;<a href=3D"mailto:rogerheflin@gmail.com" target=3D"_blank">rogerheflin@=
gmail.com</a>&gt; ha scritto:
<o:p></o:p></p>
<blockquote style=3D"border:none;border-left:solid #CCCCCC 1.0pt;padding:0i=
n 0in 0in 6.0pt;margin-left:4.8pt;margin-top:5.0pt;margin-right:0in;margin-=
bottom:5.0pt">
<pre>What is the underlying disk hardware you are running this on?<br>virtu=
al, spinning, ssd, nvme?<br><br>On Thu, Oct 13, 2022 at 2:01 AM Pawan Sharm=
a &lt;<a href=3D"mailto:sharmapawan@microsoft.com">sharmapawan@microsoft.co=
m</a>&gt; wrote:<o:p></o:p></pre>
<blockquote style=3D"border:none;border-left:solid #729FCF 1.0pt;padding:0i=
n 0in 0in 6.0pt;margin-left:4.8pt;margin-top:5.0pt;margin-right:0in;margin-=
bottom:6.0pt">
<pre><br> adding this to lvm-devel mailing list also.<br><br> Regards,<br> =
Pawan<o:p></o:p></pre>
<pre style=3D"text-align:center"><hr size=3D"2" width=3D"100%" align=3D"cen=
ter"></pre>
<pre><br> From: Pawan Sharma<br> Sent: Wednesday, October 12, 2022 10:42 PM=
<br> To: <a href=3D"mailto:linux-lvm@redhat.com">linux-lvm@redhat.com</a> &=
lt;<a href=3D"mailto:linux-lvm@redhat.com">linux-lvm@redhat.com</a>&gt;<br>=
 Cc: Mitta Sai Chaithanya &lt;<a href=3D"mailto:mittas@microsoft.com">mitta=
s@microsoft.com</a>&gt;; Kapil Upadhayay &lt;<a href=3D"mailto:kupadhayay@m=
icrosoft.com">kupadhayay@microsoft.com</a>&gt;<br> Subject: LVM2 : performa=
nce drop even after deleting the snapshot<br><br> Hi Everyone,<br><br><br> =
We are evaluating lvm2 snapshots and doing performance testing on it. This =
is what we are doing :<br><br> dump some data to lvm2 volume (using fio)<br=
> take the snapshot<br> delete the snapshot (no IOs anywhere after creating=
 the snapshot)<br> run the fio on lvm2 volume<br><br> Here as you can see, =
we are just creating the snapshot and immediately deleting it. There are no=
 IOs to the main volume or anywhere. When we run the fio after this (step 4=
) and we see around 50% drop in performance with reference to the number we=
 get in step 1.<br><br> It is expected to see a performance drop if there i=
s a snapshot because of the COW. But here we deleted the snapshot, and it i=
s not referring to any data also. We should not see any performance drop he=
re.<br><br> Could someone please help me understand this behavior. Why are =
we seeing the performance drop in this case? It seems like we deleted the s=
napshot but still it is not deleted, and we are paying the COW penalty.<br>=
<br> System Info:<br><br> OS : ubuntu 18.04<br> Kernel : 5.4.0<br><br> # lv=
m version<br>&nbsp;&nbsp; LVM version:&nbsp;&nbsp;&nbsp;&nbsp; 2.02.176(2) =
(2017-11-03)<br>&nbsp;&nbsp; Library version: 1.02.145 (2017-11-03)<br>&nbs=
p;&nbsp; Driver version:&nbsp; 4.41.0<br><br> We also tried on latest ubunt=
u with newer version of LVM. We got the same behavior.<br><br> Any help/poi=
nters would be appreciated. Thanks in advance.<br><br> Regards,<br> Pawan<o=
:p></o:p></pre>
<pre style=3D"text-align:center"><hr size=3D"2" width=3D"100%" align=3D"cen=
ter"></pre>
<pre><br> linux-lvm mailing list<br> <a href=3D"mailto:linux-lvm@redhat.com=
">linux-lvm@redhat.com</a><br> <a href=3D"https://nam06.safelinks.protectio=
n.outlook.com/?url=3Dhttps%3A%2F%2Flistman.redhat.com%2Fmailman%2Flistinfo%=
2Flinux-lvm&amp;data=3D05%7C01%7Ckupadhayay%40microsoft.com%7Ccd9e45aadb0c4=
dd0a03508daae22aa91%7C72f988bf86f141af91ab2d7cd011db47%7C1%7C0%7C6380137612=
07553033%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTi=
I6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=3D2HZwpc4MH0w7bCVwNuohJ7=
jG5naZaCNGdAJHwsIzsZg%3D&amp;reserved=3D0">https://listman.redhat.com/mailm=
an/listinfo/linux-lvm</a><br> read the LVM HOW-TO at <a href=3D"https://nam=
06.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Ftldp.org%2FHOWTO%2F=
LVM-HOWTO&amp;data=3D05%7C01%7Ckupadhayay%40microsoft.com%7Ccd9e45aadb0c4dd=
0a03508daae22aa91%7C72f988bf86f141af91ab2d7cd011db47%7C1%7C0%7C638013761207=
553033%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6=
Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=3DnMH03VV84Qe%2FkZ5g0hoBsZ=
i53QKOYs%2B9CiTnPb6xu4s%3D&amp;reserved=3D0">http://tldp.org/HOWTO/LVM-HOWT=
O</a>/<o:p></o:p></pre>
</blockquote>
<pre><o:p>&nbsp;</o:p></pre>
<pre style=3D"text-align:center"><hr size=3D"2" width=3D"100%" align=3D"cen=
ter"></pre>
<pre style=3D"margin-bottom:12.0pt"><br>linux-lvm mailing list<br><a href=
=3D"mailto:linux-lvm@redhat.com">linux-lvm@redhat.com</a><br><a href=3D"htt=
ps://nam06.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flistman.re=
dhat.com%2Fmailman%2Flistinfo%2Flinux-lvm&amp;data=3D05%7C01%7Ckupadhayay%4=
0microsoft.com%7Ccd9e45aadb0c4dd0a03508daae22aa91%7C72f988bf86f141af91ab2d7=
cd011db47%7C1%7C0%7C638013761207553033%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4w=
LjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;=
sdata=3D2HZwpc4MH0w7bCVwNuohJ7jG5naZaCNGdAJHwsIzsZg%3D&amp;reserved=3D0">ht=
tps://listman.redhat.com/mailman/listinfo/linux-lvm</a><br>read the LVM HOW=
-TO at <a href=3D"https://nam06.safelinks.protection.outlook.com/?url=3Dhtt=
p%3A%2F%2Ftldp.org%2FHOWTO%2FLVM-HOWTO&amp;data=3D05%7C01%7Ckupadhayay%40mi=
crosoft.com%7Ccd9e45aadb0c4dd0a03508daae22aa91%7C72f988bf86f141af91ab2d7cd0=
11db47%7C1%7C0%7C638013761207553033%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjA=
wMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sda=
ta=3DnMH03VV84Qe%2FkZ5g0hoBsZi53QKOYs%2B9CiTnPb6xu4s%3D&amp;reserved=3D0">h=
ttp://tldp.org/HOWTO/LVM-HOWTO</a>/<o:p></o:p></pre>
</blockquote>
</div>
</div>
</div>
</body>
</html>

--_000_HK0P153MB03244D79ED10AEAC52F60EF6C2299HK0P153MB0324APCP_--

--===============0296677216401875084==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

--===============0296677216401875084==--

