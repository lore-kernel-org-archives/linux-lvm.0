Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D3E6C433F5
	for <linux-lvm@archiver.kernel.org>; Fri, 20 May 2022 07:02:26 +0000 (UTC)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-632-gtuekzA3Nt29VT9bqEMxCA-1; Fri, 20 May 2022 03:02:21 -0400
X-MC-Unique: gtuekzA3Nt29VT9bqEMxCA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B33BD3C0218C;
	Fri, 20 May 2022 07:02:19 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E76781121319;
	Fri, 20 May 2022 07:02:12 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id AB47F19451EF;
	Fri, 20 May 2022 07:02:12 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 731061947B84
 for <linux-lvm@listman.corp.redhat.com>; Wed, 18 May 2022 11:06:12 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 3A19A492C3B; Wed, 18 May 2022 11:06:12 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 34734492CA2
 for <linux-lvm@redhat.com>; Wed, 18 May 2022 11:06:12 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 063F429DD9B0
 for <linux-lvm@redhat.com>; Wed, 18 May 2022 11:06:12 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-551-Ng3sUVIsNwKrimvU4VBQuA-1; Wed, 18 May 2022 07:06:08 -0400
X-MC-Unique: Ng3sUVIsNwKrimvU4VBQuA-1
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
 by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24IA0ij8004251
 for <linux-lvm@redhat.com>; Wed, 18 May 2022 10:36:00 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2171.outbound.protection.outlook.com [104.47.59.171])
 by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3g23d8kbpf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linux-lvm@redhat.com>; Wed, 18 May 2022 10:35:59 +0000
Received: from CO1PR11MB5009.namprd11.prod.outlook.com (2603:10b6:303:9e::11)
 by DM6PR11MB3002.namprd11.prod.outlook.com (2603:10b6:5:6d::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.18; Wed, 18 May
 2022 10:35:57 +0000
Received: from CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::f538:5980:ef0d:b634]) by CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::f538:5980:ef0d:b634%6]) with mapi id 15.20.5273.014; Wed, 18 May 2022
 10:35:57 +0000
