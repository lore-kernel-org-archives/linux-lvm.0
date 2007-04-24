Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l3OAjOr3014414
	for <linux-lvm@redhat.com>; Tue, 24 Apr 2007 06:45:25 -0400
Received: from vs1011.euddene.net (vs1011.euddene.net [84.20.3.36])
	by mx2.redhat.com (8.13.1/8.13.1) with ESMTP id l3OAjKOr002693
	for <linux-lvm@redhat.com>; Tue, 24 Apr 2007 06:45:21 -0400
Received: from [192.168.1.33] (28.Red-83-55-207.dynamicIP.rima-tde.net
	[83.55.207.28])
	by vs1011.euddene.net (8.12.3/8.12.3/Debian-7.1) with ESMTP id
	l3OAItkm012184
	for <linux-lvm@redhat.com>; Tue, 24 Apr 2007 12:18:56 +0200
Message-ID: <462DDFBE.2010104@euddene.com>
Date: Tue, 24 Apr 2007 12:45:18 +0200
From: Mariano Gonzalvo <mgm@euddene.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Configure lvm2 with drbd
References: <462DDAC5.20100@euddene.com> <462DDC87.5040808@redhat.com>
In-Reply-To: <462DDC87.5040808@redhat.com>
Content-Type: multipart/alternative;
	boundary="------------070006090503020207000903"
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

This is a multi-part message in MIME format.
--------------070006090503020207000903
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Thanks so much! now it does work ok.

Best regards

Mariano
> Mariano Gonzalvo wrote:
>   
>> Hi,
>>
>>     I'm trying to configure lvm2 on top of drbd. I've configured drbd
>> (/dev/drbd0 and /dev/drbd1) and put them as primary node, but when I try
>> to create a physical volume this is what it does happens
>>
>>        pvcreate /dev/drbd0
>>           Physical volume "/dev/drbd0" successfully created
>>        pvdisplay
>>             --- NEW Physical volume ---
>>           PV Name               /dev/md4
>>           VG Name
>>           PV Size               129,45 GB
>>           Allocatable           NO
>>           PE Size (KByte)       0
>>           Total PE              0
>>           Free PE               0
>>           Allocated PE          0
>>           PV UUID               MtxjHy-8zfW-i9nq-TJA4-b6F9-jtcW-FkanLB
>>
>>     /dev/md4 is the raid device over was configured drbd0.
>>
>>     Why /dev/md4 it's taken as PV Name?
>>
>>     
>
> It's trying to be helpful! Normally people build MD devices out of other devices
> and so LVM uses the MD in preference to other devices it finds with the same UUID.
>
> You'll need to exclude the MD device in the /etc/lvm/lvm.conf filters entry.
> something like:
>
> filter =[ "r/md4/" ]
>
>
>   


--------------070006090503020207000903
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
  <meta content="text/html;charset=ISO-8859-1" http-equiv="Content-Type">
</head>
<body bgcolor="#ffffff" text="#000000">
Thanks so much! now it does work ok.<br>
<br>
Best regards<br>
<br>
Mariano<br>
<blockquote cite="mid462DDC87.5040808@redhat.com" type="cite">
  <pre wrap="">Mariano Gonzalvo wrote:
  </pre>
  <blockquote type="cite">
    <pre wrap="">Hi,

    I'm trying to configure lvm2 on top of drbd. I've configured drbd
(/dev/drbd0 and /dev/drbd1) and put them as primary node, but when I try
to create a physical volume this is what it does happens

       pvcreate /dev/drbd0
          Physical volume "/dev/drbd0" successfully created
       pvdisplay
            --- NEW Physical volume ---
          PV Name               /dev/md4
          VG Name
          PV Size               129,45 GB
          Allocatable           NO
          PE Size (KByte)       0
          Total PE              0
          Free PE               0
          Allocated PE          0
          PV UUID               MtxjHy-8zfW-i9nq-TJA4-b6F9-jtcW-FkanLB

    /dev/md4 is the raid device over was configured drbd0.

    Why /dev/md4 it's taken as PV Name?

    </pre>
  </blockquote>
  <pre wrap=""><!---->
It's trying to be helpful! Normally people build MD devices out of other devices
and so LVM uses the MD in preference to other devices it finds with the same UUID.

You'll need to exclude the MD device in the /etc/lvm/lvm.conf filters entry.
something like:

filter =[ "r/md4/" ]


  </pre>
</blockquote>
<br>
</body>
</html>

--------------070006090503020207000903--
