Return-Path: <SRS0=alGo=ME=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFBD7C07E99
	for <linux-lvm@archiver.kernel.org>; Mon, 12 Jul 2021 19:02:05 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 35DD96121E
	for <linux-lvm@archiver.kernel.org>; Mon, 12 Jul 2021 19:02:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 35DD96121E
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=linux-lvm-bounces@redhat.com
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-345-fCT1-aj9PBC81ktM4U6wgA-1; Mon, 12 Jul 2021 15:02:02 -0400
X-MC-Unique: fCT1-aj9PBC81ktM4U6wgA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 247AC100CCC1;
	Mon, 12 Jul 2021 19:01:54 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9C8635D6BA;
	Mon, 12 Jul 2021 19:01:50 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E836C1809C99;
	Mon, 12 Jul 2021 19:01:33 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 16CJ1TMb029087 for <linux-lvm@listman.util.phx.redhat.com>;
	Mon, 12 Jul 2021 15:01:30 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id BAE739C06F; Mon, 12 Jul 2021 19:01:29 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B3B66BDC5B
	for <linux-lvm@redhat.com>; Mon, 12 Jul 2021 19:01:21 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B930A8058CD
	for <linux-lvm@redhat.com>; Mon, 12 Jul 2021 19:01:21 +0000 (UTC)
