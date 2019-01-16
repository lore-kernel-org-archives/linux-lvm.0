Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.32])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1D7E25C228
	for <linux-lvm@redhat.com>; Wed, 16 Jan 2019 19:27:35 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
	[209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 53D8FC07457B
	for <linux-lvm@redhat.com>; Wed, 16 Jan 2019 19:27:34 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id v1-v6so6484094ljd.0
	for <linux-lvm@redhat.com>; Wed, 16 Jan 2019 11:27:34 -0800 (PST)
Received: from [192.168.117.100] (128-206-55-95.baltnet.ru. [95.55.206.128])
	by smtp.gmail.com with ESMTPSA id
	l3-v6sm1174916ljg.21.2019.01.16.11.27.31 for <linux-lvm@redhat.com>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 16 Jan 2019 11:27:31 -0800 (PST)
From: Eugene Vikhman <ujin981@gmail.com>
Message-ID: <0ed153aa-b699-4cbe-35a0-b112b8867a26@gmail.com>
Date: Wed, 16 Jan 2019 21:27:30 +0200
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="------------780887676E6D0A917CE3A3FD"
Content-Language: en-US
Subject: [linux-lvm] lvmcache and bare mdadm arrays
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
To: linux-lvm@redhat.com

This is a multi-part message in MIME format.
--------------780887676E6D0A917CE3A3FD
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi.

I spent the last couple of days trying to set up a new server with 16 
sas drives for the main storage and 2 SSDs for caching it using lvmcache.

First I used mdadm to create raid10 on HDDs and raid1 on SSDs. Then I 
followed the steps from the lvmcache manpage and the lvcreate/lvconvert 
manpages to create the cache and the metadata LVs and convert them to a 
cache-pool. It went fine, "lvs -a" showed a normal cache-pool device. 
But the last step failed with an ambiguous error when I used lvconvert 
--type cache --cachepool vg/cache vg/slow. I tried playing with 
parameters and made sure that the error had nothing to do with them. For 
an unidentified reason ioctl failed saying it could not lock the device 
vg/slow.

Today I tried setting up the raids with lvm itself and it all worked 
like a charm.

So my thought is maybe manpages should actually mention something about 
it and say "don't try setting up caching on a bare mdadm raid - it won't 
work".



--------------780887676E6D0A917CE3A3FD
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p><font face="Noto Sans">Hi.</font></p>
    <p><font face="Noto Sans">I spent the last couple of days trying to
        set up a new server with 16 sas drives for the main storage and
        2 SSDs for caching it using lvmcache.</font></p>
    <p><font face="Noto Sans">First I used mdadm to create raid10 on
        HDDs and raid1 on SSDs. Then I followed the steps from the
        lvmcache manpage and the lvcreate/lvconvert manpages to create
        the cache and the metadata LVs and convert them to a cache-pool.
        It went fine, "lvs -a" showed a normal cache-pool device. But
        the last step failed with an ambiguous error when I used
        lvconvert --type cache --cachepool vg/cache vg/slow. I tried
        playing with parameters and made sure that the error had nothing
        to do with them. For an unidentified reason ioctl failed saying
        it could not lock the device vg/slow.</font></p>
    <p><font face="Noto Sans">Today I tried setting up the raids with
        lvm itself and it all worked like a charm.</font></p>
    <p><font face="Noto Sans">So my thought is maybe manpages should
        actually mention something about it and say "don't try setting
        up caching on a bare mdadm raid - it won't work".<br>
      </font></p>
    <p><font face="Noto Sans"><br>
      </font></p>
  </body>
</html>

--------------780887676E6D0A917CE3A3FD--
