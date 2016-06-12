Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.29])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u5C0b5sZ021245
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Sat, 11 Jun 2016 20:37:05 -0400
Received: from mail-pf0-f173.google.com (mail-pf0-f173.google.com
	[209.85.192.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BA7033BF557
	for <linux-lvm@redhat.com>; Sun, 12 Jun 2016 00:37:04 +0000 (UTC)
Received: by mail-pf0-f173.google.com with SMTP id c2so34428446pfa.2
	for <linux-lvm@redhat.com>; Sat, 11 Jun 2016 17:37:04 -0700 (PDT)
Received: from [192.168.1.2] ([121.99.178.58])
	by smtp.googlemail.com with ESMTPSA id
	p1sm27134991pfb.73.2016.06.11.17.37.02 for <linux-lvm@redhat.com>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 11 Jun 2016 17:37:03 -0700 (PDT)
From: sergei <sergei.franco@gmail.com>
Message-ID: <575CAE9A.1060001@gmail.com>
Date: Sun, 12 Jun 2016 12:36:42 +1200
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] LVM cache/dm-cache questions.
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com

Hi,

I have a few simple questions regarding relatively new feature LVM 
cache/dm-cache.

 From second hand information on internet, it appears that you cannot 
resize cached volume.
Please correct me if I am wrong: to resize a cached volume, one needs to 
lvremove the cache, resize and recreate the cache?

In scenario where cache device fails, how safe is the data on the cached 
LVM?

Is it possible to make snapshots of the cached device?

Before I test these things I will need to upgrade distribution (as the 
release I am on does not have the LVM cache), which means switching to 
systemd (I would rather avoid, if LVM cache does not fail gracefully).

Thank you very much!

Sergei.
