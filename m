Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k5NFDguJ014290
	for <linux-lvm@redhat.com>; Fri, 23 Jun 2006 11:13:42 -0400
Received: from ug-out-1314.google.com (ug-out-1314.google.com [66.249.92.174])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k5NFDOjw019431
	for <linux-lvm@redhat.com>; Fri, 23 Jun 2006 11:13:35 -0400
Received: by ug-out-1314.google.com with SMTP id o2so1137913uge
	for <linux-lvm@redhat.com>; Fri, 23 Jun 2006 08:13:35 -0700 (PDT)
Message-ID: <2908808b0606230813q748e8932n2f124916a7aa1b9b@mail.gmail.com>
Date: Fri, 23 Jun 2006 17:13:34 +0200
From: "Romain Cherchi" <romain.cherchi@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_7939_28960314.1151075614683"
Subject: [linux-lvm] lvcreate and lvremove issues
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@redhat.com

------=_Part_7939_28960314.1151075614683
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi,

I tryied to create a new logical volume using the following command:

lvcreate --size 128m --name LogVoltest VolGroup00

... I got the following error:

  device-mapper: table ioctl failed: Invalid argument
  Failed to activate new LV.

However, when I enter lvscan I can see the logical volume:
  ACTIVE            '/dev/VolGroup00/LogVoltest' [128.00 MB] inherit

I can remove it neither: lvremove /dev/VolGroup00/LogVoltest
Do you really want to remove active logical volume "LogVoltest"? [y/n]: y
  device-mapper: deps ioctl failed: Invalid argument
  _deps: task run failed for (253:9)
  Failed to add device (253:9) to dtree
  Unable to deactivate logical volume "LogVoltest"

I someone familiar with this problem?

Thanks :)

-- 
Romain CHERCHI

------=_Part_7939_28960314.1151075614683
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi,<br>
<br>
I tryied to create a new logical volume using the following command:<br>
<br>
<span style="font-style: italic;">lvcreate --size 128m --name LogVoltest VolGroup00</span><br>
<br>
... I got the following error:<br>
<br style="font-style: italic;">
<span style="font-style: italic;">&nbsp; device-mapper: table ioctl failed: Invalid argument</span><br style="font-style: italic;">
<span style="font-style: italic;">&nbsp; Failed to activate new LV.</span><br>
<br>
However, when I enter <span style="font-style: italic;">lvscan</span> I can see the logical volume:<br>
<span style="font-style: italic;">&nbsp; ACTIVE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; '/dev/VolGroup00/LogVoltest' [128.00 MB] inherit</span><br>
<br>
I can remove it neither: <span style="font-style: italic;">lvremove /dev/VolGroup00/LogVoltest</span><br style="font-style: italic;">
<span style="font-style: italic;">Do you really want to remove active logical volume &quot;LogVoltest&quot;? [y/n]: y</span><br style="font-style: italic;">
<span style="font-style: italic;">&nbsp; device-mapper: deps ioctl failed: Invalid argument</span><br style="font-style: italic;">
<span style="font-style: italic;">&nbsp; _deps: task run failed for (253:9)</span><br style="font-style: italic;">
<span style="font-style: italic;">&nbsp; Failed to add device (253:9) to dtree</span><br style="font-style: italic;">
<span style="font-style: italic;">&nbsp; Unable to deactivate logical volume &quot;LogVoltest&quot;</span><br>
<br>
I someone familiar with this problem?<br>
<br>
Thanks :)<br>
<br>-- <br>Romain CHERCHI

------=_Part_7939_28960314.1151075614683--
