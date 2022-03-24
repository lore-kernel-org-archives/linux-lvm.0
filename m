Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CF26C433EF
	for <linux-lvm@archiver.kernel.org>; Thu, 24 Mar 2022 15:35:15 +0000 (UTC)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-517-GcDA8yAiM1--R9i3MGu2bg-1; Thu, 24 Mar 2022 11:35:12 -0400
X-MC-Unique: GcDA8yAiM1--R9i3MGu2bg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1BDED18812C0;
	Thu, 24 Mar 2022 15:35:04 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C51A9141DEE9;
	Thu, 24 Mar 2022 15:35:03 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 2902F194034B;
	Thu, 24 Mar 2022 15:35:03 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id E15481940347
 for <linux-lvm@listman.corp.redhat.com>; Thu, 24 Mar 2022 08:26:59 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id BB6EC53D0; Thu, 24 Mar 2022 08:26:59 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B68697ADF
 for <linux-lvm@redhat.com>; Thu, 24 Mar 2022 08:26:56 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3005A803D65
 for <linux-lvm@redhat.com>; Thu, 24 Mar 2022 08:26:56 +0000 (UTC)
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102]) by relay.mimecast.com
 with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-625-Cny72gEfN2OYI0-sK98z_A-1; Thu, 24 Mar 2022 04:26:52 -0400
