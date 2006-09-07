Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k87ICGFB000468
	for <linux-lvm@redhat.com>; Thu, 7 Sep 2006 14:12:16 -0400
Received: from wx-out-0506.google.com (wx-out-0506.google.com [66.249.82.236])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k87IBxXW007557
	for <linux-lvm@redhat.com>; Thu, 7 Sep 2006 14:11:59 -0400
Received: by wx-out-0506.google.com with SMTP id i30so465948wxd
	for <linux-lvm@redhat.com>; Thu, 07 Sep 2006 11:11:59 -0700 (PDT)
Message-ID: <fd8dc0d20609071111i47351769va64fb77fd54ce1d4@mail.gmail.com>
Date: Thu, 7 Sep 2006 14:11:58 -0400
From: "Boris Ostrovsky" <baostr@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_154448_7645313.1157652718983"
Subject: [linux-lvm] CLVM vs LVM
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

------=_Part_154448_7645313.1157652718983
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

(This was somewhat covered in another thread, but I am still not clear,
so I'll ask again)

I have a number of nodes that all have access to a set of LUNs. The
nodes are managed by a dedicated management workstation that can talk
to each node and ask it to execute LVM commands. The workstation will
assure that at any given moment only one node is modifying LVM
configuration (i.e.. creating/deleting/modifying/etc a PV, VG or LV)
and that only one node is mounting a filesystem that resides on a
particular LV.

My question is whether I need to have clvmd and, if yes, whether I
have to to provide some additional locking (and perhaps something
else). My very simple experiments without clvmd seem to suggest that I
may not need it, but of course the fact that the setup worked for me
in doesn't prove anything. (I did try using CMAN/GLM, but I would like
to avoid having to deal with another package, if possible.)

It is possible that I need to specify something in the configure script.
--with-cluster and --with-clvmd seem to be particularly relevant, but I
don't
really understand what the options are.

Any help will be greatly appreciated.


Thanks.
-boris

------=_Part_154448_7645313.1157652718983
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

(This was somewhat covered in another thread, but I am still not clear,<br>so I'll ask again)<br><br>I have a number of nodes that all have access to a set of LUNs. The<br>nodes are managed by a dedicated management workstation that can talk
<br>to each node and ask it to execute LVM commands. The workstation will<br>assure that at any given moment only one node is modifying LVM<br>configuration (i.e.. creating/deleting/modifying/etc a PV, VG or LV)<br>and that only one node is mounting a filesystem that resides on a
<br>particular LV.<br><br>My question is whether I need to have clvmd and, if yes, whether I<br>have to to provide some additional locking (and perhaps something<br>else). My very simple experiments without clvmd seem to suggest that I
<br>may not need it, but of course the fact that the setup worked for me<br>in doesn't prove anything. (I did try using CMAN/GLM, but I would like<br>to avoid having to deal with another package, if possible.)<br><br>It is possible that I need to specify something in the configure script.
<br>--with-cluster and --with-clvmd seem to be particularly relevant, but I don't<br>really understand what the options are.<br><br>Any help will be greatly appreciated.<br><br><br>Thanks.<br>-boris<br>

------=_Part_154448_7645313.1157652718983--
