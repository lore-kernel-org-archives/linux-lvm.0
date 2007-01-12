Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l0CIoXfR014187
	for <linux-lvm@redhat.com>; Fri, 12 Jan 2007 13:50:33 -0500
Received: from nf-out-0910.google.com (nf-out-0910.google.com [64.233.182.187])
	by mx2.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	l0CIoLBg032645
	for <linux-lvm@redhat.com>; Fri, 12 Jan 2007 13:50:33 -0500
Received: by nf-out-0910.google.com with SMTP id k26so1393342nfc
	for <linux-lvm@redhat.com>; Fri, 12 Jan 2007 10:50:32 -0800 (PST)
Message-ID: <aec22fc50701121044x403ed456xdd34f1e696d5cff4@mail.gmail.com>
Date: Fri, 12 Jan 2007 21:44:27 +0300
From: `VL <vl.homutov@gmail.com>
Subject: Re: [linux-lvm] vgscan -- ERROR "vg_read_with_pv_and_lv(): current
	PV" can't get data of volume group
In-Reply-To: <7682E579-E6B5-41E0-BC72-659301959512@sannet.ne.jp>
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_38786_16763517.1168627467105"
References: <aec22fc50701091026i3b66ec18jbd18760e59164622@mail.gmail.com>
	<7682E579-E6B5-41E0-BC72-659301959512@sannet.ne.jp>
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
To: LVM general discussion and development <linux-lvm@redhat.com>

------=_Part_38786_16763517.1168627467105
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Thanks for everyone!

I`ve got some ideas that helped me to get data back. Here is summary, that
someone maybe find usefull:

volume group lost one of it`s physical volumes and refused to mount.
So, i had to create new physical volume with same metadata (UUID and others)
as old one,
Metadata was saved in backup.The only problem i had that new harddisk i had
was not hdh (as one those
at volume group was), but hdb. Thus, vgcfgrestore refused to work, telling
that there are no such drive
in volume group. So, i edited manually binary backup file of lvm and changed
just one letter in the name of disk.
it worked. Also,i had to set same UID for new physical volume as it was for
old drive. I achieved this by
installing lvm2 tools and using pvcreate from there. After all those
manipulations, vgscan reported about
inactive volume group, which was successfully activated.

P.S. The most funny part of all this story is that there was 23 megs of data
on that group. Person, who
asked me to help with maintance, remembered that there was some sort of
'cleaning' on that server. =)

P.P.S. Thanks for your job, LVM people! LVM rules.

------=_Part_38786_16763517.1168627467105
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Thanks for everyone!<br><br>I`ve got some ideas that helped me to get data back. Here is summary, that someone maybe find usefull:<br><br>volume group lost one of it`s physical volumes and refused to mount. <br>So, i had to create new physical volume with same metadata (UUID and others) as old one,
<br>Metadata was saved in backup.The only problem i had that new harddisk i had was not hdh (as one those<br>at volume group was), but hdb. Thus, vgcfgrestore refused to work, telling that there are no such drive<br>in volume group. So, i edited manually binary backup file of lvm and changed just one letter in the name of disk.
<br>it worked. Also,i had to set same UID for new physical volume as it was for old drive. I achieved this by<br>installing lvm2 tools and using pvcreate from there. After all those manipulations, vgscan reported about<br>
inactive volume group, which was successfully activated.<br><br>P.S. The most funny part of all this story is that there was 23 megs of data on that group. Person, who<br>asked me to help with maintance, remembered that there was some sort of &#39;cleaning&#39; on that server. =)
<br><br>P.P.S. Thanks for your job, LVM people! LVM rules.<br>

------=_Part_38786_16763517.1168627467105--
