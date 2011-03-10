Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id p2A7a7it011624
	for <linux-lvm@redhat.com>; Thu, 10 Mar 2011 02:36:07 -0500
MIME-Version: 1.0
From: daravuth lay <daravuth.lay@gmail.com>
Date: Thu, 10 Mar 2011 08:35:36 +0100
Message-ID: <AANLkTinMP-PjA-1Hnq51GqsJD6u8r7VqFG-t3ntH8OR0@mail.gmail.com>
Content-Type: multipart/alternative; boundary=00504502d78a5a81ca049e1be518
Subject: [linux-lvm] error type in your lvreduce page
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
To: Linux-LVM@sistina.com

--00504502d78a5a81ca049e1be518
Content-Type: text/plain; charset=ISO-8859-1

Hello

at: http://pwet.fr/man/linux/administration_systeme/lvm_10/lvreduce

"You should therefore ensure that the (eg) filesystem on the volume is
resized running lvreduce so that the extents that are to be removed are not
in use."




I think should be:

"You should therefore ensure that the (eg) filesystem on the volume is
resized BEFORE running lvreduce so that the extents that are to be removed
are not in use."

Regards
Daravuth

--00504502d78a5a81ca049e1be518
Content-Type: text/html; charset=ISO-8859-1

Hello<br><br>at: <a href="http://pwet.fr/man/linux/administration_systeme/lvm_10/lvreduce">http://pwet.fr/man/linux/administration_systeme/lvm_10/lvreduce</a><br><br>&quot;You should therefore ensure that the (eg) filesystem on the volume is 
resized
running lvreduce so that the extents that are to be removed are not in use.&quot;<br><br><br><br><br>I think should be:<br><br>&quot;You should therefore ensure that the (eg) filesystem on the volume is 
resized
BEFORE running lvreduce so that the extents that are to be removed are not in use.&quot;<br><br>Regards<br>Daravuth<br>
<br>

--00504502d78a5a81ca049e1be518--
