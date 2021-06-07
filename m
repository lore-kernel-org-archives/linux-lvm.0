Return-Path: <SRS0=xM+Q=LB=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75204C47094
	for <linux-lvm@archiver.kernel.org>; Mon,  7 Jun 2021 15:31:15 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E4BF3611AE
	for <linux-lvm@archiver.kernel.org>; Mon,  7 Jun 2021 15:31:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E4BF3611AE
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=linux-lvm-bounces@redhat.com
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-321-m3EHce4TPi27yzKhYQcYhw-1; Mon, 07 Jun 2021 11:31:12 -0400
X-MC-Unique: m3EHce4TPi27yzKhYQcYhw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D94D8101371D;
	Mon,  7 Jun 2021 15:31:03 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E884660FC2;
	Mon,  7 Jun 2021 15:31:01 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7FC6D44A5A;
	Mon,  7 Jun 2021 15:30:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 157FUoxu012627 for <linux-lvm@listman.util.phx.redhat.com>;
	Mon, 7 Jun 2021 11:30:50 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 13156112D435; Mon,  7 Jun 2021 15:30:50 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0D690100321A
	for <linux-lvm@redhat.com>; Mon,  7 Jun 2021 15:30:46 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C352980D0E6
	for <linux-lvm@redhat.com>; Mon,  7 Jun 2021 15:30:46 +0000 (UTC)
