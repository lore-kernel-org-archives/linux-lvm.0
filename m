Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.29])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 46CF7708F4
	for <linux-lvm@redhat.com>; Wed,  3 Jan 2018 21:18:09 +0000 (UTC)
Received: from mail-pf0-f177.google.com (mail-pf0-f177.google.com
	[209.85.192.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A77C22DB711
	for <linux-lvm@redhat.com>; Wed,  3 Jan 2018 21:18:08 +0000 (UTC)
Received: by mail-pf0-f177.google.com with SMTP id y89so1255844pfk.0
	for <linux-lvm@redhat.com>; Wed, 03 Jan 2018 13:18:08 -0800 (PST)
Received: from hurricane.ee.washington.edu
	(D-108-179-184-189.dhcp4.washington.edu. [108.179.184.189])
	by smtp.gmail.com with ESMTPSA id
	o88sm4225537pfj.175.2018.01.03.13.18.06 for <linux-lvm@redhat.com>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 03 Jan 2018 13:18:06 -0800 (PST)
From: Gordon Messmer <gordon.messmer@gmail.com>
References: <12562310-b26a-8a83-9481-d8b54fda40d5@gmail.com>
	<e70ef50c-08ed-b75b-df30-8eae007fa556@redhat.com>
	<cdefc95e-38bc-d071-c592-838991d488f2@gmail.com>
	<d5495aca-c9db-099a-13f2-f602df311a7f@redhat.com>
	<20180102184334.GA22713@agk-dp.fab.redhat.com>
	<116c5469-6f65-b750-d207-2f1e09f9fe8f@gmail.com>
Message-ID: <d1eaa3a6-ca8b-c14a-e83c-5bca40dc62d5@gmail.com>
Date: Wed, 3 Jan 2018 13:18:05 -0800
MIME-Version: 1.0
In-Reply-To: <116c5469-6f65-b750-d207-2f1e09f9fe8f@gmail.com>
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Subject: Re: [linux-lvm] unable to exclude LVs using global_filter
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

On 01/02/2018 11:16 AM, Gordon Messmer wrote:
> I'll send a patch later which might be more clear.


Submitted for consideration:


diff --git a/conf/example.conf.in b/conf/example.conf.in
index aab274d74..2aed631e5 100644
--- a/conf/example.conf.in
+++ b/conf/example.conf.in
@@ -114,16 +114,20 @@ devices {
         # device path names. Each regex is delimited by a vertical bar '|'
         # (or any character) and is preceded by 'a' to accept the path, or
         # by 'r' to reject the path. The first regex in the list to 
match the
-       # path is used, producing the 'a' or 'r' result for the device.
-       # When multiple path names exist for a block device, if any path 
name
-       # matches an 'a' pattern before an 'r' pattern, then the device is
-       # accepted. If all the path names match an 'r' pattern first, 
then the
-       # device is rejected. Unmatching path names do not affect the accept
-       # or reject decision. If no path names for a device match a pattern,
-       # then the device is accepted. Be careful mixing 'a' and 'r' 
patterns,
-       # as the combination might produce unexpected results (test 
changes.)
-       # Run vgscan after changing the filter to regenerate the cache.
-       # See the use_lvmetad comment for a special case regarding filters.
+       # path is used, producing the 'a' or 'r' result for the path.
+       #
+       # Typically, multiple paths will exist for a block device.  If 
any path
+       # to a block device is accepted by the filter list, the block device
+       # will be processed.  If no path is accepted, and at least one is
+       # rejected, the block device will not be processed.  If no path 
matches
+       # any entry in the filter list, the block device will be processed.
+       #
+       # Be careful mixing 'a' and 'r' patterns, as the combination might
+       # produce unexpected results (test changes.)  It may be best to 
use only
+       # 'r' patterns if your goal is to prevent processing specific block
+       # devices.  Run vgscan after changing the filter to regenerate the
+       # cache.  See the use_lvmetad comment for a special case regarding
+       # filters.
         #
         # Example
         # Accept every block device:
