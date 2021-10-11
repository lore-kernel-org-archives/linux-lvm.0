Return-Path: <SRS0=vu9K=PA=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB13FC433EF
	for <linux-lvm@archiver.kernel.org>; Tue, 12 Oct 2021 06:29:17 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 01A5F60EFE
	for <linux-lvm@archiver.kernel.org>; Tue, 12 Oct 2021 06:29:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 01A5F60EFE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=werft22.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=redhat.com
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-459-cD-xA6ooM5ecBpUpI3M-Pg-1; Tue, 12 Oct 2021 02:29:11 -0400
X-MC-Unique: cD-xA6ooM5ecBpUpI3M-Pg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 62D48100C662;
	Tue, 12 Oct 2021 06:29:05 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1A0D160BE5;
	Tue, 12 Oct 2021 06:29:02 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 77D621803B30;
	Tue, 12 Oct 2021 06:28:52 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 19BE8kBb032085 for <linux-lvm@listman.util.phx.redhat.com>;
	Mon, 11 Oct 2021 10:08:46 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 94C3729ED; Mon, 11 Oct 2021 14:08:46 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8DC397C2D
	for <linux-lvm@redhat.com>; Mon, 11 Oct 2021 14:08:42 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2843A1066567
	for <linux-lvm@redhat.com>; Mon, 11 Oct 2021 14:08:42 +0000 (UTC)
Received: from CHE01-GV0-obe.outbound.protection.outlook.com
	(mail-gv0che01on2111.outbound.protection.outlook.com [40.107.23.111])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-262-jCUIiAVYPpaIa814QyiKQw-1; Mon, 11 Oct 2021 10:08:39 -0400
X-MC-Unique: jCUIiAVYPpaIa814QyiKQw-1
Received: from AM7PR02CA0010.eurprd02.prod.outlook.com (2603:10a6:20b:100::20)
	by GV0P278MB0515.CHEP278.PROD.OUTLOOK.COM (2603:10a6:710:35::14) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.24;
	Mon, 11 Oct 2021 14:08:35 +0000
Received: from AM5EUR02FT017.eop-EUR02.prod.protection.outlook.com
	(2603:10a6:20b:100:cafe::95) by AM7PR02CA0010.outlook.office365.com
	(2603:10a6:20b:100::20) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.25 via
	Frontend Transport; Mon, 11 Oct 2021 14:08:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 52.169.0.179)
	smtp.mailfrom=werft22.com; redhat.com;
	dkim=pass (signature was verified)
	header.d=nanoo.onmicrosoft.com; redhat.com;
	dmarc=bestguesspass action=none
	header.from=werft22.com
Received: from eu2.smtp.exclaimer.net (52.169.0.179) by
	AM5EUR02FT017.mail.protection.outlook.com (10.152.8.111) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
	15.20.4587.18 via Frontend Transport; Mon, 11 Oct 2021 14:08:32 +0000
Received: from CHE01-GV0-obe.outbound.protection.outlook.com (104.47.22.48)
	by eu2.smtp.exclaimer.net (52.169.0.179) with Exclaimer Signature
	Manager ESMTP Proxy eu2.smtp.exclaimer.net (tlsversion=TLS12,
	tlscipher=TLS_ECDHE_WITH_AES256_SHA384); Mon, 11 Oct 2021 14:08:32 +0000
X-ExclaimerHostedSignatures-MessageProcessed: true
X-ExclaimerProxyLatency: 10493046
X-ExclaimerImprintLatency: 342238
X-ExclaimerImprintAction: 0e2e7a103a0e4a4397aabd204798a401
Authentication-Results-Original: redhat.com; dkim=none (message not signed)
	header.d=none; redhat.com;
	dmarc=none action=none header.from=werft22.com
Received: from ZRAP278MB0397.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:2e::5) by
	ZRAP278MB0077.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:14::15) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.4587.18; Mon, 11 Oct 2021 14:08:30 +0000