From: "Yu, Mingli" <Mingli.Yu@windriver.com>
To: "linux-lvm@redhat.com" <linux-lvm@redhat.com>
Thread-Topic: The lvm partiton size is not accurate
Thread-Index: AQHYaqDeiS7QyCjgJU2UzKNfCmu2NQ==
Date: Wed, 18 May 2022 10:35:57 +0000
Message-ID: <CO1PR11MB5009B1F51212981FB8292E99F1D19@CO1PR11MB5009.namprd11.prod.outlook.com>
Accept-Language: en-US, en-AS, zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 617036ba-425f-4323-e7a7-08da38ba318c
x-ms-traffictypediagnostic: DM6PR11MB3002:EE_
x-microsoft-antispam-prvs: <DM6PR11MB3002E29CFFAEEC897746ACE3F1D19@DM6PR11MB3002.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0
x-microsoft-antispam-message-info: OtN004O4dvZtUEctF0fixWwI/vrIt1MwWJmp25ULS8TNxD/rGypcH9UrI+y2Iez90iBUJysaGl7LEcIPy68oYPtt+XoD05H/0Ih/n044zdChcgPnL/sbFmdGQmrWw0qKFPoKxMI+6yaYElgTOTN+AxBx4KCR713wRouv6cF78wDTf5cVdQcoXbUwlesGdsqSJsmNbFyOHcQ4Az0amfgdkirdQYhsPfXSln2m9BL+0bHxbvje3W6/kZQn8Y7kvY4Y3yH8EZ88/TgBbge9gr1na+ZIleAYSOnL21kPts+bjzMNElWbNx/+ITmIR8sjUKQ4CP4Nf2XgEjIEE6zivAWHPfsLx+ViKSQUCBGO9WHJt8dJT1GUEeJvWpaIq1HYrf58jixRK9r7PBClrCLMQSlYwEay5BRHOvx4a9MiYtCnXheswlHaLBOrZ57V/SjdE9ppLeJGewznETMda5vbF/KJWOSOyAdAvAHTDuPU5QMp44ujPRy/JkxLIW+cL2NIGWRJzvY8rPS12622SdmIuuoAMbp+FryZXdP8Ns/F9EvtOwkamVFzzfBK4ePMAAd30k/IR7TSO51G5Mohlqmbtowf4Raaj3nXQisLTLbLRFaHLZXS01gJEJmoE+5f5rz0F0TX/YbnF9M4vpnv+DBLGyqUlRrLcdkSaz4/P8tSmfxm5tHN/RIf+fqyEioJ4c34Mjhr2lw9YHh1tqx/fzN8RkjT+g==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5009.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(66556008)(6916009)(33656002)(83380400001)(316002)(7696005)(26005)(66946007)(55016003)(86362001)(8676002)(6506007)(71200400001)(91956017)(38100700002)(5660300002)(52536014)(8936002)(186003)(19627405001)(38070700005)(9686003)(66446008)(64756008)(66476007)(2906002)(508600001)(76116006)(122000001);
 DIR:OUT; SFP:1101
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?/UU8SKs4x2OFoTD1mR8mGXzOg2jtkeUXzQghd65AL2lBl+7GhlmVYG/yPm?=
 =?iso-8859-1?Q?3EqQiCX2w+S0kU6gllN/CkIPWpizIpVKnsZOqIaMq4qXsXvt81hPL+ztPL?=
 =?iso-8859-1?Q?xGgeCUpp8l9o0gL1pEoguctn2zM1k/NdP7SDTWZAkmgvmf5RD9pGezMR8w?=
 =?iso-8859-1?Q?jnH1hgvaBlo0+hrqRzAhABtQAe1lOyBO3U9zDAdIthv7j6C9G9Pk+4J7zl?=
 =?iso-8859-1?Q?1KkEKUp9ZQHggBrTP8ysrVlvcE1a4XjAxE46o6oVWwdfsn8rmszrbYaQFo?=
 =?iso-8859-1?Q?bHDBxLgC7DiUBP33FJbRkFxNn4z82bcBOSWTDKuhGgVReODsbeQllNTYTt?=
 =?iso-8859-1?Q?cUg+DQKeRjbedVPa4vjtMyEu31zNTnzzN6fRsGTQyQHFtNKkffhuaT8jB8?=
 =?iso-8859-1?Q?MP2soGIIHqDVpHKF1hW8mfmX5Ujbe7GBBoqr2KRf/iMvIgeCNoa4EmNEwh?=
 =?iso-8859-1?Q?sRNjrMg+YQDQMc5c5wKonbGKcTVLOqN8QOscBb1gvwGBwgQfnyPwmpzuVt?=
 =?iso-8859-1?Q?1B9TdvnmrPtLVeYxoccnijjPsoJ8WGVoTk3FW7DY95xVC0DQ5QDEKupAcd?=
 =?iso-8859-1?Q?zTsvoJ66BwZZJXxZ6Gm3Mbs7sQMSC2AJlF9V+a7ULiRlKSi3euZ2WEQUJ4?=
 =?iso-8859-1?Q?gmtZlNUUVHMEtGu+r1qtBW3CsJu0d9aXIQWRutqoTSk7hZBlAqoaeBxUB4?=
 =?iso-8859-1?Q?B2+7Ev/D3VnpNv11Lf2bQRqvvrCm2xXR9HtFCcCdhAYDM9v1hgIo68Vc4I?=
 =?iso-8859-1?Q?Er4XIKs/SX1IYOc33HwzfBx4aqmjlPBunDBj6i0Ix9yS36Gra2Jh+kVzaV?=
 =?iso-8859-1?Q?mfV1OtYm/mQMntlqyoyOGTYKT/bicva3VZ9shH2E43+XF+gBOw5qYg5RCy?=
 =?iso-8859-1?Q?1eyI1vsIo/nZNFeHAJeqeiLf9ViO0IYhGXNFvQwqydM/McTABvAKto5ews?=
 =?iso-8859-1?Q?xx/FQ6CulOpiaowQIhuN6wPqroPomlzENvNsayK8/A6wPKa8+9I4IT694m?=
 =?iso-8859-1?Q?Ay3oWa/Idf9tPI/QdzHzrSZO8n8c/yCeK8pjh1mFPoXUpM2IgYnfLOK4ZN?=
 =?iso-8859-1?Q?Z9hy1R10jfUgsIZEH2B0voLxsDMtDfeI3EfqwXpe/4mvZtt5W8eRIOBA1G?=
 =?iso-8859-1?Q?lRznczdIzrFBFpyeSY+eHOIQA4pN9mCl/8tXn3pGujWeSOntKZ1M/z+qqW?=
 =?iso-8859-1?Q?xl38m8dW+LXsnNH1SMG6+8Tl7Z4yj1kLBbMZVPzVRiYTjbrRrI/FYIv/rI?=
 =?iso-8859-1?Q?bpKLNJPnQFkbTH2U12asZQ3PxIwkjKQiot3cScWkUScuy9O+6zIU0cTTeO?=
 =?iso-8859-1?Q?p22gQrRYCZoET9att864MdfUpNnBZaAfiU6sMgP3c/uUfGOPoJXTYTotga?=
 =?iso-8859-1?Q?1l/4169gSaRTui3SmA5X7JNsEZp703AdN5pGxKU2e89oQEHqtQWuc0KFX6?=
 =?iso-8859-1?Q?c35ljO4NxI0whIlov4tabtVHqR8090KbbK6yc3Y3fQ19hkVB705KRGtOSv?=
 =?iso-8859-1?Q?unafu/rmRsH52H/Go7jOIHsoPvliOa/JKPPQ2JwsTAdM24nawqLtwmCS72?=
 =?iso-8859-1?Q?LLTjUIFdb+GBrNT/71wGUHWIK1VGHEpGZr5aCodjk9SD8KcCr9VAJ1snG9?=
 =?iso-8859-1?Q?wYom4THwbppDh34trKy4P+HIqDjG0hWz0COmvv3LzMKjDqP3FQkkJ3n5Fz?=
 =?iso-8859-1?Q?Tz4MMr+5iUATDAJqZSjt67Q4ll4JFTbF3CFBPj0G5XZa7n+AnVnmKcknE/?=
 =?iso-8859-1?Q?QNh7lE8bhC9ccQdGIFYHSsD+O2cGdlO/uu9ZZGmT6ApvceXsWlJqChaz2i?=
 =?iso-8859-1?Q?F56JdlqbSg=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5009.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 617036ba-425f-4323-e7a7-08da38ba318c
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 May 2022 10:35:57.2580 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KciHmAxgJZBaa142RQGJqk7CKYKOUaJbYWLi1KqB10Pb83Nw7fkUBhacU4OsQEsa1V8mu8m3VmTQeE1gJ+zetQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3002
X-Proofpoint-GUID: S5kQOVzRmp7r1uTe-bxaABWXik6lrhsG
X-Proofpoint-ORIG-GUID: S5kQOVzRmp7r1uTe-bxaABWXik6lrhsG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-18_03,2022-05-17_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 suspectscore=0 mlxscore=0 clxscore=1011
 mlxlogscore=713 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2205180059
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
X-Mailman-Approved-At: Fri, 20 May 2022 07:02:11 +0000
Subject: [linux-lvm] The lvm partiton size is not accurate
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
Errors-To: linux-lvm-bounces@redhat.com
Sender: "linux-lvm" <linux-lvm-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: multipart/mixed; boundary="===============0386182898771641611=="

