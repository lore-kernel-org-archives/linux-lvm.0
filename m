Return-Path: <SRS0=OWAI=LA=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6961C47096
	for <linux-lvm@archiver.kernel.org>; Sun,  6 Jun 2021 06:16:22 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3FFB8611C2
	for <linux-lvm@archiver.kernel.org>; Sun,  6 Jun 2021 06:16:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3FFB8611C2
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=linux-lvm-bounces@redhat.com
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-452-d3LE97HiPL-7Wizfw6-k_g-1; Sun, 06 Jun 2021 02:16:18 -0400
X-MC-Unique: d3LE97HiPL-7Wizfw6-k_g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DEB83180FD62;
	Sun,  6 Jun 2021 06:16:10 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6BA30690EF;
	Sun,  6 Jun 2021 06:16:08 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1E25F1800FFC;
	Sun,  6 Jun 2021 06:15:50 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1566Fi68022853 for <linux-lvm@listman.util.phx.redhat.com>;
	Sun, 6 Jun 2021 02:15:45 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id CE5AA10031E7; Sun,  6 Jun 2021 06:15:44 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C93661003200
	for <linux-lvm@redhat.com>; Sun,  6 Jun 2021 06:15:42 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 132D01857F28
	for <linux-lvm@redhat.com>; Sun,  6 Jun 2021 06:15:42 +0000 (UTC)
