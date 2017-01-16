Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.29])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id v0GJqj8q026064
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Mon, 16 Jan 2017 14:52:45 -0500
Received: from mail.cropusainsurance.com (67-60-77-244.cpe.cableone.net
	[67.60.77.244]) by mx1.redhat.com (Postfix) with ESMTP id 652213DFCC
	for <linux-lvm@redhat.com>; Mon, 16 Jan 2017 19:52:44 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.cropusainsurance.com (Postfix) with ESMTP id 9831648AB12
	for <linux-lvm@redhat.com>; Mon, 16 Jan 2017 11:46:21 -0800 (PST)
Received: from mail.cropusainsurance.com ([127.0.0.1])
	by localhost (mail.cropusainsurance.com [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id xt1YrYaCUn7Y for <linux-lvm@redhat.com>;
	Mon, 16 Jan 2017 11:46:20 -0800 (PST)
Received: from mail.cropusainsurance.com (mail.cropusainsurance.com
	[67.60.77.244])
	by mail.cropusainsurance.com (Postfix) with ESMTP id 347C248AB0A
	for <linux-lvm@redhat.com>; Mon, 16 Jan 2017 11:46:20 -0800 (PST)
Date: Mon, 16 Jan 2017 11:46:20 -0800 (PST)
From: Ken Goods <kgoods@cropusainsurance.com>
Message-ID: <31656092.220.1484595977477.JavaMail.kgoods@Ken-PC>
In-Reply-To: <11587299.215.1484595906899.JavaMail.kgoods@Ken-PC>
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_219_20429786.1484595977474"
Subject: [linux-lvm] multipath_component_detection
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
To: linux-lvm Mailing List <linux-lvm@redhat.com>

------=_Part_219_20429786.1484595977474
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Hi all, 
Just a quick question. I've been setting up a (iscsi) LUN and want to create an LVM PV on it. 

The docs I have read are somewhat conflicted. Some say that the underlying devices should be filtered, however according to comments in lvm.conf it says that if multipath_component_detection is enabled, "LVM2 will ignore devices used as component paths of device-mapper multipath devices". 

So filtering is no longer necessary with LVM2? 

I would just try it but this is a live email server and I'd like to keep the downtime to a minimum. 

Thanks in advance. 




Ken 


------=_Part_219_20429786.1484595977474
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head><style type='text/css'>p { margin: 0; }</style></head><body><div style='font-family: arial,helvetica,sans-serif; font-size: 10pt; color: #000000'>Hi all,<br>Just a quick question. I've been setting up a (iscsi) LUN and want to create an LVM PV on it.<br><br>The docs I have read are somewhat conflicted. Some say that the underlying devices should be filtered, however according to comments in lvm.conf it says that if multipath_component_detection is enabled, "LVM2 will ignore devices used as component paths of device-mapper multipath devices". <br><br>So filtering is no longer necessary with LVM2?<br><br>I would just try it but this is a live email server and I'd like to keep the downtime to a minimum.<br><br>Thanks in advance.<br><div><span name="x"></span><p><br></p>
<p>Ken <br></p><br></div></div></body></html>
------=_Part_219_20429786.1484595977474--