--===============0386182898771641611==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_CO1PR11MB5009B1F51212981FB8292E99F1D19CO1PR11MB5009namp_"

--_000_CO1PR11MB5009B1F51212981FB8292E99F1D19CO1PR11MB5009namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi Experts,

When use lvcreate to claim 72M partition, but it turns out to be 69M, more =
details as below, any hints?


root@intel-x86-64:~# tmp_dir=3D`mktemp -d /tmp/XXXXXX`
root@intel-x86-64:~# dd if=3D/dev/zero of=3D${tmp_dir}/p0 bs=3D1M count=3D1=
00
100+0 records in
100+0 records out
104857600 bytes (105 MB, 100 MiB) copied, 2.75714 s, 38.0 MB/s
root@intel-x86-64:~# losetup /dev/loop0 ${tmp_dir}/p0
loop0: detected capacity change from 0 to 204800
root@intel-x86-64:~# vgcreate vg_test1 /dev/loop0
  Physical volume "/dev/loop0" successfully created.
  Volume group "vg_test1" successfully created
root@intel-x86-64:~# lvcreate -L 72 -n lv_test1 vg_test1
blk_update_request: operation not supported error, dev loop0, sector 2048 o=
p 0x9:(WRITE_ZEROES) flags 0x800800 phys_seg 00
  Logical volume "lv_test1" created.