Received: from ZRAP278MB0397.CHEP278.PROD.OUTLOOK.COM
	([fe80::8d27:f211:395a:f942]) by ZRAP278MB0397.CHEP278.PROD.OUTLOOK.COM
	([fe80::8d27:f211:395a:f942%6]) with mapi id 15.20.4587.026;
	Mon, 11 Oct 2021 14:08:30 +0000
From: Andreas Trottmann <andreas.trottmann@werft22.com>
To: linux-lvm@redhat.com
Message-ID: <82721064-e346-9256-3f29-c5df310553ac@werft22.com>
Date: Mon, 11 Oct 2021 16:08:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
	Thunderbird/78.14.0
X-ClientProxiedBy: ZR0P278CA0060.CHEP278.PROD.OUTLOOK.COM
	(2603:10a6:910:21::11) To ZRAP278MB0397.CHEP278.PROD.OUTLOOK.COM
	(2603:10a6:910:2e::5)
MIME-Version: 1.0
Received: from [195.234.163.98] (195.234.163.98) by
	ZR0P278CA0060.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:21::11)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.21
	via Frontend Transport; Mon, 11 Oct 2021 14:08:30 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e7e94188-148f-4c92-86f9-08d98cc09c1e
X-MS-TrafficTypeDiagnostic: ZRAP278MB0077:|GV0P278MB0515:
X-Microsoft-Antispam-PRVS: <GV0P278MB0515414EFCC7BC5BB0E11AD5E2B59@GV0P278MB0515.CHEP278.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;OLM:10000
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?VHhySTMvVEpzdmlERWpHNkpnaVlpNDJMMDhKYUZWbTZ5dUhraWdNaGRsb3VX?=
	=?utf-8?B?VFk5QnRKUExQc2E5YzdYa252YmdpWk9YbFZPQ0RGV2I0WnlWMjFCbkYzS3JZ?=
	=?utf-8?B?R3B6Q2UyL3p0K2luVkNjZ1kxdlYxSzhFOTYvUTZCT3NWdkVETCs2QU1wc2ts?=
	=?utf-8?B?SlBaS0dOb2VYR3JrZXZUMXlQTWkrdkhVSjZDakt2MnlEYkNJVDU2dTE3UGhi?=
	=?utf-8?B?NWYycmJ6SXYzb2N5OUt0bnJoY0pGZmFPNUNPTHQ2V0FCNy96TEZIdWhqR1ZL?=
	=?utf-8?B?VzdRNGhyVFRWaFJLYmlYUFZxQnMzbnMxUDlxb0RwTThtdzVqdlpiN3p6dDlN?=
	=?utf-8?B?b0hiVnNxMjlNTkV4ZGI5WTFROVRNWFRMNU5NWFAwTkRCWEVPMzF4M0JBcVo0?=
	=?utf-8?B?WndpeVNSY2ZlL1hCZ0tuVFNVN1E0RmdtOGxoQnBTaFAydkVLVjQzWW9tSktJ?=
	=?utf-8?B?b3VWU00za1NWakI5RmZiUHJXVXpVYlJYOVQyLy9Ha0JYY1AydTZvK2ZiWVpP?=
	=?utf-8?B?N0Y2VERwaGpqNCtPSGpZMWZtY0RQRUI4aksyTnVNRzVROU1JWTdreEJZN1Fi?=
	=?utf-8?B?MXllcGRnQ3h6aTJvOXUrbVR2YmpDY21jNXZvNjhPb2ptUVVQNmZqd2JrSG8x?=
	=?utf-8?B?dkl1dVJIcHZBSnhtalBWVmpmMjZocnZ4WmFrQm5OcWZFSVpVWGdlWVFiLyt5?=
	=?utf-8?B?eC80aTIvM3pQbnhTM0x5OVhmbXhmQkxuM0VzeEMwUllYQ1liN1FVVzUwVXds?=
	=?utf-8?B?UnpYZmpSdkdUNXBWa0tKRWF1SzUzcVhhOFpuWmI0UnU5eHZGMmlVVTdibkhX?=
	=?utf-8?B?SFo3YWZQMVRlTHdad0dQam13U29INmZTQWxTTFlXaldnVXFsR1QrNkV2OTRI?=
	=?utf-8?B?emp3T2dKQS9vdEJKYzBTYzJ0dksrNE5YRU8zdFkxZ3JRTzl0NzAvNTdZUFVS?=
	=?utf-8?B?dEY0bXNlNUtRNE1lTHAvaENiY0UwMm5sTVNmQjdRaWkyMDE4S0dFLzY0WXZn?=
	=?utf-8?B?L1FpWHE1dkV2NzlxR0JGaW9vVkl2Z3VKOWpvTUY2bklBZ3JFVnk1bVpjUVBw?=
	=?utf-8?B?T3BrQTlScVd2bjR6cjhhNCtxSGNNOG92c2hxWjB3ckFHZ3lZTTJCSElWdGJh?=
	=?utf-8?B?Q1ZaU21yMGJBVU1hWGtNVWlwTEdLZkJuTDV2bElPRjk3WUZ0RVp0WnZESVBm?=
	=?utf-8?B?Z0Z3WHI5Z0tzdHlXaVA3aVU3ZUVPRXJpQ3BqTytTRGVjK2dFbFBvYkFVKzgr?=
	=?utf-8?B?MVY1ZGJXMnIwdXVzU2ZzRUwxMkpYa0FhbnNxL29wQ0ZaeUp4Zz09?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
	SCL:1; SRV:; IPV:NLI; SFV:NSPM;
	H:ZRAP278MB0397.CHEP278.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
	SFS:(366004)(346002)(396003)(39830400003)(376002)(136003)(6486002)(36756003)(19627235002)(8676002)(26005)(86362001)(186003)(8936002)(52116002)(966005)(16799955002)(508600001)(66946007)(66476007)(66556008)(31696002)(6706004)(316002)(2906002)(6916009)(44832011)(956004)(2616005)(16576012)(38100700002)(38350700002)(31686004)(5660300002)(83380400001)(222603001)(3940600001)(14143004)(45980500001)(43740500002)(505234007);
	DIR:OUT; SFP:1102
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZRAP278MB0077
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR02FT017.eop-EUR02.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: da516963-ec96-47c3-3f97-08d98cc09a90
X-Microsoft-Antispam: BCL:0
X-Microsoft-Antispam-Message-Info: R+DYCX2u0BZgLnhVmldvMnDxIBXD0KsvGMZU5IdtVivbyd591t5BGMqDYTVubJEDQeMWHgWfcOqOGQjL+cbyWBP6vM8wQrFRTPGqTUnaCkKVONJ8KMtWA79dX8g07oieRoA7gsc+ysrGcqWe7D5tbc0+5xnG3ZqrGMuDJwsYGEOL6RQmzWsbwaXRe5aC+IzyXQJhMWAIgoTny9OFJsu5wJwBIpNO9jEjDqAcPF1xkwdPosXwVCUUjiTSfyQX8bn2LI0O3rGvW2x17CMV5OpUaUz+Srhe0WX3HbdWW7Tcmj0QrI3YfddLf/bgjUokGRjI9pAy6/Ty07v+cHV+BtKw2gOKE86UGE0ZfGulqkvDNJIn0Xjc2dIQHc9BO0UM8NT8COmCjrgX4bZOVPkm2x6UQSLwMsKSUbgUSuF6STTCebF8J938/C3wSLXh35f4BYgHaBXS5Z8NeYlQNKITTeWMUQXiJEs0Dq9WE5+VCdnTGjyCyIOorRyiATIjidIBsQGGdFQcCYjvmBZrcWLJIXIAJMBr8DuRY9rgXOJcJBprWGBxiX3eBaOv7Re50rA5IEnUqRP2wjmjN08hSHa9VMz8tQm0VoD6U08spF7uVwGs+IRzaPW+uFvsCBwk2fx0/JMttPEROphFnnvugDwoIdMvAnbE0gdqFsaeMNoQkFczWPIx4C/otSxceeY0ACUEmc323LJWDmlEZ5NZeMcENP821000JNLUg8S/ZJb8hRaeWs5YnGTP7a/BFe332XU6f5n4S6A2Z7DsUXXAY2OYJpdsRR6hD58+0d1gWZGl587AksWH16ColOn/13oU0xjYSTxd0RsGAj6MgplTRwE8/eH2Z/JKSCixZ1uGCSNqQG5i3QIaSpERNU9XKFY0DKImgYxsk9+XepoU6b0oPT/BIfNLjwwy/CPY5huD6x0WWA9yTYg=
X-Forefront-Antispam-Report: CIP:52.169.0.179; CTRY:IE; LANG:en; SCL:1; SRV:;
	IPV:CAL; SFV:NSPM; H:eu2.smtp.exclaimer.net;
	PTR:eu2.smtp.exclaimer.net; CAT:NONE;
	SFS:(376002)(39830400003)(396003)(346002)(136003)(36840700001)(46966006)(2906002)(6706004)(6916009)(47076005)(86362001)(26005)(966005)(5660300002)(6486002)(31696002)(508600001)(70206006)(19627235002)(36860700001)(83380400001)(70586007)(336012)(31686004)(356005)(7596003)(7636003)(36756003)(316002)(16576012)(44832011)(82310400003)(16799955002)(8676002)(186003)(956004)(2616005)(8936002)(3940600001)(222603001)(14143004)(43740500002)(505234007);
	DIR:OUT; SFP:1102
