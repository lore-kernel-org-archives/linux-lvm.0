Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j0BJXJr25905
	for <linux-lvm@redhat.com>; Tue, 11 Jan 2005 14:33:19 -0500
Received: from postfix3-2.free.fr (postfix3-2.free.fr [213.228.0.169])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j0BJX7sS010439
	for <linux-lvm@redhat.com>; Tue, 11 Jan 2005 14:33:12 -0500
Received: from eric.placeverte.home
	(lns-vlq-7-lil-82-254-192-167.adsl.proxad.net [82.254.192.167])
	by postfix3-2.free.fr (Postfix) with SMTP id D4477C18C
	for <linux-lvm@redhat.com>; Tue, 11 Jan 2005 20:33:06 +0100 (CET)
Date: Tue, 11 Jan 2005 20:32:45 +0100
From: messmate <messmate@free.fr>
Subject: Re: [linux-lvm] stripped or not ?
Message-ID: <20050111203245.5dd73d5f@eric.placeverte.home>
In-Reply-To: <1105469627.6118.14.camel@localhost.localdomain>
References: <20050111184621.52d06aef@eric.placeverte.home>
	<1105469627.6118.14.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

On Tue, 11 Jan 2005 10:53:47 -0800
Dan Stromberg <strombrg@dcs.nac.uci.edu> wrote:

>On Tue, 2005-01-11 at 18:46 +0100, messmate wrote:
>> Hi,
>> I'm in doubt if my volumes are stripped or not.
>> They were setted-up by the debian-installer ( no choice 
>> for stripping or not).
>> 
>> How can I seen they are striped ?
>> Thanks in advance
>> mess-mate
>
>You could probably use dstat to verify this:
>
>1) Fire up a dstat
>
>2) Write a significant amount of data to the "mirror"
>
>3) If both disks show heavy activity in dstat, then you're probably
>good to go
>
>
>There are probably other ways as well.
>
>
Thanks Dan,
Would be /usr/bin/datastat fo debian.
best regards
