Return-Path: <SRS0=D9lC=F6=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9312DC433E0
	for <linux-lvm@archiver.kernel.org>; Sat, 26 Dec 2020 13:36:37 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F127320720
	for <linux-lvm@archiver.kernel.org>; Sat, 26 Dec 2020 13:36:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F127320720
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=linux-lvm-bounces@redhat.com
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-586-x-0yNlbQPhuUEUzuoUPABQ-1; Sat, 26 Dec 2020 08:36:33 -0500
X-MC-Unique: x-0yNlbQPhuUEUzuoUPABQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 891D215721;
	Sat, 26 Dec 2020 13:36:25 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6CAA819D7D;
	Sat, 26 Dec 2020 13:36:23 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D1B4D4BB7B;
	Sat, 26 Dec 2020 13:36:08 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0BQDa4lN018882 for <linux-lvm@listman.util.phx.redhat.com>;
	Sat, 26 Dec 2020 08:36:04 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 115384241B; Sat, 26 Dec 2020 13:36:04 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 088A742ADC
	for <linux-lvm@redhat.com>; Sat, 26 Dec 2020 13:36:01 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DA60B811E78
	for <linux-lvm@redhat.com>; Sat, 26 Dec 2020 13:36:01 +0000 (UTC)
Received: from de-smtp-delivery-102.mimecast.com
	(de-smtp-delivery-102.mimecast.com [62.140.7.102]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-258-nECDHHubOby6CjlTVeLBmQ-1;
	Sat, 26 Dec 2020 08:35:59 -0500
X-MC-Unique: nECDHHubOby6CjlTVeLBmQ-1
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
	(mail-he1eur04lp2057.outbound.protection.outlook.com [104.47.13.57])
	(Using TLS) by relay.mimecast.com with ESMTP id
	de-mta-24-HV8gj-sNMzegU2Fx37y6vQ-1; Sat, 26 Dec 2020 14:35:55 +0100
X-MC-Unique: HV8gj-sNMzegU2Fx37y6vQ-1
Received: from DB7PR04MB4666.eurprd04.prod.outlook.com (2603:10a6:5:2b::14) by
	DB7PR04MB4889.eurprd04.prod.outlook.com (2603:10a6:10:18::20) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.3700.27; Sat, 26 Dec 2020 13:35:54 +0000
Received: from DB7PR04MB4666.eurprd04.prod.outlook.com
	([fe80::1c22:83d3:bc1e:6383]) by
	DB7PR04MB4666.eurprd04.prod.outlook.com
	([fe80::1c22:83d3:bc1e:6383%4]) with mapi id 15.20.3700.028;
	Sat, 26 Dec 2020 13:35:54 +0000
To: LVM general discussion and development <linux-lvm@redhat.com>
From: "heming.zhao@suse.com" <heming.zhao@suse.com>
Message-ID: <dd40ed69-522a-12ca-8eaf-8d4f06cb5590@suse.com>
Date: Sat, 26 Dec 2020 21:35:42 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
	Thunderbird/78.5.0
X-Originating-IP: [123.123.135.54]
X-ClientProxiedBy: HK2PR04CA0086.apcprd04.prod.outlook.com
	(2603:1096:202:15::30) To DB7PR04MB4666.eurprd04.prod.outlook.com
	(2603:10a6:5:2b::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from c73.home (123.123.135.54) by
	HK2PR04CA0086.apcprd04.prod.outlook.com (2603:1096:202:15::30)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3700.27
	via Frontend Transport; Sat, 26 Dec 2020 13:35:52 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9ad99f50-bac1-40e5-8647-08d8a9a32b44
X-MS-TrafficTypeDiagnostic: DB7PR04MB4889:
X-Microsoft-Antispam-PRVS: <DB7PR04MB4889ABBAF23444B18B96E8BA97DB0@DB7PR04MB4889.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0
X-Microsoft-Antispam-Message-Info: 6UMgeeAidISe2UejSgN28mHOw21E8BoiRTHDLzg5iHPj2QWGDISFmzg6ZJO09uZijYwzxCKGXagjMbOWMs1eCqL/oQbCWj3Shl3AOh5LWjqnxNyV+//R2YxravLfR5w7ukfUU3akiB8CVxX+4tpRMVY2B6coyynA7jMp6GTtcwIxVVQBtd7Tt4Ilvn5WIrkq+CczJXpuwQOdph2a9ci0egtZ4mKyTyS11Yg6V60gzboWENLfIMLlwjNrR7BeO8m8wBQX69KRERrb+6QHA+VWHz4qR5As6UGpKNkFGYLF3oPVkjLSCkIvCMm7XkQoIdht6yB4rasl2bOmbuq727SUg51j1D4AGHwCVlmbSHamFH3eTNFJCKEX5Pn0CYzjhPX4otOD/B6wZMUk2w9/GzgiQpzQhXwlf3on2SwwG3I5Lf8oPKo9mqF/eekw+UCMiTUrdGy5RhnMzzH3xfxsc8MqerWwybfYIsjRbofkFq6jL+pBk3QTDYOEug75vf/mxEfTscjaRcDgsmQ+N9BmhJKHVgtzUdRWt4dVyLVQcmqd1mwfFV1iDeV8sj4larhMVcPOqdUlD69FtHe/Wjt2ZnpoIQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:DB7PR04MB4666.eurprd04.prod.outlook.com;
	PTR:; CAT:NONE;
	SFS:(376002)(366004)(396003)(346002)(39850400004)(136003)(36756003)(66556008)(26005)(83380400001)(16526019)(186003)(956004)(316002)(86362001)(52116002)(2616005)(8936002)(31686004)(4326008)(450100002)(2906002)(66946007)(15650500001)(66476007)(6666004)(478600001)(54906003)(31696002)(8676002)(8886007)(558084003)(5660300002)(6512007)(6916009)(6486002)(966005)(6506007)(9126006)(45980500001)(43740500002);
	DIR:OUT; SFP:1101
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?QWVyd3dNTlVvZWdzWkV4YWxvUTJRNUphMVBsMGR3aElYMUUxYTVjZ1FhbWov?=
	=?utf-8?B?MklzWFNUR0hXT0NMemV4eFkwZjdqbjRFK3RsRGNwTUM3cjd0OVZhRk92VE1G?=
	=?utf-8?B?N3IwR1NUMEJwTGhiMCt2aWUzRENvWWJCa0ZvamlkSC9rSkJ0Z01ubzRWaHR6?=
	=?utf-8?B?Z0ZjUnlnNjB6U1RrempvTmRtZkIwZktOM0IxSVB5bnhuL29CLytEU3VRbXVZ?=
	=?utf-8?B?b3VXcmZvbGpiWXc0Y2NrOWIxKzNNVWpMQUFYOHR5WGsrN1J1dWcxYTgxMkw3?=
	=?utf-8?B?bm9TUFlMYjVFMmR5QmNaQmhKVVBNMFZlWUlvREFGc0Uxd2V4NThBTHcvWWlR?=
	=?utf-8?B?Y1lVN0x0d2pLRGRRVHV3N0NRUzRiMTV5d3NIRVU1Z1dLNTlBRGNqSmNjMHdW?=
	=?utf-8?B?cGcvSFh2YkJaNWp1QjBwVHpjNWdEYVVkb0Z6WkxmUGUyNDBQMGpmeG03T0Jr?=
	=?utf-8?B?V0UwRGtpYTdJUFgvcFRNaFZBNHdnVld4SW5iREkvempwVGF2cnJGRGFYKzZR?=
	=?utf-8?B?WEdSNTREVERmOUE3ZDFTZGdIVDlzQnRzci9oQjFGK2F1amcySytCUVdDaEc3?=
	=?utf-8?B?NUdVY2xkNWs1aWdXYW1ETzZoNTVGWktFOW1xT2ZwdWpWNGZuU1VlVWZPalVN?=
	=?utf-8?B?K0RINnJlM29yUXdpSUJteUF4bEdRR05PRWJRaFR1NURlQlFOUXAvOFc0MkhZ?=
	=?utf-8?B?QWdnZzJna0ZCN2J0Tm45bjN4ZTdqbFc2ZnlFb3RoWUM3a1k5VEFqN1RzSUpa?=
	=?utf-8?B?a2wyRGpQblpqTEJpb1FadkRmeWd2OG1uRktuTFZjNWgvOUhoRElNOFRFRWxU?=
	=?utf-8?B?WkZTV2srWndqQmhXSXVPRnJUZkFGRlVIQ2thdDlmai8xSW9VOHMwd29Mbkdz?=
	=?utf-8?B?S1VyNWpoSDFYQkxKdFdSVWQzTFNyR3NzK0V5RS9EbXR5NVNENlc1bnU1bzBl?=
	=?utf-8?B?M25yZCswMEY1TWU2Yk81YlV0ZTRGQ0ozNkRnSnJ0bmFyZ3NScmZ1QUlHRWN4?=
	=?utf-8?B?bVZYTkpMWkpybTJUekdoR2xyMi9meWVyeC8zWHJUSEg1aVBOWC9mc1d0UlhU?=
	=?utf-8?B?WGxkbTBXSkd0TGllclA4dGlucnhTTHllMjdJR3dXdy9DaGNteTluQzVDNEE3?=
	=?utf-8?B?aU5BSWdBMHMzWUxnR1FmUkxZU0wxOUNhdlllZUZHd1oyWWx3blI1bk8rOElR?=
	=?utf-8?B?MHRHU3BFUWZmUDVEVHVYaysxckd3QzFSTUJGM05ocWVWM2gxbXVvRi9uSUtK?=
	=?utf-8?B?WXJEeWRvb0EwS1IyeWQvaFpKQ1FEZmJmcC9pM3pxa3E2SVZzeE04MHliNTFW?=
	=?utf-8?Q?T8sQQxACJUIobzGbQ9vcZj05jp/dWkAoBg?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB4666.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Dec 2020 13:35:54.1718 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ad99f50-bac1-40e5-8647-08d8a9a32b44
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4miIEFgI+5TM/DJ7WebUPNFwP1ZBe+2hY+wyKmTz5OBXACZfqHuQg7fky3MXeZOqNd8VCS204aD2mygUWNOPPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4889
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
Cc: ejt@redhat.com, David Teigland <teigland@redhat.com>,
	Zdenek Kabelac <zkabelac@redhat.com>
Subject: [linux-lvm] suggestion: replace security_context_t with char *
X-BeenThere: linux-lvm@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
Sender: linux-lvm-bounces@redhat.com
Errors-To: linux-lvm-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"

Hello,

When I was compiling lvm2 for opensuse package, I met warning about security_context_t.
I found below URL, which show some reasons:
https://www.redhat.com/archives/libvir-list/2020-July/msg00778.html

I suggest lvm2 to follow the rule, to replace security_context_t with char *.

Thanks.

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://www.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