Received: from de-smtp-delivery-102.mimecast.com
	(de-smtp-delivery-102.mimecast.com [194.104.109.102]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-568-jGSbbGEyMjeDJYVk7cY8Hg-1;
	Sun, 06 Jun 2021 02:15:38 -0400
X-MC-Unique: jGSbbGEyMjeDJYVk7cY8Hg-1
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
	(mail-he1eur04lp2050.outbound.protection.outlook.com [104.47.13.50])
	(Using TLS) by relay.mimecast.com with ESMTP id
	de-mta-5-JTd7M4CnO6eyWpkejrQ03g-1; Sun, 06 Jun 2021 08:15:36 +0200
X-MC-Unique: JTd7M4CnO6eyWpkejrQ03g-1
Received: from DB7PR04MB4666.eurprd04.prod.outlook.com (2603:10a6:5:2b::14) by
	DBBPR04MB7706.eurprd04.prod.outlook.com (2603:10a6:10:208::21) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.4195.24; Sun, 6 Jun 2021 06:15:34 +0000
Received: from DB7PR04MB4666.eurprd04.prod.outlook.com
	([fe80::2c69:3d93:4901:ecfc]) by
	DB7PR04MB4666.eurprd04.prod.outlook.com
	([fe80::2c69:3d93:4901:ecfc%3]) with mapi id 15.20.4195.030;
	Sun, 6 Jun 2021 06:15:34 +0000
To: Zdenek Kabelac <zkabelac@redhat.com>, David Teigland <teigland@redhat.com>,
	Martin Wilck <martin.wilck@suse.com>,
	LVM general discussion and development <linux-lvm@redhat.com>
From: "heming.zhao@suse.com" <heming.zhao@suse.com>
Message-ID: <a885bfa7-9635-ba73-c16b-13b9ef7a2aa4@suse.com>
Date: Sun, 6 Jun 2021 14:15:23 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
	Thunderbird/78.10.0
X-Originating-IP: [123.123.134.201]
X-ClientProxiedBy: HK0PR01CA0061.apcprd01.prod.exchangelabs.com
	(2603:1096:203:a6::25) To DB7PR04MB4666.eurprd04.prod.outlook.com
	(2603:10a6:5:2b::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from c73.home (123.123.134.201) by
	HK0PR01CA0061.apcprd01.prod.exchangelabs.com
	(2603:1096:203:a6::25) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384)
	id 15.20.4195.22 via Frontend Transport;
	Sun, 6 Jun 2021 06:15:32 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cdd12173-cdf1-4018-f09a-08d928b27e52
X-MS-TrafficTypeDiagnostic: DBBPR04MB7706:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DBBPR04MB770663A5E7AF080DA606F11397399@DBBPR04MB7706.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0
X-Microsoft-Antispam-Message-Info: 2DJhubx8wxc08CqNX+LR+UkugAUsKRxMDJjeRTABNtGZvwuVekX3AwHsdfNY13mYEd6PfB2U1+17S33avtMJyHvvhjqtCNHWCqpw28YffVAVb/LqWB8dHBvbjt8eVk/bEyS4hmg6Q1Owq6TdW8a0phtFB5wF5IjYxv7QUAcqooYAKDjiAbXnHTkXTba9ymVjT+qGNBGDeDGxmVhVvLptOpZUklsVct5yUKriH0351ErDy2ZfjWAjcjPHiygzknQoxyx9GjdAVAWqIS3SE1tV0MaRaCS6suJoQr3F5acvE5boglTzVr1wm6V3LobpT8XFBxRr1VN8q4bmo0gEAuO08epFpWRFerN+XkaU38feCdRcN8nLX85SBcWLSGMGJj9bgIEW0CFmb3XZFM+u75dMb5myiuh3vki+ruD/CXYFL870PMO2CMJh5Pzj78whjPvBgZv6FzpECV8E+c+X3roHYqg3HO1uBbcg1Fj005HH/2qd4MzO1XtH28/aEYdY8O0omk2vv6FUBqUl0IqtzEuBjFHiZM+6j6rtp2a7FX7ro92Q8rf0QikDIyEztldg12tqJwYy/DbqFbkAI1DJ+n9kySW+VCAh7aYcVyal6Mw0Ab8ZaYRfB/i+1fSav7Cqx05RrMAa4nr0H2GvorXXWZpmkXFZkSaBZ3GUgxTUEf+nHu4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:DB7PR04MB4666.eurprd04.prod.outlook.com;
	PTR:; CAT:NONE;
	SFS:(39860400002)(136003)(376002)(366004)(396003)(346002)(956004)(2616005)(186003)(316002)(83380400001)(110136005)(2906002)(6512007)(86362001)(8886007)(6666004)(38100700002)(6486002)(16526019)(5660300002)(31686004)(8936002)(450100002)(66476007)(66556008)(36756003)(66946007)(6506007)(26005)(8676002)(31696002)(478600001)(9126006)(43740500002);
	DIR:OUT; SFP:1101
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?TUQ4TjVpYjB1TmZRVzdpTUJGUkpNZ0ZhSFZMbEFOV2V4UXV0QzM2NGZNM2RM?=
	=?utf-8?B?aDlzQ1BWaDVXWnU1ajJZWUY4QytGeEd4SldmdTJIYkltU3I5eW5Jd2U0QTNu?=
	=?utf-8?B?N09xM0VZcUpoemFnaERzN0tjRFh3K2RNSFJMMTNiQU9SMjl5VkxWR1A4Wi9U?=
	=?utf-8?B?NEZZalVjODhWQzR3a3NaR0xkRlFaSGFTNmhVbzdXZGxsS3BZV0hpZ1QydjdS?=
	=?utf-8?B?MTNKZ0tTbnBENHZLUkk5MENIWEd6emJiZWo4VkMvTkJKMGs1K2ZkWll4SWNL?=
	=?utf-8?B?OFRzQWxJQWs4NGRmSk13c1NIaEtzeFNmd2tkcG5iTUJtUHJtUGY3aU9GZmhV?=
	=?utf-8?B?dHFPVnp3VGJaNURIa2FidzJwdldKOFZ3N2pkUGt5NkJ0dEY2MC9McHl4K2ll?=
	=?utf-8?B?akNoRGxoZUJrZDl2YWRXZEY0TmNDN1RhazRHbjFSd1AyRjh1NEhrWlZtTlpL?=
	=?utf-8?B?TVV0OEQ1T21zajhQV2svQnZVbmEwOEJlU3R0YzBKT2pKNjNzM0J5RzJxRGJT?=
	=?utf-8?B?TlNRZWh0L3ErL1BRaml3Z3RhclJudVV2N29QNTd4emRsUHNwVFlPdUhCdmFl?=
	=?utf-8?B?UjVRVExKVFVlbkpTc0tiR1hwcVh5b20xZFRMdEpPODNkL3JhbHJRZENUa2pS?=
	=?utf-8?B?bEhIWmR0a2ZUZndIYTU2Y2c0MDZ5NG5xR0g2d1YyN1RCWFh3S3oycDMwSlds?=
	=?utf-8?B?cU5UQkg1RzZ0VUJZVGNTTDhwcFArbE1paDR2ak4xRXBJa1lIV2VwQi9RWFk5?=
	=?utf-8?B?VzJGQ09JRmZQRDYwSHkvUzFzbUtNNm5NMVE2WFlDTlB1RG1USS9IdktHYk4x?=
	=?utf-8?B?R3pRK1dGeU1sZFJxd2NEc3hEeEcwUzNCQzNoampNdFZPbW84Tk1mbkoxSEZv?=
	=?utf-8?B?d2dPRXpINDlhcmtuVkF2U0s4akorMWRCd3FHc0hVeFFEZlA4cUx2b21RRnZV?=
	=?utf-8?B?dDlyQjNkeXRERUpHamFzRXFkNHNlOWJ3aFZsU05LUXlyb0FUZzF3T296WWM5?=
	=?utf-8?B?RVlnS0hyTkJFZ3U1cDVmVjdBK3dFekRKMGpvblNxZVNFZWVTblNGa2ZTL1dZ?=
	=?utf-8?B?VU0rdE0yUTRkV1J1L09MQmltRmRVV2lWN1FJbWVNQXV6SllpSHlkWHJNOWsw?=
	=?utf-8?B?eGN1WW8xZTdNT0VEMFdSZmdSRGVNTll2WGhuaTgxRm93bEh1cHJqTlBkenRr?=
	=?utf-8?B?T2ZPTkY3d0ltdFhVN0JRNWdzT3ZpeXY3N3MrdGJjSmxvYXpNTkpGdTBRU1d1?=
	=?utf-8?B?d3VyajZhWnR6d0JROFNveUp2eE9DMVJRS2xJVks2YzZMTVNMelhyYU9Hc2Vt?=
	=?utf-8?B?Nzc3WG5taXJKMUFzK05QdVl6VVljdlFNQSsrYUhjRjBGVzk1b3JVa1VmY3Vs?=
	=?utf-8?B?eHhZZXdYMzNCZjdLUm1YbG9QL3NBbWlFSUpMNnVxbHViZDlERHc2Rzc4d3NI?=
	=?utf-8?B?MU9JZWpjTnRVV3hVUXc0T3h4V0IvNFFQSFY5SmM5cTAyZVBHZjRJem5ocVAz?=
	=?utf-8?B?Uit1dzczT3pORHE2NzROUm9MaUhUT2lQUGpEcGhES2t4L0VkK2xsUzlXRURY?=
	=?utf-8?B?aFRvZ1Y5bklBU0RPdjNSSm5Rak5TNjBCNjZlWHV5YnQxaFBWV3BLVTZXYXhq?=
	=?utf-8?B?eE1zaTRZZDJTR2M4aUVEL3krdVFLaytWaDA3YVBGYnVjenVTcEdCbzdxaVVP?=
	=?utf-8?B?UlVKSzlUSzBxUmZzYlJ4a0hORHRESGVtZDdHTEVKMHlJQm1QcmJHUnphQ3hh?=
	=?utf-8?Q?9nZuxvsDRc3wjWUfp2FjsuLrufCGx6P5lYjQ+ya?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cdd12173-cdf1-4018-f09a-08d928b27e52
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB4666.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2021 06:15:34.0969 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iH28CSy42z97NOfs01imHigBKnEtws1x26VWJG9NJLznYiW9iFnOkkuc5VcMO6q7btIrFw3eiLO7GLuWX6J3Xg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7706
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: linux-lvm@redhat.com
Subject: [linux-lvm] Discussion: performance issue on event activation mode
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"

Hello David & Zdenek,

I send this mail for a well known performance issue:
  when system is attached huge numbers of devices. (ie. 1000+ disks),
  the lvm2-pvscan@.service costs too much time and systemd is very easy to
  time out, and enter emergency shell in the end.

This performance topic had been discussed in there some times, and the issue was
lasting for many years. From the lvm2 latest code, this issue still can't be fix
completely. The latest code add new function _pvscan_aa_quick(), which makes the
booting time largely reduce but still can's fix this issue utterly.

In my test env, x86 qemu-kvm machine, 6vcpu, 22GB mem, 1015 pv/vg/lv, comparing
with/without _pvscan_aa_quick() code, booting time reduce from "9min 51s" to
"2min 6s". But after switching to direct activation, the booting time is 8.7s
(for longest lvm2 services: lvm2-activation-early.service).

The hot spot of event activation is dev_cache_scan, which time complexity is
O(n^2). And at the same time, systemd-udev worker will generate/run
lvm2-pvscan@.service on all detecting disks. So the overall is O(n^3).

```
dev_cache_scan //order: O(n^2)
  + _insert_dirs //O(n)
  | if obtain_device_list_from_udev() true
  |   _insert_udev_dir //O(n)
  |
  + dev_cache_index_devs //O(n)

There are 'n' lvm2-pvscan@.service running: O(n)
Overall: O(n) * O(n^2) => O(n^3)
```

Question/topic:
Could we find out a final solution to have a good performance & scale well under
event-based activation?

Maybe two solutions (Martin & I discussed):

1. During boot phase, lvm2 automatically swithes to direct activation mode
("event_activation = 0"). After booted, switch back to the event activation mode.

Booting phase is a speical stage. *During boot*, we could "pretend" that direct
activation (event_activation=0) is set, and rely on lvm2-activation-*.service
for PV detection. Once lvm2-activation-net.service has finished, we could
"switch on" event activation.

More precisely: pvscan --cache would look at some file under /run,
e.g. /run/lvm2/boot-finished, and quit immediately if the file doesn't exist
(as if event_activation=0 was set). In lvm2-activation-net.service, we would add
something like:

```
ExecStartPost=/bin/touch /run/lvm2/boot-finished
```

... so that, from this point in time onward, "pvscan --cache" would _not_ quit
immediately any more, but run normally (assuming that the global
event_activation setting is 1). This way we'd get the benefit of using the
static activation services during boot (good performance) while still being able
to react to udev events after booting has finished.

This idea would be worked out with very few code changes.
The result would be a huge step forward on booting time.


2. change lvm2-pvscan@.service running mode from parallel to serival.

This idea looks a little weird, it goes the opposite trend of today's
programming technologies: parallel programming on multi-cores.

idea:
the action of lvm2 scaning "/dev" is hard to change, the outside parallel
lvm2-pvscan@.service could change from parallel to serial.

For example, a running pvscan instance could set a "running" flag in tmpfs (ie.
/run/lvm/) indicating that no other pvscan process should be called in parallel.
If another pvscan is invoked and sees "running", it would create a "pending"
flag, and quit. Any other pvscan process seeing the "pending" flag would
just quit. If the first instance sees the "pending" flag, it would
atomically remove "pending" and restart itself, in order to catch any device
that might have appeared since the previous sysfs scan.
In most condition, devices had been found by once pvscan scanning,
then next time of pvscan scanning should work with order O(n), because the
target device had been inserted internal cache tree already. and on overall,
there is only a single pvscan process would be running at any given time.

We could create a list of pending to-be-scanned devices then (might be directory
entries in some tmpfs directory). On exit, pvscan could check this dir and
restart if it's non-empty.


Thanks
Heming

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

