Message-ID: <3895A6A4.345BA093@msede.com>
Date: Mon, 31 Jan 2000 16:13:40 +0100
From: Michael Marxmeier <mike@msede.com>
Reply-To: Volker_Abele@hp.com
MIME-Version: 1.0
Subject: RE: [linux-lvm] Couple of question/confusion
Content-Transfer-Encoding: 8bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="utf-8"
To: linux-lvm@msede.com

Forwarded message ...

-------- Original Message --------
From: "Volker Abele, HP" <Volker_Abele@hp.com>
To: "Scott Walker" <scott@zeroknowledge.com>, <linux-lvm@msede.com>
Subject: RE: [linux-lvm] Couple of question/confusion
Date: Mon, 31 Jan 2000 11:32:09 +0100
Resent-Date: Mon, 31 Jan 2000 16:08:33 MEZ
Message-ID: <001f01bf6bd6$6dd4a8d0$1d7b880f@nsmseva.bbn.hp.com>

Hi,

> -----Original Message-----
> From: owner-linux-lvm@msede.com [mailto:owner-linux-lvm@msede.com]On
> Behalf Of Scott Walker
> Sent: Montag, 31. Januar 2000 03:29
> To: linux-lvm@msede.com
> Subject: [linux-lvm] Couple of question/confusion
>
>
> I started playing with LVM tonight and I am impressed... LVM + resierfs
> is nice! But I have a couple problems.
>
> Let me explain (Please offer advice if you want) I have the following
> setup..
> /dev/hdc1 = 1.2G
> /dev/hdd2 = 7.9G
> /dev/hda3 = 1.2G
> /dev/sda1 = 9.11
>
> I wanted to combine all of the above into 1 *partition* for /home. now
> is LVM something I should be looking into or should I just go to linear
> raid? or raid 0?
>
> Now I create my physical volume, but when I want to create my logical I
> keep recieving this error:
>
> freedom /# lvcreate -L100G freedom
> lvcreate -- only 499 free physical extents in volume group "freedom"

-L100G means 100 Gigabyte, that�s just a little bit to much (I think
you
only
have 1.2 + 7.9 + 1.2 + 9.1 = 19.4 G - if I�m right).

>
> What am I doing wrong?
>
> Please offer some advice, wether LVM is just overkill for me and I
> should just use raid0 or linear.
>
>
> --
> Scott Walker			                Zero Knowledge Systems Inc.
> scott@zeroknowledge.com
http://www.zeroknowledge.com

There are three kinds of people: Those who can count & those who
can't.