Received: from de-smtp-delivery-102.mimecast.com
	(de-smtp-delivery-102.mimecast.com [194.104.111.102]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-556-GTomgW86MD-XfNDc9Oaxhg-1;
	Mon, 12 Jul 2021 15:01:19 -0400
X-MC-Unique: GTomgW86MD-XfNDc9Oaxhg-1
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
	(mail-ve1eur02lp2059.outbound.protection.outlook.com [104.47.6.59])
	(Using TLS) by relay.mimecast.com with ESMTP id
	de-mta-12-z71bQ0J8N1ixI8CTaeOk9g-1; Mon, 12 Jul 2021 21:01:16 +0200
X-MC-Unique: z71bQ0J8N1ixI8CTaeOk9g-1
Received: from DB7PR04MB4666.eurprd04.prod.outlook.com (2603:10a6:5:2b::14) by
	DB7PR04MB5979.eurprd04.prod.outlook.com (2603:10a6:10:8f::17) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.4308.25; Mon, 12 Jul 2021 19:01:14 +0000
Received: from DB7PR04MB4666.eurprd04.prod.outlook.com
	([fe80::d9ad:152e:66d6:b880]) by
	DB7PR04MB4666.eurprd04.prod.outlook.com
	([fe80::d9ad:152e:66d6:b880%3]) with mapi id 15.20.4308.026;
	Mon, 12 Jul 2021 19:01:13 +0000
From: Heming Zhao <heming.zhao@suse.com>
To: linux-lvm@redhat.com, zkabelac@redhat.com, teigland@redhat.com
Date: Tue, 13 Jul 2021 03:01:00 +0800
Message-ID: <20210712190100.8813-1-heming.zhao@suse.com>
X-ClientProxiedBy: HKAPR04CA0012.apcprd04.prod.outlook.com
	(2603:1096:203:d0::22) To DB7PR04MB4666.eurprd04.prod.outlook.com
	(2603:10a6:5:2b::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (123.123.130.159) by
	HKAPR04CA0012.apcprd04.prod.outlook.com (2603:1096:203:d0::22)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.20
	via Frontend Transport; Mon, 12 Jul 2021 19:01:12 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e54f0c46-fa64-447d-a76b-08d945676b06
X-MS-TrafficTypeDiagnostic: DB7PR04MB5979:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB7PR04MB59791EC6C431F2314EC56EAC97159@DB7PR04MB5979.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:619
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0
X-Microsoft-Antispam-Message-Info: uWXrbAQd5fBB9W0wh6DoVIesK6guNsyalvtpL3mjorvkIpmSF4k3JdNNoTqVf/uODoB5pVAsyiPZDskGdlZUDIw30ia0Zx+K5ld292WOTDy5P/q5AGa6fRTvADdQFTp1ra5S9ZNevYF10Ckx8/uwDcz3DCJTSn2BabBZ2Cx75IF1jOtiiATelzpITgxg3zS2+WB7zRHUCwAkr7nykPKkkzZYCp1XrV1KHxuPL7gPsFLO59lNs5v3+nb+gt3oec2VH03cwZX+Y4BERmq8nzy15rV2gGEU+eijDc0+4OxuCD/t/atZOQeyiB93ARxCdh7batXyU6J6/Ug0SwY0H7JAWrbjb/kb4j7PgMXhoS1I835dFipb0lrW/YOZCDuPJUn+0eDvtoc5uuCUKjJXppyatwr6FoMm7W6fld7DyrSEYbtTSU+F0aeY4KqXHI2N3eZKOLzFi04ZdUceD+PvZhCSBM8qJpa0E597wWJ5LfbBeI2hykQtN3Qo1A63+DZdWZdHC5eG8MAb36Gck+E3bMjC/qZVgGaI66CixXQeHc41xG6LSR7CS5dEJgax2NC8SeqdqZ9FSV55/Lapx70m8CidyOsFAtuHpTRTJ2rmXzUmP+O9bk7zRg38ADmOKDSGrYUtbEjHOSejXkWjgKLzpUM/4mVHzvLPH5alLxuX00N3hg5oCo/LHkyk1NGvH11r/p4E
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:DB7PR04MB4666.eurprd04.prod.outlook.com;
	PTR:; CAT:NONE;
	SFS:(376002)(366004)(39860400002)(346002)(136003)(396003)(316002)(8936002)(36756003)(66556008)(86362001)(44832011)(66476007)(26005)(478600001)(2616005)(66946007)(956004)(6486002)(8676002)(450100002)(2906002)(107886003)(186003)(4326008)(6666004)(1076003)(38100700002)(5660300002)(83380400001)(6496006)(9126006);
	DIR:OUT; SFP:1101
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xwR45pOXiNQbX0bVv2Ai3uNMT0mpto9EGbiCVQGLr2LyGYkY472JiLwUgat9?=
	=?us-ascii?Q?eYSL3P1gV0uUl7l5bDmpmA+VpqKIfl0Jj9KgfKwAAa7nzdS6E5w18IyVBAtv?=
	=?us-ascii?Q?oZnfs2Oc/+MOLakuYi2Vdxx98zHadQS2chH/6ej+RR4oNrKbkp5WUjtq9Af2?=
	=?us-ascii?Q?rlAGH1Dkoy+OGqX84yg/cE7/UROSgVw6qv4sKsXnFXc9CchuMQWrAuTYaJLe?=
	=?us-ascii?Q?POoph78nKPp7VD45SCYHfJRByPbX2W6VohUnafRGIhiAhrYrGH4FFW95FOGY?=
	=?us-ascii?Q?h8ZC+IdjGDBxIJp1lz01Ios0jHLjXkKz6BcaA9QLaRw0t+T7rIaUWZA82rte?=
	=?us-ascii?Q?6jCb2d5d+CljeNed+ydGa69Rgc6c5VoLpkPdvXbLWOhdBDixIJkYvh68zM3S?=
	=?us-ascii?Q?95CINTNO1me4kX7+aHVfDKl4iEV2hV2igS0wgWGPOQujcEKRDWlsoJpK6Yu8?=
	=?us-ascii?Q?MGLniVS6K0FDtetqO+LRQ8DaIULnt8m8Ch4/tRzE1rBTl9NTML1k8PPVL4RD?=
	=?us-ascii?Q?4RvH7ViAfJWwAryW2fxjC8F9Oscb7CRZ373sJNANTM3/dbUjevuDLScTt1IB?=
	=?us-ascii?Q?PPjkmIb1TzPnEU25DuoWfo3xrgE3fmazVbb8xnlko2LMmAkEu6HEx7K/jfU8?=
	=?us-ascii?Q?I92x3qBBG3wh2HbWdoV0o5S5JoqxNgL7VbizLllzLsG36+P0ZHaGXy+jVdmG?=
	=?us-ascii?Q?rnnUHogu3hZezKss4rsFqRaZPXc8+P3qYvPP84tJbAqFMJxQMnhbo5AQKJrS?=
	=?us-ascii?Q?veT/9OQunfH6QTQ0qEBNED3FayiUIhbhwOanFC37kuNmD+gM4a5Zfjr0KQvi?=
	=?us-ascii?Q?YS8L6VpmwaV51t7JJbn8UthckXBaW9VnDw0IIsqbsUwot1EQhFwOZ0xsYW13?=
	=?us-ascii?Q?9yuVNe73/9svKqTIDt59TJeYuk2kWg73vRF/CVhWl9n96dBRpwyrlXEftm0N?=
	=?us-ascii?Q?YDG4cIaeAXqCH+mei8ETleyrGfEWOO5X2JtYKF2W7ShSebtVnydYuZYQTvC7?=
	=?us-ascii?Q?W4Pbuc+fVvJElekcXgBTymRzcmzVYdVyAFH4ePQcMTmSQf8Gry9sMgj/E62N?=
	=?us-ascii?Q?aoK5fPYGOyuqq3/Sq6tXmblsEYS3Ol0JizVM3YiaNPM8L7BcUzCMcf5TyfAb?=
	=?us-ascii?Q?55H8+hvs8yf294oierJQL/cxFEqpcfn3PnCLXv0Sr0at38/jBSd5vZXRRCWr?=
	=?us-ascii?Q?gfUeWk/84wwyM7zme7h7xecdinzHMp/NSKyzSG9f4i4Ic0lXks6HD9bGeK01?=
	=?us-ascii?Q?ieT7irrkee1HSweKAagpAJ/jWXWd9imUZou3j1kSRW36IdFzncDVUOEsyJ8l?=
	=?us-ascii?Q?lV/stDfO8XhRX3JyRmH2lt6w?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e54f0c46-fa64-447d-a76b-08d945676b06
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB4666.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2021 19:01:13.8266 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZU6oiPRosW0GH2fAA8SpueiocTT9uMzsyJ7YspFxeEvnS6s+jDXGviank8PyTpiOL0UhyBESgXTspAR/1gN7LQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB5979
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 16CJ1TMb029087
X-loop: linux-lvm@redhat.com
Cc: Heming Zhao <heming.zhao@suse.com>
Subject: [linux-lvm] [PATCH] toolcontext: fix double free (core dumped) issue
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

How to trigger:

```
~ # export LVM_SYSTEM_DIR=_
~ # pvscan
  No matching physical volumes found
double free or corruption (!prev)
Aborted (core dumped)
```

when LVM_SYSTEM_DIR is empty, _load_config_file() won't be called.

when LVM_SYSTEM_DIR is not empty, cfl->cft links into cmd->config_files
by _load_config_file()@lib/commands/toolcontext.c

core dumped code: _destroy_config()@lib/commands/toolcontext.c

```
    /* CONFIG_FILE/CONFIG_MERGED_FILES */
    if ((cft = remove_config_tree_by_source(cmd, CONFIG_MERGED_FILES)))
        config_destroy(cft);
    else if ((cft = remove_config_tree_by_source(cmd, CONFIG_FILE)))
        config_destroy(cft); <=== first free the cft

    dm_list_iterate_items(cfl, &cmd->config_files)
        config_destroy(cfl->cft); <=== double free the cft
```

Fixes: c43f2f8ae08ed0555a300764c8644ea56f4f41e2

Signed-off-by: Heming Zhao <heming.zhao@suse.com>
---
 lib/commands/toolcontext.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/lib/commands/toolcontext.c b/lib/commands/toolcontext.c
index b295a20efe52..742bdd9c2311 100644
--- a/lib/commands/toolcontext.c
+++ b/lib/commands/toolcontext.c
@@ -966,8 +966,13 @@ static void _destroy_config(struct cmd_context *cmd)
 	/* CONFIG_FILE/CONFIG_MERGED_FILES */
 	if ((cft = remove_config_tree_by_source(cmd, CONFIG_MERGED_FILES)))
 		config_destroy(cft);
-	else if ((cft = remove_config_tree_by_source(cmd, CONFIG_FILE)))
+	else if ((cft = remove_config_tree_by_source(cmd, CONFIG_FILE))) {
+		dm_list_iterate_items(cfl, &cmd->config_files) {
+			if (cfl->cft == cft)
+				dm_list_del(&cfl->list);
+		}
 		config_destroy(cft);
+	}
 
 	dm_list_iterate_items(cfl, &cmd->config_files)
 		config_destroy(cfl->cft);
-- 
1.8.3.1


_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