root@intel-x86-64:~# lvscan
  ACTIVE            '/dev/vg_test1/lv_test1' [72.00 MiB] inherit
root@intel-x86-64:~# mke2fs -I 128 /dev/vg_test1/lv_test1
mke2fs 1.46.5 (30-Dec-2021)
128-byte inodes cannot handle dates beyond 2038 and are deprecated
Discarding device blocks: done
Creating filesystem with 73728 1k blocks and 18432 inodes
Filesystem UUID: 0308c2e2-6f97-4472-9fb9-0d20ae0851b6
Superblock backups stored on blocks:
8193, 24577, 40961, 57345

Allocating group tables: done
blk_update_request: operation not supported error, dev loop0, sector 149376=
 op 0x9:(WRITE_ZEROES) flags 0x800800 phys_seg0
Writing inode tables: blk_update_request: operation not supported error, de=
v loop0, sector 2570 op 0x9:(WRITE_ZEROES) fla0
blk_update_request: operation not supported error, dev loop0, sector 18954 =
op 0x9:(WRITE_ZEROES) flags 0x800800 phys_seg 0
blk_update_request: operation not supported error, dev loop0, sector 34822 =
op 0x9:(WRITE_ZEROES) flags 0x800800 phys_seg 0
blk_update_request: operation not supported error, dev loop0, sector 51722 =
op 0x9:(WRITE_ZEROES) flags 0x800800 phys_seg 0
blk_update_request: operation not supported error, dev loop0, sector 67590 =
op 0x9:(WRITE_ZEROES) flags 0x800800 phys_seg 0
blk_update_request: operation not supported error, dev loop0, sector 84490 =
op 0x9:(WRITE_ZEROES) flags 0x800800 phys_seg 0
blk_update_request: operation not supported error, dev loop0, sector 100358=
 op 0x9:(WRITE_ZEROES) flags 0x800800 phys_seg0
blk_update_request: operation not supported error, dev loop0, sector 117258=
 op 0x9:(WRITE_ZEROES) flags 0x800800 phys_seg0
blk_update_request: operation not supported error, dev loop0, sector 133126=
 op 0x9:(WRITE_ZEROES) flags 0x800800 phys_seg0
done
Writing superblocks and filesystem accounting information: done

root@intel-x86-64:~# mkdir -p ${tmp_dir}/lv1
root@intel-x86-64:~# mount /dev/vg_test1/lv_test1 ${tmp_dir}/lv1
EXT4-fs (dm-0): mounting ext2 file system using the ext4 subsystem
EXT4-fs (dm-0): mounted filesystem without journal. Opts: (null). Quota mod=
e: none.
ext2 filesystem being mounted at /tmp/inBS27/lv1 supports timestamps until =
2038 (0x7fffffff)
root@intel-x86-64:~# df -h | grep ${tmp_dir}/lv1
/dev/mapper/vg_test1-lv_test1   69M   14K   65M   1% /tmp/inBS27/lv1
root@intel-x86-64:~#



