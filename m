Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j0BHZdr23713
	for <linux-lvm@redhat.com>; Tue, 11 Jan 2005 12:35:39 -0500
Received: from postfix4-2.free.fr (postfix4-2.free.fr [213.228.0.176])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j0BHZWCC029899
	for <linux-lvm@redhat.com>; Tue, 11 Jan 2005 12:35:33 -0500
Received: from eric.placeverte.home
	(lns-vlq-7-lil-82-254-192-167.adsl.proxad.net [82.254.192.167])
	by postfix4-2.free.fr (Postfix) with SMTP id 1B6AA29FFAE
	for <linux-lvm@redhat.com>; Tue, 11 Jan 2005 18:35:31 +0100 (CET)
Date: Tue, 11 Jan 2005 18:35:30 +0100
From: messmate <messmate@free.fr>
Subject: Re: [linux-lvm] strange logical volume issue
Message-ID: <20050111183530.1dfd9ed0@eric.placeverte.home>
In-Reply-To: <20050111142411.GU26670@agk.surrey.redhat.com>
References: <20050110234240.749ebab3@eric.placeverte.home>
	<20050111142411.GU26670@agk.surrey.redhat.com>
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

On Tue, 11 Jan 2005 14:24:11 +0000
Alasdair G Kergon <agk@redhat.com> wrote:

>On Mon, Jan 10, 2005 at 11:42:40PM +0100, messmate wrote:
>> there is somewhat strange with a lv of mine: lv_usr-local.
>> Marked as /dev/mapper/vg1_hda1-lv_usr--local    and
>> as /dev/vg1_hda/lv_usr-local  !
> 
>> See the (-) differences.
>
>A hyphen in the name in /dev/mapper separates the volume
>group name from the logical volume name.
>
That's right. Between the group-name and the logical volume-name, 
do it ?

>If you put hyphens in either of those names they
>get quoted by doubling them up.
>
Also in the logical volume-name ??
The lv-name = lv_usr-local !
It becomes lv_usr--local ??
mess-mate
