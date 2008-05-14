Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m4EAZ80u026367
	for <linux-lvm@redhat.com>; Wed, 14 May 2008 06:35:08 -0400
Received: from wa-out-1112.google.com (wa-out-1112.google.com [209.85.146.183])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m4EAYvuk016145
	for <linux-lvm@redhat.com>; Wed, 14 May 2008 06:34:57 -0400
Received: by wa-out-1112.google.com with SMTP id j32so4327531waf.7
	for <linux-lvm@redhat.com>; Wed, 14 May 2008 03:34:57 -0700 (PDT)
Message-ID: <55c04c360805140334j34b6f67dy7409d656f68ebbb9@mail.gmail.com>
Date: Wed, 14 May 2008 12:34:51 +0200
From: "Jorge Souto" <jorgeother@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_10777_17007534.1210761291185"
Subject: [linux-lvm] disk striping
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

------=_Part_10777_17007534.1210761291185
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello,

I use lvm in a mainframe environment, with small ECKD disks (maximum model
54, aprox. 45 GB). So to create a big volume a I need a lot of disks. I'm
going to create one with 35 physical volumes. I have doubts about striping,
particularly deciding the number of stripes in such case (35 PVs in one
storage array rank -yeah, not good-), and the drawbacks in administration
tasks ( growing and limitations adding pvs to a stripped volume).


The use of striping is recommended because of performance improvement:

http://www-128.ibm.com/developerworks/linux/linux390/perf/tuning_rec_dasd_volMan.html


Thanks for your suggestions

------=_Part_10777_17007534.1210761291185
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

<div>Hello,</div>
<div>&nbsp;</div>
<div>I use lvm in a mainframe environment, with small ECKD disks (maximum model 54, aprox. 45 GB). So to create a big volume a I need a lot of disks. I&#39;m going to create one with 35 physical volumes. I have doubts about striping, particularly deciding the number of stripes in such case (35 PVs in one storage array rank -yeah, not good-), and the drawbacks in administration tasks ( growing and limitations adding&nbsp;pvs to a stripped volume).</div>

<div>&nbsp;</div>
<div>&nbsp;</div>
<div>The use of striping is recommended because of performance improvement:</div>
<div>&nbsp;</div>
<div><a href="http://www-128.ibm.com/developerworks/linux/linux390/perf/tuning_rec_dasd_volMan.html">http://www-128.ibm.com/developerworks/linux/linux390/perf/tuning_rec_dasd_volMan.html</a></div>
<div>&nbsp;</div>
<div>&nbsp;</div>
<div>Thanks for your suggestions</div>

------=_Part_10777_17007534.1210761291185--