--_000_CO1PR11MB5009B1F51212981FB8292E99F1D19CO1PR11MB5009namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
Hi Experts,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
When use lvcreate to claim 72M partition, but it turns out to be 69M, more =
details as below, any hints?</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
root@intel-x86-64:~# tmp_dir=3D`mktemp -d /tmp/XXXXXX`
<div>root@intel-x86-64:~# dd if=3D/dev/zero of=3D${tmp_dir}/p0 bs=3D1M coun=
t=3D100</div>
<div>100+0 records in</div>
<div>100+0 records out</div>
<div>104857600 bytes (105 MB, 100 MiB) copied, 2.75714 s, 38.0 MB/s</div>
<div>root@intel-x86-64:~# losetup /dev/loop0 ${tmp_dir}/p0</div>
<div>loop0: detected capacity change from 0 to 204800</div>
<div>root@intel-x86-64:~# vgcreate vg_test1 /dev/loop0</div>
<div>&nbsp; Physical volume &quot;/dev/loop0&quot; successfully created.</d=
iv>
<div>&nbsp; Volume group &quot;vg_test1&quot; successfully created</div>
<div>root@intel-x86-64:~# lvcreate -L 72 -n lv_test1 vg_test1</div>
<div>blk_update_request: operation not supported error, dev loop0, sector 2=
048 op 0x9:(WRITE_ZEROES) flags 0x800800 phys_seg 00</div>
<div>&nbsp; Logical volume &quot;lv_test1&quot; created.</div>
<div>root@intel-x86-64:~# lvscan</div>
<div>&nbsp; ACTIVE &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;'/dev/vg_test1/=
lv_test1' [72.00 MiB] inherit</div>
<div>root@intel-x86-64:~# mke2fs -I 128 /dev/vg_test1/lv_test1</div>
<div>mke2fs 1.46.5 (30-Dec-2021)</div>
<div>128-byte inodes cannot handle dates beyond 2038 and are deprecated</di=
v>
<div>Discarding device blocks: done &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</div>
<div>Creating filesystem with 73728 1k blocks and 18432 inodes</div>
<div>Filesystem UUID: 0308c2e2-6f97-4472-9fb9-0d20ae0851b6</div>
<div>Superblock backups stored on blocks: </div>
<div>8193, 24577, 40961, 57345</div>
<div><br>
</div>
<div>Allocating group tables: done &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</div>
<div>blk_update_request: operation not supported error, dev loop0, sector 1=
49376 op 0x9:(WRITE_ZEROES) flags 0x800800 phys_seg0</div>
<div>Writing inode tables: blk_update_request: operation not supported erro=
r, dev loop0, sector 2570 op 0x9:(WRITE_ZEROES) fla0</div>
<div>blk_update_request: operation not supported error, dev loop0, sector 1=
8954 op 0x9:(WRITE_ZEROES) flags 0x800800 phys_seg 0</div>
<div>blk_update_request: operation not supported error, dev loop0, sector 3=
4822 op 0x9:(WRITE_ZEROES) flags 0x800800 phys_seg 0</div>
<div>blk_update_request: operation not supported error, dev loop0, sector 5=
1722 op 0x9:(WRITE_ZEROES) flags 0x800800 phys_seg 0</div>
<div>blk_update_request: operation not supported error, dev loop0, sector 6=
7590 op 0x9:(WRITE_ZEROES) flags 0x800800 phys_seg 0</div>
<div>blk_update_request: operation not supported error, dev loop0, sector 8=
4490 op 0x9:(WRITE_ZEROES) flags 0x800800 phys_seg 0</div>
<div>blk_update_request: operation not supported error, dev loop0, sector 1=
00358 op 0x9:(WRITE_ZEROES) flags 0x800800 phys_seg0</div>
<div>blk_update_request: operation not supported error, dev loop0, sector 1=
17258 op 0x9:(WRITE_ZEROES) flags 0x800800 phys_seg0</div>
<div>blk_update_request: operation not supported error, dev loop0, sector 1=
33126 op 0x9:(WRITE_ZEROES) flags 0x800800 phys_seg0</div>
<div>done &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp;</div>
<div>Writing superblocks and filesystem accounting information: done</div>
<div><br>
</div>
<div>root@intel-x86-64:~# mkdir -p ${tmp_dir}/lv1</div>
<div>root@intel-x86-64:~# mount /dev/vg_test1/lv_test1 ${tmp_dir}/lv1</div>
<div>EXT4-fs (dm-0): mounting ext2 file system using the ext4 subsystem</di=
v>
<div>EXT4-fs (dm-0): mounted filesystem without journal. Opts: (null). Quot=
a mode: none.</div>
<div>ext2 filesystem being mounted at /tmp/inBS27/lv1 supports timestamps u=
ntil 2038 (0x7fffffff)</div>
<div>root@intel-x86-64:~# df -h | grep ${tmp_dir}/lv1</div>
<div>/dev/mapper/vg_test1-lv_test1 &nbsp; 69M &nbsp; 14K &nbsp; 65M &nbsp; =
1% /tmp/inBS27/lv1</div>
root@intel-x86-64:~#<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
</body>
</html>

--_000_CO1PR11MB5009B1F51212981FB8292E99F1D19CO1PR11MB5009namp_--

--===============0386182898771641611==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

--===============0386182898771641611==--

