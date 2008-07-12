Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m6CNMWWx031790
	for <linux-lvm@redhat.com>; Sat, 12 Jul 2008 19:22:32 -0400
Received: from yw-out-2324.google.com (yw-out-2324.google.com [74.125.46.30])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m6CNLdvE014658
	for <linux-lvm@redhat.com>; Sat, 12 Jul 2008 19:21:39 -0400
Received: by yw-out-2324.google.com with SMTP id 5so1876275ywb.81
	for <linux-lvm@redhat.com>; Sat, 12 Jul 2008 16:21:35 -0700 (PDT)
Message-ID: <e3fe12630807121621m30ff681cxe0614750a5872007@mail.gmail.com>
Date: Sun, 13 Jul 2008 00:21:35 +0100
From: "Edgar Costa" <dane@netcabo.pt>
Sender: daneone@gmail.com
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_39798_17521143.1215904895274"
Subject: [linux-lvm] lvm unstriping
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

------=_Part_39798_17521143.1215904895274
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

at first i striped my partitions by 3 disks but then there was a need to
remove one so i make pvmove, now what happens is that now i lose performance
because the disk his always jumping from where it reads/writes
for example onde de / (not in lvm) with hdparm i get 232 / 50 mb/s and in a
lvm partition 193 / 5.8

so i need to unstrip the logical volumes

but the question is: how?

there is any reshaper? or something like that?
i already found out that pvmove can move only a PE at a time but this will
be very lame, I would have to make a script to make my efficient again, and
it's a easy way to get it worse...(if i get something wrong)

------=_Part_39798_17521143.1215904895274
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

<span class="postbody">at first i striped my partitions by 3 disks but
then there was a need to remove one so i make pvmove, now what happens
is that now i lose performance because the disk his always jumping from
where it reads/writes <br>
for example onde de / (not in lvm) with hdparm i get 232 / 50 mb/s and  in a lvm partition 193 / 5.8
<br>

<br>
so i need to unstrip the logical volumes
<br>

<br>
but the question is: how?<br><br>there is any reshaper? or something like that? <br>i already found out that pvmove can move only a PE at a time but this will be very lame, I would have to make a script to make my efficient again, and it&#39;s a easy way to get it worse...(if i get something wrong)<br>
</span>

------=_Part_39798_17521143.1215904895274--