X-OriginatorOrg: werft22.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2021 14:08:32.8972 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e7e94188-148f-4c92-86f9-08d98cc09c1e
X-MS-Exchange-CrossTenant-Id: 28eff738-e52c-4df8-9f47-73928389e1b3
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=28eff738-e52c-4df8-9f47-73928389e1b3; Ip=[52.169.0.179];
	Helo=[eu2.smtp.exclaimer.net]
X-MS-Exchange-CrossTenant-AuthSource: AM5EUR02FT017.eop-EUR02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV0P278MB0515
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: linux-lvm@redhat.com
X-Mailman-Approved-At: Tue, 12 Oct 2021 02:28:49 -0400
Subject: [linux-lvm] "md/raid:mdX: cannot start dirty degraded array."
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
Content-Language: de-CH
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"

Hello linux-lvm

( I originally sent this e-Mail to linux-raid@vger.kernel.org which 
appears to have been the wrong place )


I am running a server that runs a number of virtual machines and manages 
their virtual disks as logical volumes using lvmraid (so: indivdual SSDs 
are used as PVs for LVM; the LVs are using RAID to create redundancy and 
are created with commands such as "lvcreate --type raid5 --stripes 4 
--stripesize 128 ...")

The server is running Debian 10 "buster" with latest updates and its 
stock kernel: Linux (hostname) 4.19.0-17-amd64 #1 SMP Debian 4.19.194-3 
(2021-07-18) x86_64 GNU/Linux


Recently, the server had one of its SSDs serving as a PV fail.

After a restart, all of the logical volumes came back, except one.

As far as I remember, there were NO raid operations (resync, reshape or 
the like) going on when the SSD failed.

Many LVs had _rmeta and _rimage volumes on the failed PV; all but one of 
them are perfectly useable in a "degraded" state.


The one failed volume in question consists of four stripes and uses raid5.


When I'm trying to activate it, I get:

# lvchange -a y /dev/vg_ssds_0/host-home
   Couldn't find device with uuid 8iz0p5-vh1c-kaxK-cTRC-1ryd-eQd1-wX1Yq9.
   device-mapper: reload ioctl on  (253:245) failed: Input/output error


dmesg shows:

device-mapper: raid: Failed to read superblock of device at position 1
md/raid:mdX: not clean -- starting background reconstruction
md/raid:mdX: device dm-50 operational as raid disk 0
md/raid:mdX: device dm-168 operational as raid disk 2
md/raid:mdX: device dm-230 operational as raid disk 3
md/raid:mdX: cannot start dirty degraded array.
md/raid:mdX: failed to run raid set.
md: pers->run() failed ...
device-mapper: table: 253:245: raid: Failed to run raid array
device-mapper: ioctl: error adding target to table


I can successfully activate and access three of the four _rmeta_X and 
_rimage_X LVs: _0, _2 and _3.

_rmeta_1 and _rimage_1 was on the failed SSD.

This makes me think that the data should be recoverable; three out of 
four RAID5 stripes should be enough.

I copied the entire data of all of the _rimage and _rmeta volumes onto a 
safe space.

The _rmeta ones look like this:

# od -t xC /dev/vg_ssds_0/host-home_rmeta_0
0000000 44 6d 52 64 01 00 00 00 04 00 00 00 00 00 00 00
0000020 ce 0b 00 00 00 00 00 00 00 00 00 00 00 00 00 00
0000040 ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0000060 05 00 00 00 02 00 00 00 00 01 00 00 00 00 00 00
0000100 ff ff ff ff ff ff ff ff 05 00 00 00 02 00 00 00
0000120 00 01 00 00 00 00 00 00 00 00 00 cb 01 00 00 00
0000140 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
0000160 00 00 00 80 00 00 00 00 00 00 00 00 00 00 00 00
0000200 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
*
0010000 62 69 74 6d 04 00 00 00 00 00 00 00 00 00 00 00
0010020 00 00 00 00 00 00 00 00 ce 0b 00 00 00 00 00 00
0010040 ce 0b 00 00 00 00 00 00 00 00 00 99 00 00 00 00
0010060 00 00 00 00 00 00 20 00 05 00 00 00 00 00 00 00
0010100 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
*
20000000

the only difference of _rmeta_2 and _rmeta_3 to _rmeta_0 is a "2" and a 
"3", respectively, on offset 12; this should be "array_position" and it 
makes sense to me that _rmeta_0 contains 0, _rmeta_2 contains 2 and 
_rmeta_3 contains 3.

I googled for the error message "md/raid:mdX: not clean -- starting 
background", and found 
https://forums.opensuse.org/showthread.php/497294-LVM-RAID5-broken-after-sata-link-error

In the case described there, the "failed_devices" field was not zero, 
and zeroing it out using a hex editor made "vgchange -a y" do the right 
thing again. However, in my _rmetas, it looks like the "failed_devices" 
fields are already all zero:

44 6D 52 64               magic
01 00 00 00               compat_features FEATURE_FLAG_SUPPORTS_V190
04 00 00 00               num_devices
00 00 00 00               array_position
CE 0B 00 00  00 00 00 00  events
00 00 00 00  00 00 00 00  failed_devices (none)
FF FF FF FF  FF FF FF FF  disk_recovery_offset
FF FF FF FF  FF FF FF FF  array_resync_offset
05 00 00 00               level
02 00 00 00               layout
00 01 00 00               stripe_sectors
00 00 00 00               flags
FF FF FF FF  FF FF FF FF  reshape_position
05 00 00 00               new_level
02 00 00 00               new_layout
00 01 00 00               new_strip_sectors
00 00 00 00               delta_disks
00 00 00 CB  01 00 00 00  array_sectors (0x01CB000000)
00 00 00 00  00 00 00 00  data_offset
00 00 00 00  00 00 00 00  new_data_offset
00 00 00 80  00 00 00 00  sectors
00 00 00 00  00 00 00 00  extended_failed_devices (none)
(...)                     (more zero bytes skipped)
00 00 00 00               incompat_features

This looks very fine to me; the "array sectors" value fits with the 
actual size of the array.


I was not able to find the meaning of the block starting at offset 
0x0010000 (62 69 74 6d; "bitm").


I now have two questions:

* is there anything I can do to those _rmeta blocks in order to make 
"vgchange -a y" work again?

* if not: I successfully copied the "_rimage_" into files. Is there 
anything magical that I can do with with losetup and mdadm to create a 
new /dev/md/... device that I can access to copy data from?



Thank you very much in advance and kind regards

-- 
Andreas Trottmann

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

