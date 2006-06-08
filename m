Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k58ETS9v022198
	for <linux-lvm@redhat.com>; Thu, 8 Jun 2006 10:29:28 -0400
Received: from conterra.de (vvv.conterra.de [212.124.44.162])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k58ETQhJ020351
	for <linux-lvm@redhat.com>; Thu, 8 Jun 2006 10:29:26 -0400
Message-ID: <44883438.1070302@conterra.de>
Date: Thu, 08 Jun 2006 16:29:12 +0200
From: =?UTF-8?B?RGlldGVyIFN0w7xrZW4=?= <stueken@conterra.de>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Where is the PE to LE mapping done?
References: <7121782.1149769981070.JavaMail.root@mail1>
In-Reply-To: <7121782.1149769981070.JavaMail.root@mail1>
Content-Transfer-Encoding: 8bit
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
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: jowkju@postech.ac.kr, LVM general discussion and development <linux-lvm@redhat.com>

조완근 wrote:
> Hello, This is my second e-mail.

Sorry, if my first answer was not helpful to you.
Here is a good introduction into LVM internals
by Alasdair G Kergon:

http://people.redhat.com/agk/talks/LVM2-LinuxTag2006

You should also have a look into the meta data backup under
/etc/lvm/backup/* This describes the content of the data
structures you found in the sources. May be this helps
to understand how a VG is organized.

But even if you are much faster in reading and understanding
C source code (57251 lines) than reading the documentation
(3166 lines), I still think, your problem can be solved
by using the provided LVM-tools. 

For example: you may modify/edit the meta data dump with a
text editor and use "vgcfgrestore" to fill up the data structs
you found. (but you can also destroy your LVM this way!).

Dieter.