Received: from de-smtp-delivery-102.mimecast.com
	(de-smtp-delivery-102.mimecast.com [194.104.111.102]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-598-xYeDEDpvP-uWVTfb8taRRA-1;
	Mon, 07 Jun 2021 11:30:43 -0400
X-MC-Unique: xYeDEDpvP-uWVTfb8taRRA-1
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
	(mail-vi1eur04lp2054.outbound.protection.outlook.com [104.47.14.54])
	(Using TLS) by relay.mimecast.com with ESMTP id
	de-mta-16-xnJlRaBXOPKcf9lvZnjD8A-2; Mon, 07 Jun 2021 17:30:41 +0200
X-MC-Unique: xnJlRaBXOPKcf9lvZnjD8A-2
Received: from DB7PR04MB4666.eurprd04.prod.outlook.com (2603:10a6:5:2b::14) by
	DBAPR04MB7415.eurprd04.prod.outlook.com (2603:10a6:10:1aa::8) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.4195.24; Mon, 7 Jun 2021 15:30:38 +0000
Received: from DB7PR04MB4666.eurprd04.prod.outlook.com
	([fe80::2c69:3d93:4901:ecfc]) by
	DB7PR04MB4666.eurprd04.prod.outlook.com
	([fe80::2c69:3d93:4901:ecfc%3]) with mapi id 15.20.4195.030;
	Mon, 7 Jun 2021 15:30:38 +0000
To: Martin Wilck <martin.wilck@suse.com>,
	"linux-lvm@redhat.com" <linux-lvm@redhat.com>,
	"rogerheflin@gmail.com" <rogerheflin@gmail.com>
References: <a885bfa7-9635-ba73-c16b-13b9ef7a2aa4@suse.com>
	<CAAMCDef6sSy5X2+-WLR3wx5m7dx9bhmN3EKWyPa31SebS=wRGQ@mail.gmail.com>
	<dd395e820a4cf9b5e807e8de1e456786eebd2044.camel@suse.com>
From: "heming.zhao@suse.com" <heming.zhao@suse.com>
Message-ID: <7522886d-bfba-6dd6-882a-703d5776e71f@suse.com>
Date: Mon, 7 Jun 2021 23:30:25 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
	Thunderbird/78.10.0
In-Reply-To: <dd395e820a4cf9b5e807e8de1e456786eebd2044.camel@suse.com>
X-Originating-IP: [123.123.134.201]
X-ClientProxiedBy: HK0PR03CA0102.apcprd03.prod.outlook.com
	(2603:1096:203:b0::18) To DB7PR04MB4666.eurprd04.prod.outlook.com
	(2603:10a6:5:2b::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from c73.home (123.123.134.201) by
	HK0PR03CA0102.apcprd03.prod.outlook.com (2603:1096:203:b0::18)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.15
	via Frontend Transport; Mon, 7 Jun 2021 15:30:35 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e87e6a6d-b7e2-4911-574c-08d929c93380
X-MS-TrafficTypeDiagnostic: DBAPR04MB7415:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DBAPR04MB7415AAEC9BD18D3FE3D0B91D97389@DBAPR04MB7415.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0
X-Microsoft-Antispam-Message-Info: abvvw14Sh6c1c29N+XVM25jEu6kNgYSmfRe/deoHRMfpm8/T8K9PEH0+EyOkyQUWc0IBXnuDKKo9I/iCtDT9rsYj9t9OBAEX5RGjitzOBhXLt8P2oeJmnA+r2lHo5oDLtRVUImuF9wNK0pLR1G70oWXL2Blmw6FP4BTURfSOshutmCr9lYUSLKvb+dhBIlAheipYcuUZ8sOsw7OlYTr1AZDqJLh5BuBF+DmkP094pgmZfhUs374/ejIZC3PgvQG+Dz6XpGsHnY8b4USzDFSJFgL4Crbx3vZs5+tWqRYHGEHgBUCY8fr9ObyhppTJOUdHc9ztbLJ3QK4JjDj7uPtZUmVGPF6rGHtfkCrxLB4G5rqS9GwgOcR+T15qQWn7SYtyNPVQFjzwSLMQsUOZrJSq4++kbwrDl0/gbo5sPbopHrV6u9ot/pYttb7KmGyP6Y3OqibVwhfDGjmtkMAxZ60IwEoZcBn2WeD0WpOyJBt+jSv8W9oiq9gKGCRV2PkiGemOq/E4AnxenlfYPxrFOK/YiyEHC0vge8Yi1LiI9xxx6PcXsRuDDLHtVysJDsiJ47W+87ZKYSGa7jzNJz90zdEUNB8UEwkABQyj9cUULRfITGdvuVffh5HOyNK/T/BF0MrYE7O8Q/wwTz9vUCVgKdbMSVs2HThFY7y2ihPpU9/e8UWM1vEsA/V1r+VnnIzVuEcctNxiw8qFTtiZf4TPCRZN4A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:DB7PR04MB4666.eurprd04.prod.outlook.com;
	PTR:; CAT:NONE;
	SFS:(366004)(396003)(136003)(346002)(39860400002)(376002)(186003)(316002)(956004)(6506007)(2616005)(8936002)(38100700002)(66476007)(83380400001)(2906002)(5660300002)(4326008)(6512007)(54906003)(16526019)(8676002)(26005)(31696002)(53546011)(31686004)(36756003)(86362001)(8886007)(6486002)(478600001)(66946007)(66556008)(6666004)(110136005)(9126006)(43740500002)(45980500001);
	DIR:OUT; SFP:1101
X-MS-Exchange-AntiSpam-MessageData: +9KO6YKgsXdnkuMoII2g0ORtXJW7WDrwiNqYzoEftnAnJrpQYybmH/dB4oMAGxOWaSUXxpywkpx6lOnjbSy7Pxz6i8TkdxWNa1N7xuzVQsXo/3ygk6dJ9Ov4D/6yOJTFN2J8mBw+OdiZJH1A49koEhHEnnsMnt/a8+9m+1g2vi8fLmdHz7/zXtTGlG8DbkGGnBXyTnpP6KH17IPlUnapcjqSe4ErCTLfWbBhGdNJP9bR8VDcTh3cq1ooK6+InkovuhvLaIAFAdH9LeqOTPybKQc3CP7FVsQ3W6T9P7uRevTalbXMLaswl7Z21zUAFVLJTxWzHpL0h5g+B26W5nQtn5IsD1ir+7k3yQRSCHr8y60/4LNs6i04B3/ZmxFQ9RKeMhSr0KnER56XRZwJGkrsyfEhQS4SgF0HThQWjXNeaJUfr7F3ZUb1ZA5BY4XTAognYCCFfYgaduisEMtdVECGhou6dasl8CXfUudl3FY65MMYSHK3Aj8ZZBRpu6jpXQ5ugoGsIDnTz4QXqORwVMxiwtQnRNwBTPQCr09xCbg6oHDvtMgpnBf/3a8J8bJfi1rGwgjb/V7pMEymSziXlxJbqUuNRyjW8Fx1W8Qi/y7M4xeggibYpzHUVi2eNPadIYKoT9KRIU5kQoETEeiBpIlcscRNURHQXFIt3SF4UN+3WhfAqAuNZmuupIw9Rwzz84IplWYTp4muWmgIxa3UWqbv6tgSEEebvuT6fPEmBJqdjkKy8xw4GGiu/dfCu3QXagLc
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e87e6a6d-b7e2-4911-574c-08d929c93380
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB4666.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2021 15:30:37.9869 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2+EentYBiheUzJEthmoA+KL6GyjK4zEe26QHSK1/0uzOti0vrtgB5m8doZSqGUE+ATuZ6FosO5Unt9uW8S2bRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7415
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
	lists01.pubmisc.prod.ext.phx2.redhat.com id 157FUoxu012627
X-loop: linux-lvm@redhat.com
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-15"; Format="flowed"

On 6/7/21 6:27 PM, Martin Wilck wrote:
> On So, 2021-06-06 at 11:35 -0500, Roger Heflin wrote:
>> This might be a simpler way to control the number of threads at the
>> same time.
>>
>> On large machines (cpu wise, memory wise and disk wise).=A0=A0 I have
>> only seen lvm timeout when udev_children is set to default. =A0 The
>> default seems to be set wrong, and the default seemed to be tuned for
>> a case where a large number of the disks on the machine were going to
>> be timing out (or otherwise really really slow), so to support this
>> case a huge number of threads was required..=A0 =A0 I found that with it
>> set to default on a close to 100 core machine that udev got about 87
>> minutes of time during the boot up (about 2 minutes).=A0 Changing the
>> number of children to =3D4 resulted in udev getting around 2-3 minutes
>> in the same window, and actually resulted in a much faster boot up
>> and a much more reliable boot up (no timeouts).
>=20
> Wow, setting the number of children to 4 is pretty radical. We decrease
> this parameter often on large machines, but we never went all the way
> down to a single-digit number. If that's really necessary under
> whatever circumstances, it's clear evidence of udev's deficiencies.
>=20
> I am not sure if it's better than Heming's suggestion though. It would
> affect every device in the system. It wouldn't even be possible to
> process more than 4 totally different events at the same time.
>=20

hello

I tested udev.children_max with value 1, 2 & 4. The results showed it
didn't take effect, and the booting time even longer than before.
This solution may suite for some special cases.

(my env: kvm-qemu vm, 6vpu, 22G mem, 1015 disks)

Regards
heming


_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

