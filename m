Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n6N9T68x020422
	for <linux-lvm@redhat.com>; Thu, 23 Jul 2009 05:29:06 -0400
Received: from mail-qy0-f201.google.com (mail-qy0-f201.google.com
	[209.85.221.201])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n6N9Sr1J024406
	for <linux-lvm@redhat.com>; Thu, 23 Jul 2009 05:28:53 -0400
Received: by qyk39 with SMTP id 39so1080284qyk.23
	for <linux-lvm@redhat.com>; Thu, 23 Jul 2009 02:28:53 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <38bdcd1f0907230044v7a1304dr44f261e6e12ca781@mail.gmail.com>
References: <38bdcd1f0907210016y440121c1x9c92f399e5ea1f9e@mail.gmail.com>
	<4A657BEB.6070200@cox.net>
	<38bdcd1f0907210208g19b3a803j90e43a4ce8f6b301@mail.gmail.com>
	<4A658D5A.7060205@cox.net>
	<20090721103511.GH32330@agk-dp.fab.redhat.com>
	<4A659CFF.4060308@cox.net>
	<38bdcd1f0907210449t78caaafdr445d5b2284fc6bcd@mail.gmail.com>
	<38bdcd1f0907230044v7a1304dr44f261e6e12ca781@mail.gmail.com>
Date: Thu, 23 Jul 2009 18:28:53 +0900
Message-ID: <38bdcd1f0907230228i26c3a9f2j8fea65a8d2c01453@mail.gmail.com>
Subject: Re: [linux-lvm] vgs result code error
From: Masanari Iida <standby24x7@gmail.com>
Content-Transfer-Encoding: quoted-printable
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
Content-Type: text/plain; charset="iso-8859-1"
To: LVM general discussion and development <linux-lvm@redhat.com>

It was my mis-understood that this symptom still exist with
RHEL5.4 beta lvm2.

# rpm -q lvm2
lvm2-2.02.46-8.el5

# vgs /dev/cciss/c0d3p3
  Invalid volume group name: cciss/c0d3p3
#
# echo $?
0              <=3D=3D should be non-zero

Masanari


On Thu, Jul 23, 2009@4:44 PM, Masanari Iida<standby24x7@gmail.com> wrote:
> Download lvm2-2.02.46-8.el5 =EF=BF=BDfrom RHEL5 beta channel and tested.
> I have confirmed this one is fixed.
> Thanks
> Masanari
>