X-MC-Unique: Cny72gEfN2OYI0-sK98z_A-1
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2051.outbound.protection.outlook.com [104.47.0.51]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-4-gPnKtoRkO9-UuZFpiH9PGw-1; Thu, 24 Mar 2022 09:26:46 +0100
X-MC-Unique: gPnKtoRkO9-UuZFpiH9PGw-1
Received: from DB7PR04MB4666.eurprd04.prod.outlook.com (2603:10a6:5:2b::14) by
 VI1PR04MB3024.eurprd04.prod.outlook.com (2603:10a6:802:d::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5061.29; Thu, 24 Mar 2022 08:26:43 +0000
Received: from DB7PR04MB4666.eurprd04.prod.outlook.com
 ([fe80::34b0:c774:609d:2764]) by DB7PR04MB4666.eurprd04.prod.outlook.com
 ([fe80::34b0:c774:609d:2764%7]) with mapi id 15.20.5102.016; Thu, 24 Mar 2022
 08:26:43 +0000
Message-ID: <9bacb637-77ce-5870-2f3c-9618ccceff81@suse.com>
Date: Thu, 24 Mar 2022 16:26:33 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
To: Martin Wilck <mwilck@suse.com>, David Teigland <teigland@redhat.com>
References: <38c190ac39c244d9442670589b7bfeb4f800383e.camel@suse.com>
 <97c2e9f9-0959-c5ed-230a-9d4089577410@suse.com>
 <20220321164431.GA23151@redhat.com>
 <a4df63ee-1381-de03-7490-bb1d51fa1e0e@suse.com>
 <89c9ea9d0a5e04071b5bfc00994332d6f9068438.camel@suse.com>
From: "heming.zhao@suse.com" <heming.zhao@suse.com>
In-Reply-To: <89c9ea9d0a5e04071b5bfc00994332d6f9068438.camel@suse.com>
X-ClientProxiedBy: SG2P153CA0016.APCP153.PROD.OUTLOOK.COM (2603:1096::26) To
 DB7PR04MB4666.eurprd04.prod.outlook.com (2603:10a6:5:2b::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: abf9887b-dd68-46d8-0d4d-08da0d7006de
X-MS-TrafficTypeDiagnostic: VI1PR04MB3024:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS: <VI1PR04MB302427DF8B2EFB035F9560D197199@VI1PR04MB3024.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0
X-Microsoft-Antispam-Message-Info: izU2v5uluCDH/lHlUzaOwYvffJHOuk0YXXzihYpznTksAAEg5n+Q8f+smiB2ZrK5xBxXuz4TN4KdmfkLrj/NAbbHCKJ878YaLZc29OEpptRfgeIJE/gY8VrltPRG+adLF93TmnOiITkjMULN3hrj9vYvnOpjXYrJtvhDDAL6tlIuM2FMS1Kjtx+Chzp+L5MMVcnMyFm+4wRxYzkAG7RTvt7T5I2aViS0rCG+uJZrrsiOrHVXmOZhYi5NjrGJRiE7tKCPTjAI/vS+VF3k7ArpEvcoP4crDc2ocETAWZbqVVe1e6ApIQOWe0YR8IAF1nJr/FJdzUf8qatcV/kaWof86lBzIdrfwTxasRzTw8LU34ARP1uyHyV/mRkHMwoYilOThulDG6+/fk+HoW+8OdbAYKbuqIECLDHrk7Qh4qYmiUqF/xh60ny/6qlj4yi/e19Th/tkw/ZKeAeWWyNYO/FSTs7zpOf6AfFuvNhxWclsSP4usBzNvXBHe8kAitDNQVXohwm4vtS4s/BmiZBBnvk/5KSDrWZc6DLNB+6W67+DwWM7/2t8Vr/PCPZl4R7AKEiXMkuC8Zpwm8L3r2Cxs+V7uR+IMupSb2TVpW/E7WPDZc9o7krnyrisUib0lJ7l6GHVqgw4ME/UpqiJfyrCkv2SH5hNcJ+Q0P3Oa5ZBEp2OAjTRl4QGxoo/9POHlTy6IySrUWMdqEcQnnpOIiiojsbMeYu2TjYICDsWnO0LlNyLUwY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB7PR04MB4666.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(5660300002)(38100700002)(31686004)(2906002)(53546011)(31696002)(83380400001)(6486002)(8936002)(508600001)(54906003)(66476007)(4326008)(316002)(86362001)(3480700007)(66556008)(66946007)(450100002)(186003)(36756003)(110136005)(8676002)(26005)(2616005)(6506007)(6666004)(6512007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d0M4OVZ6TXdwdEo2RUI1M2I0bXYzYytGWTBsaHZNUHJnVTAxbEtVM0ZWR1pS?=
 =?utf-8?B?eUIza1RJV2RnWWFTcDVhRHVUOG9COHN3YVBlUW9xTWQ3eGx3NWk2N3RWcENq?=
 =?utf-8?B?SkNzYlpXd05JN01vb1VDR3hIWjJ4eFFqVDFBTmlvb0dRdmxrWStNYzltdnFZ?=
 =?utf-8?B?aDkzTTVqcGJER1p5YXlqQUgyT0twTENBRzdRdS8rVW82dVRJZXlJNnlid0Ro?=
 =?utf-8?B?b2E0Ny8vU0EwM3lUSy8xV2dqNmR5T0x2L2Y1V0ZBd04rcmYrcTkrQzJqUUJR?=
 =?utf-8?B?RlN6bWRTSW5zdEFYMjNGWTBDNmRRbVJBS1NSMFloYThkUTg1bHZrcWdqSW52?=
 =?utf-8?B?M0xmWUgvQmowRlRtK20xZW9IWEdhdnlUS05BQjZBQ1ErK3c0ZDJWeitxT0l2?=
 =?utf-8?B?QXpmdi9jVEVXM21RZ2JnN0wyOXZIbHVnTzcyeU5iTGdtbkVSUm9iRjZ3Szht?=
 =?utf-8?B?cVYxTWVVVWx6bWdpd2xwd09XT2xBWFBEN2tzc2dHZ1ljR3Rpb2VMOEYzS213?=
 =?utf-8?B?cnY4bTkyalVjNk9sUVZweXZJS1psMTcvcXBETkhUZnlVT0RmdDRURUNUbjZV?=
 =?utf-8?B?a0ZTNXlGb20xWFEycS9lOEhmdWlERjNUK1pSRklYUC9UdE1IbzdpUGxJWVo5?=
 =?utf-8?B?VVd0S2hZREhjdXQrbDFkUTlUbWdodWh1UjFWZmFiRFRVU0lDRjBOaFRBWGVy?=
 =?utf-8?B?V3l2UE8rS29Vak9tZzBJV2l0VUdUeEJUYjlMTGZZdU9FTjZReE1mNlg0Z2Vq?=
 =?utf-8?B?L1FsVjFiQkhjbkdSWHZvL0U1TTcxZzNiMnoraUFkNzFtcFZnc3VyaFpwekQ1?=
 =?utf-8?B?MmlzTkJHMi9hRWVBL2RqeUppOTF5ZE5Id25iUVJVdW5qODlSbjdHRjhlK2FU?=
 =?utf-8?B?OGUwK2JNMXJMWkkxM2hYUkl5MXA4dDJMYmxBNVVDQUh5UzIwZVlFUXduWnFh?=
 =?utf-8?B?djhVa0I4NzN2cWxVdFFBK3F3N2pjS3ZOT0c0MXBWLzJhTGg2dE4rREJEMHVR?=
 =?utf-8?B?M1U5aUJaYmNEZFlwd2ZZd003WlhlOTFVaGE3cDE1WnNHZ0hhOG5tSWNYU2VV?=
 =?utf-8?B?enhmdGJ2ZWJmb3NyMnZZV0syVmtWK0NJajQ2MlV0aTJoc2RFU01lOVEvelJl?=
 =?utf-8?B?TTR0NlJSbnpWNmRvZ3ZLQzl4SHE0TXRMaXRicWlvblUrOHEwOVN6RUZ4Mi9W?=
 =?utf-8?B?UGxONFNKVkJlbE0za0Fqc1I0bndSTGNPVWc3KzlXMDBreW1PRGF0WjQ1bU83?=
 =?utf-8?B?ZXJ3UnFKa1ZaenljbkxxbE1TRjE4dUlLdkVrMXo2WEFSQXpmN0J4K3k4WUl4?=
 =?utf-8?B?TitVQk1SdjF4Y04rYjlRTkpZNDFGUkxyWVFrZjVtemJlaC9zQlNGUEE2U3JQ?=
 =?utf-8?B?YU0rR0JvQW9IRmZOdmpNSUsvUUlWK1pFK0dlR2luMHBUR0ZLM0c3RngvYnd5?=
 =?utf-8?B?ZE12NStpcEt4Q09sc0xYQkN4N1REbTBCQXNLQWJJeHdUN3o5TTJMQVFPVXNw?=
 =?utf-8?B?NmJPRVNqelUxRG1idGk1S1hua2dUUnlrbTRGS2lvbGpZU24xbkFzUmpMV3NB?=
 =?utf-8?B?UlFhaXFZYi9uSDdFU1ZCTGxaNUVySmg0SHo4b3o0ZlFiaFc0QUhFallxa2ND?=
 =?utf-8?B?S2lyYXRGWDBORDJldUdmbXpRdVJDRFZlb1JKSWZsUmtMbVNnQU9Pc255Q1hX?=
 =?utf-8?B?R0l5Rm5xak5LdUVFZnJOVFRNQWZuU1UzUms0SnhyQUlNVVRyMm5TRWFSQ0Zh?=
 =?utf-8?B?OEVCbi9UNGVkNTAzQjV3N2p4YjhENnE5bnovQ1RiRVcycklPQWdHV1djdG9t?=
 =?utf-8?B?YWNsMysvblRPd0ZqRTlab2hjWFo4WW5VaEhXQm8xTDBTRkxEQlVsQnR1QThS?=
 =?utf-8?B?NU1FaWhzUTU3OVNqTkxDUXJONnZ2c0lzMFFkT3dvSWhzYWZhQ1dpclRKcC9B?=
 =?utf-8?Q?piF3fSdBt3ZnN/mjnC0XcSDi47Wuhdl8?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: abf9887b-dd68-46d8-0d4d-08da0d7006de
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB4666.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2022 08:26:43.1716 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /uvBw3Ajx2Y98EhbUOrhwIVbfozRlj7AJ+FdL88QWx7x32PTmkI2oY9ls9AAWnbF1x1QQ8tKJaXFdbtxGhadUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3024
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Mailman-Approved-At: Thu, 24 Mar 2022 15:34:56 +0000
Subject: Re: [linux-lvm] LVM autoactivation and udev
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
Cc: Peter Rajnoha <prajnoha@redhat.com>,
 LVM general discussion and development <linux-lvm@redhat.com>
Errors-To: linux-lvm-bounces@redhat.com
Sender: "linux-lvm" <linux-lvm-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"

On 3/23/22 15:51, Martin Wilck wrote:
> On Wed, 2022-03-23 at 15:33 +0800, heming.zhao@suse.com wrote:
>>
>> I inclined to use the "--config" option to avoid booting warning.
>> (or write additional codes for vgchange "monitor_ARG")
>>
>> I have two reasons:
>>
>> 1>
>> Martin & I also found it is a difficult to find the best time to
>> start lvm2-monitor.service
>> So modification "After=" dependency will still failed with some
>> cases.
> 
> Yes. The reason is that even after "sysinit.target" is reached, "udev
> settle" for coldplug hasn't necessarily finished these days (as
> systemd-udev-settle.service is deprecated, and often not activated any
> more). Thus even if started after sysinit.target, lvm2-monitor.service
> may encounter devices that haven't been fully processed by udev yet.
> 
>> 2>
>> the lvm2-monitor.service helps to finish monitoring job for lvm_scan.
>> So it's not necessary
>> to ask this service to handle the VG/LV which starting after switch
>> rootfs. (These VG/LV
>> should be monitored by "pvscan --cache".)
>>
>> So starting lvm2-monitor.service as early as possible is accepted.
> 
> Please forgive me if I am (out of ignorance about dmeventd) totally on
> the wrong track here, but:
> 
> I still have my doubts. I can see that the warnings about missing udev
> information have gone if we use  --config 'devices {
> external_device_info_source="none" }'. But that doesn't mean much by
> itself. vgchange will instead rely on native device detection, which,
> as we know very well, will lead to wrong results more often than not,
> in particular if multipath devices are present. IOW, it will probably
> ask dmeventd to monitor SCSI devices that are path of multipath maps,
> rather than the map devices themselves. I don't know dmeventd well
> enough to judge whether that would be fatal, but past experience makes
> me wary about it.
> 
> I suppose to test that we'd need to setup systems with root FS on
> "monitored" LVM volumes (e.g. thin or mirror) on multipath (with recent
> multipath releases, 0.8.8 or newer). I for one haven't tested this so
> far.
> 
> What I would love to see wrt lvm2 monitoring is true event-based
> activation - i.e. activate monitoring of devices one by one as they
> actually appear in the system, in a manner that's consistent with udev.
> Thus something similar to David's late approach with the "devices file"
> for PV detection. That would avoid both the need to pass config options
> and the need to figure out when to safely start the monitoring.
> 

Your concern is may right, "vgchange --monirtor y" will call lvmcache_label_scan() to search
active VGs , meanwhile libudev hasn't done on some devs. And then vgchange will output
some warning which can be ignored but may irritate users.

In theory, if "vgchange --monitor y" only handles the VGs which created during initrd phase
can avoid this problem.

- Heming

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

