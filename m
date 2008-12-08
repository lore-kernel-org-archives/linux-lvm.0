Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id mB88bFt0008178
	for <linux-lvm@redhat.com>; Mon, 8 Dec 2008 03:37:15 -0500
Received: from nf-out-0910.google.com (nf-out-0910.google.com [64.233.182.191])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id mB88b2Uc031400
	for <linux-lvm@redhat.com>; Mon, 8 Dec 2008 03:37:03 -0500
Received: by nf-out-0910.google.com with SMTP id d3so481342nfc.21
	for <linux-lvm@redhat.com>; Mon, 08 Dec 2008 00:37:02 -0800 (PST)
Message-ID: <d66ef690812080037k5d99dbcdm1ce11ab32744efff@mail.gmail.com>
Date: Mon, 8 Dec 2008 16:37:02 +0800
From: "wu jessinay" <jessinay@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_42812_2059893.1228725422301"
Subject: [linux-lvm] system-config-lvm bug with using lv as swap space
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

------=_Part_42812_2059893.1228725422301
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

 Hi,all
I have encountered several bugs of system-config-lvm.
The first one is if there is a logical volume entry in /etc/fstab
and another raw device entry for swap
such as
/dev/my_vg1/my_lv1   swap  swap  defaults 0 0
/dev/hda1       swap    swap   defaults   0  0

then if we use system-config-lvm to remove my_lv1,
Not only the my_lv1 entry,but all other swap entries in /etc/fstab will get
removed.

After some investigation on the system-config-lvm python source file.
It seems that the problem is in the InputController.py file.
When we click the remove button,the program will check if there is any
entry of the removed logical volume in /etc/fstab.
If any entry exist in /etc/fstab, it will remove this line from /etc/fstab
so that when the system reboot it won't mount this logical volume(since it
has been removed).

This procedure is OK.However,the program will delete the corresponding entry
in the following way:
1.check what is the mount point of this logical volume.(in our case it is
swap)
2.search /etc/fstab file,delete all the entries with the same mount
point.This won't result in any trouble if the logical volume is mounted on
/mnt/mylv1 .but if the mount point is swap ,it will delete all swap entries
in /etc/fstab file.

I have created a patch to solve this problem,which modify the removing
procedure if the mount point is swap.

There is several other bugs with system-config-lvm but the root cause should
be the same.

this problem exist in enterprise linux 5 and enterprise linux 5 U1.
Is this a fixed bug?Any advice is appreciated!

Thanks

------=_Part_42812_2059893.1228725422301
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

<div id="mb_0">
<div>Hi,all</div>
<div>I have encountered several bugs of system-config-lvm.</div>
<div>The first one is if&nbsp;there is&nbsp;a logical volume entry in /etc/fstab</div>
<div>and another raw device entry for swap</div>
<div>such as</div>
<div>/dev/my_vg1/my_lv1&nbsp;&nbsp; swap&nbsp; swap&nbsp; defaults 0 0</div>
<div>/dev/hda1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; swap&nbsp;&nbsp;&nbsp; swap&nbsp;&nbsp; defaults&nbsp;&nbsp; 0&nbsp; 0</div>
<div>&nbsp;</div>
<div>then if we use system-config-lvm to remove my_lv1,</div>
<div>Not only the my_lv1 entry,but all other&nbsp;swap entries in /etc/fstab will get removed.</div>
<div>&nbsp;</div>
<div>After some investigation on the system-config-lvm python source file.</div>
<div>It seems that the problem is in the InputController.py file.</div>
<div>When we click the remove button,the program will check if there is any entry&nbsp;of the removed logical volume&nbsp;in /etc/fstab.</div>
<div>If any entry exist in /etc/fstab, it will remove this line from /etc/fstab so that when the system reboot it won&#39;t mount this logical volume(since it has been removed).</div>
<div>&nbsp;</div>
<div>This procedure is OK.However,the program will delete the corresponding entry in the following way:</div>
<div>1.check what is the mount point of this logical volume.(in our case it is swap)</div>
<div>2.search /etc/fstab file,delete all the entries with the same mount point.This won&#39;t result in any trouble if the logical volume is mounted on /mnt/mylv1 .but if the mount point is swap ,it will delete all swap entries in /etc/fstab file.</div>

<div>&nbsp;</div>
<div>I have created a patch to solve this problem,which modify the removing procedure if the mount point is swap.</div>
<div>&nbsp;</div>
<div>There is several other bugs with system-config-lvm but the root cause should be the same.</div>
<div>&nbsp;</div>
<div>this problem exist in enterprise linux 5 and enterprise linux 5 U1.&nbsp;</div>
<div>Is this a fixed bug?Any advice is appreciated!</div>
<div>&nbsp;</div>
<div>Thanks</div></div>

------=_Part_42812_2059893.1228725422301--
